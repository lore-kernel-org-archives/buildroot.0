Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301FDC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 20:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF18B410DE;
	Mon, 10 Apr 2023 20:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF18B410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLoYqdfQ0LCf; Mon, 10 Apr 2023 20:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA7A410CB;
	Mon, 10 Apr 2023 20:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA7A410CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 348FD1C3BA6
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C9924090B
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C9924090B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIFbqOy1_dGE for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 20:08:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D169408D8
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 20:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D169408D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43F2783DF9; Mon, 10 Apr 2023 20:08:33 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:49:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09d954fc4e342357db85636cf50c2094764d5b42
X-Git-Newrev: 6a6a11f64b305e272d34e84d1e9e9b61ada24218
X-Patchwork-Hint: ignore
Message-Id: <20230410200833.43F2783DF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/doc-asciidoc: allow docs to
 request a specific TOC depth
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a6a11f64b305e272d34e84d1e9e9b61ada24218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some documents, we may want a terse or deeper TOC depth. For
example, short documents may want just the level-0 in the TOC, while
longer documents may want depth 1 or 2, or even deeper; also, some
documents may not use the document-title levels [0], only section
levels [1], and so may want to increase the TOC depth.

Additionally, allow per-format depth. For example, split-html has a
single page dedicated to the TOC, so there we may want a deeper TOC,
while on the html output, where the TOC is on the same page as the
whole document, a shorter TOC is preferred.

[0] https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/#document-header
[1] https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/#section-titles

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-asciidoc.txt | 54 +++++++++++++++++++-------------
 package/doc-asciidoc.mk                  |  3 +-
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
index 0bfe99d22e..d68978b1cb 100644
--- a/docs/manual/adding-packages-asciidoc.txt
+++ b/docs/manual/adding-packages-asciidoc.txt
@@ -66,6 +66,12 @@ information is (assuming the document name is +foo+) :
 * +FOO_DEPENDENCIES+, optional, the list of packages (most probably,
   host-packages) that must be built before building this document.
 
+* +FOO_TOC_DEPTH+, +FOO_TOC_DEPTH_<FMT>+, optionals, the depth of the
+  table of content for this document, which can be overridden for the
+  specified format +<FMT>+  (see the list of rendered formats, above,
+  but in uppercase, and with dash replaced by underscore; see example,
+  below). By default: +1+.
+
 There are also additional hooks (see xref:hooks[] for general information
 on hooks), that a document may set to define extra actions to be done at
 various steps:
@@ -108,26 +114,30 @@ Here is a complete example that uses all variables and all hooks:
 07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
 08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/ressources))
 09:
-10: define FOO_GEN_EXTRA_DOC
-11:     /path/to/generate-script --outdir=$(@D)
-12: endef
-13: FOO_POST_RSYNC_HOOKS += FOO_GEN_EXTRA_DOC
-14:
-15: define FOO_CHECK_MY_PROG
-16:     if ! which my-prog >/dev/null 2>&1; then \
-17:         echo "You need my-prog to generate the foo document"; \
-18:         exit 1; \
-19:     fi
-20: endef
-21: FOO_CHECK_DEPENDENCIES_HOOKS += FOO_CHECK_MY_PROG
-22:
-23: define FOO_CHECK_MY_OTHER_PROG
-24:     if ! which my-other-prog >/dev/null 2>&1; then \
-25:         echo "You need my-other-prog to generate the foo document as PDF"; \
-26:         exit 1; \
-27:     fi
-28: endef
-29: FOO_CHECK_DEPENDENCIES_PDF_HOOKS += FOO_CHECK_MY_OTHER_PROG
-30:
-31: $(eval $(call asciidoc-document))
+10: FOO_TOC_DEPTH = 2
+11: FOO_TOC_DEPTH_HTML = 1
+12: FOO_TOC_DEPTH_SPLIT_HTML = 3
+13:
+14: define FOO_GEN_EXTRA_DOC
+15:     /path/to/generate-script --outdir=$(@D)
+16: endef
+17: FOO_POST_RSYNC_HOOKS += FOO_GEN_EXTRA_DOC
+18:
+19: define FOO_CHECK_MY_PROG
+20:     if ! which my-prog >/dev/null 2>&1; then \
+21:         echo "You need my-prog to generate the foo document"; \
+22:         exit 1; \
+23:     fi
+24: endef
+25: FOO_CHECK_DEPENDENCIES_HOOKS += FOO_CHECK_MY_PROG
+26:
+27: define FOO_CHECK_MY_OTHER_PROG
+28:     if ! which my-other-prog >/dev/null 2>&1; then \
+29:         echo "You need my-other-prog to generate the foo document as PDF"; \
+30:         exit 1; \
+31:     fi
+32: endef
+33: FOO_CHECK_DEPENDENCIES_PDF_HOOKS += FOO_CHECK_MY_OTHER_PROG
+34:
+35: $(eval $(call asciidoc-document))
 ----
diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 931c5136d4..6b8eaa81b3 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -87,7 +87,7 @@ $(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
 endif
 
 $(2)_$(3)_A2X_OPTS = \
-	--xsltproc-opts "--stringparam toc.section.depth 1"
+	--xsltproc-opts "--stringparam toc.section.depth $$(or $$($(2)_TOC_DEPTH_$$(call UPPERCASE,$(4))),$$($(2)_TOC_DEPTH))"
 
 # Handle a2x warning about --destination-dir option only applicable to HTML
 # based outputs. So:
@@ -161,6 +161,7 @@ $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 .PHONY: $(1)-prepare-sources
 $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
+$(2)_TOC_DEPTH ?= 1
 $(2)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc.conf
 
 $(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
