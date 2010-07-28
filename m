From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Wed, 28 Jul 2010 12:06:13 +0200
Subject: [Buildroot] [PATCH 8/9] Move download commands definition
In-Reply-To: <1280311574-8017-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1280311574-8017-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1280311574-8017-9-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move download-related defines down to the package/Makefile.package.in
file, closer to where they are used (mainly for clarity's sake).

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
---
 Makefile                    |   14 --------------
 package/Makefile.package.in |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 40602a1..c01ffe2 100644
--- a/Makefile
+++ b/Makefile
@@ -243,24 +243,10 @@ ifeq ($(ARCH),xtensa)
 ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
 endif
 
-WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
-SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
-BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
-GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
-# Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
-# used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
-# external-deps target.
-SPIDER_MODE=DOWNLOAD
-
-DL_DIR=$(call qstrip,$(BR2_DL_DIR))
-ifeq ($(DL_DIR),)
-DL_DIR:=$(TOPDIR)/dl
-endif
-
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
 STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 32b52a3..73cffd3 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -68,6 +68,22 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESE
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
+# Download method commands
+WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
+SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
+BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
+GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+
+# Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
+# used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
+# external-deps target.
+SPIDER_MODE=DOWNLOAD
+
+DL_DIR=$(call qstrip,$(BR2_DL_DIR))
+ifeq ($(DL_DIR),)
+DL_DIR:=$(TOPDIR)/dl
+endif
+
 ################################################################################
 # The DOWNLOAD_{GIT,SVN} helpers are in charge of getting a working copy of
 # the source repository for their corresponding SCM, checking out the requested
-- 
1.6.3.3.346.g8a41d
