Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53274C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F514199C;
	Wed,  5 Feb 2025 11:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrhixwkXPV3R; Wed,  5 Feb 2025 11:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D07D241968
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D07D241968;
	Wed,  5 Feb 2025 11:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FEF412A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B2C441968
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dy2zSEbcRDL2 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DD874180D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD874180D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DD874180D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:26:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D5EC44212;
 Wed,  5 Feb 2025 11:26:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tfdXv-000722-2s;
 Wed, 05 Feb 2025 12:26:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 12:26:18 +0100
Message-Id: <20250205112619.27018-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepjedvudefudfhledtkedvffehffeuheeitddutedtgefhhefhgfffgfetuefhudejnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/swipl: fix build without C++ compiler
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes http://autobuild.buildroot.net/results/b24a96b999676990995a466686fe1eacf6cddfef

Some of the optional packages in swipl are written in C++, so CMake thinks a
C++ compiler is needed even though we build with -DSWIPL_PACKAGES=OFF.  Add
-DCMAKE_CXX_COMPILER=true to satisfy this check even in setups without C++:

-- Check for working CXX compiler: /usr/bin/true
-- Check for working CXX compiler: /usr/bin/true - works

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swipl/swipl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index ef9aedcd2d..e29b8d8f46 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -36,7 +36,8 @@ SWIPL_CONF_OPTS = \
 	-DQSORT_R_GNU=1 \
 	-DSWIPL_NATIVE_FRIEND=$(HOST_SWIPL_SRCDIR) \
 	-DSWIPL_PACKAGES=OFF \
-	-DUSE_TCMALLOC=OFF
+	-DUSE_TCMALLOC=OFF \
+	-DCMAKE_CXX_COMPILER=true
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SWIPL_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
