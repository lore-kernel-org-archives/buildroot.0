Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB1EC48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 18:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B559B60626;
	Mon, 19 Feb 2024 18:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iY43C38mc37b; Mon, 19 Feb 2024 18:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E591A60747
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E591A60747;
	Mon, 19 Feb 2024 18:38:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2F1F1BF5AA
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 18:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9CD81F1A
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 18:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfotRZ1YqIK1 for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 18:38:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2A7E81F18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2A7E81F18
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2A7E81F18
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 18:38:31 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6C0F32C83847;
 Mon, 19 Feb 2024 19:38:29 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 19:38:27 +0100
Message-Id: <20240219183828.1289275-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708367909; bh=zAQUtCsN0FWERd9TbyQU8zDKGnmUul7OH5sZJEhefGQ=;
 h=From:To:Cc:Subject:Date;
 b=YIbzYR6R0/Uypeg42GetWL6jUqYANUA4/60Lxx4wxlsKDtPoA8l+MVJf2ofwqNHmj
 bh+VOUBsQ/MZ9gJi69pfNdkSNr4UKYxxYQ1AzkekQNRch21c3nSy79dsJ6FbSO1nFm
 Hu/AJ4FABHwsMP06zHFZbRUaw20euqHAoQzK1OhtOyATbNeypyQgG52in+kFQA1wln
 pIw5fcKXLgPsGBTscqftl7qNi3QBMzLHA3J8oJyYDvrKm1SxCkLQs2YAmEjTv9ee5o
 D59YvYjgv31af2T588t31bpRXfavjxS2JjmkPVO49iPOqMyYJ+VLlFFthNWJZtii8t
 msdTcxzn6FpTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=YIbzYR6R
Subject: [Buildroot] [PATCH] package/systemd: needs sulogin for emergency
 target support
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

systemd invokes util-linux' sulogin via systemd-sulogin-shell[1] via
emergency.service/emergency.target[2].

[1] https://github.com/systemd/systemd/blob/main/src/sulogin-shell/sulogin-shell.c
[2] https://github.com/systemd/systemd/blob/main/units/emergency.service.in#L23

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 859332d9e4..58b4e51c6d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -34,6 +34,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_FSCK
+	select BR2_PACKAGE_UTIL_LINUX_SULOGIN # emergency target
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
