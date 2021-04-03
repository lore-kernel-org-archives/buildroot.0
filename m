From: qblade <qblade@protonmail.com>
Date: Sat, 03 Apr 2021 13:41:58 +0000
Subject: [Buildroot] [PATCH 2/2] package: add kmscon
Message-ID: <Tid09bZA4nUDltEiuqvCboxK-cHb0Jk33cy_PRXdZVvU06oGEHtPoqhIeI9ZsFZx-V2PI8RDQly7DwDBSbd-TaGt3O35gdGXHbQzOlje2jk=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: qblade <qblade@protonmail.com>
---
 package/Config.in          |  1 +
 package/kmscon/Config.in   | 13 +++++++++++++
 package/kmscon/kmscon.hash |  2 ++
 package/kmscon/kmscon.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/kmscon/Config.in
 create mode 100644 package/kmscon/kmscon.hash
 create mode 100644 package/kmscon/kmscon.mk

diff --git a/package/Config.in b/package/Config.in
index 1269bc7b51..ca86e3dd2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1932,6 +1932,7 @@ menu "Other"
 	source "package/libtasn1/Config.in"
 	source "package/libtommath/Config.in"
 	source "package/libtpl/Config.in"
+	source "package/libtsm/Config.in"
 	source "package/libubox/Config.in"
 	source "package/libuci/Config.in"
 	source "package/libunwind/Config.in"
diff --git a/package/kmscon/Config.in b/package/kmscon/Config.in
new file mode 100644
index 0000000000..356d5f497d
--- /dev/null
+++ b/package/kmscon/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KMSCON
+	bool "kmscon"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBTSM
+	select BR2_PACKAGE_XKEYBOARD_CONFIG # keyboard layout support
+	help
+	  Kmscon is a simple terminal emulator based on linux kernel
+	  mode setting (KMS). It is an attempt to replace the in-kernel
+	  VT implementation with a userspace console.
+
+	https://www.freedesktop.org/wiki/Software/kmscon/
diff --git a/package/kmscon/kmscon.hash b/package/kmscon/kmscon.hash
new file mode 100644
index 0000000000..134e39285b
--- /dev/null
+++ b/package/kmscon/kmscon.hash
@@ -0,0 +1,2 @@
+sha256 9f4a8c643dc8c7f551cf0f1bd4c6059a019c162c147178aa00a5c09eff8b9fbe  kmscon-01dd0a231e2125a40ceba5f59fd945ff29bf2cdc.tar.gz
+sha256 bf738bc59e8608b783e35d61f49705cdbf668b611d13a32483d734c38dc289f9  COPYING
diff --git a/package/kmscon/kmscon.mk b/package/kmscon/kmscon.mk
new file mode 100644
index 0000000000..03e075f019
--- /dev/null
+++ b/package/kmscon/kmscon.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kmscon
+#
+################################################################################
+
+KMSCON_VERSION = 01dd0a231e2125a40ceba5f59fd945ff29bf2cdc
+KMSCON_SITE = $(call github,Aetf,kmscon,$(KMSCON_VERSION))
+KMSCON_AUTORECONF = YES
+KMSCON_DEPENDENCIES = host-automake host-autoconf host-libtool libxkbcommon libtsm udev libdrm
+KMSCON_LICENSE = MIT, LGPL-2.1+, BSD-2-Clause, GPL-2.0+
+KMSCON_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
--
2.27.0
