Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B7CA0FE2
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07DD26172B;
	Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DMF6GGJrK8W; Thu, 21 Aug 2025 19:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB462616F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB462616F9;
	Thu, 21 Aug 2025 19:20:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 224091C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF28F6167B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMJdpfWvw5yJ for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 119F56149E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 119F56149E
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 029E4878D5; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:50:51 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 9fa033bb1d64d87d80e9b509dac0cfd86388bf47
X-Git-Newrev: f1745c048225c330ebc23610cf12ce07f1d5443a
X-Patchwork-Hint: ignore
Message-Id: <20250821192006.029E4878D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] Makefile: release: make
 manual build reproducible
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f1745c048225c330ebc23610cf12ce07f1d5443a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The manual contains build timestamps like:

Buildroot 2025.08-rc1 manual generated on 2025-08-12 06:43:37 UTC

Making it not reproducible.  Luckily asciidoc respects SOURCE_DATE_EPOCH, so
use that to use the timestamp of the latest git commit instead.

Notice: The release and manual targets are marked as noconfig targets (and
need to stay like that for make release), so we cannot use the
BR2_REPRODUCIBLE logic.  Instead manually set SOURCE_DATE_EPOCH.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3fc5d821eba04059525c07b737ecc4ab5cf7d50d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5706e84c3c..6b33bc462f 100644
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
