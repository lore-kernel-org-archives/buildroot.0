From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 18:29:33 +0200
Subject: [Buildroot] [git commit branch/next] Package downloads: allow
	restricting to primary site only
Message-ID: <20120802195258.C0B798E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a83e0849964c5160b980bb57ce89e28684a7dbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds a new config option BR2_PRIMARY_SITE_ONLY that, when set,
restricts package downloads to the specified BR2_PRIMARY_SITE. If the package
is not present on the primary site, the download fails.

This is useful for project developers who want to ensure that the project can
be built even if the upstream tarball locations disappear.

[thomas.petazzoni at free-electrons.com:
 Extend config option help message with more details coming from the
 commit log. Added a dependency on the fact that a primary site has
 been defined. Without any primary site (the default configuration),
 this new option does not make any sense.]

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in               |   18 ++++++++++++++++++
 package/pkg-download.mk |    7 +++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index c182f70..b18c927 100644
--- a/Config.in
+++ b/Config.in
@@ -123,6 +123,22 @@ config BR2_PRIMARY_SITE
 	  NOTE: This works for all packages using the central package
 	  infrastructure (generic, autotools, cmake, ...)
 
+config BR2_PRIMARY_SITE_ONLY
+	bool "Only allow downloads from primary download site"
+	depends on BR2_PRIMARY_SITE != ""
+	help
+	  If this option is enabled, downloads will only be attempted
+	  from the primary download site. Other locations, like the
+	  package's official download location or the backup download
+	  site, will not be considered. Therefore, if the package is
+	  not present on the primary site, the download fails.
+
+	  This is useful for project developers who want to ensure
+	  that the project can be built even if the upstream tarball
+	  locations disappear.
+
+if !BR2_PRIMARY_SITE_ONLY
+
 config BR2_BACKUP_SITE
 	string "Backup download site"
 	default "http://sources.buildroot.net/"
@@ -179,6 +195,8 @@ config BR2_DEBIAN_MIRROR
 	  Usually, just add your country code like XX here:
 	  http://ftp.XX.debian.org
 
+endif
+
 endmenu
 
 config BR2_JLEVEL
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e938759..9e98581 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -192,8 +192,8 @@ endef
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
-# 2) Download site
-# 3) BR2_BACKUP_SITE if enabled
+# 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
+# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
 #
 # Argument 1 is the source location
 # Argument 2 is the source filename
@@ -213,6 +213,9 @@ define DOWNLOAD_INNER
 			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
+	if test "$(BR2_PRIMARY_SITE_ONLY)" = "y" ; then \
+		exit 1 ; \
+	fi ; \
 	if test -n "$(1)" ; then \
 		if test -z "$($(PKG)_SITE_METHOD)" ; then \
 			scheme="$(call geturischeme,$(1))" ; \
