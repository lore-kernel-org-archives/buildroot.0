From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 13:35:55 +0200
Subject: [Buildroot] [git commit] pkg-generic: fix fallout of
	<pkg>_STRIP_COMPONENTS introduction
Message-ID: <20150712114318.35BC7817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef7cc99c7a432aa3929015183f7c7476b7cd1b68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The introduction of <pkg>_STRIP_COMPONENTS broke the build of the
target tar package, because support/dependencies/check-host-tar.mk
defines TAR_STRIP_COMPONENTS to --strip-components. Which leads to
have the package infrastructure do:

 $$(TAR_STRIP_COMPONENTS)=$$($(2)_STRIP_COMPONENTS)

which for the tar package evaluates to:

 $$(TAR_STRIP_COMPONENTS)=$$(TAR_STRIP_COMPONENTS)

which evalutes to:

 --strip-components=--strip-components

Which obviously doesn't work really well. And in fact the
TAR_STRIP_COMPONENTS definition in
support/dependencies/check-host-tar.mk is no longer necessary: it was
needed in the days where we were trying to support old tar versions
that did not support --strip-components. But nowadays, when such an
old tar version is encountered, we build our own host-tar which
supports --strip-components.

Fixes:

  http://autobuild.buildroot.org/results/ae2/ae20df67f99f75b1ba5d5b7316ad265d66f3aa66/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk                 |    2 +-
 support/dependencies/check-host-tar.mk |    3 ---
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7000975..82376df 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -439,7 +439,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
-	$$(TAR) $$(TAR_STRIP_COMPONENTS)=$$($(2)_STRIP_COMPONENTS) -C $$($(2)_DIR) $$(TAR_OPTIONS) -)
+	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) -C $$($(2)_DIR) $$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
 $(2)_PRE_DOWNLOAD_HOOKS         ?=
diff --git a/support/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
index 9729507..9840a55 100644
--- a/support/dependencies/check-host-tar.mk
+++ b/support/dependencies/check-host-tar.mk
@@ -4,6 +4,3 @@ ifeq (,$(call suitable-host-package,tar,$(TAR)))
 DEPENDENCIES_HOST_PREREQ += host-tar
 TAR = $(HOST_DIR)/usr/bin/tar
 endif
-
-# Since TAR is at least 1.17, it will certainly support --strip-components
-TAR_STRIP_COMPONENTS = --strip-components
