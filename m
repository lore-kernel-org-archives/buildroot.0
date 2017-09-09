From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:34 +0200
Subject: [Buildroot] [PATCH 28/49 v2] package/spandsp: new package
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <d89d72386ef004f0fdb39074ac4f8814411fe7c8.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                      |  1 +
 package/spandsp/0001-fix-msse4.x.patch | 29 +++++++++++++++++++++++++++++
 package/spandsp/Config.in              |  9 +++++++++
 package/spandsp/spandsp.hash           |  2 ++
 package/spandsp/spandsp.mk             | 28 ++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/spandsp/0001-fix-msse4.x.patch
 create mode 100644 package/spandsp/Config.in
 create mode 100644 package/spandsp/spandsp.hash
 create mode 100644 package/spandsp/spandsp.mk

diff --git a/package/Config.in b/package/Config.in
index 764ae73c8b..2243d6bdcd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -964,6 +964,7 @@ menu "Audio/Sound"
 	source "package/opusfile/Config.in"
 	source "package/portaudio/Config.in"
 	source "package/sbc/Config.in"
+	source "package/spandsp/Config.in"
 	source "package/speex/Config.in"
 	source "package/taglib/Config.in"
 	source "package/tinyalsa/Config.in"
diff --git a/package/spandsp/0001-fix-msse4.x.patch b/package/spandsp/0001-fix-msse4.x.patch
new file mode 100644
index 0000000000..ba3a3e55e3
--- /dev/null
+++ b/package/spandsp/0001-fix-msse4.x.patch
@@ -0,0 +1,29 @@
+diff -durN spandsp-20170713.orig/configure.ac spandsp-20170713/configure.ac
+--- spandsp-20170713.orig/configure.ac	2014-08-09 10:19:27.000000000 +0200
++++ spandsp-20170713/configure.ac	2017-09-07 21:38:36.990854021 +0200
+@@ -354,10 +354,10 @@
+         COMP_VENDOR_CFLAGS="-msse4a $COMP_VENDOR_CFLAGS"
+     fi
+     if test "$enable_sse4_2" = "yes" ; then
+-        COMP_VENDOR_CFLAGS="-msse42 $COMP_VENDOR_CFLAGS"
++        COMP_VENDOR_CFLAGS="-msse4.2 $COMP_VENDOR_CFLAGS"
+     fi
+     if test "$enable_sse4_1" = "yes" ; then
+-        COMP_VENDOR_CFLAGS="-msse41 $COMP_VENDOR_CFLAGS"
++        COMP_VENDOR_CFLAGS="-msse4.1 $COMP_VENDOR_CFLAGS"
+     fi
+     if test "$enable_ssse3" = "yes" ; then
+         COMP_VENDOR_CFLAGS="-mssse3 $COMP_VENDOR_CFLAGS"
+@@ -418,10 +418,10 @@
+         COMP_VENDOR_CFLAGS="-msse4a $COMP_VENDOR_CFLAGS"
+     fi
+     if test "$enable_sse4_2" = "yes" ; then
+-        COMP_VENDOR_CFLAGS="-msse42 $COMP_VENDOR_CFLAGS"
++        COMP_VENDOR_CFLAGS="-msse4.2 $COMP_VENDOR_CFLAGS"
+     fi
+     if test "$enable_sse4_1" = "yes" ; then
+-        COMP_VENDOR_CFLAGS="-msse41 $COMP_VENDOR_CFLAGS"
++        COMP_VENDOR_CFLAGS="-msse4.1 $COMP_VENDOR_CFLAGS"
+     fi
+     if test "$enable_ssse3" = "yes" ; then
+         COMP_VENDOR_CFLAGS="-mssse3 $COMP_VENDOR_CFLAGS"
diff --git a/package/spandsp/Config.in b/package/spandsp/Config.in
new file mode 100644
index 0000000000..a2d5b85d79
--- /dev/null
+++ b/package/spandsp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SPANDSP
+	bool "spandsp"
+	select BR2_PACKAGE_TIFF
+	help
+	  Spandsp is a library of many DSP functions for telephony.
+	  These range from simple modules, such as DTMF detection, to
+	  a complete software FAX machine.
+
+	  http://www.soft-switch.org/
diff --git a/package/spandsp/spandsp.hash b/package/spandsp/spandsp.hash
new file mode 100644
index 0000000000..6c7b772ac7
--- /dev/null
+++ b/package/spandsp/spandsp.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256  fcdc49aafbd4999514f2851f0dcfdc0bfa497eda600e66335a621cdead8b44cb  spandsp-20170713.tar.gz
diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
new file mode 100644
index 0000000000..5e7034e340
--- /dev/null
+++ b/package/spandsp/spandsp.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# spandsp
+#
+################################################################################
+
+SPANDSP_VERSION = 20170713
+SPANDSP_SITE = https://www.soft-switch.org/downloads/spandsp/snapshots
+
+SPANDSP_LICENSE = LGPLv2.1 (library), GPLv2 (test suite)
+SPANDSP_LICENSE_FILES = COPYING
+
+SPANDSP_AUTORECONF = YES
+SPANDSP_DEPENDENCIES = tiff
+SPANDSP_INSTALL_STAGING = YES
+
+SPANDSP_CONF_OPTS = \
+	--disable-doc \
+	--disable-builtin-tiff \
+	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx) \
+	$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
+	$(if $(BR2_X86_CPU_HAS_SSE2),--enable-sse2,--disable-sse2) \
+	$(if $(BR2_X86_CPU_HAS_SSE3),--enable-sse3,--disable-sse3) \
+	$(if $(BR2_X86_CPU_HAS_SSSE3),--enable-ssse3,--disable-ssse3) \
+	$(if $(BR2_X86_CPU_HAS_SSE4),--enable-sse4-1,--disable-sse4-1) \
+	$(if $(BR2_X86_CPU_HAS_SSE42),--enable-sse4-2,--disable-sse4-2)
+
+$(eval $(autotools-package))
-- 
2.11.0
