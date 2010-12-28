From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:10:34 -0300
Subject: [Buildroot] [PATCH 09/10] binutils: needs libintl when locales are
	enabled
In-Reply-To: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293563435-10054-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/Config.in   |    2 ++
 package/binutils/binutils.mk |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 942562e..65b0f30 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_BINUTILS
 	bool
 	depends on BR2_TOOLCHAIN_BUILDROOT
 	default y if BR2_PACKAGE_BINUTILS_TARGET || BR2_PACKAGE_BINUTILS_LIBBFD
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 
 config BR2_PACKAGE_BINUTILS_TARGET
 	bool "binutils"
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 634c7ae..62b8b89 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -12,6 +12,7 @@ BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
+BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 # These aren't really needed, we just pull them until gcc is a proper package
 ifeq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
-- 
1.7.2.2
