From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 10 Apr 2015 10:01:05 -0500
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: ccache compile fix
Message-ID: <1428678065-24673-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cryptodev-linux fails to build when BR2_CCACHE=y.

>>> cryptodev-linux 1.7 Building
/usr/bin/make -j5 -C /home/dkehn/buildroot/output/build/cryptodev-linux-1.7 HOSTCC="/home/dkehn/buildroot/output/host/usr/bin/ccache /usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/dkehn/buildroot/output/target CROSS_COMPILE="/home/dkehn/buildroot/output/host/usr/bin/ccache /home/dkehn/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-" DEPMOD=/home/dkehn/buildroot/output/host/sbin/depmod LOADADDR="0x82000000" KERNEL_DIR=/home/dkehn/buildroot/output/build/linux-2489c022b2932432606f897741a71b712e6dbe77
make -C /home/dkehn/buildroot/output/build/linux-2489c022b2932432606f897741a71b712e6dbe77 SUBDIRS=`pwd` ARCH=arm CROSS_COMPILE=/home/dkehn/buildroot/output/host/usr/bin/ccache /home/dkehn/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf- modules
make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
make[3]: /home/dkehn/buildroot/output/host/usr/bin/ccachegcc: Command not found

Adding quotes around ${CROSS_COMPILE} KERNEL_MAKE_OPTS assignment in
cryptodev-linux Makefile fixes compile error.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/cryptodev-linux/0002-fix-ccache-compile.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/cryptodev-linux/0002-fix-ccache-compile.patch

diff --git a/package/cryptodev-linux/0002-fix-ccache-compile.patch b/package/cryptodev-linux/0002-fix-ccache-compile.patch
new file mode 100644
index 0000000..a023190
--- /dev/null
+++ b/package/cryptodev-linux/0002-fix-ccache-compile.patch
@@ -0,0 +1,13 @@
+Index: cryptodev-linux-1.7/Makefile
+===================================================================
+--- cryptodev-linux-1.7.orig/Makefile
++++ cryptodev-linux-1.7/Makefile
+@@ -18,7 +18,7 @@ ifneq (${ARCH},)
+ KERNEL_MAKE_OPTS += ARCH=${ARCH}
+ endif
+ ifneq (${CROSS_COMPILE},)
+-KERNEL_MAKE_OPTS += CROSS_COMPILE=${CROSS_COMPILE}
++KERNEL_MAKE_OPTS += CROSS_COMPILE="${CROSS_COMPILE}"
+ endif
+ 
+ build: version.h
-- 
2.3.5
