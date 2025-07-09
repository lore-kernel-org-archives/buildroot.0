Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FF9C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 21:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B111C40887;
	Wed,  9 Jul 2025 21:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbUs_vUY4x-q; Wed,  9 Jul 2025 21:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD70240874
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD70240874;
	Wed,  9 Jul 2025 21:16:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A6512E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0410240874
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggGZfVUK5qty for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 21:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB2F540423
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2F540423
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB2F540423
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:16:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8DE9444310;
 Wed,  9 Jul 2025 21:16:37 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  9 Jul 2025 23:16:35 +0200
Message-ID: <20250709211636.846101-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkeeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfeftdehkeehfeelvedtgfegudfgueekuefhvdfgfeehtdeukeetgfduffetvdelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752095797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2/3HALqvL5hB9PLqPmcwD+L8DPGPJCTVuWFjEo43Xto=;
 b=o+fDFc9jwDI0QGYV66GlXQZ078pzbIO3FcweX1D3Jj5paWfPs2bD5juP3NMjL94UEsFWnB
 YJNW+fKAgItggy6iTsCOQFbjQd2VWZZw/ruWQMkfpmUmF2FsI6e/g9fcNBHxoaLxJHLKah
 cT/U6asW2dJhENfyPr5fGU4cJfnRZNIGyzQK9NUzczWKW2DjoYj6PV+jwPrpcFSKlp8o0k
 qLTnoX4VbjCerLlJtEcww/xupaj/MCz3LCT4Qucjw/FiG3K79ka93aFIKUjucr7Gp6JIlX
 phSPRie4RgqaKaq2cAOyzyRj+Zq0MNCfaQaCuuOuflJYeUaLah5x+1x1+wUkiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o+fDFc9j
Subject: [Buildroot] [PATCH] package/bctoolbox: disable mbedtls support
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

Since mbedtls was bumped to version 3.6.3.1 in commit
3481a9643fc7223e400ed877f08ade34d44e6b78, the build of bctoolbox fails
as its mbedtls support is not compatible with mbedtls 3.x.

This issue is known upstream:

  https://github.com/BelledonneCommunications/bctoolbox/issues/19

and is not fixed, even in newer version of bctoolbox. So for the time
being, simply disable mbedtls support in bctoolbox.

Fixes:

  https://autobuild.buildroot.org/results/7af784cb60b0ec5e5bd0e0915ce6827f69f4bb97/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: the bctoolbox has no maintainer in the DEVELOPERS file, and
hasn't been bumped since November 2020, despite upstream having
released multiple versions. Candidate for removal?
---
 package/bctoolbox/bctoolbox.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index ac9361026f..db545311fd 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -12,25 +12,23 @@ BCTOOLBOX_INSTALL_STAGING = YES
 
 # Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
 # shared library.
+
+# We have to disable mbedtls support even though we have a mbedtls
+# package because bctoolbox is not compatible with mbedtls 3.x as of
+# version 4.4.8.
 BCTOOLBOX_CONF_OPTS = \
 	-DENABLE_POLARSSL=OFF \
 	-DENABLE_STRICT=OFF \
 	-DENABLE_TESTS_COMPONENT=OFF \
 	-DENABLE_TESTS=OFF \
-	-DCMAKE_SKIP_RPATH=ON
+	-DCMAKE_SKIP_RPATH=ON \
+	-DENABLE_MBEDTLS=OFF
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 BCTOOLBOX_DEPENDENCIES += libiconv
 BCTOOLBOX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -liconv"
 endif
 
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-BCTOOLBOX_DEPENDENCIES += mbedtls
-BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=ON
-else
-BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=OFF
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
