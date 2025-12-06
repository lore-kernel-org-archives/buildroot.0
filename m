Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364AAD3B7C2
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 08:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E09D440B24;
	Sat,  6 Dec 2025 08:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3ZNzuB5Uyln; Sat,  6 Dec 2025 08:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E379540B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765011503;
	bh=V9y2jH6A8g4kfzy/SxVCXcq6R4FJ5sVhpSiZap9uwGE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eUFqFH90+NDZYKwpmmpK9FjSS806Vt43jTiPeZKDdxXZzVqs3oUWVabeyqDRuC7/g
	 oRK54mt5NA5L6lWFY789e7pXRdLb+X2ttdpC0DkXfmiIywqpq4Ntk3UzT9cmv5oJh9
	 SCrHUE2Wq6YVP7H+d/3/D39Db3YrG5CAMu/Ml71DtoraZV6pA+ajVVbxPnHXcHLXhM
	 c/d5665uS6xcNMHJ99o/q8cX3GXlqOZqaYF6Vb2/Pm0+dpWptGwC6CWWO2RNXeZUIM
	 nENuuvM1GLCtWj7R9IqEcEP+1qnALs1CCsoYwmXdD1t9k6aqapQg4PAD0FtybeLw3C
	 CUvpPlmET6qZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E379540B02;
	Sat,  6 Dec 2025 08:58:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBE1A151
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 08:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAE3140B02
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 08:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdNOC8YFhcE1 for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 08:58:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 976EE40AFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 976EE40AFE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 976EE40AFE
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 08:58:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A4A9A4C019D
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:58:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33720)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRo7N-000000004VQ-2ddu
 for buildroot@buildroot.org; Sat, 06 Dec 2025 08:58:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Dec 2025 09:58:17 +0100
Message-ID: <20251206085817.442480-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765011498;
 bh=fR1P5auvnslHbnzf5J6BUm370EUF/N1jgBaZA/SoHAE=;
 h=From:To:Subject:Date:From;
 b=XJNkZoxtULBd0tkhiI/FxjS/+lIIT4DjZWOtE9jauiZBlblgaUZzd4LbVhSW/0fuN
 6ynaX5oPju+qO+Y1UtBV17MYHHrbd2DbBhvD60GlOGFOlmlL/DuDLNBi7Q69hdyEJw
 dal09m6rAE4QuTwmpnmhUgQDfs4Pcmkw9JJ/F2CFdNoZMxrxx0wrbOWJebvNSSrQ83
 mD6B74qf26qdvON4OQsjzhvstHNxhuFoXgKii60L3XZLVFcz5RePWaZZkoAeTQivuV
 9ypWzNulXGzTMHwbRtW+AmeO7tH/zqOG2aaVh5eZ7o2Hv29FFyGF6B/XcuyVuADgft
 6VlzcVrbe9teA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=XJNkZoxt
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: fix build error
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

Fixes:
https://autobuild.buildroot.net/results/8ad/8ad5d33f726fe57910a70df7c8f40a9568c2dfa7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...002-use-correct-modulus-and-exponent.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/rdesktop/0002-use-correct-modulus-and-exponent.patch

diff --git a/package/rdesktop/0002-use-correct-modulus-and-exponent.patch b/package/rdesktop/0002-use-correct-modulus-and-exponent.patch
new file mode 100644
index 0000000000..f6989d5777
--- /dev/null
+++ b/package/rdesktop/0002-use-correct-modulus-and-exponent.patch
@@ -0,0 +1,29 @@
+From 53ba87dc174175e98332e22355ad8662c02880d6 Mon Sep 17 00:00:00 2001
+From: Markus Beth <markus.beth@zkrd.de>
+Date: Mon, 2 Dec 2019 11:22:13 +0100
+Subject: [PATCH] use correct modulus and exponent in rdssl_rkey_get_exp_mod
+
+Upstream: https://github.com/rdesktop/rdesktop/commit/53ba87dc174175e98332e22355ad8662c02880d6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ssl.c b/ssl.c
+index 930c7f94..0681a890 100644
+--- a/ssl.c
++++ b/ssl.c
+@@ -307,10 +307,10 @@ rdssl_rkey_get_exp_mod(RDSSL_RKEY * rkey, uint8 * exponent, uint32 max_exp_len,
+ {
+ 	size_t outlen;
+ 
+-	outlen = (mpz_sizeinbase(modulus, 2) + 7) / 8;
++	outlen = (mpz_sizeinbase(rkey->n, 2) + 7) / 8;
+ 	if (outlen > max_mod_len)
+ 		return 1;
+-	outlen = (mpz_sizeinbase(exponent, 2) + 7) / 8;
++	outlen = (mpz_sizeinbase(rkey->e, 2) + 7) / 8;
+ 	if (outlen > max_exp_len)
+ 		return 1;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
