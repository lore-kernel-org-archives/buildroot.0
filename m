Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E21CA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 21:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F6DD41DDC;
	Tue, 12 Aug 2025 21:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZgxhyQu0pl2; Tue, 12 Aug 2025 21:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8711041D9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8711041D9B;
	Tue, 12 Aug 2025 21:46:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3E7C939
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AACD741D5F
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5r7BMnNn8oat for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 21:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F097F41C45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F097F41C45
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC2AD87519; Tue, 12 Aug 2025 21:46:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 23:43:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa855cbe6e024ef23ed7f4d5071956fe139168d9
X-Git-Newrev: 802d0930602fe8fef6bc9f021760b3da9ab8650e
X-Patchwork-Hint: ignore
Message-Id: <20250812214646.EC2AD87519@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: release: make .tar.gz
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

commit: https://git.buildroot.net/buildroot/commit/?id=802d0930602fe8fef6bc9f021760b3da9ab8650e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the timestamp from the .tar.gz to make it reproducible, similar to how
it is done in support/download/helpers.

Notice: .xz files do not contain a timestamp

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index db2f522c7e..c740c6783d 100644
--- a/Makefile
+++ b/Makefile
@@ -1255,7 +1255,7 @@ release:
 	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar --owner=0 --group=0 \
 		--mtime="$$(git log -1 --pretty=format:%ci)" $(OUT)
-	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
+	gzip -9 -n -c < $(OUT).tar > $(OUT).tar.gz
 	xz -9 -c < $(OUT).tar > $(OUT).tar.xz
 	rm -rf $(OUT) $(OUT).tar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
