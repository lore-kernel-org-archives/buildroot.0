From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:36:34 +0200
Subject: [Buildroot] [git commit] whois: use the new gettext logic
Message-ID: <20170704233519.B7F377FCEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eb862bff5d318bb2e1e4983abf3a7dfc7efdece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection, which means we no longer
   need to depend on BR2_USE_WCHAR, so this dependency is dropped

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/whois/Config.in | 6 ------
 package/whois/whois.mk  | 8 ++------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/whois/Config.in b/package/whois/Config.in
index 0fbaf90..9505d58 100644
--- a/package/whois/Config.in
+++ b/package/whois/Config.in
@@ -1,13 +1,7 @@
 config BR2_PACKAGE_WHOIS
 	bool "whois"
-	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Improved whois client.
 
 	  http://www.linux.it/~md/software/
-
-comment "whois needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 24b6b69..b773499 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -8,17 +8,13 @@ WHOIS_VERSION = 5.2.14
 WHOIS_SITE = http://snapshot.debian.org/archive/debian/20161230T032015Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
-WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+WHOIS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox) $(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
 WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS="$(WHOIS_EXTRA_LIBS)"
 WHOIS_LICENSE = GPL-2.0+
 WHOIS_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_NEEDS_GETTEXT),y)
-WHOIS_DEPENDENCIES += gettext
-WHOIS_EXTRA_LIBS += -lintl
-endif
+WHOIS_EXTRA_LIBS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WHOIS_DEPENDENCIES += libiconv
