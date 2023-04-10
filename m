Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B5BC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 20:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F354090B;
	Mon, 10 Apr 2023 20:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F354090B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vJqEL8b5Mq0; Mon, 10 Apr 2023 20:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88A64408F9;
	Mon, 10 Apr 2023 20:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A64408F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C558B1BF345
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97566408F9
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97566408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hg4ayCZ8-V5W for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 20:08:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F256408C8
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 20:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F256408C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B33683DF5; Mon, 10 Apr 2023 20:08:33 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:46:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d03d2346a993f55762e14d6a697be2e98a59eea
X-Git-Newrev: 09d954fc4e342357db85636cf50c2094764d5b42
X-Patchwork-Hint: ignore
Message-Id: <20230410200833.3B33683DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/doc-asciidoc: specify TOC depth
 for all formats
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

commit: https://git.buildroot.net/buildroot/commit/?id=09d954fc4e342357db85636cf50c2094764d5b42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 17feaf00160d (manual: set toc depth to 4 for html outputs) did
not explain why it set the depth of the table of content (TOC) only for
the html and split-html formats.

From memory, but it is a bit fuzzy after all those years, the TOC for
HTML documentation was by default deeper than for the other formats, so
it was really useless to expand it more than one-level deep, while for
other formats, the default was acceptable.

However, it does not make much sense to limit/enforce the depth of the
TOC only for specific formats, and keep the default for the others;
indeed, there is nothing that prevents the default to change with
various versions of asciidoc and the rendering backends.

Render all the formats with the same, explicit level of TOC.

We move the assignment of _A2X_OPTS above the comment, because the
comment does not apply to the TOC setting. Also note that the previous
assignment to an empty value was completely superfluous...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/doc-asciidoc.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 2bd761edfb..931c5136d4 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -86,11 +86,13 @@ ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
 $(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
 endif
 
+$(2)_$(3)_A2X_OPTS = \
+	--xsltproc-opts "--stringparam toc.section.depth 1"
+
 # Handle a2x warning about --destination-dir option only applicable to HTML
 # based outputs. So:
 # - use the --destination-dir option if possible (html and split-html),
 # - otherwise copy the generated document to the output directory
-$(2)_$(3)_A2X_OPTS =
 ifneq ($$(filter $(4),html split-html),)
 $(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
 else
@@ -161,11 +163,9 @@ $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
 $(2)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc.conf
 
-$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML,\
-	--xsltproc-opts "--stringparam toc.section.depth 1")
+$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML)
 
-$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML,\
-	--xsltproc-opts "--stringparam toc.section.depth 1")
+$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML)
 
 # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
 # from reaching the template recursion limit when processing the (long) target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
