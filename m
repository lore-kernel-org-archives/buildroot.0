From: Gregory Dymarek <gregd72002@gmail.com>
Date: Fri, 12 Dec 2014 15:42:41 +0000
Subject: [Buildroot] [PATCH v2 1/7] Adding ding-libs
In-Reply-To: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418398967-2183-2-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/Config.in                |  1 +
 package/ding-libs/Config.in      |  9 +++++++++
 package/ding-libs/ding-libs.hash |  1 +
 package/ding-libs/ding-libs.mk   | 17 +++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/ding-libs/Config.in
 create mode 100644 package/ding-libs/ding-libs.hash
 create mode 100644 package/ding-libs/ding-libs.mk

diff --git a/package/Config.in b/package/Config.in
index 48be2df..9e3f11b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -876,6 +876,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
new file mode 100644
index 0000000..7c7a17f
--- /dev/null
+++ b/package/ding-libs/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DING_LIBS
+	bool "ding-libs"
+#	depends on BR2_TOOLCHAIN_BUILDROOT_LOCALE 
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	Adds ding-libs 
+	https://git.fedorahosted.org/git/ding-libs.git
+
diff --git a/package/ding-libs/ding-libs.hash b/package/ding-libs/ding-libs.hash
new file mode 100644
index 0000000..cf21585
--- /dev/null
+++ b/package/ding-libs/ding-libs.hash
@@ -0,0 +1 @@
+sha256,639984a57d6f936a6551c842712619692febaebf4515033fc929620a241ffa6a
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
new file mode 100644
index 0000000..582b9be
--- /dev/null
+++ b/package/ding-libs/ding-libs.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# ding-libs
+#
+#############################################################
+DING_LIBS_VERSION = 0_4_0
+DING_LIBS_SOURCE = ding_libs-$(DING_LIBS_VERSION).tar.xz
+DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot 
+#DING_LIBS_DEPENDENCIES = BR2_TOOLCHAIN_BUILDROOT_LOCALE
+DING_LIBS_DEPENDENCIES = $(if !$(BR2_ENABLE_LOCALE),libiconv) $(if $(BR2_NEEDS_GETTEXT),gettext) 
+DING_LIBS_AUTORECONF = YES
+DING_LIBS_INSTALL_STAGING = YES
+DING_LIBS_LICENSE = GPLv3
+DING_LIBS_LICENSE_FILES = COPYING
+DING_LIBS_MAKE=$(MAKE1)
+
+$(eval $(autotools-package))
-- 
1.9.1
