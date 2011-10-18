From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 11:14:54 -0300
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
Message-ID: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add FOO_MIRROR support for packages that have different URLs to fetch
from, for redundancy or when they move to an obsolete/old directory when
a new version pops up.
Only implement for WGET methods.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.package.in |   26 +++++++++++++++++++++++---
 1 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index b5ef57b..b9b5181 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -207,10 +207,12 @@ endef
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
 # 2) Download site
-# 3) BR2_BACKUP_SITE if enabled
+# 3) Download mirror
+# 4) BR2_BACKUP_SITE if enabled
 #
 # Argument 1 is the source location
 # Argument 2 is the source filename
+# Argument 3 is the mirror location
 #
 # E.G. use like this:
 # $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
@@ -229,6 +231,15 @@ define DOWNLOAD
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
+	if test -n "$(3)" ; then \
+		case "$($(PKG)_SITE_METHOD)" in \
+			git) exit ;; \
+			svn) exit ;; \
+			bzr) exit ;; \
+			file) exit ;; \
+			*) $(call $(DL_MODE)_WGET,$(3),$(2)) && exit ;; \
+		esac ; \
+	fi ; \
 	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
 		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
 	fi ; \
@@ -266,8 +277,8 @@ ifeq ($(DL_MODE),DOWNLOAD)
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
 endif
-	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE)))
-	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
+	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE),$($(PKG)_MIRROR)))
+	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH),$($(PKG)_MIRROR)))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
@@ -463,6 +474,15 @@ ifndef $(2)_SITE
  endif
 endif
 
+ifndef $(2)_MIRROR
+ ifdef $(3)_MIRROR
+  $(2)_MIRROR = $($(3)_MIRROR)
+ else
+  $(2)_MIRROR			?= \
+	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
+ endif
+endif
+
 ifndef $(2)_SITE_METHOD
  ifdef $(3)_SITE_METHOD
   $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
-- 
1.7.3.4
