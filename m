Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA189C3601E
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 11:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99C8A81193;
	Fri,  4 Apr 2025 11:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZSLP8SABxTc; Fri,  4 Apr 2025 11:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6238181CDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6238181CDC;
	Fri,  4 Apr 2025 11:15:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 464A31C7
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E50540B5C
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blD-FFbyYlZS for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 11:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=18212901c=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F3F440571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F3F440571
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F3F440571
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:41 +0000 (UTC)
X-CSE-ConnectionGUID: OD9/7JEtTm6INTpKo/nToA==
X-CSE-MsgGUID: pFfTy05UTIm3gyJkdGtZyQ==
X-IronPort-AV: E=Sophos;i="6.15,188,1739862000"; d="scan'208";a="40101909"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2025 04:08:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 04:08:08 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 4 Apr 2025 04:08:07 -0700
Date: Fri, 4 Apr 2025 16:37:55 +0530
MIME-Version: 1.0
Message-ID: <20250404-optee-4-5-0-v1-3-704dadae3f5b@microchip.com>
References: <20250404-optee-4-5-0-v1-0-704dadae3f5b@microchip.com>
In-Reply-To: <20250404-optee-4-5-0-v1-0-704dadae3f5b@microchip.com>
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=uFjecdko4feMfAeZ5QijdY5vG5etW0wCyYhZX6yA6MU=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMaS/3zthk1BJx99YQZZTmp0Nkks4fF8JMz4SvCATZP/94
 uldt187dJSyMIhxMMiKKbJ0b54/27DoT2fmT84VMHNYmUCGMHBxCsBE/gszMjz9zeYxz+22Q1ph
 cK33pH0+N7qC5rF+Lbr37m5IUekzr2qG/3n916rdZjkd2KLp/zdlfvXrDe2HruXaXNqVfMZHy7E
 tjgsA
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1743765342; x=1775301342;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uFjecdko4feMfAeZ5QijdY5vG5etW0wCyYhZX6yA6MU=;
 b=qKK0tBeBg0RX67cxkcAsMPQFEqS2Zpn/EITGWUu5rWBtUTA9xD2qHdB3
 IYiNgv9cghSNwCPL7fkCQ5ZATyhV7J+TRl80W8dIRW6jI16VNqXXI7Thi
 YFiQkFcinYjtzGyyVT0dY7RBwaAp6Y5vPRS51HNTa93TLJZsNtS256/jS
 YmHPN1TGlBo8OZqM2tB7Pz+YalSD7o8ErKuHFaxb/2+UoW6Z0jgH8h7G7
 nPwJkoEXdcPycJKEOaWiVkDuasrj682WPAp9mHmPGQdBZQg6JmbHChN7I
 kdeRajBU9O5maLjpJbps+534+agUVQ/HOnUJtHtsGYGZB0CAwTboJYZ1m
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=qKK0tBeB
Subject: [Buildroot] [PATCH 3/4] package/optee-examples: bump to 4.5.0
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

Update optee-examples to the latest tagged release

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 package/optee-examples/Config.in           | 4 ++--
 package/optee-examples/optee-examples.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 5c5b0ce5ba4a7a2b15add9cabfabd14f2b904b0b..222beb2af10c17ed3c91a183139a5f94dd2cee62 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
-	bool "4.3.0"
+	bool "4.5.0"
 	help
 	  Use the latest release tag from the optee-examples official
 	  Git repository.
@@ -72,7 +72,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
-	default "4.3.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default "4.5.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index a6ecd2caec54589a781bbe6eedc2a26d6aa20f9b..539f6f2148eac33c37279769ada5e21a5a766be7 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
 # From https://github.com/linaro-swg/optee_examples/archive/4.3.0/optee-examples-4.3.0.tar.gz
-sha256  ee1576617365b5fe9d20d72c16cf6b39159eb79b1401189bd37a91ef03371820  optee-examples-4.3.0.tar.gz
+sha256  3fcf1f9eab8d094f898bbb3e2a69a0ca321765f39c832749fdb571a21063bcfc  optee-examples-4.5.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
