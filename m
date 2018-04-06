From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 18:55:25 +0200
Subject: [Buildroot] [git commit] core/instrumentation: shave minutes
 off the build time
In-Reply-To: <20180318141512.781CD836E0@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 17 Mar 2018 16:46:43 +0100")
References: <20180318141512.781CD836E0@busybox.osuosl.org>
Message-ID: <87woxki8aq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7fb6e782542fc440c2da226ec4525236d0508b77
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As part of the build, we run some instrumentation hooks to gather
 > statistics about the usage of the target/, staging/ and host/
 > directories, so that we can generate reports for the user, that
 > shows:
 >   - for each file, what package installed it,
 >   - for each package,the size that it installed.

 > In so doing, we run a double md5 pass on all files of the affected
 > directories (before/after installation).  These passes were mostly invisible
 > when we were only scanning target/, but has greatly increased in time now
 > that we also scan staging/ and host/ (but only in the corresponding _CMDS,
 > of course).

 > This md5 was mostly aimed at catching packages that would "cheat" with
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
 > for our use-case: generating some graphs.  It is not mission-critical, and
 > if a graph is slightly off, that's not a biggy.  It can anyway be attributed
 > to a broken package's buildsystem, which should get fixed.

 > However, we lose the ability to track directories. Non-empty directories
 > can be tracked back by a bit of scripting, but empty directories are
 > simply not caught. If we were to also look for directories using mtime,
 > we would catch parents of installed files:

 >   - /foo/bar/ exists
 >   - a package installs /foo/bar/buz
 >   - mtime of /foo/bar/ is changed to account for the new file in it.

 > So we do not track directories at all, and we lose empty directories.
 > The existing tracking was mostly happenstance, with the original
 > submission and comments not really accounting for a real use-case.

 > Now, we also change the way we handle symlinks. Previously, we would
 > hash the file pointed to by the symlink. Now, we only look at the mtime
 > of the symlink itself, which still detects modifications.

 > Eventually, this also means that we now no longer need to establish a
 > list before the install step; we can now simply run after the install
 > step, finding any files newer than the build stamp.

 > [0] Yeah, md5 is very weak, but we're not guarding against malicious
 > attacks, just about careless modifications.

 > [1] defconfig used for tests:
 > BR2_arm=y
 > BR2_cortex_a7=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_INIT_SYSTEMD=y
 > BR2_PACKAGE_MESA3D=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
 > BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
 > BR2_PACKAGE_MESA3D_OSMESA=y
 > BR2_PACKAGE_MESA3D_OPENGL_ES=y
 > BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
 > BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
 > BR2_PACKAGE_SYSTEMD_BINFMT=y
 > BR2_PACKAGE_SYSTEMD_COREDUMP=y
 > BR2_PACKAGE_SYSTEMD_FIRSTBOOT=y
 > BR2_PACKAGE_SYSTEMD_HIBERNATE=y
 > BR2_PACKAGE_SYSTEMD_IMPORTD=y
 > BR2_PACKAGE_SYSTEMD_LOCALED=y
 > BR2_PACKAGE_SYSTEMD_LOGIND=y
 > BR2_PACKAGE_SYSTEMD_MACHINED=y
 > BR2_PACKAGE_SYSTEMD_POLKIT=y
 > BR2_PACKAGE_SYSTEMD_QUOTACHECK=y
 > BR2_PACKAGE_SYSTEMD_RANDOMSEED=y
 > BR2_PACKAGE_SYSTEMD_RFKILL=y
 > BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT=y
 > BR2_PACKAGE_SYSTEMD_SYSUSERS=y
 > BR2_PACKAGE_SYSTEMD_VCONSOLE=y

 > [Peter: tweak commit message, use find -type l]
 > Reported-by: Trent Piepho <tpiepho@impinj.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Trent Piepho <tpiepho@impinj.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
