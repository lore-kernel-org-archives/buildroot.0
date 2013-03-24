From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 14:36:10 +0100
Subject: [Buildroot] [git commit] unexport TERMINFO to correct ncurses
	behavior
Message-ID: <20130324133540.AA99A9B26D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20ca008d02668c8f5880c81e2b8d1c9fd7841bd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index c462bb1..f1c98aa 100644
--- a/Makefile
+++ b/Makefile
@@ -208,6 +208,7 @@ unexport CXXFLAGS
 unexport GREP_OPTIONS
 unexport CONFIG_SITE
 unexport QMAKESPEC
+unexport TERMINFO
 
 GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
