From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Thu, 15 Oct 2020 12:23:24 +0000
Subject: [Buildroot] [PATCH 1/1] opensc: new package
Message-ID: <HTWQnJ0gT9IYyrHRALoef3ZjeiElmsAU9i55-sqSxBQ5ZyngPz7qhxmskaI-ATuoiCd2BDsDq1CTS01wtL_ZGkCyR3RcGrXRaNbYiFE-sbw=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Open source smart card tools and middleware.
OpenSC provides a set of libraries and utilities to work with smart cards. Its
main focus is on cards that support cryptographic operations, and facilitate
their use in security applications such as authentication, mail encryption and
digital signatures. OpenSC implements the standard APIs to smart cards, e.g.
PKCS#11 API, Windows? Smart Card Minidriver and macOS CryptoTokenKit.

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 ...icit-declaration-of-function-wprintf.patch | 26 +++++++++++++++++++
 package/opensc/Config.in                      | 22 ++++++++++++++++
 package/opensc/opensc.hash                    |  3 +++
 package/opensc/opensc.mk                      | 14 ++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/opensc/0001-Comment-implicit-declaration-of-function-wprintf.patch
 create mode 100644 package/opensc/Config.in
 create mode 100644 package/opensc/opensc.hash
 create mode 100644 package/opensc/opensc.mk

diff --git a/package/opensc/0001-Comment-implicit-declaration-of-function-wprintf.patch b/package/opensc/0001-Comment-implicit-declaration-of-function-wprintf.patch
new file mode 100644
index 0000000000..48a8dedd92
--- /dev/null
+++ b/package/opensc/0001-Comment-implicit-declaration-of-function-wprintf.patch
@@ -0,0 +1,26 @@
+From 8ad8030732544f4eb94e9f0d55a3878842737928 Mon Sep 17 00:00:00 2001
+From: Yair Ben-Avraham <yairba@protonmail.com>
+Date: Wed, 14 Oct 2020 13:28:23 +0200
+Subject: [PATCH 1/1] Comment implicit declaration of function wprintf
+
+Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
+---
+ src/tools/gids-tool.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tools/gids-tool.c b/src/tools/gids-tool.c
+index 53203f22..3a58b007 100644
+--- a/src/tools/gids-tool.c
++++ b/src/tools/gids-tool.c
+@@ -419,7 +419,7 @@ static int print_info(sc_card_t *card) {
+ 				}
+ 				for (i = 0; i < cmaprecordnum; i++) {
+ 					printf("   container:                  %d\n", i);
+-					wprintf(L"      guid:                    %ls\n", cmaprecords[i].wszGuid);
++					// wprintf(L"      guid:                    %ls\n", cmaprecords[i].wszGuid);
+ 					printf("      bFlags:                  ");
+ 					if (cmaprecords[i].bFlags & CONTAINER_MAP_VALID_CONTAINER) {
+ 						printf("Valid container");
+--
+2.20.1
+
diff --git a/package/opensc/Config.in b/package/opensc/Config.in
new file mode 100644
index 0000000000..98581c0a7c
--- /dev/null
+++ b/package/opensc/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_OPENSC
+	bool "opensc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite, libusb
+	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
+	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Open source smart card tools and middleware.
+	  OpenSC provides a set of libraries and utilities to work with smart
+	  cards. Its main focus is on cards that support cryptographic
+	  operations, and facilitate their use in security applications such as
+	  authentication, mail encryption and digital signatures. OpenSC
+	  implements the standard APIs to smart cards, e.g. PKCS#11 API,
+	  Windows? Smart Card Minidriver and macOS CryptoTokenKit.
+
+	  https://github.com/OpenSC/OpenSC
+
+comment "opensc needs a toolchain w/ wchar threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
new file mode 100644
index 0000000000..aceb51e2de
--- /dev/null
+++ b/package/opensc/opensc.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  bbf4b4f4a44463645c90a525e820a8059b2f742a53b7b944f941de3c97ba4863  opensc-0.20.0.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
new file mode 100644
index 0000000000..f01acbbb3d
--- /dev/null
+++ b/package/opensc/opensc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# opensc
+#
+################################################################################
+
+OPENSC_VERSION = 0.20.0
+OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
+OPENSC_LICENSE = LGPLv2.1+
+OPENSC_LICENSE_FILES = COPYING
+OPENSC_INSTALL_STAGING = YES
+OPENSC_DEPENDENCIES = pcsc-lite
+
+$(eval $(autotools-package))
--
2.20.1
