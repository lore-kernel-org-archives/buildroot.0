From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:55 +0200
Subject: [Buildroot] [PATCH 075/100] sshfs: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-76-thomas.petazzoni@free-electrons.com>
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
 package/sshfs/Config.in | 1 -
 package/sshfs/sshfs.mk  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 54aa831..54e92c6 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_SSHFS
 	depends on !BR2_STATIC_LIBS # libfuse
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
 	help
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 1288318..ee96ad6 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -10,7 +10,7 @@ SSHFS_LICENSE = GPL-2.0
 SSHFS_LICENSE_FILES = COPYING
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 $(eval $(autotools-package))
-- 
2.9.4
