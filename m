From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 11 Jul 2015 16:15:04 +0200
Subject: [Buildroot] [PATCH 1/7] Add <PKG>_STRIP_COMPONENTS for packages
	with non-standard tarballs
Message-ID: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usually package tarballs contain only a directory named
"<pkg-name>-<pkg-version>" which contains the actual source tree. To properly
extract the source files in $(BUILD_DIR), Buildroot passes the
--strip-components=1 option to tar.

Unfortunately a few packages ship in a non-standard way, with no root
directory or with more than one. In Buildroot these packages must be handled by
overriding the <PKG>_DOWNLOAD_CMDS.

As the number of such packages is growing, introduce a <PKG>_STRIP_COMPONENTS
variable for packages to request a number of components to strip different
from 1.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9fe01b8d4d12..8aad1b4acc23 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -322,6 +322,14 @@ ifndef $(2)_SUBDIR
  endif
 endif
 
+ifndef $(2)_STRIP_COMPONENTS
+ ifdef $(3)_STRIP_COMPONENTS
+  $(2)_STRIP_COMPONENTS = $$($(3)_STRIP_COMPONENTS)
+ else
+  $(2)_STRIP_COMPONENTS ?= 1
+ endif
+endif
+
 $(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
 $(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
 
@@ -431,7 +439,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
-	$$(TAR) $$(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $$(TAR_OPTIONS) -)
+	$$(TAR) $$(TAR_STRIP_COMPONENTS)=$$($(2)_STRIP_COMPONENTS) -C $$($(2)_DIR) $$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
 $(2)_PRE_DOWNLOAD_HOOKS         ?=
-- 
1.9.1
