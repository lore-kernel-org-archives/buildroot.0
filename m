Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D79C3DA7A
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 22:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A63F582018;
	Thu, 22 Dec 2022 22:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A63F582018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sui-XDQyedoP; Thu, 22 Dec 2022 22:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE31282013;
	Thu, 22 Dec 2022 22:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE31282013
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8012A1BF357
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 22:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B319403C8
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 22:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B319403C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBmyAXEAIWwM for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 22:50:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE55140112
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE55140112
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 22:50:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id co23so3066170wrb.4
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 14:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKe9khRGxUNKbBRxdh8AwT8rhpsVtlw8DyACq/65qUM=;
 b=AztWAw2GG3pZUqhUJFHM7WjmWl+ZqmJZo4TTwV08A9pGtP3S4XzpyCN9CKpgT5V+e/
 KBHyi3HEI8d+O7PWBXHcQJjFkooIgdcSMlJP4R04tI3lz7M/qf6V4NtF5BmB6wK8dbGe
 jFSh4/hcubS3kyOPtdz2aSzdxlhne3PHNGSGU0b5WRJFf3FDMuFG2bKeasbBYYXPmHvE
 DGRgGl0Efj0xtbNcQnKM7cTAhXPr4t6KRm98YNXxzhStm0lvLIqXDddGBxp4k+7XcpYX
 Mf78cEhyHVrGI5dEl/WU8x3HunX1B2WO4zopB65tYGVliIzlUoNyJIyucV/ICNFlOB49
 THRQ==
X-Gm-Message-State: AFqh2koI/YULA7XWWkPgvt0niUstvBjEEu06qdNG9jTPAo7WR1WdwLaD
 zyH9hMeJmygbbor44O4jI9b/32t/b8k=
X-Google-Smtp-Source: AMrXdXvdwjfq2wtP5OVJ03xhbfCYTGnUxRvMbW7I+9dgXvDJ444DjAZdW1s1u1vjavOLP2lIuHhRIg==
X-Received: by 2002:adf:b1c2:0:b0:242:87d0:bf11 with SMTP id
 r2-20020adfb1c2000000b0024287d0bf11mr5251741wra.1.1671749429850; 
 Thu, 22 Dec 2022 14:50:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m15-20020a056000008f00b00267e918d1ecsm1633152wrx.24.2022.12.22.14.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 14:50:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 23:50:27 +0100
Message-Id: <20221222225027.277117-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tKe9khRGxUNKbBRxdh8AwT8rhpsVtlw8DyACq/65qUM=;
 b=CjON1HRWEgRxuvA/JcWM1cm/28NrYRaaBlDpxIMmMg6vOlJxley314nxTBgR72SRW6
 KEMgZxWZ5az4rklaikUxTIx0ZVcklTcZcc4F+SnjJAsbhjUpzWyFGu6tzDPYxRUmlu80
 BX/SfOHqQNXONIKt0qFJQwreQC1AiAecj6g2zBTAANrOP7X82K0maVR3HdGyCmAFoC3R
 vmaLYiZCCLdmXFRBoBMyQP4EVl3ZCMtK2OTDiARV9b3NUTK9+FjxrdtSgFxXbSdqRFg0
 q5su7K09nXsd4SOUNdpdkWTJ19j9YDkAbYcZCGN86vJ70kDubLpPU1qWZyoZmbsEnzeC
 1/pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CjON1HRW
Subject: [Buildroot] [PATCH 1/1] package/libdeflate: fix static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since bump to version 1.15
in commit c31087182fa545784d9a0a01f0b32715d78c3955:

[ 79%] Linking C shared library libdeflate.so
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/12.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/12.2.0/crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/25489e5c6f0da642136e099ab35b091624f53a2b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdeflate/libdeflate.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 2305af4dc9..67e97c6e5e 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -12,4 +12,18 @@ LIBDEFLATE_INSTALL_STAGING = YES
 LIBDEFLATE_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE"
 
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=ON \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=OFF
+else ifeq ($(BR2_STATIC_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=OFF \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=ON \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
