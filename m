Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5773C53219
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7F880C43;
	Wed, 29 Jul 2026 18:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HHRfwWe9lwJ; Wed, 29 Jul 2026 18:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90DFB80D4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785350369;
	bh=aD8j4hnGpMkOYJhm8q64WYgro8X6Tn4meMuKiJkOf1Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NYFwt+dw7sudclhU9mSodyQ3uqxXVVSns0HOYzd+muCSpjXXHBgbw4nKiQ2a/iTr+
	 EemKUPODYMxq1bSGkKpJvMLfR53WmnIjdSRUoQwScpKI1Vh3Mh+9SJ0sha4CN3vaf6
	 UNIzkpOwfNV1v1deOTBtRED9RUBSaj+mxi4dxgdmeb53Jn7VUY3l99z9aBpU9UZP10
	 sKw/cfghcIFb1+5Eecr2NJ496PohM1SbGOBhtTf1Kv0hctm6WhAwv++zagsftwPNrz
	 cIMejvSCFe76PWMMAohcVXPMh01vwjRw+q8RRhQj/C7bIjoT5Fv+FYJ78jQwGZmHx0
	 VcGLSAXBpANVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90DFB80D4F;
	Wed, 29 Jul 2026 18:39:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2685B197
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 185CE40317
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TzAeQYT5GBv for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:39:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD6EE40149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD6EE40149
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD6EE40149
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:39:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bfcd.dip0.t-ipconnect.de [84.161.191.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7574BA4C4228
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:39:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wp9Bc-000000008Fc-0TbZ
 for buildroot@buildroot.org; Wed, 29 Jul 2026 18:39:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 20:39:24 +0200
Message-ID: <20260729183924.138235-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785350364;
 bh=e9mBl25eBg57PKJzc6DFR+hV2+h5d+GZo50WMGdQKVU=;
 h=From:To:Subject:Date:From;
 b=or2L99iwN0byy+ulzoovVa24s8DO5IXqrDfxvyldlwtPZALxmK0z0ICEjH2PCMMhx
 DaJiS4lmchMusl2prnOTuD/7Jr06klKBeDcyHCGt7CrBi/yemSjuhoqysNbEyjJTTV
 3HytE9dghabj+S5Cdqovy3s9uu+LVes4bamBh18QCIfDhbUYWaaGWFaCVEXhOB9HZ2
 YPjc3gvpgIsfv1o7hxOh3aCnBxKpEIJ+eu8sqCQoFfaqHB/SJGG1s+fQ6E+sRdfyUl
 aGlg7gfDf9CcEzAYeNvVsVDbk8sGKIe0mtswQ5c2rwI5m0HLjibNvU7vJdiZPfetbM
 X4FBnm7arkObA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=or2L99iw
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x series
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

Update the latest kernel releases to:
 - 6.12.98 -> 6.12.99
 - 6.6.145 -> 6.6.146
 - 6.1.178 -> 6.1.179

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/before-6.17/linux.hash               | 6 +++---
 package/linux-headers/{6.1.178 => 6.1.179} | 0
 package/linux-headers/{6.12.98 => 6.12.99} | 0
 package/linux-headers/{6.6.145 => 6.6.146} | 0
 package/linux-headers/Config.in.host       | 6 +++---
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename package/linux-headers/{6.1.178 => 6.1.179} (100%)
 rename package/linux-headers/{6.12.98 => 6.12.99} (100%)
 rename package/linux-headers/{6.6.145 => 6.6.146} (100%)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 5102fea2ff..92f0ad8550 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a62b6a2d207ff72510e5f47156b7078e1e71797357412411b8e4fff97fc8f4c7  linux-6.12.98.tar.xz
-sha256  de100e33d8ad8b6f4b3d2335b179e961be3c00ae7a39efdb052182a8d8bf0126  linux-6.6.145.tar.xz
-sha256  7d83fa67ca75032b1ac6ef49973722073963c0cb9bc3aa7ef3efa749cf6c720f  linux-6.1.178.tar.xz
+sha256  6a477222c132033381cda981eb0127f29fbcbba17e820283bc21290f8e408629  linux-6.12.99.tar.xz
+sha256  62e6c1e456202b57b048071593e890f9e8f50fb50fe0df64f8bfbf65f360140e  linux-6.6.146.tar.xz
+sha256  dd4a164b6ffdcac6b1d958eb14bee256b10819557ee58ac5c9f6a1ae33380126  linux-6.1.179.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c396aeebc90c7aecb7f7abdf504c19b372c9926eb0cf0e91f9f09d7d870b65fe  linux-5.15.212.tar.xz
 sha256  a19ca1100640a5fd3b452eb15fe9de32f8deb4ab1866dd7db52183b1a2fad7c4  linux-5.10.261.tar.xz
diff --git a/package/linux-headers/6.1.178 b/package/linux-headers/6.1.179
similarity index 100%
rename from package/linux-headers/6.1.178
rename to package/linux-headers/6.1.179
diff --git a/package/linux-headers/6.12.98 b/package/linux-headers/6.12.99
similarity index 100%
rename from package/linux-headers/6.12.98
rename to package/linux-headers/6.12.99
diff --git a/package/linux-headers/6.6.145 b/package/linux-headers/6.6.146
similarity index 100%
rename from package/linux-headers/6.6.145
rename to package/linux-headers/6.6.146
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8e90f85a64..250fb083ab 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -474,9 +474,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.261"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.212"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.178"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.145"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.98"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.179"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.146"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.99"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.40"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.5"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
