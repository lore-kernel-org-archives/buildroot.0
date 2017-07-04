From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:59 +0200
Subject: [Buildroot] [PATCH 019/100] curlftpfs: use new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-20-thomas.petazzoni@free-electrons.com>
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
 package/curlftpfs/Config.in    | 1 -
 package/curlftpfs/curlftpfs.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index 986faf1..c8c432f 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_CURLFTPFS
 	depends on !BR2_STATIC_LIBS # libfuse
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
index 585dbf2..584d01a 100644
--- a/package/curlftpfs/curlftpfs.mk
+++ b/package/curlftpfs/curlftpfs.mk
@@ -11,7 +11,7 @@ CURLFTPFS_LICENSE = GPL-2.0
 CURLFTPFS_LICENSE_FILES = COPYING
 CURLFTPFS_DEPENDENCIES = \
 	libglib2 libfuse openssl libcurl \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 $(eval $(autotools-package))
-- 
2.9.4
