Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD59C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 12:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FDA740B4C;
	Sun, 10 Aug 2025 12:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZisD_RBL8Guj; Sun, 10 Aug 2025 12:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DBD140BB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DBD140BB7;
	Sun, 10 Aug 2025 12:48:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EFAB154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 12:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10B8340B4C
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 12:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_KgcX0sYZVA for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 12:48:29 +0000 (UTC)
X-Greylist: delayed 7246 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 10 Aug 2025 12:48:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1747240BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1747240BB7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1747240BB7
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 12:48:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7D69A44287;
 Sun, 10 Aug 2025 12:48:25 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Aug 2025 14:48:16 +0200
Message-ID: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdelieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfftddtledvgeefveegfedtjedvveeltdevkeffgfejgeeiveeijeeuvdevgeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754830105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AwCmpmesDCa9eFf8sdB5EJ0JWUSGh975QbJ0vB+gpnQ=;
 b=kbSb/cUns8zLGYbe+51Xytw+ONP+TnIIQJCTzqx8uEfOYIkbGy+UE7qVdP+RtAiX6k0f7f
 yBEF0V0T/+oyCBrxbcLHGKwIWmTciFSB23flxkMdoRK2hMDV41rtKF/iFd9tLbIOIA64vm
 IjlxYGdxa3mn9Eiprkinexr/p7g7kNCqOqt0MjVKf1idQWhwF1ygZ3oTKJ+FUPSCizKW5t
 OSa5GGpxQhyr+2bmDqXPbxjKGFQ0N1LrOZpuPmbfBKgCl5JPzh6WfyFVfL9MizmVa99MHw
 tbP/kGTlBceov2M0rqioOT7xRb5r3bQqlCF4g9Of7hkV7JDZ5pZHx17ofFqcoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kbSb/cUn
Subject: [Buildroot] [PATCH 1/3] package/gcc: 2024.12 ARC gcc is in fact
 based on GCC 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Contrary to what was done in
8ef2ba2ec3cedae92c585135d3a1c5ae3e0f63d8 ("package/{gcc, binutils,
gdb}: update ARC version to 2024.12"), the ARC gcc version 2024.12 is
in fact based on GCC 14.2. This can be verified at:

  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2024.12-release

Which states "GCC 14.2 with ARC patches".

Fixes: 8ef2ba2ec3cedae92c585135d3a1c5ae3e0f63d8 ("package/{gcc, binutils, gdb}: update ARC version to 2024.12")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2149846761..dc0867fa14 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -10,10 +10,10 @@ choice
 	  Select the version of gcc you wish to use.
 
 config BR2_GCC_VERSION_ARC
-	bool "gcc arc (15.1)"
+	bool "gcc arc (14.2)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
