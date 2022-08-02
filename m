Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE5DC19F2C
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 13:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24DB4408EF;
	Tue,  2 Aug 2022 13:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24DB4408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkoE_M6SlAnZ; Tue,  2 Aug 2022 13:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FB3408A6;
	Tue,  2 Aug 2022 13:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03FB3408A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78EE81BF329
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 13:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B6760C22
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 13:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B6760C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nu152q_QfsvF for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 13:36:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8479460C21
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8479460C21
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 13:36:38 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id b7so9337810qvq.2
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 06:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2tLqfuNcYA3gP78wchm0DzqoZKNiiK/WN1FiOJ/5zA=;
 b=aP6euPb2Uew1nalyVx7xgSLyzxYQGEdN2JasJ/ZsMV0VbG6s3ugtoVjUJqze0choKI
 zdD4cFGAuDyFUaADZlWGSwC9WEFCT9kqTZafWzWF4NwFzds+nnsfyhgSu2ZxCqOc/wGj
 U5oFOF/54h9seG/ejgBYBojUUuzuqf0Q9BprUntUkaSUSdix4Hm5xGspUyRctWmUmnM9
 mj4pLYbFL/hlIdP6hM9Nnjtq8c0FuUdC0cn7lHc9c+Hte/1oUPXSVQ6rNYQqVulM/iHm
 u30V9UvxJ1/HBQ5VIrE8KJ9CABZDmKDBObRi5MfktPeC2DFENqJOnFdgdjD5kPsojK1R
 Hf0Q==
X-Gm-Message-State: ACgBeo0f7/3ZJV9NvSDRrxe/GW0E76/P8t3D/TZmTsqcv1CtN34AMkGq
 XFb56KvIrJrQA4OAzGXxWAr2PkifqLb+7g==
X-Google-Smtp-Source: AA6agR56C5g2+MxVyM8dPvtqiBTaevjDoNJ1+55koSU364iCSvpnBaEkDE0a12opQaRFJSDsAxFssQ==
X-Received: by 2002:ad4:5dee:0:b0:474:56:2d0c with SMTP id
 jn14-20020ad45dee000000b0047400562d0cmr18783961qvb.50.1659447397340; 
 Tue, 02 Aug 2022 06:36:37 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 w19-20020a05620a0e9300b006b5c87e9eb1sm10758646qkm.102.2022.08.02.06.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:36:36 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 09:36:25 -0400
Message-Id: <20220802133625.1285283-1-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2tLqfuNcYA3gP78wchm0DzqoZKNiiK/WN1FiOJ/5zA=;
 b=fuDlodK0wnlFFCF1HzWiGt2stDDDfH4K95HUUq+2yA9Vt9zNnEn5blnuIAk27N8GXM
 Avpqn7UMsoM1fDLtuJYMSwBgn/JIkLxGNs6mHouc8OZ2/1+UOmz7OmnbuIy1Ow78EoEw
 hVYlPFYUQpObTHocpARzwzKwXWA1IZiEHvDMBDh0fvT3TypatvY15/P0WHLGYfgAVsxF
 baG3hZsNZQscOHV97pzF32C0f8oR8+iwsQr2wNP5h5qVFY2MYKGMS4rgkJ/sNly5rUi2
 rTwZOClb7VuqtTD/LosDNoBpeSIuReM9tUd/VxV0/FkJVqcSXSXTjDrXwJAxWCnOGQC/
 tq9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=fuDlodK0
Subject: [Buildroot] [PATCH] package/uclibc: fix usage of DODEBUG option
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DODEBUG option passes -O0 and -DDEBUG to the compiler, which has a
significant impact on runtime behavior and performance. Currently,
DODEBUG is enabled by BR2_ENABLE_DEBUG, but it makes more sense for it
to be enabled by BR_ENABLE_RUNTIME_DEBUG.

This patch implements the above change, and also disables the DOSTRIP
option when BR2_ENABLE_DEBUG is set, allowing debug info to be retained.

Lastly, this patch passes all of $(TARGET_CFLAGS) to make, instead of
just $(TARGET_ABI). This enables debug symbols when appropriate.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 package/uclibc/uclibc.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0e17a8e65d..cfdd6a2714 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -216,12 +216,21 @@ endif
 #
 # Debug
 #
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
 define UCLIBC_DEBUG_CONFIG
 	$(call KCONFIG_ENABLE_OPT,DODEBUG)
 endef
 endif
 
+#
+# Disable stripping
+#
+ifeq ($(BR2_ENABLE_DEBUG),y)
+define UCLIBC_STRIP_CONFIG
+	$(call KCONFIG_DISABLE_OPT,DOSTRIP)
+endef
+endif
+
 #
 # Endianness
 #
@@ -374,7 +383,7 @@ endif
 # Commands
 #
 
-UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI)
+UCLIBC_EXTRA_CFLAGS = $(TARGET_CFLAGS)
 
 # uClibc-ng does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
@@ -412,6 +421,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_POWERPC_TYPE_CONFIG)
 	$(UCLIBC_X86_TYPE_CONFIG)
 	$(UCLIBC_DEBUG_CONFIG)
+	$(UCLIBC_STRIP_CONFIG)
 	$(UCLIBC_ENDIAN_CONFIG)
 	$(UCLIBC_IPV6_CONFIG)
 	$(UCLIBC_FLOAT_CONFIG)
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
