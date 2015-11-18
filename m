From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 18 Nov 2015 10:03:25 +0100
Subject: [Buildroot] [PATCH v2] pkg-download: support 'file://' in
	BR2_PRIMARY_SITE
Message-ID: <1447837405-25846-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This feature was already discuted here:

  http://lists.busybox.net/pipermail/buildroot/2015-April/125419.html

Personally, I have a big central directory with all tarballs I have
ever downloaded. I use this feature to isolate tarballs necessary to
build a configuration:

  make project_defconfig
  make BR2_DL_DIR=/tmp/mirror-project BR2_PRIMARY_SITE=file:///home/user/dl source
  tar -C /tmp -czvf mirror-project.tgz mirror-project

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
v2:
 - Update help message

 Config.in               | 6 ++++--
 package/pkg-download.mk | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index d795361..1809eeb 100644
--- a/Config.in
+++ b/Config.in
@@ -165,8 +165,10 @@ config BR2_PRIMARY_SITE
 	  Primary site to download from. If this option is set then buildroot
 	  will try to download package source first from this site and try the
 	  default if the file is not found.
-	  Valid URIs are URIs recognized by $(WGET) and scp URIs of the form
-	  scp://[user@]host:path.
+	  Valid URIs are:
+	    - URIs recognized by $(WGET)
+	    - local URIs of the form file://absolutepath
+	    - scp URIs of the form scp://[user@]host:path.
 
 config BR2_PRIMARY_SITE_ONLY
 	bool "Only allow downloads from primary download site"
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c86b9ab..f08f616 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -214,6 +214,7 @@ endef
 define DOWNLOAD_INNER
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
+			file) $(call $(3)_LOCALFILES,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 			scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 			*) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 		esac ; \
-- 
2.1.4
