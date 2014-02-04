From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2014 16:18:51 +0100
Subject: [Buildroot] [PATCH 2/3] infra: replace BUILDROOT_DL_DIR with
	BR2_DL_DIR.
In-Reply-To: <1391527132-20103-1-git-send-email-arnout@mind.be>
References: <1391527132-20103-1-git-send-email-arnout@mind.be>
Message-ID: <1391527132-20103-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To make the naming consistent (all user-visible options should be
prefixed BR2_).

An entry is added to Makefile.legacy to warn users who have set
BUILDROOT_DL_DIR but not BR2_DL_DIR.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in                         |  2 +-
 Makefile                          |  7 +++++++
 Makefile.legacy                   | 16 ++++++++++++++++
 docs/manual/common-usage.txt      |  2 +-
 docs/manual/download-location.txt |  8 ++++----
 package/pkg-download.mk           |  9 ++-------
 6 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/Config.in b/Config.in
index 7ec7c2a..1dc1ffe 100644
--- a/Config.in
+++ b/Config.in
@@ -126,7 +126,7 @@ config BR2_DL_DIR
 	default "$(TOPDIR)/dl"
 	help
 	  Directory to store all the source files that we need to fetch.
-	  If the Linux shell environment has defined the BUILDROOT_DL_DIR
+	  If the Linux shell environment has defined the BR2_DL_DIR
 	  environment variable, then this overrides this configuration item.
 
 	  The default is $(TOPDIR)/dl
diff --git a/Makefile b/Makefile
index 15d110e..a3fc0db 100644
--- a/Makefile
+++ b/Makefile
@@ -121,6 +121,13 @@ else
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
 endif
 
+# To make sure the the environment variable overrides the .config option,
+# set this before including .config.
+ifneq ($(BR2_DL_DIR),)
+DL_DIR := $(BR2_DL_DIR)
+endif
+
+
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
 BR2_GRAPH_OUT := $(or $(GRAPH_OUT),pdf)
diff --git a/Makefile.legacy b/Makefile.legacy
index e0b7ec2..4954398 100644
--- a/Makefile.legacy
+++ b/Makefile.legacy
@@ -13,6 +13,22 @@ $(error "You have legacy configuration in your .config! Please check your config
 endif
 
 #
+# Legacy options from 2014.02
+#
+
+# The BUILDROOT_DL_DIR environment variable was renamed by BR2_DL_DIR. We
+# want to detect someone using the old variable, _except_ if also the new
+# variable was set. By the time we get here, however, we no longer have
+# access to the BR2_DL_DIR environment variable (because it has been overridden
+# by the .config inclusion). However, the environment variable (if defined) was
+# saved in DL_DIR, so we can use that.
+ifneq ($(BUILDROOT_DL_DIR),)
+ifneq ($(BUILDROOT_DL_DIR),$(DL_DIR))
+$(error "The BUILDROOT_DL_DIR environment variable was renamed to BR2_DL_DIR.")
+endif
+endif
+
+#
 # Legacy options from 2012.08
 #
 
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 1d15c05..127060d 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -80,7 +80,7 @@ to +make+ or set in the environment:
   configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
   +
-* +BUILDROOT_DL_DIR+ to override the directory in which
+* +BR2_DL_DIR+ to override the directory in which
   Buildroot stores/retrieves downloaded files
   +
   Note that the Buildroot download directory can also be set from the
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 4aa8cea..21055c1 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -13,14 +13,14 @@ filesystem with exactly the same versions.
 
 If you maintain several Buildroot trees, it might be better to have a
 shared download location. This can be achieved by pointing the
-+BUILDROOT_DL_DIR+ environment variable to a directory.  If this is
++BR2_DL_DIR+ environment variable to a directory.  If this is
 set, then the value of +BR2_DL_DIR+ in the Buildroot configuration is
 overridden. The following line should be added to +<~/.bashrc>+.
 
 -----------------
- $ export BUILDROOT_DL_DIR <shared download location>
+ $ export BR2_DL_DIR <shared download location>
 -----------------
 
 The download location can also be set in the +.config+ file, with the
-+BR2_DL_DIR+ option. This value is overridden by the +BUILDROOT_DL_DIR+
-environment variable.
++BR2_DL_DIR+ option. Unlike most options in the .config file, this value 
+is overridden by the +BR2_DL_DIR+ environment variable.
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2641d4e..84598d5 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -23,13 +23,8 @@ LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 # external-deps target.
 DL_MODE=DOWNLOAD
 
-# Override BR2_DL_DIR if shell variable defined
-ifneq ($(BUILDROOT_DL_DIR),)
-DL_DIR := $(BUILDROOT_DL_DIR)
-else
-DL_DIR := $(call qstrip,$(BR2_DL_DIR))
-endif
-
+# DL_DIR may have been set already from the environment
+DL_DIR ?= $(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR := $(TOPDIR)/dl
 endif
-- 
1.9.rc1
