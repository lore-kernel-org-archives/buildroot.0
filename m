Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FFEC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AE70607EC;
	Wed,  3 Aug 2022 20:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE70607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MrCPjpf6spQ; Wed,  3 Aug 2022 20:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1539607A3;
	Wed,  3 Aug 2022 20:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1539607A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA3841BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3B59401D3
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3B59401D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EaRDkvS6Pwqe for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:06:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D804011E
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96D804011E
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:06:39 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id l18so10330149qvt.13
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 13:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agUswavpRjNhvOIUURwqiuj9n4fNbbJ1ziCDLQoA3Is=;
 b=45yEMwa9U53Utv/QArocywoW1X9uxMfpVItasSx7yvfdRDxD7F/rme6Gvv6dPgNlmD
 uj3CBKIoFr/AELQdB4UMnNfMvwJzlgv3ilU04ELhI0u9V4SEyuREg2TDWiiAQ6VW98oH
 PpMbtOWEkyrsUA6Q36E7fdNpZyzOxpQqJ0AYTgpug5mXjbH+lVKSpcO7jyqWLeCIxNPL
 i9M/UdcpqaOi6glrdn1lKtzZXMh01PQCmGAqfHMPGjrLh9DTS6l9foVnhymvE3LtrAkV
 Azt3KXKL3gbyh9GfI6EGlxduWxIIKFG0jl8QY68YgJ8vd+7rFQlQ9pYMFeKHtSIrQcnH
 M6rQ==
X-Gm-Message-State: ACgBeo2bbfvIgwqcaeWwyor/OVBQZ5crLHcyMX/ft+cIlxpQO82zAf8R
 th9cMOwKpA+3SVLbG98E3U5N8CeRCJ5H5g==
X-Google-Smtp-Source: AA6agR4KKUQKE9TcH4zJiVmXCKkYgZUyP1gXh2dN5vpj+HJQ3/SdCHKW/y1g6Do1zWzaN5se3GR0cQ==
X-Received: by 2002:a05:6214:2306:b0:473:f77a:85a7 with SMTP id
 gc6-20020a056214230600b00473f77a85a7mr23224084qvb.106.1659557198250; 
 Wed, 03 Aug 2022 13:06:38 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a430c00b006af1f0af045sm13293650qko.107.2022.08.03.13.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 13:06:37 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Wed,  3 Aug 2022 16:06:29 -0400
Message-Id: <20220803200629.3172370-1-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agUswavpRjNhvOIUURwqiuj9n4fNbbJ1ziCDLQoA3Is=;
 b=LRd5URC7sQoW5x62YOo2PrD7TUOFnsG9vbhf6KA48GHBFxq8wU3AM8ifcKBov1FQ2S
 7EAUKwEnlGNREGbDHx/+9+NL3irppPGdiQ0DVFMHnkI1/qcwWqQiAEnWrHjdrl5jQly1
 kisXZ0L1ht37RFEbv4LiBdBfhLbVbQNib/boLLd7SUDJspGVbl0tQmyfnWh1piPkEuIm
 LT+JQN7D3q8Dzaz/VkBM9+aoUq5NhIda6rewVxeYCO4XbsqkgpwXqtHoUUSCS7dkQMwq
 Bn7XCHZa2Lr4ajbvfp1vDkVIiNR9w08EfFvHGjhMOYFYAOyTGiNy7CaRDdEbHatHIVQY
 xNQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=LRd5URC7
Subject: [Buildroot] [PATCH v2] package/uclibc: fix usage of DODEBUG option
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DODEBUG option passes -O0 and -DDEBUG to the compiler, which has a
significant impact on runtime behavior and performance. Currently,
DODEBUG is enabled by BR2_ENABLE_DEBUG, but it makes more sense for it
to be enabled by BR_ENABLE_RUNTIME_DEBUG.

This patch implements the above change, and also disables the DOSTRIP
option, allowing Builroot to decide whether binaries should be stripped.

Lastly, this patch adds $(TARGET_DEBUGGING) to the compiler flags, to
enable debug symbols when appropriate.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
Changes in v2:
  - Always disable DOSTRIP.
  - Only add $(TARGET_DEBUGGING) to CFLAGS, to avoid any unintended side
    effects.

 package/uclibc/uclibc.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0e17a8e65d..7e237c48e6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -216,7 +216,7 @@ endif
 #
 # Debug
 #
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
 define UCLIBC_DEBUG_CONFIG
 	$(call KCONFIG_ENABLE_OPT,DODEBUG)
 endef
@@ -374,7 +374,7 @@ endif
 # Commands
 #
 
-UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI)
+UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI) $(TARGET_DEBUGGING)
 
 # uClibc-ng does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
@@ -396,6 +396,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,RUNTIME_PREFIX,"/")
 	$(call KCONFIG_SET_OPT,DEVEL_PREFIX,"/usr")
 	$(call KCONFIG_SET_OPT,SHARED_LIB_LOADER_PREFIX,"/lib")
+	$(call KCONFIG_DISABLE_OPT,DOSTRIP)
 	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_BINFMT_CONFIG)
 	$(UCLIBC_AARCH64_PAGE_SIZE_CONFIG)
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
