From: Alex Suykov <alex.suykov@gmail.com>
Date: Thu, 1 Oct 2015 00:12:43 +0300
Subject: [Buildroot] [RFC 1/2] non-versioned packages
Message-ID: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case (PKG)_VERSION is empty, do not attempt to download sources
for the package. Attempts to download (package)-undefined.tar.gz
are pointless, the file is not likely to exist.

Also, output/build/(package) looks better and makes more sense than
output/build/(package)-undefined for such packages.

Non-versioned packages within buildroot: skeleton and mke2img.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/pkg-generic.mk | 6 ++----
 package/pkg-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

The actual case the prompted me to do the change: I'm using buildroot
as a test rig for building and running HEAD shapshots of a local git repo.
"HEAD" is not a proper version, but without these changes I could only
get "package-unknown" or "package-HEAD", and it took some effort to prevent
download attempts.

I'm not sure how common this is, but it's possible. And since no proper
downloadable package should ever come without a version, changing the way
empty VERSION is handled should affect them.


diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5201fca..cb5545b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -332,8 +332,6 @@ ifndef $(2)_VERSION
   $(2)_DL_VERSION := $$($(3)_DL_VERSION)
  else ifdef $(3)_VERSION
   $(2)_DL_VERSION := $$($(3)_VERSION)
- else
-  $(2)_DL_VERSION = undefined
  endif
 else
  $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
@@ -344,7 +342,7 @@ ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
 endif
 
-$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
+$(2)_BASE_NAME	=  $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
@@ -374,7 +372,7 @@ endif
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
- else
+ else ifdef $(2)_VERSION
   $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
  endif
 endif
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..c098b55 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -83,7 +83,7 @@ INFLATE.tar  = cat
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
+MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_BASE_NAME) $(call qstrip,$(1))$(TERM_RESET)"
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
-- 
2.0.3
