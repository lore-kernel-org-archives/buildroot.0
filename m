From: hartleys <hartleys@visionengravers.com>
Date: Mon, 5 Jan 2009 15:49:06 -0500
Subject: [Buildroot] Problem with svn revision 24694
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909FA4C34@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I updated my svn checkout today and noticed that busybox and the linux
kernel were updated.  When either of these have been updated in the past
I usually have problems with my root filesystem not getting fully
created.

To get around this issue I normally just do a 'make menuconfig' so that
my buildroot .config gets updated then do a 'make'.  The new files then
get downloaded and compiled.  I'll then do a 'make busybox-menuconfig'
and 'make linux26-menuconfig' to make sure busybox and the kernel are
configured correctly for what I need.  After that I manually delete
$(PROJECT_BUILD_DIR)/root, $(PROJECT_BUILD_DIR)/.root,
$(PROJECT_BUILD_DIR)/autotools-stamps.  Then do a 'make' and everything
gets built correctly.

In the past this has worked fine.  When I tried it today I get the
following right after my external toolchain libraries are copied to
$(PROJECT_BUILD_DIR)/root/lib:

...
copy_toolchain_lib_root lib=libstdc++.so.6.0.8 dst=/lib
SYSROOT_DIR=`/usr/local/arm/4.1.1-920t/bin/arm-linux-gcc -v 2>&1 | grep
^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; cp
-a ${SYSROOT_DIR}/* /home/bigguiness/buildroot/build_arm/staging_dir/ ;
find /home/bigguiness/buildroot/build_arm/staging_dir -type d | xargs
chmod 755
cp: cannot create special file
`/home/bigguiness/buildroot/build_arm/staging_dir/dev/vcsa6': Operation
not permitted
cp: cannot create special file
`/home/bigguiness/buildroot/build_arm/staging_dir/dev/vcs6': Operation
not permitted
cp: cannot create special file
`/home/bigguiness/buildroot/build_arm/staging_dir/dev/vcsa5': Operation
not permitted
...
More cp: cannot create special file errors
...
cp: cannot create special file
`/home/bigguiness/buildroot/build_arm/staging_dir/dev/console':
Operation not permitted
cp: cannot open `/etc/X11/Xwrapper.config' for reading: Permission
denied
cp: cannot create regular file
`/home/bigguiness/buildroot/build_arm/staging_dir/etc/vmware-tools/xsess
ion-gdm.sh': Permission denied
...
More cp: cannot create regular file errors
...
cp: cannot create regular file
`/home/bigguiness/buildroot/build_arm/staging_dir/etc/vmware-tools/xsess
ion-xdm.pl': Permission denied
cp: cannot access `/etc/cups/ssl': Permission denied
cp: cannot open `/etc/cups/cupsd.conf' for reading: Permission denied
cp: cannot open `/etc/cups/printers.conf' for reading: Permission denied
cp: cannot access `/etc/chatscripts': Permission denied
cp: cannot open `/etc/group-' for reading: Permission denied
cp: cannot access `/etc/selinux/refpolicy-targeted/modules/active':
Permission denied
cp: cannot open
`/etc/selinux/refpolicy-targeted/modules/semanage.read.LOCK' for
reading: Permission denied
cp: cannot open
`/etc/selinux/refpolicy-targeted/modules/semanage.trans.LOCK' for
reading: Permission denied
cp: cannot access `/etc/selinux/refpolicy-targeted/modules/previous':
Permission denied
cp: cannot open `/etc/shadow-' for reading: Permission denied
cp: cannot open `/etc/identd.key' for reading: Permission denied
cp: cannot open `/etc/apt/secring.gpg' for reading: Permission denied
cp: cannot open `/etc/apt/trusted.gpg' for reading: Permission denied
cp: cannot open `/etc/apt/trustdb.gpg' for reading: Permission denied
cp: cannot open `/etc/apt/trusted.gpg~' for reading: Permission denied
cp: cannot open `/etc/.pwd.lock' for reading: Permission denied
cp: cannot access `/etc/ssl/private': Permission denied
cp: cannot open `/etc/passwd-' for reading: Permission denied
cp: cannot open `/etc/qt3/.qt_plugins_3.3rc.lock' for reading:
Permission denied
cp: cannot open `/etc/gshadow-' for reading: Permission denied
cp: cannot open `/etc/at.deny' for reading: Permission denied
cp: cannot open `/etc/sudoers' for reading: Permission denied
cp: cannot open `/etc/ppp/pap-secrets' for reading: Permission denied
cp: cannot open `/etc/ppp/chap-secrets' for reading: Permission denied
cp: cannot access `/etc/ppp/peers': Permission denied
cp: cannot open `/etc/exim4/passwd.client' for reading: Permission
denied
cp: cannot open `/etc/gshadow' for reading: Permission denied
cp: cannot open `/etc/shadow' for reading: Permission denied
cp: cannot create regular file
`/home/bigguiness/buildroot/build_arm/staging_dir/etc/init.d/vmware-tool
s': Permission denied
cp: cannot access `/home/bigguiness/.gnupg': Permission denied

At this point the build just hangs.  I've let it sit there for various
times to see if it will continue but a Ctrl-C always gives me:

make: *** Deleting file
`/home/bigguiness/buildroot/project_build_arm/ep9307/root/lib/libc.so.0'
make: ***
[/home/bigguiness/buildroot/project_build_arm/ep9307/root/lib/libc.so.0]
Interrupt

Any ideas what might be the problem? I'm at a loss...

Thanks,
Hartley
