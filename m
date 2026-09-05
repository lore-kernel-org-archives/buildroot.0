Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CC7C79F8B
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 19:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9296C80F06;
	Sat,  5 Sep 2026 19:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6cjg7752qVo; Sat,  5 Sep 2026 19:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7E91E80F0B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788636553;
	b=B8ZLfNWJ/9giEEihg/lfRfO9VzhcdXXiAyz6r0lBza13muOoIXo5ALTp76aqzp4SDDZE
	 rp1qr//+CMnQ+ScXW4QjnwM/MZ+psieo1/foMfHnkhp4qca6W+wvNKbDxD/73B7vpl0BC
	 uIgwrBAgSPZGjjz8+yOxJzGTi97d4jGLZ4r/+mPkmDIXJ26h78XaTvI9pAPngLDpasw2y
	 UjdZ1Aa39F1ULGtUbVW10YAdnG0O4Yonye+tlulvG5M5V4ERzgve/2l3hi4tdHic1E0h7
	 ipPGrDLzLCc5H8FRRWBEZSaW5YZsgUkwn2VLh6ZIsdayHQXFsM3bqQgCT6WoMBpVgKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788636553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5Yf7vmllxok+FDokdb0hTHP66iP/+oKww3F2/qJjEeM=;
	b=bc5tRVcNiJ6eT0enUHodbw67W4dIAqWq9rIj1jPm6OhwPoxPXpVQEjXoEXm33jv6S+Ei
	 NfsGXKQ97aR+vgmJ+SIEQC4YLBbQmE9SFmbcWZadpz/UPDv+NCH7XCG/A/NF52MyxMynF
	 oOHpbw9rfGS2aMQHqsQiGyxYT9MDvMP00WvFgSYlCTKV7I2u0autf1kdKKX0+tU9Kbno8
	 xmLbcLTcrs9YG8NWpuANkik/fYsa1dZQ0eB61Yg7GXJXtDIghCVxO+GRykNuPkqGXfikP
	 ZpOQpT0qq5fQ4mNl6HK5+jCuvRYAcFdC5gImc9KScUHpRcM8ua3lU3BPNfIqK0FbHMg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=SKh0y2Dp;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788636553;
	bh=5Yf7vmllxok+FDokdb0hTHP66iP/+oKww3F2/qJjEeM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LfeWg/p6XpJsts0SLQtAsI28gHUG4M0RqRDsctMxoxIOHIPDbX4q7vbVXh4LBjuqK
	 +AqmIn8tp3lq5zPYGLM+gW1qqzFHN2XuA86JxqVolNdMEQyHqrUeM8VQCavnz6F18V
	 gdSd1scQ1l4A3K2lrgu3mqgIg42Xi+i7667M2eyCHopc/S7O1WsQKXzfbOJeXJU4SO
	 h0MMdUXWXvbg9LCSCfIl05xfDf8CJfsRnIF+odOzWQI1vEIA9yzt4N7qfn35XCW71a
	 nn99eBYbJ9yhz5irmafrOv4SIADpXX1wwJv0oZv0XSHZM4mA4nkxZC6zHp9vHDKPGh
	 zUAnvqg+GXdsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E91E80F0B;
	Sat,  5 Sep 2026 19:29:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C749E118
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 19:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B88CA80F14
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 19:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f92hb5UxhDj9 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 19:29:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 018AE80F06
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788636550;
 b=iKyNvLCjODjqBZm1MiXU36ws+rYe8+eNCESf4r5/A841cKilzsFbJP5hWCTP49oLyG2d
 542P4wYqLt+5WGVifaAvnmyIiAsAcT3dYDlIrlnmLD1CmGsV4xYpmvXzfJPI1bu0G4kQo
 VfJAOZjRxV2VkU13SQLkNK3UvL6r/SBMSAfBQVHk2kIefkXC69oY/7DLVnGcGqAKj/O7s
 +HwpzBcnY+bkUjBYcOOg3Wh7R1+h2Oz4BnD113X2xfysZiuudzUO6MKu/l1iguMJl1Ngc
 K0gK9smDp2LF3+ISLglJV9PonC98d9psKYBZCTrFZRUMaBeQehsN9t8r94FFCT+bF/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788636550;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=cSEwB5XaU/75toMD1wXbxQ1FHiF3+exPCfVOO4pQGJ8=;
 b=XYpTnssjhGADyIJJyqDBPW6AUvbw875mFoAnnnaLWvIUkI8mVSXpJLeQ/7eYokwD2n6/
 TUv/OHQjFfQg9lGlfVr56u2YmuNKYBtlTVcDmTeEjX/1U85//A6HWzuOMeYB4EV86h+KL
 kHtTWHFKH97i46k9QJTB/dwXFGL3W5p8t/1ThprTzIpbu3k7Phf6HmDKVKl4IrnlAswhk
 s2XwMSI1JXSmcpm2kEY2d7Whl/393Mu4JXesXrjvrWlSQCnd4H2/NxeecTBrfi+TWKeSU
 8kC4gseKz7jFI5SQWFvTCErvqp31sYb7CGSpElQBRdQkJgyszQ07JTIb6jWm2HYQ9bw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SKh0y2Dp; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SKh0y2Dp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 018AE80F06
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788636544;
 bh=cSEwB5XaU/75toMD1wXbxQ1FHiF3+exPCfVOO4pQGJ8=;
 h=From:To:Cc:Subject:Date:From;
 b=SKh0y2Dpm80vsBgfEOBaaaONVg6U3b3jnQld7YEwEr+UmYwTMEFKtqoQGYHQ48Qhr
 bRaeWNOfcIr3gbbVcXafYfdB7xl6+hCW/3+aZ2x9UpVgOSOm0riWwOLq2X/Pl3alcB
 wSvR6ehR0i5+VOgu6DYoAnvDVPjB3yK2LQk+sFDs+Uxw+kqmZ93j/OCf3cqOElCAUd
 c1//og5XBfORHI2U3QZb2elQ8m9acd7i/WH0bEflh5fq7hPoNOM+XYrMBaKkQXrK2q
 rzld4UDBc/q5V+cGQ+e/DPU9Z6v3g9E35MBNkkLsjus9B+gaywP/bbA9nKZkjiheGw
 mNPJLzHFmuGvQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C867CA4C3377;
 Sat,  5 Sep 2026 21:29:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41758)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2w4W-000000006f9-2EsT;
 Sat, 05 Sep 2026 19:29:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  5 Sep 2026 21:29:04 +0200
Message-ID: <20260905192904.3794181-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5knx: fix license hash
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot 262a7f6d2f406ed21b2379bb3c4a6c8f6fa0edd7 added the package but
forgot to provide the hash for LICENSE.GPL3-EXCEPT, instead a hash for
a non-existing file was added to qt5knx.hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt5/qt5knx/qt5knx.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 750e4770c0..2600a739bc 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -3,4 +3,4 @@ sha256  1648bd6d7e5d8fc91aaa6db1bf9d2744d0385a087ba78a00080f99f1d5027c8b  qt5knx
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
