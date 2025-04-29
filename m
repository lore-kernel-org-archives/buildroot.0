Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BFCC369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 06:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 508D84048A;
	Tue, 29 Apr 2025 06:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNZNLxLrvqLI; Tue, 29 Apr 2025 06:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B19D40425
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B19D40425;
	Tue, 29 Apr 2025 06:42:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2154B1C4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6766F80C20
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmQNzTkM8cuM for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 06:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=20723122b=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD3DC80BBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD3DC80BBB
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD3DC80BBB
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:55 +0000 (UTC)
X-CSE-ConnectionGUID: bKa2xpqTRSaMBxsSc3vR0g==
X-CSE-MsgGUID: /BvGjsa/TF2ilchci+HJFA==
X-IronPort-AV: E=Sophos;i="6.15,248,1739862000"; d="scan'208";a="41007749"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2025 23:41:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 23:41:49 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 28 Apr 2025 23:41:48 -0700
Date: Tue, 29 Apr 2025 12:11:28 +0530
MIME-Version: 1.0
Message-ID: <20250429-optee-4-6-v1-2-1cdb296ef7c8@microchip.com>
References: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
In-Reply-To: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=35TqvZEIdRAyOMZJYknzVlLaXGe38mYuBmmmJhO6oUw=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMWQIlCx/vnAro9XXSdvve7LuXXhj7oz293H/LBcyVNTM+
 HPikJFcY0cpC4MYB4OsmCJL9+b5sw2L/nRm/uRcATOHlQlkCAMXpwBM5PZEht8srI5lDjdFfqjN
 7ao9/qJb23b9hEeXTmYbPUvcXPpi7otiRoZjOz79zF76rm7R/ZLrBsf+tjHN37Gwbk/q/euJi75
 lfG3hAgA=
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1745908915; x=1777444915;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=35TqvZEIdRAyOMZJYknzVlLaXGe38mYuBmmmJhO6oUw=;
 b=Qosl+zShfsanLFMHhSyfMjv9qvlnEz0rrQM9Pxa2Ghd6UKejwgYA5GtJ
 qIwJdyWxulZgFr9IkLYfxMsI0Pymbo2Th/r3mO17NH9kdTU0wHlmB72qS
 jUhlyTPcbNBKbu7aOFrJVbWgdTa5Fr8eJkdrfOWDeuJ4xe0lvTKDJpXoY
 eiPSVfChh5UhxQ39u9oOTvf8EHDcdqz7URB7s0Zs/kcbtCwClJWvHPZWn
 bGMGRAss7gZlaUaDa44NyU+gnMJmsESN7RN4R1PDRvZ1SvslVwyB/f6CN
 Gq4BYZKC9bLLbKbMszBSWNFjJl6JOxywJaycJwZynKPw7PxG7P6ncJs1T
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Qosl+zSh
Subject: [Buildroot] [PATCH 2/4] package/optee-test: bump to 4.6.0
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update optee-test to the latest tagged release

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 package/optee-test/Config.in       | 4 ++--
 package/optee-test/optee-test.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index c01e3c06a7f605d8a4c9a89a75a50129410d4558..dd1160ea485d9322d0453d3d1d43b4f974d65267 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -48,7 +48,7 @@ config BR2_PACKAGE_OPTEE_TEST_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_TEST_LATEST
-	bool "4.5.0"
+	bool "4.6.0"
 	help
 	  Use the latest release tag from the optee-test official Git
 	  repository.
@@ -77,7 +77,7 @@ config BR2_PACKAGE_OPTEE_TEST_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_TEST_AS_OS
-	default "4.5.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default "4.6.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 3192c72b93d5fdbee92bc73a493c217d5212aa41..058d95e29b203014953d1d20bbf3aa5455515597 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cda3a4280a919cc6cd3cd3060e8c176cd42b968a9008305a6881e1fd433a6f1e  optee-test-4.5.0.tar.gz
+sha256  db4de73fa955a7db70a64a2c4ad1d2c48ddcb54c369821aba670fec6131a6f61  optee-test-4.6.0.tar.gz
 sha256  2b36458cd0292200e406a608efe7dfda17aae39646a86b730a2776b61d0fa410  LICENSE-BSD
 sha256  a094472b51f57d0403953d087e410793519cb6f3a7cea2be34eb44e09a426a73  LICENSE-GPL
 sha256  a562ab14c307d0e02b7bf6f1bdb0d1cf789409e6375a500e15dc7a0503e5c2c3  LICENSE.md

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
