Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D59F99C80
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 14:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA9540F98;
	Sat, 18 Apr 2026 14:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hv8LqVMUGtVw; Sat, 18 Apr 2026 14:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B6C40BF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776522763;
	bh=98Qnq8nw8YSsVZJHRgdcWR8aT8ZE/bo3Ok5oQjwVpHs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gmyrhnFTkTQBoZ2bihmL/QHr35U9vYEv80GjMgAmyA12Rks/kCDOX+axqvIzcrsP7
	 9vTNdCf1RVaPN8vZU4K3f55M6YFbBkoW8om1PkWMkEJcVue6PDdenF2GKCF9bGdOdv
	 GHNUCKFQfVwQxY5LNeXNAc7Oae7G+yG/pXnXaP89k/14I9lj5hqsOmh22/rWmUgJU8
	 6MO2WW5IouE4ErdoEc3Z/l0S825DXP84HmIe+aWvGHCt4HSiOKSV39eBq8ZbomH5ji
	 MYCTFmkhZlo4GL6SeLSH6++24lZjBhWs4L3xUuy7lyMMudsH+Qj2JxyHGwyXu2+WFh
	 Gb+HoRmokrnDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B6C40BF0;
	Sat, 18 Apr 2026 14:32:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1231335B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 14:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC46F40273
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 14:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHqLy2jK6wNm for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 14:32:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06FA14008B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06FA14008B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06FA14008B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 14:32:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87059A4C1052
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:32:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45166)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wE6is-000000006za-0Mr7
 for buildroot@buildroot.org; Sat, 18 Apr 2026 14:32:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Apr 2026 16:32:37 +0200
Message-ID: <20260418143237.669585-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776522758;
 bh=5U8ZuKO4xZc1RxOMZ9dYmeTPI+7PIRi52nSlc73AQM8=;
 h=From:To:Subject:Date:From;
 b=n/o0E1ydoO68pmJR+TidmlsmJpdU3nkm0/b1DlStBYuIWhXSCxKoGwtEv60PJt4Zv
 1qA1gvxGGAjPf4JP7q4B+8khlWcCpzs2mGc5ACruiEtEEqaNJy/4GFMw7/5RN8eJa4
 Ar2+kOX83impX+lFsYS2Vwu+GsLVNyGLKPIgpQX+vnYYTRPPaCCGq4KQb7NKiOj+oQ
 feQrd78I/D+ruMJzrotzsq0oSGdozp26s21fz7DsY+sUhgm4YLjKwlwc0+eh5IHQwL
 eb8Aqihnar3SOt/dOofHPCb8R8qCXjeUIWUiEsExb3u0LPjdjrWAJsO6pPW6PeNjxP
 uiHMax1TZykgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=n/o0E1yd
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18, 19}.x series
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
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.252 => 5.10.253} |  0
 package/linux-headers/{5.15.202 => 5.15.203} |  0
 package/linux-headers/{6.1.168 => 6.1.169}   |  0
 package/linux-headers/{6.12.81 => 6.12.82}   |  0
 package/linux-headers/{6.18.22 => 6.18.23}   |  0
 package/linux-headers/{6.19.12 => 6.19.13}   |  0
 package/linux-headers/{6.6.134 => 6.6.135}   |  0
 9 files changed, 7 insertions(+), 7 deletions(-)
 rename package/linux-headers/{5.10.252 => 5.10.253} (100%)
 rename package/linux-headers/{5.15.202 => 5.15.203} (100%)
 rename package/linux-headers/{6.1.168 => 6.1.169} (100%)
 rename package/linux-headers/{6.12.81 => 6.12.82} (100%)
 rename package/linux-headers/{6.18.22 => 6.18.23} (100%)
 rename package/linux-headers/{6.19.12 => 6.19.13} (100%)
 rename package/linux-headers/{6.6.134 => 6.6.135} (100%)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f6a6e0dfa7..cd69a9dd05 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c2b09c3643946a7097c5371e1dcb123c66505ea30fafd0b0a22dc1d5f0228847  linux-6.12.81.tar.xz
-sha256  6378697b36376bf4e727a47402fee340ca4e3b146d5b407d3753cbff300f37bf  linux-6.6.134.tar.xz
-sha256  e0856fe51e444986425886533ebb91d8540189e80c3f0365c76e4beb7439776e  linux-6.1.168.tar.xz
+sha256  0e570b05cd73981bb4a5bcf0e03751d4f0e2ac776c6d4fdcc2366bed3e0f19a9  linux-6.12.82.tar.xz
+sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
+sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
-sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
+sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
+sha256  ec0724928050e8e2f6226fe8bbb206f42a951c0ed2dbb533c5462789f6d75ac8  linux-5.10.253.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 75994f545c..66c28f474e 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,8 +2,8 @@
 sha256  bb7f6d80b387c757b7d14bb93028fcb90f793c5c0d367736ee815a100b3891f0  linux-7.0.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ce5c4f1205f9729286b569b037649591555f31ca1e03cc504bd3b70b8e58a8d5  linux-6.19.12.tar.xz
-sha256  a23c92faf3657385c2c6b5f4edd8f81b808907ebe603fa30699eae224da55f59  linux-6.18.22.tar.xz
+sha256  0559b1fea740e71714b4368023902b7d098c45ac1faa3176eab392c867645648  linux-6.19.13.tar.xz
+sha256  2a2d8e76bfcd135ab861bb9795211574eeff6d4ede9cc920f7c137587e835134  linux-6.18.23.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.252 b/package/linux-headers/5.10.253
similarity index 100%
rename from package/linux-headers/5.10.252
rename to package/linux-headers/5.10.253
diff --git a/package/linux-headers/5.15.202 b/package/linux-headers/5.15.203
similarity index 100%
rename from package/linux-headers/5.15.202
rename to package/linux-headers/5.15.203
diff --git a/package/linux-headers/6.1.168 b/package/linux-headers/6.1.169
similarity index 100%
rename from package/linux-headers/6.1.168
rename to package/linux-headers/6.1.169
diff --git a/package/linux-headers/6.12.81 b/package/linux-headers/6.12.82
similarity index 100%
rename from package/linux-headers/6.12.81
rename to package/linux-headers/6.12.82
diff --git a/package/linux-headers/6.18.22 b/package/linux-headers/6.18.23
similarity index 100%
rename from package/linux-headers/6.18.22
rename to package/linux-headers/6.18.23
diff --git a/package/linux-headers/6.19.12 b/package/linux-headers/6.19.13
similarity index 100%
rename from package/linux-headers/6.19.12
rename to package/linux-headers/6.19.13
diff --git a/package/linux-headers/6.6.134 b/package/linux-headers/6.6.135
similarity index 100%
rename from package/linux-headers/6.6.134
rename to package/linux-headers/6.6.135
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
