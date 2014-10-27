From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 17:41:42 +0100
Subject: [Buildroot] [git commit] subversion: needs sqlite and pkg-config
Message-ID: <20141027164208.8EC20B10EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97c5d445202b082d0bb390a8c395dacb09942416
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/de2/de243c429c1e443efdbba82a860dbb7a03d5b746/
http://autobuild.buildroot.net/results/40c/40ce377893789883503deaa57912b87d2e0192e8/
http://autobuild.buildroot.net/results/134/13449cd77fbbd1c2b21d04b1fc866a086d915353/
http://autobuild.buildroot.net/results/e3f/e3fc33177eef955830a7be68e7b23503fd1d9ebe/
and others.

Also add the missing 'select' statements for apr, expat and zlib to match
the .mk file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/Config.in     |    4 ++++
 package/subversion/subversion.mk |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index cc2549f..dc04bdb 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_SUBVERSION
 	bool "subversion"
+	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_APR_UTIL
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_XML
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_SQLITE
 	help
 	  Subversion is an open source version control system
 
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index af5244b..5f37a87 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -9,7 +9,7 @@ SUBVERSION_SITE = http://archive.apache.org/dist/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
 
-SUBVERSION_DEPENDENCIES = apr apr-util expat neon zlib
+SUBVERSION_DEPENDENCIES = host-pkgconf apr apr-util expat neon zlib sqlite
 SUBVERSION_CONF_OPTS = \
 	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
 	--with-apr=$(STAGING_DIR)/usr \
