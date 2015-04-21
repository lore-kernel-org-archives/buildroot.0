From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 22:09:19 +0200
Subject: [Buildroot] [git commit] package/cryptodev-linux: ccache compile fix
Message-ID: <20150421201501.3977980753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bc1746d277f444e3ca77a1da2738e353d9e9629
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cryptodev-linux fails to build when BR2_CCACHE=y.

>>> cryptodev-linux 1.7 Building
/usr/bin/make -j5 -C /home/dkehn/buildroot/output/build/cryptodev-linux-1.7 HOSTCC="/home/dkehn/buildroot/output/host/usr/bin/ccache /usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/dkehn/buildroot/output/target CROSS_COMPILE="/home/dkehn/buildroot/output/host/usr/bin/ccache /home/dkehn/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-" DEPMOD=/home/dkehn/buildroot/output/host/sbin/depmod LOADADDR="0x82000000" KERNEL_DIR=/home/dkehn/buildroot/output/build/linux-2489c022b2932432606f897741a71b712e6dbe77
make -C /home/dkehn/buildroot/output/build/linux-2489c022b2932432606f897741a71b712e6dbe77 SUBDIRS=`pwd` ARCH=arm CROSS_COMPILE=/home/dkehn/buildroot/output/host/usr/bin/ccache /home/dkehn/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf- modules
make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
make[3]: /home/dkehn/buildroot/output/host/usr/bin/ccachegcc: Command not found

Adding quotes around ${CROSS_COMPILE} KERNEL_MAKE_OPTS assignment in
cryptodev-linux Makefile fixes compile error.

[Thomas: add description and SoB inside the patch.]

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../cryptodev-linux/0002-fix-ccache-compile.patch  |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/cryptodev-linux/0002-fix-ccache-compile.patch b/package/cryptodev-linux/0002-fix-ccache-compile.patch
new file mode 100644
index 0000000..058fb43
--- /dev/null
+++ b/package/cryptodev-linux/0002-fix-ccache-compile.patch
@@ -0,0 +1,20 @@
+Fix compilation with ccache enabled
+
+When ccache is enabled the CROSS_COMPILE variable contains a space, so
+it must be properly quoted.
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
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
