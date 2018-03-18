From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 15:14:40 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 15 Mar 2018 21:35:08 +0100")
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
Message-ID: <87muz5fp2n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > As part of the build, we run some instrumentation hooks to gather
 > statistics about the usage of the target/, staging/ and host/
 > directories, so that we can generate reports for the user, that
 > shows:
 >   - for each file, what package installed it,
 >   - for each package,the size that it installed.

 > In so doing, we run a double md5 pass on all files of the affected
 > directories. These passes were mostly invisible when we were only
 > scanning target/, but has greatly increased in time now that we also
 > scan staging/ and host/ (but only in the corresponding _CMDS, of
 > course).

 > This md5 wsa mostly aimed at catching packages that would "cheat" with
 > mtime/atime/ctime somehow. They can't really cheat on md5, though [0].

 > Timings however speak for themselves, with this defconfig (slightly
 > biggish-but-still-manageable build) [1].

 > host/      20965 files    1.2GiB
 > staging/    4715 files    333MiB
 > target/     1801 files     44MiB

 > All instrumentation steps, using md5:    19min 27s
 > All instrumentation steps, using mtime:  14min 45s
 > No instrumentation step at all:          14min 31s

 > So, using mtime is an almost-5min improvement, i.e. about 25% faster,
 > while removing all instrumentation steps does not gain that much more...

 > So, we switch to using mtime, because in the end that's still good-enough
 > for our use-case: generating some graphs. It is not mission-critical, and
 > if a graph is slightly off, that's not biggy. It can anyway be attributed
 > to a broken package's buildsystem, which should get fixed.

 > However, we lose the ability to track directories. Non-empty directories
 > can be tracked back by a bit of scripting, but empty directories are
 > simply not caught. If we were to also look for directories using mtime,
 > we would catch parents of installed files:

 >   - /foo/bar/ exists
 >   - a package installs /foo/bar/buz
 >   - mtime of /foo/bar/ is changed to account for the nex file in it.

Playing around with this, I noticed two other issues:

- It doesn't work for packages using rsync to install,
  E.G. skeleton-init-common as rsync also sets the mtime to match the
  source files

- It breaks for <pkg>-reinstall

I don't think either of those are really big issues compared to the huge
slowdown, but it is worth noticing.

 > +define step_pkg_size_inner
 > +	cd $(2); \
 > +	find . \( -type f -o -type L \) \
 > +		-newer $($(PKG)_DIR)/.stamp_built \
 > +		-exec printf '$(1),%s\n' {} + \
 > +		>> $(BUILD_DIR)/packages-file-list$(3).txt

What find version are you using? My fileutils find (and the busybox
applet) use 'l' for symlinks, so I've changed it to that.

Committed with that fixed (and a few tweaks to the commit message),
thanks.

-- 
Bye, Peter Korsgaard
