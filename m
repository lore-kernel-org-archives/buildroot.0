Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1D5F47CDA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5130082E9D;
	Thu,  5 Mar 2026 21:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id keSqDyuDtA9f; Thu,  5 Mar 2026 21:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7515C82ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745092;
	bh=ngIW8yIaloWkt/+CGQmZG3DYo4zb639HDJsGWQSGa2Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m4NrUKFpBcLOBQgEoi6YNJ9glChPyoQgWvCTwxO/4m7q9YFU/k5wo4DcdLanrYj4w
	 NsMZquftljJHWS+I5bWLf2mrW7BNV27EuxQGiWfzbyApuRrvLml13NwiLPTTJ0AZRm
	 7YaEMmhLWcDdhyiz5ORjnQ9apkqSpdKbGV//V/bVp+iQteUzmPlw+MYnJ149HMDYim
	 kNZh9/OcH9IOGRSwYcIPN2Q1kId+fyFT5z6CkDf1341y9NfmH8lRFPYSNOWqk/5YEt
	 ocDT889uo/Urhazf1VOTe0RuwpTXe/e84BM8BAyRD+jv650PdfYr+A2tYwa6wCBzs7
	 k1A6Nw233n+1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7515C82ED1;
	Thu,  5 Mar 2026 21:11:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19402223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3160418EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kso1_rmg18WR for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E96D4418E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E96D4418E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E96D4418E9
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85A8FA4C346B;
 Thu,  5 Mar 2026 22:09:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFxA-000000003FD-06CP;
 Thu, 05 Mar 2026 21:09:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:43 +0100
Message-ID: <20260305210950.3471974-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744997;
 bh=MoaXdbIsryjtZpBrH5ktbHK7U3qkPNRUAsMrxJAcYWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DuEcLfZOTyMgbS4u2CpBF/pq3ub+yznWzo1MBOmAsaVi0f5EIrssBtcTta+b2c4O6
 ghsJgsVqJiNY2TknjMisI0D/K0Ngi35SxUY+0O2zRnuGdqf+gn10/RT7jqCFp6s9OZ
 4E3w8pfd7Nltb6CganVRGPSANZEroiGzjZFZwymYH6nPRjZzThXl8kucgyXLmOJO23
 oIEtuSz1driwYKYT8X300eY8Sh/JLQHI90qNoXbh1Xr1vO/vFoKkqX58mcBvlMycNi
 /Nv6YfT6Sbo4oa41G3DN3NliLSk+QoOmuC9xR5ehise58Yo3v0QRyAq4iSdabtzZL1
 EyLoKPTENyMUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DuEcLfZO
Subject: [Buildroot] [PATCH v2 08/14] package/links: Fix build with glibc
 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/links/0001-glibc-2.43.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/links/0001-glibc-2.43.patch

diff --git a/package/links/0001-glibc-2.43.patch b/package/links/0001-glibc-2.43.patch
new file mode 100644
index 0000000000..73bd330c7a
--- /dev/null
+++ b/package/links/0001-glibc-2.43.patch
@@ -0,0 +1,27 @@
+Fix build with glibc 2.43
+
+https://bugs.gentoo.org/969617
+https://gitlab.exherbo.org/exherbo/arbor/-/raw/45d1f0e764ad1fcb8d776534d0925fe074d04d61/packages/net-www/links/files/links-2.30-glibc-2.43.patch
+
+Source: https://www.linuxfromscratch.org/blfs/view/svn/basicnet/links.html
+Reason: Fix build with glibc 2.43
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/www-client/links/files/links-2.30-glibc-2.43-const.patch?id=ad9dd078c5473b947f237136746cd1c3933ae494
+
+Upstream: Sent via email to project maintainers
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/ftp.c
++++ b/ftp.c
+@@ -768,7 +768,7 @@
+ } while (0)
+ 		A(ftp_head);
+ 		ud = stracpy(get_url_data(c->url));
+-		if (strchr(cast_const_char ud, POST_CHAR)) *strchr(cast_const_char ud, POST_CHAR) = 0;
++		if (strchr(cast_char ud, POST_CHAR)) *strchr(cast_char ud, POST_CHAR) = 0;
+ 		s0 = init_str();
+ 		s0l = 0;
+ 		add_conv_str(&s0, &s0l, ud, (int)strlen(cast_const_char ud), -1);
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
