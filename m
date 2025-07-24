Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0275C87FC5
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D3B41B13;
	Thu, 24 Jul 2025 19:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sO0TVZoA3-Vs; Thu, 24 Jul 2025 19:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF1A41AB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF1A41AB2;
	Thu, 24 Jul 2025 19:36:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B5B8115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7903B613C0
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xA5Qo1R6Vj7O for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 906AA61161
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 906AA61161
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 906AA61161
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:36:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B17FBA4C0685
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 21:36:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59862)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uf1kB-0000000021u-0Qvi
 for buildroot@buildroot.org; Thu, 24 Jul 2025 19:36:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:36:43 +0200
Message-Id: <20250724193643.1193871-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753385803;
 bh=FkAnoOT8xPYF8QLZRp+ZdnhUHPax4q5JVN1ugTwXuzc=;
 h=From:To:Subject:Date:From;
 b=GqWRTCdh/+TtJkd4rqgQt2YPsENFptdJfOzgh+UHHbyhH5MU/LdPPAcMbKV9OaI1Z
 Kp2bOBWe+P0SyrJViWKl0pGqKEQsckZ8oLXRdyWt5HvndKFqzjQOb3YYl0OjxpZ/uK
 oqdDw8CtV4nbf/3NUsPB9MRlUUTH4Ys/F0y+9uQwtA7PXwoxHgDprETYE6zxEnN27F
 rv1jWJJwS4p/JvCJnIUqwAhLKMj9eIwi3By/bcaB3eYOYDAmcCFEAxCzzvczHqsJFq
 TichxDyJGqT2qoMP6oXpkGruzaY9XJaPrNDX1yqdPcMOUE+p0PhBalNmmtrCtCU0TA
 WX+owKeraGblg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=GqWRTCdh
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 15}.x series
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
index f74a0cef53..b4c6624488 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.15.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c3426f6a6c..1e6602c878 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  2bb586c954277d070c8fdf6d7275faa93b4807d9bf3353b491d8149cca02b4fc  linux-6.15.6.tar.xz
-sha256  936fdfd2405b5e0ac38d4e094b07772610c22cd478f4bb257c9bf929e762ff95  linux-6.12.37.tar.xz
-sha256  3b67c170638142da56b7a9c3295f2483b88e8c4d3bc26b2bda63b6cf0cb9ee3b  linux-6.6.97.tar.xz
-sha256  0f49bda42fbd7506063d537fec7d4d147c373a0324655fdaf2a65a000c9f7acf  linux-6.1.144.tar.xz
+sha256  d37e92bc16b962a3025df156647bdad90b2db4ff36c7a6137817fe81ef3f28a6  linux-6.15.8.tar.xz
+sha256  4811af1317f98d2cccea3c7695969a2c03a27cb02fd2d5327032dd5341842933  linux-6.12.40.tar.xz
+sha256  d6c0ec4d55b14814f55b62a0b23a2d95faf66877e48fbfb4b83523e4afdf97ba  linux-6.6.100.tar.xz
+sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  21786ee84981418279fcd60ae6ed98ab2f102b5a4a255bd81b881033f0afff14  linux-5.15.187.tar.xz
-sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
-sha256  c48158f7735668aac78b9d74bb3616f57a4ea0816ca09f7db83f7834d705b6a9  linux-5.4.295.tar.xz
+sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
+sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
+sha256  3d63614e58bf1befaba3f5713145200d09f26e564832c8948094fdf5b11fa73a  linux-5.4.296.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5c0ec12287..23b65f8dee 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -444,13 +444,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.187"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.144"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.97"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.37"	if BR2_KERNEL_HEADERS_6_12
-	default "6.15.6"	if BR2_KERNEL_HEADERS_6_15
+	default "5.4.296"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.100"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.40"	if BR2_KERNEL_HEADERS_6_12
+	default "6.15.8"	if BR2_KERNEL_HEADERS_6_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
