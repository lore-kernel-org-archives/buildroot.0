Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964EFC2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 18:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45415608FE;
	Fri,  7 Aug 2026 18:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gB1Clwu8Qc3b; Fri,  7 Aug 2026 18:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E960607EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786128357;
	bh=PIM7LKMY31pp2qokuoPcJcNnZKnmra1epBrK2jNsAF0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mCDDYsW/kjl9N2DBrxsF9h1eTyiv8ApnzECEI9ahUeKN29Gx9/dq+2HX6pclAyU1q
	 UYDag7G7jsKexhb0bn0hH6mHlQrD72UdhATS0bZXft1xKGEfN4pkPJ2bbNL3YKUQlr
	 BGS1hlipvuUl6hXKRM23hUYd70aZKbnh3r2q2Q+OuJ4nKpgC7Y1tC60ZInmUWHWQDI
	 HtnXAYpH4FkZgmPpN9iXiVbG8v1gl6ZnBz07ro3V45lFaQE/UYUD1kms8sPS2jrBOI
	 XDKAaIsYEt14UX8+bJHoNjsZv49m0Tl+TQbf1E536XF5frKiEy5U2BxyKxZVXsQcM4
	 AuM8AKxDdbLbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E960607EC;
	Fri,  7 Aug 2026 18:45:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A59F5282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B77481233
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2xtNpWxYmXO for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 18:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17A3E8122F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A3E8122F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17A3E8122F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:45:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c228.dip0.t-ipconnect.de [79.214.194.40])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 761BDA4C4912
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 20:45:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53694)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wsPZj-000000001RD-2BXH
 for buildroot@buildroot.org; Fri, 07 Aug 2026 18:45:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Aug 2026 20:45:47 +0200
Message-ID: <20260807184547.2521801-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786128351;
 bh=3h2O71MO32c2po6xlvHtKDq4WQ2544FUB0Ve1iluOLg=;
 h=From:To:Subject:Date:From;
 b=XR1YCvLALHqJAArfN2iXSEFm8/UBYzuxlVIli9LKTa6ky+niyDS9DspKdpwkQ8Tix
 y1T8y+21358pEFNi2EDdxJqu0g4ncmAEp0Xc3TPNDB1aGlE0hx27mHDLIUSzoW4uC5
 Yxc/YBj1ot+86WsCQQ5F12JUcpr4TH1w8HJsI3nPajcw+volzhpbWJuHApJM7GgGeb
 axQf9K8hnoKLPdJ+EfXRWZeYSDLS0ZD0jfeSpsnmkMiTFeLKjdfACQ7NLXo2LEuKgP
 TgOUnDiFcwXbiPKnu4xcv6XYq2W/9uRqqbTdvcvQ8KBiEVS5hSjiVKpjy9+Qk+upkm
 OKLTSUd4aFI2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XR1YCvLA
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.6.x, 6.1.x,
 5.15.x, 5.10.x series
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
 - 6.6.149 -> 6.6.150
 - 6.1.181 -> 6.1.182
 - 5.15.214 -> 5.15.215
 - 5.10.263 -> 5.10.264

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/before-6.17/linux.hash                 | 8 ++++----
 package/linux-headers/{5.10.263 => 5.10.264} | 0
 package/linux-headers/{5.15.214 => 5.15.215} | 0
 package/linux-headers/{6.1.181 => 6.1.182}   | 0
 package/linux-headers/{6.6.149 => 6.6.150}   | 0
 package/linux-headers/Config.in.host         | 8 ++++----
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename package/linux-headers/{5.10.263 => 5.10.264} (100%)
 rename package/linux-headers/{5.15.214 => 5.15.215} (100%)
 rename package/linux-headers/{6.1.181 => 6.1.182} (100%)
 rename package/linux-headers/{6.6.149 => 6.6.150} (100%)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 34d3be41d6..7102a69377 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  694bb5f49371323ab9c2b7040bd358ed81bffbe80b372d76507045828f655803  linux-6.12.102.tar.xz
-sha256  a7ef7a894d6c5111eb5281167819a76bf08914edacd953e7704de045b73ac3d0  linux-6.6.149.tar.xz
-sha256  d9b94ba489852aceb676c6f9e54502766a4e8363d9da114e6213bc0b6fb18908  linux-6.1.181.tar.xz
+sha256  6eb823269151936c0af9e050678ed5c70ca515d6b20a09af741852b02d228979  linux-6.6.150.tar.xz
+sha256  f38416bb6e8024a21ae868c7f29cd15293a73755e3484c7f2f4adea5b03c1f85  linux-6.1.182.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  61d2c47f4b7148ce101cb257b8dfde301c2df5c64b4b53eb2e038a2fa709e541  linux-5.15.214.tar.xz
-sha256  c93338f367aab6c746bff8a05bca82665702065493127e204be4a96d4e4c7da6  linux-5.10.263.tar.xz
+sha256  d57f279da0813fa6d69fb2e59cf9a364be4faa1cd18cb76b0b64c074fd23b7a7  linux-5.15.215.tar.xz
+sha256  f27552ec32783512c81918c3b8f155fed8dbaf8a90a5a20afdc01aac715b489e  linux-5.10.264.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/package/linux-headers/5.10.263 b/package/linux-headers/5.10.264
similarity index 100%
rename from package/linux-headers/5.10.263
rename to package/linux-headers/5.10.264
diff --git a/package/linux-headers/5.15.214 b/package/linux-headers/5.15.215
similarity index 100%
rename from package/linux-headers/5.15.214
rename to package/linux-headers/5.15.215
diff --git a/package/linux-headers/6.1.181 b/package/linux-headers/6.1.182
similarity index 100%
rename from package/linux-headers/6.1.181
rename to package/linux-headers/6.1.182
diff --git a/package/linux-headers/6.6.149 b/package/linux-headers/6.6.150
similarity index 100%
rename from package/linux-headers/6.6.149
rename to package/linux-headers/6.6.150
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8f4cd3b283..4fa0bc80f9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,10 +472,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.263"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.214"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.181"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.149"	if BR2_KERNEL_HEADERS_6_6
+	default "5.10.264"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.215"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.182"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.150"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.102"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.43"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.7"		if BR2_KERNEL_HEADERS_7_1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
