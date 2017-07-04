From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:56 +0200
Subject: [Buildroot] [PATCH 016/100] clamav: use new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-17-thomas.petazzoni@free-electrons.com>
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
 package/clamav/Config.in | 1 -
 package/clamav/clamav.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index a962103..bc934ea 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CLAMAV
 	bool "clamav"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 23dee0a..5429abb 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -15,7 +15,7 @@ CLAMAV_DEPENDENCIES = \
 	libtool \
 	openssl \
 	zlib \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	$(TARGET_NLS_DEPENDENCIES)
 
 # mmap cannot be detected when cross-compiling, needed for mempool support
 CLAMAV_CONF_ENV = \
-- 
2.9.4
