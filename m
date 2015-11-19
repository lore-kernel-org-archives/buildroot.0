From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 19 Nov 2015 11:36:04 +0100
Subject: [Buildroot] [PATCH 3/5] pkg-generic: allow to populate build
	directory from a git archive
In-Reply-To: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
Message-ID: <1447929366-8972-4-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/pkg-generic.mk | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 08f4f31..846d8e9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -515,12 +515,26 @@ $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
+ifdef $(2)_SOURCE
+ifeq ($$(filter %.git.tar.gz,$$($(2)_SOURCE)),)
 $(2)_EXTRACT_CMDS ?= \
-	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
+	$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
 		-C $$($(2)_DIR) \
 		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
-		$$(TAR_OPTIONS) -)
+		$$(TAR_OPTIONS) -
+else
+# $(2)_STRIP_COMPONENTS != 1 and $(2)_EXCLUDES are not supported
+$(2)_EXTRACT_CMDS ?= \
+	mkdir -p $$($(2)_DIR)/.git && \
+	$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
+	$$(TAR) --strip-components=1 \
+		-C $$($(2)_DIR)/.git \
+		$$(TAR_OPTIONS) - && \
+	$(GIT) -C $$($(2)_DIR) config --local --bool core.bare false && \
+	$(GIT) -C $$($(2)_DIR) reset --hard
+endif
+endif
 
 # pre/post-steps hooks
 $(2)_PRE_DOWNLOAD_HOOKS         ?=
-- 
2.1.4
