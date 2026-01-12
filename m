Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22BBD25053
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9D0061537;
	Mon, 12 Jan 2026 08:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfD93fITwASk; Mon, 12 Jan 2026 08:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE70B61527
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206788;
	bh=gJgm5rsNO1evCywTYy4vaYnNXju1DJmRpumccEMpuqA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUe8ddj5U8A/TFpyzWcN5//EgFAsnr0YEdgNq6rGMnJ8c700BZ3P7Mbq78c78Ftrm
	 cCjjUhL4jyDoxPfT6hvfhghrX/6DFSCrrgkwGMEscKjRT6h52TDRSFQ8VfsMCNkvZT
	 /g4bqKgXlmKkmlMx30HksmpPCWieqJX1SLdTgl1t9DkpsajrjScWH2NQBKTddS47KC
	 sqQyB13LxLxeZEFEyZonvmUyfkgQZNjL1J3GQGLhjmgzqG8s0zmRfTVtYxvTgzB73V
	 3Q/cqkURnRVJjmdyXBjTyulsbSZUstjsoWI6r7/CNj5mMDhR88AjmvIyv8f1e9Sc05
	 jey+3Nb5YGyMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE70B61527;
	Mon, 12 Jan 2026 08:33:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6B3E1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98ACA6152E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZN5QscleFDy for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:33:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 932FB61527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 932FB61527
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 932FB61527
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A05D5A4C3B94;
 Mon, 12 Jan 2026 09:30:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-0cq5;
 Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:13 +0100
Message-ID: <20260112082950.2528445-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206611;
 bh=5MwxnUXM+WGOZ9fbvQPm5jeM5ZFh8JBgR7s37mS1zeo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bJ4BIv7k/vde6l6e9LCHwUD+uGKMZkyYt8AUz2jdLrGAjiUM6ac45q8lRRWo9j0Of
 jt0HAxf0Bqah6HDfPc4K24RvsB+/riQxzJKCfHp5DL8UgvI4zEiPNSBrnHsz2mSKBb
 D1i1Tki1qaM+blGR93sIW9RZC/GUBeCm9gzo7FzR0fJxbIQMg+BG1QfJVhJ8qxS4ZI
 NnQ1xpPl75/ev8CNO58aCkVyj40YvW+MCU6HnmcAxxEa2noNkGP8UyAMUGK8PdSeM8
 x2Dp1Q8HB/HilVMAHg55TWpP9mCfmANGZkCbI5h/msxQsNhwzwkO84jfVPf49Cyx2m
 lVAYYdqpP4X2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bJ4BIv7k
Subject: [Buildroot] [PATCH 065/102] package/x11r7/xapp_xinput-calibrator:
 use tarball hashes provided by upstream
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
index a55b9b8c6e..0ad13a4c45 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
@@ -1,3 +1,5 @@
-# locally computed
+# From https://lists.x.org/archives/xorg-announce/2024-July/003522.html
 sha256  0508bf9705c0945f746b8c81bfc8d583a347dd067b58fa76b1aed4225e4b8b40  xinput_calibrator-0.8.0.tar.xz
+sha512  38a06c1c181fb4e7c2a9fe6c9df47536065213bb177e74fb864b2aa62f7851c7bbc825771fc53725b6705d2c7b42ca01ae3c084b3229961aeee1c76bb86c6754  xinput_calibrator-0.8.0.tar.xz
+# locally computed
 sha256  ba6f260bba7d9640cfedfde3a6ae1790583ab8b9ee7c547233ecc0a214d1a6d3  COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
