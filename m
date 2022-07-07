Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06327C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Jul 2022 05:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CEEE60E74;
	Thu,  7 Jul 2022 05:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CEEE60E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qUtM84lPvIHf; Thu,  7 Jul 2022 05:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD0160B72;
	Thu,  7 Jul 2022 05:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD0160B72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 255771BF578
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 05:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D4A660B72
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 05:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D4A660B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPUeJs3ntKyd for <buildroot@lists.busybox.net>;
 Thu,  7 Jul 2022 05:53:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD63660B6B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD63660B6B
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 05:53:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a5so10056068wrx.12
 for <buildroot@buildroot.org>; Wed, 06 Jul 2022 22:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IqOcI9MHHfkmvHw1XmOhc47Wo2rxhFBT11pKGHZrJU=;
 b=uXH/6wPNeLx0Yo5y60LiLzQwldTgEeO4AnD7f6VGKDyrUUvhBvuvRc/c/5i1JjJjem
 h2MO7C4j+J8GK0v1DhWntoRdnGbPk+Ln3wW0t42wY0c0HKFUV88CI0/DNN2IjQxt2I7O
 VLQvHTY7c0845RTWVo9H/migqIouvE47vL2QXh1gAvdvbgi3woUrGU54lRaySIjxgW62
 JtKzg2RRcKHpsdwWQoSKsMP8tYKcPzZti2ykfprDkIPLny8MLIRbwRXkqtbewyDCqexr
 C3yfsYZKG65UxRok0XzVbUvftuvnnXwIT9k1a4jl4GlL7kAj9jDK7bZkP9RY6vqWV6od
 O2Qw==
X-Gm-Message-State: AJIora99xojtPFIvXNCbBwr81HHlXbG0z2r7YDroLcx6fP+QAVx9lZhq
 KAEpFbI7e1hfV4c8pDNIR082ILufW2Y=
X-Google-Smtp-Source: AGRyM1tRZF17LKZ3fTPYEQaIQG2iPqN1p/0ukyE/qubOevtOUYOK9pXpnO8f4bWAQcnph2WfcDGL7A==
X-Received: by 2002:adf:ed44:0:b0:21d:81a3:d78 with SMTP id
 u4-20020adfed44000000b0021d81a30d78mr3359955wro.677.1657173219831; 
 Wed, 06 Jul 2022 22:53:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b0039c362311d2sm28392629wmi.9.2022.07.06.22.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 22:53:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Jul 2022 07:49:48 +0200
Message-Id: <20220707054948.479212-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IqOcI9MHHfkmvHw1XmOhc47Wo2rxhFBT11pKGHZrJU=;
 b=AAtVP0q3qiIMPVlj64CQTUzyyFbGpYbSGhEYZvDThjD8/RgrupSAw8X+CJF0gHAZLV
 93GiQt6u8pJFlaB7EdeNSwg/KUrT8Fy9uPKO/5kg3BeIMoUmGWJzynuCj24OaVEuisH7
 3B47S3kqaDSeW/O2eJC2g1VT90oE9Ti+Ljjg3ImjkKqs5Q02y1TPQ71zYdHgUKkOizdM
 89ffmSGdHDjgHWBbcllTXSU1xjgHrhdm4v0V154k0OTJcKxdj1yKufA2g0kbFOmTSQi0
 NSsG5z8/JF1Mt+WTBPz18R0hks3SfS/2cmQUymfgG7a/rLsYobKM+/sujVcutZlcEhEC
 lLMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AAtVP0q3
Subject: [Buildroot] [PATCH v2,
 1/1] package/libopenssl: fix BR2_OPTIMIZE_FAST build
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop unneeded SED hacks (including build_tests) to fix the following
build failure with BR2_OPTIMIZE_FAST:

In file included from crypto/async/arch/../async_local.h:30,
                 from crypto/async/arch/async_null.c:11:
crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name 'ucontext_t'
   32 |     ucontext_t fibre;
      |     ^~~~~~~~~~

While at it, also "drop parentheses as all it does is spawn a useless
sub-shell" as noticed by Yann E. Morin

Fixes:
 - http://autobuild.buildroot.org/results/3ce202f11a821940ff55eafa1dc7cea54b8c0da2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Drop SED hacks and useless parentheses

 package/libopenssl/libopenssl.mk | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 601da3f8f1..f19a63da41 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -52,7 +52,7 @@ LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
 endif
 
 define HOST_LIBOPENSSL_CONFIGURE_CMDS
-	(cd $(@D); \
+	cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		./config \
 		--prefix=$(HOST_DIR) \
@@ -61,15 +61,14 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
 		no-fuzz-libfuzzer \
 		no-fuzz-afl \
 		shared \
-		zlib-dynamic \
-	)
-	$(SED) "s#-O[0-9sg]#$(HOST_CFLAGS)#" $(@D)/Makefile
+		zlib-dynamic
 endef
 
 define LIBOPENSSL_CONFIGURE_CMDS
-	(cd $(@D); \
+	cd $(@D); \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
+		 CFLAGS="$(LIBOPENSSL_CFLAGS)" \
 		./Configure \
 			$(LIBOPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
@@ -108,11 +107,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
-			$(if $(BR2_STATIC_LIBS),no-dso) \
-	)
-	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-	$(SED) "s#-O[0-9sg]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
-	$(SED) "s# build_tests##" $(@D)/Makefile
+			$(if $(BR2_STATIC_LIBS),no-dso)
 endef
 
 # libdl is not available in a static build, and this is not implied by no-dso
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
