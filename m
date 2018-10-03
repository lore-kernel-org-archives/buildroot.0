From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Oct 2018 15:13:57 +0200
Subject: [Buildroot] [PATCH 3/4] package/spandsp: new package
In-Reply-To: <20181003131358.28002-1-bernd.kuhls@t-online.de>
References: <20181003131358.28002-1-bernd.kuhls@t-online.de>
Message-ID: <20181003131358.28002-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[Bernd:
 - bumped version to 20180108
 - removed 0001-fix-msse4.x.patch, applied upstream
 - removed autoreconf after patch removal
 - added license hash (Arnout)
 - added SPDX license codes (Arnout)]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in            |  1 +
 package/spandsp/Config.in    |  9 +++++++++
 package/spandsp/spandsp.hash |  3 +++
 package/spandsp/spandsp.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/spandsp/Config.in
 create mode 100644 package/spandsp/spandsp.hash
 create mode 100644 package/spandsp/spandsp.mk

diff --git a/package/Config.in b/package/Config.in
index 02660a4164..d378e2401f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1094,6 +1094,7 @@ menu "Audio/Sound"
 	source "package/opusfile/Config.in"
 	source "package/portaudio/Config.in"
 	source "package/sbc/Config.in"
+	source "package/spandsp/Config.in"
 	source "package/speex/Config.in"
 	source "package/speexdsp/Config.in"
 	source "package/taglib/Config.in"
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
index 0000000000..1123e29c1b
--- /dev/null
+++ b/package/spandsp/spandsp.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256 0fcdda74bd9703dd66c3e9721bf2d81bd7c185c539d1887768c2b332ab703d51  spandsp-20180108.tar.gz
+sha256 366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  COPYING
diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
new file mode 100644
index 0000000000..4b1f89cf4b
--- /dev/null
+++ b/package/spandsp/spandsp.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# spandsp
+#
+################################################################################
+
+SPANDSP_VERSION = 20180108
+SPANDSP_SITE = https://www.soft-switch.org/downloads/spandsp/snapshots
+
+SPANDSP_LICENSE = LGPL-2.1 (library), GPL-2.0 (test suite)
+SPANDSP_LICENSE_FILES = COPYING
+
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
2.19.0
