From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:32 +0100
Subject: [Buildroot] [PATCH 31/52] package/spandsp: new package
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <30f8c75fe1db337a7b13149fc3a5295faa4f74a3.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in            |  1 +
 package/spandsp/Config.in    |  9 +++++++++
 package/spandsp/spandsp.hash |  2 ++
 package/spandsp/spandsp.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/spandsp/Config.in
 create mode 100644 package/spandsp/spandsp.hash
 create mode 100644 package/spandsp/spandsp.mk

diff --git a/package/Config.in b/package/Config.in
index b3a9539..dd9f3de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -874,6 +874,7 @@ menu "Audio/Sound"
 	source "package/opusfile/Config.in"
 	source "package/portaudio/Config.in"
 	source "package/sbc/Config.in"
+	source "package/spandsp/Config.in"
 	source "package/speex/Config.in"
 	source "package/taglib/Config.in"
 	source "package/tinyalsa/Config.in"
diff --git a/package/spandsp/Config.in b/package/spandsp/Config.in
new file mode 100644
index 0000000..a2d5b85
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
index 0000000..29185da
--- /dev/null
+++ b/package/spandsp/spandsp.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256  cc053ac67e8ac4bb992f258fd94f275a7872df959f6a87763965feabfdcc9465  spandsp-0.0.6.tar.gz
diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
new file mode 100644
index 0000000..661f67e
--- /dev/null
+++ b/package/spandsp/spandsp.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# spandsp
+#
+################################################################################
+
+SPANDSP_VERSION = 0.0.6
+SPANDSP_SITE = http://www.soft-switch.org/downloads/spandsp
+
+SPANDSP_LICENSE = LGPLv2.1 (library), GPLv2 (test suite)
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
2.7.4
