From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Dec 2015 17:39:13 +0100
Subject: [Buildroot] [PATCH 1/4] package/libelementary: move to package
	directory
Message-ID: <1450543156-16847-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on the list the two remaining packages in
package/efl subdirectory will be moved to package/
directory.

- Add the efl dependency to libelementary.
- Set LIBELEMENTARY_VERSION with the version number
  directly.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  | 1 +
 package/efl/Config.in                              | 1 -
 package/{efl => }/libelementary/Config.in          | 3 ++-
 package/{efl => }/libelementary/libelementary.hash | 0
 package/{efl => }/libelementary/libelementary.mk   | 2 +-
 5 files changed, 4 insertions(+), 3 deletions(-)
 rename package/{efl => }/libelementary/Config.in (89%)
 rename package/{efl => }/libelementary/libelementary.hash (100%)
 rename package/{efl => }/libelementary/libelementary.mk (97%)

diff --git a/package/Config.in b/package/Config.in
index 94898a1..75d6201 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -252,6 +252,7 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libelementary/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 80658b2..7ef1b5b 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -16,7 +16,6 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 source "package/efl/libefl/Config.in"
-source "package/efl/libelementary/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
diff --git a/package/efl/libelementary/Config.in b/package/libelementary/Config.in
similarity index 89%
rename from package/efl/libelementary/Config.in
rename to package/libelementary/Config.in
index ce597de..54f8688 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/libelementary/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
-	select BR2_PACKAGE_LIBEFL
+	depends on BR2_PACKAGE_EFL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elm_store.c
 	depends on !BR2_STATIC_LIBS
 	help
@@ -11,4 +11,5 @@ config BR2_PACKAGE_LIBELEMENTARY
 	  https://enlightenment.org
 
 comment "libelementary needs a toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_EFL
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/efl/libelementary/libelementary.hash b/package/libelementary/libelementary.hash
similarity index 100%
rename from package/efl/libelementary/libelementary.hash
rename to package/libelementary/libelementary.hash
diff --git a/package/efl/libelementary/libelementary.mk b/package/libelementary/libelementary.mk
similarity index 97%
rename from package/efl/libelementary/libelementary.mk
rename to package/libelementary/libelementary.mk
index c920801..4ba8681 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/libelementary/libelementary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = $(EFL_VERSION)
+LIBELEMENTARY_VERSION = 1.15.2
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.xz
 LIBELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
 LIBELEMENTARY_LICENSE = LGPLv2.1
-- 
2.4.3
