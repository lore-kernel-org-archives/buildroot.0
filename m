Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE0BC5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 04:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3396408F4;
	Thu,  5 Jun 2025 04:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2T0qLPvdOA2; Thu,  5 Jun 2025 04:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1277740A19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1277740A19;
	Thu,  5 Jun 2025 04:42:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88BCF1A6
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 04:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 867D540060
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 04:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkUQ5oe7IhH8 for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 04:42:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20B284002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20B284002C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20B284002C
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 04:42:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b33b.dip0.t-ipconnect.de [84.161.179.59])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41035A4C035D
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 06:42:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52528)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uN2Qa-000000007RJ-3jDU
 for buildroot@buildroot.org; Thu, 05 Jun 2025 04:42:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Jun 2025 06:42:09 +0200
Message-Id: <20250605044209.3347446-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749098530;
 bh=AQIBuY/vZUeC31H2FdhyBOL8+Oun76TTjUrHx+QqZMs=;
 h=From:To:Subject:Date:From;
 b=pbXHRI0mpEDI4aX7gAj+p1sKSBnpY8CWnApIlSJo+3/Z57M5pNkaMKQROcsIM4wCb
 0Ve8M+flQUX0ibHuvax1VkfKVeUVysLePJebuENlmj0jcuGaHPJt3z2w8wbLkxsc72
 kwOOThblv6J9t0dkV9lkAISxQE1FROGWOokVTbuFmWjcvVFgY+vdkovfgn+A0AAPDO
 WcwNtkOjRvXD/2Jxa3prBmWf5OXiccerkpNc7ij1ZrWVPP571JvFZD3+PJFA5Io20h
 4A3vccaEhf46tQohzzTAnry6TTpbSPNf1ebmCXJTn/VlFrjWi1SpaYjpBY9AP64LXb
 7QDQ9b71fIbZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=pbXHRI0m
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 14}.x series
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
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7552aa4d6c..ddd6515446 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.14.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.14.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 104d42288f..b69793bf63 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  62b12ecd3075a357eb320935657de84e01552803717dad383fa7cc3aa4aa2905  linux-6.14.8.tar.xz
-sha256  df046a48971e40ce0b2e003e7e55b6b1e7da2912120eb216d5d6c8450c9cf82e  linux-6.12.30.tar.xz
-sha256  1d82a82642d281c31d86f7301bc55e12a8a9f9c04532e249ef8ae6fe7dc237ec  linux-6.6.92.tar.xz
-sha256  5779f9caca77f7bfe3c3923b4d760041318db0303de93b2d4691d60e4d41eb74  linux-6.1.140.tar.xz
+sha256  de8b97cfeae74c22f832ee4ca2333c157cc978d98baa122f0ee9c01796a2fe43  linux-6.14.10.tar.xz
+sha256  a9b020721778384507010177d3929e7d4058f7f6120f05a99d56b5c5c0346a70  linux-6.12.32.tar.xz
+sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
+sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  9c3e98c6dcc7dca7c2e9dd51423eaf0581f5e100d0f04c23bc29f21913dac1d9  linux-5.15.184.tar.xz
-sha256  1fc82737e0e4f0ae0b40f91a00c68f3cb75362e6ae54623ec64b41a51cde0f25  linux-5.10.237.tar.xz
-sha256  34589340c7d76c0de91965e5242f61e9f9f3bacd03e8e34239e5d4660d45372d  linux-5.4.293.tar.xz
+sha256  3d03eb798910f32929f7fda5a56e4bb1a121f10bde320d6f3063639c009313dc  linux-5.15.185.tar.xz
+sha256  07c852940dc2dc03fe84f7fcf697648d7cba11c62d20504380492ba07aa46bb6  linux-5.10.238.tar.xz
+sha256  c879d0ba817aaa0fde318d58d7e1f141d9c29bd8569a96b73159ebc448077b99  linux-5.4.294.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ccaad58e44..efe50f98df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -440,13 +440,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.293"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.237"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.184"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.140"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.92"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.30"	if BR2_KERNEL_HEADERS_6_12
-	default "6.14.8"	if BR2_KERNEL_HEADERS_6_14
+	default "5.4.294"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.238"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.32"	if BR2_KERNEL_HEADERS_6_12
+	default "6.14.10"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
