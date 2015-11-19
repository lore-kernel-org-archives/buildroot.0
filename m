From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 19 Nov 2015 11:36:05 +0100
Subject: [Buildroot] [PATCH 4/5] pkg-generic: provide an option to use git
	archives
In-Reply-To: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
Message-ID: <1447929366-8972-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note: In order to make this work, $(2)_SITE_METHOD must be set before
$(2)_SOURCE

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Config.in              | 13 +++++++++++++
 package/pkg-generic.mk | 36 ++++++++++++++++++++----------------
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/Config.in b/Config.in
index d795361..6b9482c 100644
--- a/Config.in
+++ b/Config.in
@@ -158,6 +158,19 @@ config BR2_HOST_DIR
 
 menu "Mirrors and Download locations"
 
+config BR2_USE_GIT_ARCHIVES
+	bool "Place git repository in archives"
+	help
+	  In case a package use a git repository as source. Enabling this
+	  option will archive (shallowed) bare git repository instead of plain
+	  files. In order to distinguish these archives from classical ones,
+	  their names end with .git.tar.gz.
+
+	  Enable this option if you work with upstream and are interrested to
+	  have a better workflow with upstream team. Notice archive generation
+	  is about 25% slower and archives are 20 to 50% bigger. Time to extract
+	  archives are identical with or without this option.
+
 config BR2_PRIMARY_SITE
 	string "Primary download site"
 	default ""
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 846d8e9..30155a6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -412,11 +412,30 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
 
+ifndef $(2)_SITE
+ ifdef $(3)_SITE
+  $(2)_SITE = $$($(3)_SITE)
+ endif
+endif
+
+ifndef $(2)_SITE_METHOD
+ ifdef $(3)_SITE_METHOD
+  $(2)_SITE_METHOD = $$($(3)_SITE_METHOD)
+ else
+  # Try automatic detection using the scheme part of the URI
+  $(2)_SITE_METHOD = $$(call geturischeme,$$($(2)_SITE))
+ endif
+endif
+
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
+  ifeq ($(BR2_USE_GIT_ARCHIVES)$$($(2)_SITE_METHOD),ygit)
+   $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).git.tar.gz
+  else
+   $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
+  endif
  endif
 endif
 
@@ -431,21 +450,6 @@ $(2)_ALL_DOWNLOADS = \
 		$$(if $$(findstring ://,$$(p)),$$(p),\
 			$$($(2)_SITE)/$$(p)))
 
-ifndef $(2)_SITE
- ifdef $(3)_SITE
-  $(2)_SITE = $$($(3)_SITE)
- endif
-endif
-
-ifndef $(2)_SITE_METHOD
- ifdef $(3)_SITE_METHOD
-  $(2)_SITE_METHOD = $$($(3)_SITE_METHOD)
- else
-	# Try automatic detection using the scheme part of the URI
-	$(2)_SITE_METHOD = $$(call geturischeme,$$($(2)_SITE))
- endif
-endif
-
 ifeq ($$($(2)_SITE_METHOD),local)
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_OVERRIDE_SRCDIR = $$($(2)_SITE)
-- 
2.1.4
