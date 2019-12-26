From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 14:32:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: disable
 parallel build
In-Reply-To: <20191226085308.2198045-1-fontaine.fabrice@gmail.com>
References: <20191226085308.2198045-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226143230.7d9e6634@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 26 Dec 2019 09:53:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build randomly fails since December 2017 on:
> 
> make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/ecryptfs-utils-111/src/utils'
>  /bin/mkdir -p '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
>   /bin/bash ../../libtool   --mode=install /usr/bin/install -c mount.ecryptfs umount.ecryptfs mount.ecryptfs_private '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
> libtool: install: /usr/bin/install -c mount.ecryptfs /home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs
> /usr/bin/install: cannot create regular file '/home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs': File exists
> Makefile:832: recipe for target 'install-rootsbinPROGRAMS' failed
> make[5]: *** [install-rootsbinPROGRAMS] Error 1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2063bd18830ef02dca0bed889c43639009bc688e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I think I would prefer to fix the actual problem. From a quick look, my
guess is that the problem happens due to:

install-exec-hook:      install-rootsbinPROGRAMS
        -rm -f "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
        $(LN_S) "mount.ecryptfs_private" "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"

in src/utils/Makefile.am

The install-exec-hook target should not have a dependency on
install-rootsbinPROGRAMS.

From https://www.gnu.org/software/automake/manual/html_node/Extending.html#Extending:

"""
In contrast, some rules also have a way to run another rule, called a
hook; hooks are always executed after the main rule?s work is done. The
hook is named after the principal target, with ?-hook? appended. The
targets allowing hooks are install-data, install-exec, uninstall, dist,
and distcheck.

For instance, here is how to create a hard link to an installed program:

install-exec-hook:
        ln $(DESTDIR)$(bindir)/program$(EXEEXT) \
           $(DESTDIR)$(bindir)/proglink$(EXEEXT)

"""

So, they explicitly say that these hooks are run after the main rule
work is done, which means the dependency on install-rootsbinPROGRAMS is
not needed. And the example they use to illustrate is *exactly* the
situation of ecryptfs-utils: creating a link to a program that was
installed.

Could you try this, and if possible upstream the fix ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
