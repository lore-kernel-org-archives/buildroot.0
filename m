From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 00:57:50 +0100
Subject: [Buildroot] [RFC 01/11] common service startup files
In-Reply-To: <3116b4122f3e3ea776ce2739c11ee36ea967297f.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <3116b4122f3e3ea776ce2739c11ee36ea967297f.1426960081.git.alex.suykov@gmail.com>
Message-ID: <550E057E.2030605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/03/15 19:27, Alex Suykov wrote:
> This patch introduces support infrastructure for per-project .run files.
> 
> Any .run files in package directory are picked up by pkg-generic code,
> fed to support/init/install-run script which converts them into either
> sysv initscripts or systemd unit files and installs those into predefined
> locations. The package itself provides only the .run files, no code
> in package .mk file is necessary.
> 
> Packages that install some of their services conditionally may set
> $(PKG)_INIT = list of run files to install. As a side effect, this
> removes the need to handle S99foo S99bar vs foo.service bar.service
> with the package .mk file.
> 
> Packages that need to substititue some values within their service

 substitute

> files may set $(PKG)_INIT = KEY:value KEY:value ..., which will be
> handled by install-run. The substitutions will be applied to sysv
> and systemd files.

 I don't see why this is needed, and it probably makes the install-run script
more complicated.

> 
> In case particular init system needs hand-crafted startup files
> or cannot handle certain services at all, install-run may be told
> so using special lines in the .run file.
> 
> This patch does not remove existing BR2_INIT_{SYSV,SYSTEMD} hooks.

 Good!

> Each package should either provide .run files or define hooks, but not both.
> ---

 Missing SoB, but perhaps that's intentional because it's not ready for inclusion?

>  package/Makefile.in          |  10 +
>  package/pkg-generic.mk       |  23 +++
>  support/init/install-run     | 457 +++++++++++++++++++++++++++++++++++++++++++
>  support/init/install-tmpconf |   7 +
>  4 files changed, 497 insertions(+)
>  create mode 100755 support/init/install-run
>  create mode 100755 support/init/install-tmpconf
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 803b162..599fe7f 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -408,6 +408,16 @@ ifeq ($(BR2_COMPILER_PARANOID_UNSAFE_PATH),y)
>  export BR_COMPILER_PARANOID_UNSAFE_PATH=enabled
>  endif
>  
> +ifdef BR2_INIT_SYSV
> +BR2_INIT = initscripts
> +else ifdef BR2_INIT_BUSYBOX
> +BR2_INIT = initscripts
> +else ifdef BR2_INIT_SYSTEMD
> +BR2_INIT = systemd
> +else
> +BR2_INIT = none
> +endif

 It's nicer to do this kind of switch in system/Config.in:

config BR2_INIT
	string
	default "initscripts" if BR2_INIT_SYSV || BR2_INIT_BUSYBOX
	default "systemd" if BR2_INIT_SYSTEMD
	default "none"

> +
>  include package/pkg-download.mk
>  include package/pkg-autotools.mk
>  include package/pkg-cmake.mk
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index c1b379b..fe7de8a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -762,10 +762,33 @@ ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
>  DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
>  endif
>  
> +# Init, users and files are for target image only
> +ifeq ($4,target)
> +
> +$(2)_INIT ?= $$(notdir $$(wildcard package/$1/*.run))

 package/$1/ is not correct, because it could be outside of the package
directory (e.g. external) or in a subdirectory. Use $(pkgdir) instead (note:
only one $!).

> +$(2)_POST_INSTALL_TARGET_HOOKS += $(2)_INSTALL_INIT
> +
> +# This will expand to (nothing) if none of the files are present
> +# in the package directory.
> +ifndef $(2)_INSTALL_INIT

 There should never be any reason for a package to override _INSTALL_INIT, they
can just avoid adding *.run files or setting _INIT.

 Therefore, I'd also move this to the %/.stamp_target_installed rule. That makes
it easier to understand because of less $$. Note that that is also the place
where the current init handling is done. With that done, there is also no need
to keep the definition of _INIT in the ifeq($4,target) condition.

> +define $(2)_INSTALL_INIT
> +	$$(call ifargs,support/init/install-run $$(BR2_INIT) \
> +		$$($$(PKG)_INIT_SUBST),$$(addprefix package/$1/,$$($$(PKG)_INIT)))

 The line is split at an inconvenient place here.

 I wouldn't do this $(notdir) and $(addprefix) magic. It's OK for the package
.mk file to be required to provide the full path to the .run file.

> +	$$(call ifargs,support/init/install-tmpconf $$(BR2_INIT),$$(wildcard package/$1/*.tmp.conf))

 This tmpdir support should probably be in a separate patch.

 BTW, shouldn't tmpdirs be handled for sysv as well? Typically, the init script
will create the tmpdir...

> +endef
> +endif
> +
> +endif # $4 == target
> +
>  endif # $(2)_KCONFIG_VAR
>  endef # inner-generic-package
>  
>  ################################################################################
> +define ifargs
> +	$(if $2,$1 $2)
> +endef

 This should go to pkg-utils instead.

> +
> +################################################################################
>  # generic-package -- the target generator macro for generic packages
>  ################################################################################
>  
> diff --git a/support/init/install-run b/support/init/install-run
> new file mode 100755
> index 0000000..24b79c7
> --- /dev/null
> +++ b/support/init/install-run

 I've spent about an hour trying to understand this script, and I'm still not
fully there... So this probably falls in the "too complicated" category. I still
have a bunch of stylistic remarks below, but here are some overall thoughts.

 - The script should do something as simple as possible. The variable
substitution is an example of something that is (probably) adding complexity,
and it can be done in a different way, e.g. running a sed script afterwards.

 - The script should only handle cases that are actually used. So start with
something extremely simple that covers a few interesting cases, and leave the
others to use the old initscripts system.

 - There should be a lot more comments to explain what is done and why.

 - You should start with the documentation of what it's supposed to do. That
makes it easier for us to understand what it's doing (and to say which things it
shouldn't do :-)

 - Avoid the getattr() etc. magic. It's easier to understand what's going on if
things are in a simple and explicit dict.

 - Use existing infrastructure where possible. For instance, you could change
the .run format into .ini format and use configparser, or you could use the
shlex module for parsing.

 - Don't make names too short, they should always be descriptive. 'w' is not a
good name for a function. If typing is a problem for you, get an editor that
supports completion.

 - You should take care of the exit conditions (and document them). If there is
something wrong with a .run file or with the script itself, it should exit
fatally and the build should be stopped. But if the .run file contains something
that is not supported for this init system, this should be non-fatal.


> @@ -0,0 +1,457 @@
> +#!/usr/bin/env python
> +
> +# Usage:
> +#
> +#   install-init [-] init-system [VAR1:val1 VAR2:val2 ...] file1.run file2.run ...
> +#
> +# init-system is one the values from inits array below.
> +#
> +# The script will write relevant configuration files to output/target/etc/...,
> +# so it should be called from the top Buildroot directory.
> +# Use - to write all files to the current directory (useful for debugging)
> +
> +# Bundling all init systems into a single script, vs having install-init-(system)
> +# scripts for each system, may look strange, but it turns out most of the code
> +# below is common for all init systems.
> +
> +from sys import stderr, argv

 We don't do that. Just

import sys

   ... sys.argv ...


> +from re import match, sub
> +from os.path import dirname, basename
> +from os import makedirs, fdopen, fstat, fchmod
> +from os import O_RDONLY, O_WRONLY, O_CREAT, O_TRUNC
> +from os import open as osopen
> +from os import read as osread
> +from os import write as oswrite
> +
> +inits = ['initscripts', 'systemd']
> +output = None

 Don't put this in a global variable. A member of Run would be a good place.

> +nopath = False
> +
> +class Run:
> +    def __init__(self, name, path):
> +        self.path = path    # full .run file name, for error reporting
> +        self.name = name    # service name = stem(basename(path))

 This splitting into path and name should be handled here, in the constructor,
and not in the caller.

> +
> +        # This is a bit more complicated than it should be
> +        # to allow reporting incorrect global keys while still
> +        # accepting unadorned commands for pre/post groups.
> +
> +        for k in ['description', 'user', 'group', 'umask',
> +                  'pidfile', 'priority',
> +                  'after', 'requires', 'wantedby',
> +                  'busname', 'conflicts', 'killwith', 'restart']:
> +            setattr(self, k, None)

 This will also be simpler if you just use a dict.

> +
> +        # sequence:
> +        #   pre-exec-post
> +        #   pre-start-stop-post
> +        #   pre  (for run-once scripts)
> +        self.pre = []
> +        self.post = []
> +        self.acts = ['exec', 'start', 'stop', 'reload']
> +        for k in self.acts:
> +            setattr(self, k, None)
> +
> +        for k in inits:
> +            setattr(self, k, None)
> +
> +        # variable substitutions
> +        # (default values from .run until update() is called)
> +        self.subs = {}
> +
> +    def has(self, key):
> +        return hasattr(self, key)
> +
> +    def get(self, key):
> +        return getattr(self, key)
> +
> +    def set(self, key, val):
> +        setattr(self, key, val)
> +
> +    def update(self, values):
> +        self.subs.update(values)
> +
> +    def isempty(self):
> +        return (not self.exec and not self.start and not self.pre and not self.post)

 exec is a reserved word in python2.

> +
> +    def substcmds(self):
> +        for k in ['pre', 'post']:
> +            attr = getattr(self, k)
> +            for i, s in enumerate(attr):
> +                attr[i] = self.substvars(s)
> +        for k in ['exec', 'start', 'stop', 'reload']:
> +            attr = getattr(self, k)
> +            if not attr is None:
> +                setattr(self, k, self.substvars(attr))
> +
> +    def substvars(self, value):
> +        def var(m):
> +            k = m.group(1)
> +            if k in self.subs:
> +                return self.subs[k]
> +            else:
> +                return m.group(0)
> +
> +        ret = sub(r'\$([A-Za-z]+)', var, value)
> +        return ret
> +
> +
> +def die(message, *args):
> +    stderr.write((message+"\n") % tuple(args))
> +    exit(-1)
> +
> +
> +def openread(filename):
> +    try:
> +        fh = open(filename)
> +    except OSError:
> +        die("Can't open %s" % filename)

 This wrapper doesn't make a lot of sense. Such failures should anyway not
occur, because the script is always called with .run files. So it's OK to dump
an exception stack on the user.

> +    return fh
> +
> +def parse(name, path):
> +    run = Run(name, path)
> +    fh = openread(path)
> +    inscript = False    # after the first empty line
> +    pastpre = False     # after exec/start/stop
> +    firstline = True
> +
> +    for line in fh:
> +        line = line.strip()
> +
> +        # Use ## for description, but only if it is the first line
> +        if firstline and match('^## ', line):
> +            run.description = line[3:]

 Why this ## hack? "description = This is program foo" is much more descriptive.

> +        else:
> +            firstline = False
> +
> +        # Skip comments in non-command section, but pass them through
> +        # when inscript
> +        if not inscript and match(r'^#', line):
> +            continue
> +
> +        # Empty line marks the start of script section
> +        if not inscript and match(r'^\s*$', line):
> +            inscript = True
> +            continue
> +
> +        m = match(r'^[A-Z_0-9]+=(.*)', line)
> +        if m and not inscript:
> +            run.subs[m.group(1)] = m.group(2)
> +            continue
> +
> +        m = match(r'^([A-Za-z]+)(\s+(.*))?', line)
> +        if m:
> +            key, val = m.group(1), m.group(3)
> +        else:
> +            key, val = None, None
> +
> +        if not inscript and not key:
> +            die("%s: bad line", path)
> +
> +        if (not inscript and key) or (inscript and key in run.acts):
> +            if run.get(key):
> +                die("%s: cannot re-assign %s", path, key)
> +            elif run.has(key):
> +                run.set(key, val if m.group(2) else True)
> +            else:
> +                die("%s: unknown key %s", path, key)
> +            if key in run.acts:
> +                pastpre = True
> +        elif inscript:
> +            if pastpre:
> +                run.post.append(line)
> +            else:
> +                run.pre.append(line)
> +
> +    if not run.priority:
> +        if run.exec:
> +            run.priority = '50'
> +        elif run.start:
> +            run.priority = '40'
> +        else:
> +            run.priority = '10'

 The reasoning behind these static priorities should be explained somewhere.

> +
> +    return run
> +
> +def openwrite(path, mode):
> +    global nopath
> +
> +    if nopath:
> +        path = basename(path)
> +    else:
> +        try:
> +            makedirs(dirname(path))
> +        except OSError:
> +            pass
> +
> +    fd = osopen(path, O_WRONLY | O_CREAT | O_TRUNC)
> +    fchmod(fd, mode)
> +    return fd

 This whole umask thing is useless IMHO. You also don't provide an example for it.

 If someone is so paranoid that they think an init script should be
non-readable, they should give it a BR2_ROOTFS_DEVICE_TABLE entry.

 And anyway, use chmod instead of fchmod.

 So, if the umask is gone, you can just do open(path, 'w')

> +
> +def writeto(path, mode):
> +    global output
> +    fd = openwrite(path, mode)
> +    output = fdopen(fd, 'w')
> +
> +# write
> +def w(fmt, *subst):
> +    global output
> +    output.write((fmt+"\n") % subst)

 Making a function for this is really not worth it.

> +
> +# write newline
> +def wnl(): w("")
> +
> +# write lines
> +def wl(fmt, array):
> +    for l in array:
> +        w(fmt, l)
> +
> +# write-tab, write-tab-tab
> +def wt(fmt, *subst): w("\t" + fmt, *subst)
> +def wtt(fmt, *subst): w("\t\t" + fmt, *subst)
> +
> +# ------------------------------------------------------------------------------
> +
> +# return either cmd or su cmd; the caller naturally handles shell commands
> +def maybesu(r, cmd):

 Should be a method of Run.

> +    if r.user:
> +        return "su - %s -c '%s'" % (r.user, cmd)
> +    else:
> +        return cmd
> +
> +# ------------------------------------------------------------------------------
> +
> +def initscripts(r):
> +    writeto('output/target/etc/init.d/S%02d%s' % (int(r.priority), r.name), 0o755)

 Ah yes here you need to set the exec bit of course.

 output/ is wrong, it could be modified by O=. Instead, you should pass
TARGET_DIR in the environment or on the commandline and use that.

> +
> +    (start, stop) = initscripts_ssd(r)
> +
> +    w("#!/bin/sh\n")
> +    if r.description:
> +        w("# %s\n", r.description)
> +
> +    for k, v in r.subs.items():
> +        w("%s=%s", k, v)
> +    if r.subs:
> +        wnl()
> +
> +    if r.umask:
> +        w("umask %s", r.umask)
> +
> +    w("case \"$1\" in")
> +    w(" start)")
> +    for c in r.pre:
> +        wtt("%s", maybesu(r, c))
> +    if r.start:
> +        wtt("%s", maybesu(r.start))
> +    elif start:
> +        wtt("%s", start)
> +    elif not r.pre and not r.post:
> +        die("%s: cannot write initscript without any commands to run", r.path)
> +    wtt(";;")
> +
> +    wt("stop)")
> +    if r.stop and not r.stop is True:
> +        wtt("%s", r.stop)
> +    elif r.start or r.exec:
> +        wtt("%s", stop)
> +    for c in r.post:
> +        wtt("%s", maybesu(c))
> +    wtt(";;")
> +
> +    if r.reload:
> +        wt("reload)")
> +        wtt("%s", r.reload)
> +        wtt(";;")
> +
> +    wt("restart)")
> +    wtt("$0 stop")
> +    wtt("$0 start")
> +    wtt(";;")
> +
> +    w("esac")

 A multiline template with %-formatting would be easier to understand. So:

completestart = map(maybesu,r.start).join('\n\t\t')
completestart += ...
completestop = ...

output.write("""
#! /bin/sh
%s

case "$1" in
	start)
		%s;;
	stop)
		%s;;
	restart|reload)
		$0 stop
		$0 start
		;;
esac
""" % (substitions, completestart, completestop)



> +
> +# generate start-stop-daemon commands from r.exec
> +# run -> (start, stop)
> +def initscripts_ssd(r):
> +    if not r.exec:
> +        return None, None
> +
> +    if r.pidfile:
> +        pidfile = r.pidfile
> +    else:
> +        pidfile = '/var/run/%s.pid' % r.name
> +
> +    ssdopts = ['-S']
> +    sskopts = ['-K']

 ssdopts and sskopts are visually too similar to make it easy to distinguish.
What about startopts and stopopts?

> +    if r.user:
> +        ssdopts.append('-c')
> +        ssdopts.append(r.user)
> +    if r.group:
> +        ssdopts.append('-g')
> +        ssdopts.append(r.group)
> +    if not r.pidfile and not r.start:
> +        ssdopts.append('-m')
> +    if pidfile:
> +        ssdopts.append('-p')
> +        ssdopts.append(pidfile)
> +        sskopts.append('-p')
> +        sskopts.append(pidfile)
> +    ssdopts = (" ".join(ssdopts))

 It's ugly if a variable is first a list and then a string. But you don't need
to do it here, just do the join below where it's used to construct start/stop.

> +    sskopts = (" ".join(sskopts))
> +
> +    cmd = sub(r'\s.*', '', r.exec)
> +    arg = sub(r'^\S+', ' --', r.exec) if cmd != r.exec else ''

 	cmd = re.sub(r'\s.*', ' -- ', 1)
	start = "start-stop-daemon %s -b %s" % (" ".join(ssdopts), cmd)

> +
> +    start = "start-stop-daemon %s -b %s%s" % (ssdopts, cmd, arg)
> +    stop = "start-stop-daemon %s" % sskopts

 I prefer an explicit /sbin/start-stop-daemon - when manually starting/stopping,
/sbin is not always in the path.


> +
> +    return (start, stop)
> +
> +# ------------------------------------------------------------------------------
> +
> +def systemd(r):
> +    writeto("output/target/usr/lib/systemd/system/%s.service" % r.name, 0o644)
> +    r.substcmds()
> +
> +    if r.after:
> +        after = r.after
> +    elif r.priority and r.priority >= '90':
> +        after = "syslog.service network.service"
> +    elif r.priority and r.priority >= '50':

 If that is the meaning of the priorities, perhaps it's better to give them
names rather than numbers.

> +        after = "syslog.service"
> +    else:
> +        after = None
> +
> +    w("[Unit]")
> +    if r.description:
> +        w("Description=%s", r.description)
> +    if after:
> +        w("After=%s", after)
> +    if r.requires:
> +        w("Requires=%s", r.requires)
> +    if r.conflicts:
> +        w("Conflicts=%s", r.conflicts)
> +    wnl()
> +
> +    w("[Service]")
> +    if r.user:
> +        w("User=%s", r.user)
> +    if r.group:
> +        w("Group=%s", r.group)
> +    if r.pidfile and not r.exec:
> +        w("PIDFile=%s", r.pidfile)
> +    if r.start or r.exec:
> +        for c in r.pre:
> +            w("ExecStartPre=%s", c)
> +
> +    if r.exec:
> +        w("ExecStart=%s", r.exec)
> +    elif r.start:
> +        w("Type=forking")
> +        w("ExecStart=%s", r.start)
> +    elif r.pre:
> +        w("Type=oneshot")
> +        wl("ExecStart=%s", r.pre)
> +
> +    if r.stop and not r.exec:
> +        w("ExecStop=%s", r.stop)
> +
> +    for c in r.post:
> +        w("ExecStartPost=%s", c)
> +    if r.reload:
> +        w("ExecReload=%s", r.reload)
> +    if r.restart:
> +        w("Restart=%s", r.restart)
> +    elif r.exec:
> +        w("Restart=always")
> +    wnl()
> +
> +    w("[Install]")
> +    if r.wantedby:
> +        w("WantedBy=%s", r.wantedby)
> +    else:
> +        w("WantedBy=multi-user.target")
> +
> +# ------------------------------------------------------------------------------
> +
> +# Usage:
> +#     bypass systemd foo.service
> +#     bypass initscripts foo.init foo.line
> +#     bypass inittab -

 This bypass syntax is hard to understand IMHO. Can you find something
simpler/clearer and more verbose? If you would switch to ini format, it could be
something like

[initscripts]
cp = package/foo/S10start
     /etc/init.d/S10start

[systemd]
cp-ln = package/foo/foo.service
        /usr/lib/systemd/system/foo.service
        /etc/systemd/system/multi-user.target.wants

> +
> +bypasstable = {
> +    'initscripts': [
> +        ('*:*.init',    'output/target/etc/init.d/S$1$2'),
> +        ('*.init',      'output/target/etc/init.d/S50$1'),
> +        ('*.conf',      'output/target/etc/config.d/*'),
> +        ('S*',          'output/target/etc/init.d/*') ],
> +    'systemd': [
> +        ('*.service',   'output/target/usr/lib/systemd/system/*.service'),
> +        ('*.tmp.conf',  'output/target/usr/lib/tmpfiles.d/*.conf') ]
> +}
> +
> +def bypass(run, init, arg):
> +    if arg == '-': return
> +    rules = bypasstable[init]
> +    for f in arg.split():
> +        copied = False
> +        for r in rules:
> +            m = match(r[0].replace('*','(.*)'), basename(f))
> +            if not m: continue
> +            copyfile(sub(r'.*:', '', f),
> +                    r[1].replace('*', m.group(1))
> +                        .replace('$1', m.group(1))
> +                        .replace('$2', m.group(2)))
> +            copied = True
> +            break
> +        if not copied:
> +            die('no destination for %s', f)
> +
> +def copyfile(src, dst):

 Use shutil.copyfile instead of inventing your own.

> +    f = osopen(src, O_RDONLY)
> +    s = fstat(f)
> +    o = openwrite(dst, s.st_mode)
> +    buf = osread(f, s.st_size)
> +    oswrite(o, buf)
> +
> +# ------------------------------------------------------------------------------
> +
> +if len(argv) > 1 and argv[1] == '-':
> +    nopath = True
> +    del argv[1]
> +
> +if len(argv) < 2:
> +    die("Usage: install-init [-] init-system file.run file.run ...")
> +
> +init = argv[1]
> +
> +if not init:
> +    die("Bad call")
> +
> +if init in inits:
> +    writer = globals()[init]
> +else:
> +    die("Unknown init system %s", init)
> +
> +subst = []
> +files = []
> +
> +for a in argv[2:]:
> +    eq = a.find(':')
> +    if eq >= 0:
> +        subst.append((a[0:eq], a[eq+1:]))
> +    elif a.endswith('.run'):
> +        files.append((basename(a)[:-4], a))
> +    else:
> +        die("Bad argument: %s", a)
> +
> +for f in files:
> +    run = parse(f[0], f[1])
> +    run.update(subst)
> +    if getattr(run, init):
> +        bypass(run, init, getattr(run, init))
> +    if r.isempty():
> +        continue
> +    else:
> +        writer(run)
> diff --git a/support/init/install-tmpconf b/support/init/install-tmpconf
> new file mode 100755
> index 0000000..080dcd7
> --- /dev/null
> +++ b/support/init/install-tmpconf
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +test "$1" = 'systemd' && shift || exit
> +mkdir -p output/target/etc/tmpfiles.d/
> +for i in "$@"; do
> +	cp $i output/target/etc/tmpfiles.d/${i/.tmp.conf/.conf}
> +done

 You also didn't give an example of this, but I have the feeling it would make
more sense to put this in the .run script as well. For sysv, the tmpfile should
be created in the init script; for systemd, it's done by tmpfiles.


 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
