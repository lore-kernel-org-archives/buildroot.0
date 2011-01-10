From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 22:24:43 +0100
Subject: [Buildroot] [git commit master 1/1] flac: fix powerpc build
Message-ID: <20110110213102.65FD38A389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e2fd818870882158dab4c3aa4c1fdac11211fd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flac incorrectly assumes every powerpc around has altivec.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/flac/flac-no-altivec.patch |   28 +++++++++++++++++++++++++
 package/multimedia/flac/flac.mk               |    2 -
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 package/multimedia/flac/flac-no-altivec.patch

diff --git a/package/multimedia/flac/flac-no-altivec.patch b/package/multimedia/flac/flac-no-altivec.patch
new file mode 100644
index 0000000..c6a535b
--- /dev/null
+++ b/package/multimedia/flac/flac-no-altivec.patch
@@ -0,0 +1,28 @@
+FLAC assumes every powerpc around has altivec ABI which is wrong.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura flac-1.2.1/src/libFLAC/Makefile.am flac-1.2.1-noaltivec/src/libFLAC/Makefile.am
+--- flac-1.2.1/src/libFLAC/Makefile.am	2007-09-14 18:06:17.000000000 -0300
++++ flac-1.2.1-noaltivec/src/libFLAC/Makefile.am	2011-01-06 15:14:36.384242614 -0300
+@@ -41,7 +41,7 @@
+ else
+ # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
+ #@@@ PPC optimizations temporarily disabled
+-CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
++CPUCFLAGS = -DFLAC__NO_ASM
+ endif
+ endif
+ 
+diff -Nura flac-1.2.1/src/libFLAC/Makefile.in flac-1.2.1-noaltivec/src/libFLAC/Makefile.in
+--- flac-1.2.1/src/libFLAC/Makefile.in	2007-09-16 17:05:12.000000000 -0300
++++ flac-1.2.1-noaltivec/src/libFLAC/Makefile.in	2011-01-06 15:14:50.997545602 -0300
+@@ -240,7 +240,7 @@
+ @FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_TRUE at CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
+ # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
+ #@@@ PPC optimizations temporarily disabled
+- at FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_FALSE at CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
++ at FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_FALSE at CPUCFLAGS = -DFLAC__NO_ASM
+ 
+ AM_CFLAGS = $(DEBUGCFLAGS) $(CPUCFLAGS) @OGG_CFLAGS@
+ @FLaC__CPU_PPC_TRUE@@FLaC__NO_ASM_FALSE at ARCH_SUBDIRS = ppc
diff --git a/package/multimedia/flac/flac.mk b/package/multimedia/flac/flac.mk
index a11924a..dbaf2e9 100644
--- a/package/multimedia/flac/flac.mk
+++ b/package/multimedia/flac/flac.mk
@@ -7,8 +7,6 @@
 FLAC_VERSION = 1.2.1
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.gz
 FLAC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/flac/
-FLAC_AUTORECONF = NO
-FLAC_INSTALL_TARGET = YES
 FLAC_INSTALL_STAGING = YES
 
 FLAC_CONF_OPT = \
-- 
1.7.2.2
