From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 22:28:16 +0200
Subject: [Buildroot] [PATCH v3 1/4] support/scripts/get-developers: add
 new script
In-Reply-To: <1473713695-2611-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1473713695-2611-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <24863d6b-4bff-7af7-f681-7ab1963e01bf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-16 22:54, Thomas Petazzoni wrote:
> This script, and its companion library, is more-or-less Buildroot's
> equivalent to the kernel get_maintainer.pl script: it allows to get the
> list of developers to whom a set of patches should be sent to.
[snip]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 I think this script is good enough to go in, so I'm going to give it my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

However, I have a few suggestions on how to make it more pythonic.

> ---
>  support/scripts/get-developers     |  83 +++++++++++++++
>  support/scripts/getdeveloperlib.py | 201 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 284 insertions(+)
>  create mode 100755 support/scripts/get-developers
>  create mode 100644 support/scripts/getdeveloperlib.py
> 
> diff --git a/support/scripts/get-developers b/support/scripts/get-developers
> new file mode 100755
> index 0000000..f73512f
> --- /dev/null
> +++ b/support/scripts/get-developers
> @@ -0,0 +1,83 @@
> +#!/usr/bin/env python
> +
> +import argparse
> +import getdeveloperlib
> +
> +def parse_args():
> +    parser = argparse.ArgumentParser()
> +    parser.add_argument('patches', metavar='P', type=str, nargs='*',

 Why metavar P? Doesn't look great in the help text IMHO. The default PATCHES is
much better, no?

> +                        help='list of patches')
> +    parser.add_argument('-a', dest='architecture', action='store',

 You would typically use ('--architecture', '-a', action='store') i.e. make the
dest implicit based on the long option.


> +                        help='find developers in charge of this architecture')
> +    parser.add_argument('-p', dest='package', action='store',
> +                        help='find developers in charge of this package')
> +    parser.add_argument('-c', dest='check', action='store_const',
> +                        const=True, help='list files not handled by any developer')

 I wonder about the logic here: for patches, we support a list of patches, but
for architecture or package just a single one. Wouldn't it be better to use the
positional arguments as "things to work with" and -a/-p as a modifier?

> +    return parser.parse_args()
> +
> +def __main__():
> +    devs = getdeveloperlib.parse_developers()
> +    if devs is None:
> +        sys.exit(1)
> +    args = parse_args()
> +
> +    # Check that only one action is given
> +    action = 0
> +    if args.architecture is not None:
> +        action += 1
> +    if args.package is not None:
> +        action += 1
> +    if args.check:
> +        action += 1
> +    if len(args.patches) != 0:
> +        action += 1

 Why not use argparse.add_mutually_exclusive_group()? This will also print the
help text properly. So I would make it:

parser = ...
check_or_act = parser.add_mutually_exclusive_group(required=True)
check_or_act.add_argument('--check', '-c', ...)
act = check_or_act.add_argument_group()
action = act.add_mutually_exclusive_group(required=False)
action.add_argument('--architecture', '--arch', '-a', dest='action',
                    action='store_const', const='arch')
action.add_argument('--package', '-p', ...)
act.add_argument('things_to_work_with', nargs='*', ...)

 You may want to look for a better name than 'things to work with' though :-)

 While we're at it: I would also like a --file and --infra option.


> +    if action > 1:
> +        print("Cannot do more than one action")
> +        return
> +    if action == 0:
> +        print("No action specified")
> +        return

 Same here: argparse can do that check for you. Also you'd normally use
parser.error() for error exit. It calls sys.exit internally.

> +
> +    # Handle the check action

 A nicer way to handle the different actions is to use dest='action', const= and
the store_const action so you have a single 'action' attribute to check. So:

	if args.action == 'check':
	elif args.action == 'arch':
	...

 Or even better, create a function for each action (taking args as the
argument), use the functions as the const=, and call it directly:

	args.action(args)


> +    if args.check:
> +        files = getdeveloperlib.check_developers(devs)
> +        for f in files:
> +            print f

 If you're going to use Python 2, you must put python2 on the first line.

 But I'd prefer Python 3 :-). It's just the prints, so run it through 2to3 and add

from __future__ import print_function


> +
> +    # Handle the architecture action
> +    if args.architecture is not None:
> +        for dev in devs:
> +            if args.architecture in dev.architectures:
> +                print(dev.name)
> +        return
> +
> +    # Handle the package action
> +    if args.package is not None:
> +        for dev in devs:
> +            if args.package in dev.packages:
> +                print(dev.name)

 It would make sense to me if the infra was also analysed when you specify a
package.

> +        return
> +
> +    # Handle the patches action
> +    if len(args.patches) != 0:
> +        (files, infras) = getdeveloperlib.analyze_patches(args.patches)
> +        matching_devs = set()
> +        for dev in devs:
> +            # See if we have developers matching by package name
> +            for f in files:
> +                if dev.hasfile(f):
> +                    matching_devs.add(dev.name)
> +            # See if we have developers matching by package infra
> +            for i in infras:
> +                if i in dev.infras:
> +                    matching_devs.add(dev.name)

 I'm actually not so sure if it's a good idea to put people in Cc based on
infra. You really want to be Cc-ed every time someone bumps an autotools package?

> +
> +        result = "--to buildroot at buildroot.org"
> +        for dev in matching_devs:
> +            result += " --to \"%s\"" % dev

 I agree with Yann: --cc is better.

> +
> +        if result != "":
> +            print("git send-email %s" % result)
> +
> +__main__()
> +
> diff --git a/support/scripts/getdeveloperlib.py b/support/scripts/getdeveloperlib.py
> new file mode 100644
> index 0000000..7b39041
> --- /dev/null
> +++ b/support/scripts/getdeveloperlib.py
> @@ -0,0 +1,201 @@
> +import sys
> +import os
> +import re
> +import argparse
> +import glob
> +import subprocess
> +
> +#
> +# Patch parsing functions
> +#
> +
> +FIND_INFRA_IN_PATCH = re.compile("^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
 Better make it a raw string:       ^r

> +
> +def analyze_patch(patch):
> +    """Parse one patch and return the list of files modified, added or
> +    removed by the patch."""
> +    files = set()
> +    infras = set()
> +    with open(patch, "r") as f:
> +        for line in f:
> +            # If the patch is adding a package, find which infra it is
> +            m = FIND_INFRA_IN_PATCH.match(line)
> +            if m:
> +                infras.add(m.group(2))
> +            if not line.startswith("+++ "):
> +                continue
> +            line.strip()
> +            fname = line[line.find("/") + 1 : ].strip()
> +            if fname == "dev/null":
> +                continue
> +            files.add(fname)
> +    return (files, infras)

 I think it is more useful to extract only the files from the patch, and then
look at the actual files in the filesystem to analyse them further. This does go
against the approach of get_maintainers.pl, but for me it's more logical. But
perhaps this was intentional, to avoid getting a mail every time a package using
a particular infra is changed?


> +
> +FIND_INFRA_IN_MK = re.compile("^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
> +
> +def fname_get_package_infra(fname):
> +    """Checks whether the file name passed as argument is a Buildroot .mk
> +    file describing a package, and find the infrastructure it's using."""
> +    if not fname.endswith(".mk"):
> +        return None
> +
> +    if not os.path.exists(fname):
> +        return None
> +
> +    with open(fname, "r") as f:
> +        for l in f:
> +            l = l.strip()
> +            m = FIND_INFRA_IN_MK.match(l)
> +            if m:
> +                return m.group(2)
> +    return None
> +
> +def get_infras(files):
> +    """Search in the list of files for .mk files, and collect the package
> +    infrastructures used by those .mk files."""
> +    infras = set()
> +    for fname in files:
> +        infra = fname_get_package_infra(fname)
> +        if infra:
> +            infras.add(infra)
> +    return infras
> +
> +def analyze_patches(patches):
> +    """Parse a list of patches and returns the list of files modified,
> +    added or removed by the patches, as well as the list of package
> +    infrastructures used by those patches (if any)"""
> +    allfiles = set()
> +    allinfras = set()
> +    for patch in patches:
> +        (files, infras) = analyze_patch(patch)
> +        allfiles = allfiles | files
> +        allinfras = allinfras | infras
> +    allinfras = allinfras | get_infras(allfiles)
> +    return (allfiles, allinfras)
> +

 All of the above could be in a separate module.

> +#
> +# DEVELOPERS file parsing functions
> +#
> +
> +class Developer:
> +    def __init__(self, name, files):
> +        self.name = name
> +        self.files = files
> +        self.packages = parse_developer_packages(files)
> +        self.architectures = parse_developer_architectures(files)
> +        self.infras = parse_developer_infras(files)
> +
> +    def hasfile(self, f):
> +        f = os.path.abspath(f)
> +        for fs in self.files:
> +            if f.startswith(fs):
> +                return True
> +        return False
> +
> +def parse_developer_packages(fnames):
> +    """Given a list of file patterns, travel through the Buildroot source
> +    tree to find which packages are implemented by those file
> +    patterns, and return a list of those packages."""
> +    packages = set()
> +    for fname in fnames:
> +        for root, dirs, files in os.walk(fname):
> +            for f in files:
> +                path = os.path.join(root, f)
> +                if fname_get_package_infra(path):
> +                    pkg = os.path.splitext(f)[0]
> +                    packages.add(pkg)
> +    return packages
> +
> +def parse_arches_from_config_in(fname):
> +    """Given a path to an arch/Config.in.* file, parse it to get the list
> +    of BR2_ARCH values for this architecture."""
> +    arches = set()
> +    with open(fname, "r") as f:
> +        parsing_arches = False
> +        for l in f:
> +            l = l.strip()
> +            if l == "config BR2_ARCH":
> +                parsing_arches = True
> +                continue
> +            if parsing_arches:
> +                m = re.match("^\s*default \"([^\"]*)\".*", l)
> +                if m:
> +                    arches.add(m.group(1))
> +                else:
> +                    parsing_arches = False
> +    return arches
> +
> +def parse_developer_architectures(fnames):
> +    """Given a list of file names, find the ones starting by
> +    'arch/Config.in.', and use that to determine the architecture a
> +    developer is working on."""
> +    arches = set()
> +    for fname in fnames:
> +        if not re.match("^.*/arch/Config\.in\..*$", fname):
                             ^^^
 I don't think this is a good idea. First of all it looks ugly, second, this
would also match the Config.in.host file of a package called arch. And there is
no reason to. See below.

> +            continue
> +        arches = arches | parse_arches_from_config_in(fname)
> +    return arches
> +
> +def parse_developer_infras(fnames):
> +    infras = set()
> +    for fname in fnames:
> +        m = re.match("^package/pkg-([^.]*).mk$", fname)
> +        if m:
> +            infras.add(m.group(1))
> +    return infras
> +
> +def parse_developers(basepath=None):

 basepath isn't used and I also don't see how it could be used.

> +    """Parse the DEVELOPERS file and return a list of Developer objects."""
> +    developers = []
> +    linen = 0
> +    if basepath == None:
> +        basepath = os.getcwd()

 I don't see any reason to use absolute paths. Just use relative paths
everywhere, and require that the script is executed from the top-level buildroot
directory. Makes things a whole lot simpler.

 Note that BR2_EXTERNAL is implicitly supported: just put a DEVELOPERS file in
it, and run the script for the external directory.

> +    with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
> +        files = []
> +        name = None
> +        for l in f:
> +            l = l.strip()
> +            if l.startswith("#"):
> +                continue
> +            elif l.startswith("N:"):
> +                if name is not None or len(files) != 0:
> +                    print("Syntax error in DEVELOPERS file, line %d" % linen)

 Is it really required to have an empty line at the end of a developer? Just
'finish' the developer when you encounter the next one.

> +                name = l[2:].strip()
> +            elif l.startswith("F:"):
> +                fname = l[2:].strip()
> +                dev_files = glob.glob(os.path.join(basepath, fname))
> +                if len(dev_files) == 0:
> +                    print("WARNING: '%s' doesn't match any file" % fname)
> +                files += dev_files
> +            elif l == "":
> +                if not name:
> +                    continue
> +                developers.append(Developer(name, files))
> +                files = []
> +                name = None
> +            else:
> +                print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, l))
> +                return None
> +            linen += 1
> +    # handle last developer
> +    if name is not None:
> +        developers.append(Developer(name, files))
> +    return developers

 IMHO this whole function would be simpler if structured like this:

for l in f:
	if '#': continue
	if 'N': developer = Developer(name); developers.append(developer)
	if 'F': for f in files: developer.addFile (f)

i.e. don't create the developer at the end, but create it immediately and update it.


> +
> +def check_developers(developers, basepath=None):
> +    """Look at the list of files versioned in Buildroot, and returns the
> +    list of files that are not handled by any developer"""
> +    if basepath == None:
> +        basepath = os.getcwd()
> +    cmd = ["git", "--git-dir", os.path.join(basepath, ".git"), "ls-files"]

 I don't understand why you need the --git-dir...

> +    files = subprocess.check_output(cmd).strip().split("\n")
> +    unhandled_files = []
> +    for f in files:
> +        handled = False
> +        for d in developers:
> +            if d.hasfile(os.path.join(basepath, f)):
> +                handled = True
> +                break
> +        if not handled:
> +            unhandled_files.append(f)
> +    return unhandled_files
> 


 You are creating a Developer -> Files/Arches/Infras mapping, but all the uses
are actually with the reverse, i.e. File -> Developers. So maybe it makes sense
to build up the reverse mapping as well. Protip: use collections.defaultdict.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
