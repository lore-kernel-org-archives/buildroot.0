From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Fri,  2 Feb 2018 17:55:25 +0300
Subject: [Buildroot] [PATCH v2 1/2] libdrm-armada: new package
In-Reply-To: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20180202145526.20133-2-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Evgeniy Didin <didin@synopsys.com>

libdrm-armada is an Etnaviv libdrm buffer object management module.
It is used with xf86-driver-video-armada, which is Xorg driver for Etnaviv.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
---
Changes since v1:
-Add entry in DEVELOPERS
-Some clean-up was made
-Add license file
-Add dependency for threads in toolchain
-Use full Git hash

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libdrm-armada/Config.in          |  8 ++++++++
 package/libdrm-armada/libdrm-armada.hash |  5 +++++
 package/libdrm-armada/libdrm-armada.mk   | 22 ++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/libdrm-armada/Config.in
 create mode 100644 package/libdrm-armada/libdrm-armada.hash
 create mode 100644 package/libdrm-armada/libdrm-armada.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fe989c0775..f38ce61966 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -153,6 +153,7 @@ F:	package/wf111/
 
 N:	ARC Maintainers <arc-buildroot@synopsys.com>
 F:	arch/Config.in.arc
+F:	package/libdrm-armada
 
 N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
 F:	package/axfsutils/
diff --git a/package/Config.in b/package/Config.in
index bd39a374f0..4e7a15fb49 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1116,6 +1116,7 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
+	source "package/libdrm-armada/Config.in"
 	source "package/libepoxy/Config.in"
 	source "package/libexif/Config.in"
 	source "package/libfm/Config.in"
diff --git a/package/libdrm-armada/Config.in b/package/libdrm-armada/Config.in
new file mode 100644
index 0000000000..a78ed44040
--- /dev/null
+++ b/package/libdrm-armada/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBDRM_ARMADA
+	bool "libdrm-armada"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Etnaviv libdrm buffer object management module
+
+	  http://git.arm.linux.org.uk/cgit/libdrm-armada.git/
diff --git a/package/libdrm-armada/libdrm-armada.hash b/package/libdrm-armada/libdrm-armada.hash
new file mode 100644
index 0000000000..7b36147312
--- /dev/null
+++ b/package/libdrm-armada/libdrm-armada.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  d9a6184276aa9defe70f6eb215656096a4d3c669f2ceae98e8348a60d749c549  libdrm-armada-6b461c163b0bd02c76b65d94cc2fb3767167bda8.tar.gz
+
+# Hash for license file:
+sha256  cf445db5adf2d878b83f7bbd60948a22303f8cf606a83b85fbaf20d9e16a3861  libdrm_lists.h
diff --git a/package/libdrm-armada/libdrm-armada.mk b/package/libdrm-armada/libdrm-armada.mk
new file mode 100644
index 0000000000..c01fa69e0f
--- /dev/null
+++ b/package/libdrm-armada/libdrm-armada.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libdrm-armada
+#
+################################################################################
+
+LIBDRM_ARMADA_VERSION = 6b461c163b0bd02c76b65d94cc2fb3767167bda8
+LIBDRM_ARMADA_SITE = http://git.arm.linux.org.uk/cgit/libdrm-armada.git
+LIBDRM_ARMADA_SITE_METHOD = git
+LIBDRM_ARMADA_DEPENDENCIES = libdrm
+LIBDRM_ARMADA_INSTALL_STAGING = YES
+LIBDRM_ARMADA_AUTORECONF = YES
+LIBDRM_ARMADA_LICENSE_FILES = libdrm_lists.h
+
+# Needed for autoreconf to work properly
+define LIBDRM_ARMADA_FIXUP_M4_DIR
+        mkdir $(@D)/m4
+endef
+
+LIBDRM_ARMADA_POST_PATCH_HOOKS += LIBDRM_ARMADA_FIXUP_M4_DIR
+
+$(eval $(autotools-package))
-- 
2.11.0
