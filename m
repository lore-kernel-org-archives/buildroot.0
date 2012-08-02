From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:47 -0000
Subject: [Buildroot] [git commit branch/next] quota: fix build on uClibc
	with locale support
Message-ID: <20120802195246.62DC28C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62fe33317bd1001de61dfe4df4c8159ecd1f5be0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/508f2ee3f97dfdf782eb1c0b03c2fffb87c4953f

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quota/Config.in |    2 ++
 package/quota/quota.mk  |    5 +++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index dfefb8a..6c2beff 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Implementation of the disk quota system.
 
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 845eefb..9715230 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -10,6 +10,11 @@ QUOTA_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/linuxqu
 
 QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+QUOTA_DEPENDENCIES = gettext libintl
+QUOTA_MAKE_OPT += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
+endif
+
 # Package uses autoconf but not automake.
 QUOTA_INSTALL_TARGET_OPT = \
 	ROOTDIR=$(TARGET_DIR) \
