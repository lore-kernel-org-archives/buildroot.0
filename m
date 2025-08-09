Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199C7C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBDA8819BE;
	Sat,  9 Aug 2025 16:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5Wae4TgVYpj; Sat,  9 Aug 2025 16:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E3881992
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E3881992;
	Sat,  9 Aug 2025 16:56:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E2C21F
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFD02816E0
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HijptFiGELrV for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C6281992
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42C6281992
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F714869BE; Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 18:52:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 161d7ded43da4d48641db5ea83b1af4cb976410a
X-Git-Newrev: 117ccb6cc41e3bf8f5b6ab50bcbf0d77cd845405
X-Patchwork-Hint: ignore
Message-Id: <20250809165600.1F714869BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: silence list-defconfigs for
 br2-external with no defconfig
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
Content-Type: multipart/mixed; boundary="===============6774663835673774194=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6774663835673774194==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=117ccb6cc41e3bf8f5b6ab50bcbf0d77cd845405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a br2-external tree has no defconfig, list-defconfig currently
whines with an error from find:

    find: ‘[...]/my-external/configs’: No such file or directory

Fix that by only running find if the directory exists.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fa82afa49c..540183f16e 100644
--- a/Makefile
+++ b/Makefile
@@ -1219,7 +1219,7 @@ help:
 # $(2): br2-external name, empty for bundled
 define list-defconfigs
 	@first=true; \
-	for defconfig in $$(find $(1)/configs -name '*_defconfig' |sort); do \
+	for defconfig in $$([ -d $(1)/configs ] && find $(1)/configs -name '*_defconfig' |sort); do \
 		[ -f "$${defconfig}" ] || continue; \
 		if $${first}; then \
 			if [ "$(2)" ]; then \

--===============6774663835673774194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6774663835673774194==--
