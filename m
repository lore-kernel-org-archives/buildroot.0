Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E37CA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 21:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10FE341D94;
	Tue, 12 Aug 2025 21:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i60tw1NnfvPS; Tue, 12 Aug 2025 21:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CB8C41D82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CB8C41D82;
	Tue, 12 Aug 2025 21:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9388938
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB35383DA7
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDhk0vTOgNQK for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 21:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB86783DA6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB86783DA6
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAB6B874DA; Tue, 12 Aug 2025 21:46:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 23:43:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a62ed63dce9a892b5c4942e0c2fc2c310c62ccf6
X-Git-Newrev: 3fc5d821eba04059525c07b737ecc4ab5cf7d50d
X-Patchwork-Hint: ignore
Message-Id: <20250812214646.DAB6B874DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: release: make manual build
 reproducible
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fc5d821eba04059525c07b737ecc4ab5cf7d50d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual contains build timestamps like:

Buildroot 2025.08-rc1 manual generated on 2025-08-12 06:43:37 UTC

Making it not reproducible.  Luckily asciidoc respects SOURCE_DATE_EPOCH, so
use that to use the timestamp of the latest git commit instead.

Notice: The release and manual targets are marked as noconfig targets (and
need to stay like that for make release), so we cannot use the
BR2_REPRODUCIBLE logic.  Instead manually set SOURCE_DATE_EPOCH.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 203d90510d..33e8563e93 100644
--- a/Makefile
+++ b/Makefile
@@ -1250,7 +1250,8 @@ release: OUT = buildroot-$(BR2_VERSION)
 # documentation to the git output
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
-	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
+	SOURCE_DATE_EPOCH=$$(git log -1 --format=%at 2> /dev/null) \
+		$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
 	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
