From: Nathan Lynch <ntl@pobox.com>
Date: Tue, 10 Jul 2012 12:37:22 -0500
Subject: [Buildroot] [PATCH] unexport TERMINFO to correct ncurses behavior
Message-ID: <1341941842-22303-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ncurses build can become polluted by the user's TERMINFO
environment variable, causing the user's ~/.terminfo to be modified
and preventing the install from succeeding:

/bin/sh ./run_tic.sh
** Building terminfo database, please wait...
Running tic to install /home/nathanl/devel/buildroot.git/output/host/usr/i686-unknown-linux-gnu/sysroot/usr/share/emacs/24.0.97/etc/ ...

	You may see messages regarding extended capabilities, e.g., AX.
	These are extended terminal capabilities which are compiled
	using
		tic -x
	If you have ncurses 4.2 applications, you should read the INSTALL
	document, and install the terminfo without the -x option.

1562 entries written to /home/nathanl/.terminfo
** built new /home/nathanl/devel/buildroot.git/output/host/usr/i686-unknown-linux-gnu/sysroot/usr/share/emacs/24.0.97/etc/
installing std
installing stdcrt
installing vt100
installing vt300
make[2]: Leaving directory `/home/nathanl/devel/buildroot.git/output/build/ncurses-5.7/misc'
make[1]: Leaving directory `/home/nathanl/devel/buildroot.git/output/build/ncurses-5.7'
for i in $(find /home/nathanl/devel/buildroot.git/output/host/usr/i686-unknown-linux-gnu/sysroot/usr/lib* -name "*.la"); do cp -f $i $i~; /usr/bin/sed -i -e "s:\(['= ]\)/usr:\\1/home/nathanl/devel/buildroot.git/output/host/usr/i686-unknown-linux-gnu/sysroot/usr:g" $i; done
>>> ncurses 5.7 Installing to target
mkdir -p /home/nathanl/devel/buildroot.git/output/target/usr/lib
cp -dpf /home/nathanl/devel/buildroot.git/output/build/ncurses-5.7/lib/libncurses.so* /home/nathanl/devel/buildroot.git/output/target/usr/lib/
ln -snf /usr/share/terminfo /home/nathanl/devel/buildroot.git/output/target/usr/lib/terminfo
mkdir -p /home/nathanl/devel/buildroot.git/output/target/usr/share/terminfo/x
cp -dpf /home/nathanl/devel/buildroot.git/output/host/usr/i686-unknown-linux-gnu/sysroot/usr/share/terminfo/x/xterm /home/nathanl/devel/buildroot.git/output/target/usr/share/terminfo/x
cp: cannot stat `/home/nathanl/devel/buildroot.git/output/host/usr/i686-unknown-linux-gnu/sysroot/usr/share/terminfo/x/xterm': No such file or directory
make: *** [/home/nathanl/devel/buildroot.git/output/build/ncurses-5.7/.stamp_target_installed] Error 1

So unexport TERMINFO in the top-level Makefile.

Signed-off-by: Nathan Lynch <ntl@pobox.com>

---

Noticed this when building in emacs ansi-term.  The following
defconfig is enough to recreate it:

BR2_x86_i686=y
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_NCURSES=y

Verified that menuconfig still works; is there anything else I should
check?

 Makefile |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index b80477f..6ec7a57 100644
--- a/Makefile
+++ b/Makefile
@@ -199,6 +199,7 @@ unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
 unexport CONFIG_SITE
+unexport TERMINFO
 
 GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
-- 
1.7.10.4
