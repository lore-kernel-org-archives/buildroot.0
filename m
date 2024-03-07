Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC94C54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E9E941935;
	Thu,  7 Mar 2024 17:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixph2A-OEVAY; Thu,  7 Mar 2024 17:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6EEC4193A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6EEC4193A;
	Thu,  7 Mar 2024 17:48:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F13F1BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 380F94193A
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-GNcc0jcUgV for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D48BC41935
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48BC41935
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D48BC41935
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:48:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd61.dip0.t-ipconnect.de [84.161.189.97])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EEA1BA4C0B02;
 Thu,  7 Mar 2024 18:48:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51086)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1riHrN-000000005Mx-2vE2;
 Thu, 07 Mar 2024 18:48:49 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:48:47 +0100
Message-Id: <20240307174849.37394-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1709833729;
 bh=iHWk+QvhT3VHz2fGPuYuSH8x2rFfJ4IBXdYWZaliZac=;
 h=From:To:Cc:Subject:Date:From;
 b=ODjNYXlXEbPn6ZrsC3RHyXP9lOpRIZeGmHy8l1wGsMUIIyiQiAs+Mx/KSGMutJZey
 kPxDyHGKdOT0hkBHDbSrDyduIUuw27KE15w99nmyb/+O2AThIVzRBirhItYsYBNVhz
 GJgjJsuugPliBdZkDY63RjSCc5PiTpVsfbBzEBqvaseEC+EqJmbDHjwAA2JQDNvy6L
 ukog3P7SE24j1gXVRF3stJXR7OOhQDjgjuyYw2Q95R1KccAS1ELyGbzfs3e2ILcCas
 p+ioCPokMbUMOUPBzqv0JvN0ad/x1s9MlEiqrLhRksLkVLzCh/zzm/GwR0KncohD1S
 yx8e5g9xJZpAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=ODjNYXlX
Subject: [Buildroot] [PATCH 1/3] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6}.x series
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 07d6b2b5ec..df84cce539 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.21" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 15c0dc8d3d..977ad30f73 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
-sha256  faa49ca22fb55ed4d5ca2a55e07dd10e4e171cfc3b92568a631453cd2068b39b  linux-6.1.79.tar.xz
+sha256  ee0b430148da94d2b13608b8d80b007b7d281dc90e3f19b63cf9a9943810e457  linux-6.6.21.tar.xz
+sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  bd84809a367eb400eb04e0e70294e6ba12fc03b6bfb5a7dfaca548f8947501b0  linux-5.15.149.tar.xz
-sha256  4ea63c5a90fdc3c459ab35c11ee8c93d2364a7cdbfb101100f8cab70d490ef6d  linux-5.10.210.tar.xz
-sha256  ff54bec6d053c7994f3bb8c45021de2858ff9f740d2ccbbcf072b87821a918cf  linux-5.4.269.tar.xz
+sha256  8a1e760bf2660947234109aa4fdbbe3686238b4e852157b96c59356689107e49  linux-5.15.151.tar.xz
+sha256  0cf3e467bd8d35533888327e9f8a9a9d354fdf83e8f82e9fe5a234f896a07493  linux-5.10.212.tar.xz
+sha256  cdbc61334cdadbd3945b08f03ed197c65bdf358c3383a4334b3e5b483bd95850  linux-5.4.271.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  83eeff613405d0045d0f717c6ac14c178678fe0a163c41d9dd8878ac0f73e352  linux-4.19.307.tar.xz
+sha256  95ada7aa6ef1c69d7a469432f936365e35b004d24e751d82c21a371edd2c84f9  linux-4.19.309.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 63e82c49df..fe4fc5011e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.307"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.269"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.210"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.149"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.79"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.18"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.309"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.271"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.212"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.151"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.81"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.21"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
