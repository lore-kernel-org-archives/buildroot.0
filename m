From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 May 2017 23:31:30 +0200
Subject: [Buildroot] [PATCH] grep: gettext is not mandatory
Message-ID: <1495229490-4820-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even when locales are enabled, gettext is not mandatory to build
grep, i.e the following defconfig builds fine:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.02-1096-g54a5333.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_GREP=y

However, if gettext provides libintl, it gets used. Therefore this
commit moves gettext from a mandatory dependency to an optional
dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/Config.in | 1 -
 package/grep/grep.mk   | 6 +++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/grep/Config.in b/package/grep/Config.in
index 6427650..5b0471b 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GREP
 	bool "grep"
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  The GNU regular expression matcher.
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 92a915c..5101dda 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -11,7 +11,11 @@ GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_CONF_OPTS = --disable-perl-regexp \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
-GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+
+# Can use libintl if available
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+GREP_DEPENDENCIES += gettext
+endif
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-- 
2.7.4
