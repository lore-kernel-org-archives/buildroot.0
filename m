From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:24 +0200
Subject: [Buildroot] [git commit] axel: use the new gettext logic
Message-ID: <20170704233513.3F6317F8A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e41fd0c4cdf40075674c1e527c2776597f6bc36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Note that -lpthread is no longer needed for -lintl, but axel uses
pthread directly anyway, so we have to keep -lpthread as part of
LDFLAGS.

Finally, we now use BR2_SYSTEM_ENABLE_NLS to decide whether NLS
support should be enabled or not.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/axel/Config.in |  1 -
 package/axel/axel.mk   | 12 +++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/axel/Config.in b/package/axel/Config.in
index aea85bf..6e709cf 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  HTTP/FTP download accelerator.
 
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index e89a946..60bf5e4 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -8,16 +8,10 @@ AXEL_VERSION = 2.4
 AXEL_SITE = http://sources.buildroot.net
 AXEL_LICENSE = GPL-2.0+
 AXEL_LICENSE_FILES = COPYING
+AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+AXEL_LDFLAGS = -lpthread $(TARGET_NLS_LIBS)
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-AXEL_DEPENDENCIES += gettext
-AXEL_LDFLAGS += -lintl
-endif
-
-# -lintl may use symbols from -lpthread
-AXEL_LDFLAGS += -lpthread
-
-ifneq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 AXEL_DISABLE_I18N = --i18n=0
 endif
 
