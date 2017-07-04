From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:14 +0200
Subject: [Buildroot] [PATCH 034/100] gnuchess: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-35-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuchess/Config.in   | 1 -
 package/gnuchess/gnuchess.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gnuchess/Config.in b/package/gnuchess/Config.in
index 4993b1a..aa446f4 100644
--- a/package/gnuchess/Config.in
+++ b/package/gnuchess/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_GNUCHESS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  GNU Chess lets most modern computers play a full game of chess.
 
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 0103367..1465ab0 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -11,6 +11,6 @@ GNUCHESS_LICENSE_FILES = COPYING
 
 GNUCHESS_DEPENDENCIES = host-flex flex
 GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline) \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	$(TARGET_NLS_DEPENDENCIES)
 
 $(eval $(autotools-package))
-- 
2.9.4
