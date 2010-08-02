From: Malte Starostik <m-starostik@versanet.de>
Date: Mon,  2 Aug 2010 23:08:15 +0200
Subject: [Buildroot] [PATCH 1/2] ntfsprogs: add option to include ntfsmount
Message-ID: <1280783296-18965-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently libfuse is added as a build time dependency for ntfsprogs if
it is included in the target, which makes ntfsmount available. However,
that binary is never installed.
This adds a config option to explicitly request mount support and if so,
pulls in libfuse as a dependency.

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 package/ntfsprogs/Config.in    |    7 +++++++
 package/ntfsprogs/ntfsprogs.mk |    3 ++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
index 836a2b6..eff1ddc 100644
--- a/package/ntfsprogs/Config.in
+++ b/package/ntfsprogs/Config.in
@@ -7,5 +7,12 @@ config BR2_PACKAGE_NTFSPROGS
 
 	  http://www.linux-ntfs.org/
 
+config BR2_PACKAGE_NTFSPROGS_NTFSMOUNT
+	bool "ntfsmount"
+	depends on BR2_PACKAGE_NTFSPROGS
+	select BR2_PACKAGE_LIBFUSE
+	help
+	  include support for mounting NTFS filesystems, requires libfuse
+	  
 comment "ntfsprogs requires a toolchain with WCHAR and LARGEFILE support"
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
index 2046d29..895a324 100644
--- a/package/ntfsprogs/ntfsprogs.mk
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -12,8 +12,9 @@ NTFSPROGS_INSTALL_STAGING:=yes
 NTFSPROGS_BIN:=ntfscat ntfscluster ntfscmp ntfsfix ntfsinfo ntfsls
 NTFSPROGS_SBIN:=ntfsclone ntfscp ntfslabel ntfsresize ntfsundelete mkntfs
 
-ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+ifeq ($(BR2_PACKAGE_NTFSPROGS_NTFSMOUNT),y)
 NTFSPROGS_DEPENDENCIES += libfuse
+NTFSPROGS_BIN += ntfsmount
 endif
 
 $(eval $(call AUTOTARGETS,package,ntfsprogs))
-- 
1.7.1
