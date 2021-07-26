Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC944C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A0F60F50
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11A0F60F50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8457402A0;
	Mon, 26 Jul 2021 08:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVugFzPDScvA; Mon, 26 Jul 2021 08:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 357DC4029B;
	Mon, 26 Jul 2021 08:09:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8001BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DF74830FB
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_IdF9YkSo92 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:09:08 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB260830C2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:09:07 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7vYlmHZ5reISt7vYmmPzbZ; Mon, 26 Jul 2021 10:02:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627286521; bh=HSbpAzHGSxwXnYNs5zcYjqoc27Vl0pJTt45Z3500md8=;
 h=From:To:Subject:Date:MIME-Version;
 b=CYA/EN9Xmy+ZU7gtAkWTL+5jashalXRo8y2gLUnKVv2UGgC/P+/szOWGoYCzoqLya
 pJ4b//uXnd8jii6ug6GqxmveEVLg08MQygtuc/w8YJrQlNCq0J+e2L0o+EaMGETXDH
 ZpZHE5nMTkbNuxtikCYctcLVW9L9ykH3inU+VHqLR0zgpGBxbJPvBgrTj2qB+AJOe+
 zyXtBnbYDrRRoFy9fyYDnny0gmsNlsScWTrJqBmTKcMzuuueP48ijAVSxFmyQOPzVm
 dbY9tHRqgUigyJl40htaVIX46t2zqvw5SR0PJhGUTwa8V+bzq4fKRhmN7Nc5BNLo6e
 X3zcb8ydHMaPg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:01:59 +0200
Message-Id: <20210726080159.3900395-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfE8bt4LiMx5zlhfw6YDWMZ6ez6qqr2yeRXSd1yhM5IkRv3MdEV5VOFNVi2BIJjUMnLxc/8QexqrU/P/pBQPZ+LL8pJIe9c9r+/z/bKUyvTP3cu8MBGRU
 3jCBBVrIxN5n2fZ7WjWuTd0O3wU3LFskRdM6xTLASTI04F++wd30N9O1x2dkMwCz2nez02QbOr4tPVWr3nvebANFxcjj809S2JOp25jeOOa/6cUDsf3MKHNx
 dyh+JYHBa+XSjytmc09WEdc8+Ep+Yt8Q9pHAGriql+h1fSad2fWlOlNl4Kgop9+W761TIi/bXVvCsNkpLxuSWcxGSFdNQ2UqQIZIb5tFGh6F7+aEL5Bcloba
 5Po1tEmKzFI+9JudKb6oWwbCTTbzYIPHyo3tzwFAXeWaVyp2VhM=
Subject: [Buildroot] [PATCH] toolchain: update gcc bug 99140
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Gcc bug 99140 is still not fixed on gcc version 8.x so we need to move gcc
version up to 9.x to have it correctly working.

Fixes:
http://autobuild.buildroot.net/results/c55/c55f50a8d657695f0d5492c32efa666254cd7f99/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 03375e0c52..8603e2aaff 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -171,10 +171,10 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc >= 8.x.
+# no longer exists in gcc >= 9.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
-	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
