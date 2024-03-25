Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5459FCD11BF
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 06:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C5E81DE3;
	Mon, 25 Mar 2024 06:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JeLJxagcRJaE; Mon, 25 Mar 2024 06:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFC2581E26
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC2581E26;
	Mon, 25 Mar 2024 06:48:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 799FC1BF41C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 06:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 713DF6073C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 06:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5QKHhLltMI8 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 06:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80B45606F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B45606F3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80B45606F3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 06:48:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3080260002;
 Mon, 25 Mar 2024 06:48:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1roe85-008PTN-1m;
 Mon, 25 Mar 2024 07:48:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 07:48:13 +0100
Message-Id: <20240325064813.2004530-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/doc-asciidoc.mk: unbreak docs logic
 after pkgdir change
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 748fc4be21e (package/pkg-utils.mk: remove trailing slash in pkgdir
definition) broke the docs generation logic:

make manual-html
>>>   Preparing the manual sources...
>>>   Generating HTML manual...
a2x: ERROR: missing ASCIIDOC_FILE: /home/peko/source/buildroot/output/build/docs/manual/manual.adoc

make: *** [docs/manual/manual.mk:12: /home/peko/source/buildroot/output/docs/manual/manual.html] Error 1

As it now ends up with the .adoc file one level below
(../docs/manual/manual/manual.adoc).  The reason is that the pkgdir macro is
used to define $(2)_DOCDIR, which is passed to rsync:

rsync -a docs/manual /home/peko/source/buildroot/output/build/docs/manual

Fix it by appending a / to the rsync arguments like we do elsewhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/doc-asciidoc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 40c9a725d1..d6ecd1e30e 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -155,7 +155,7 @@ $(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
 $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 	$$(Q)$$(call MESSAGE,"Preparing the $(1) sources...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)rsync -a $$($(2)_DOCDIR) $$(@D)
+	$$(Q)rsync -a $$($(2)_DOCDIR)/ $$(@D)/
 	$$(Q)$$(foreach hook,$$($(2)_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
 .PHONY: $(1)-prepare-sources
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
