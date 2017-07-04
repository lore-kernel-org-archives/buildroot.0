From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:24 +0200
Subject: [Buildroot] [git commit] clamav: use new gettext logic
Message-ID: <20170704233513.72F848083A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6882af6364819f38db7c67093b970778eea2170
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
