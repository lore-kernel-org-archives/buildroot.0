Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F4EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:01:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1057061078
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1057061078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF84D83313;
	Wed,  8 Sep 2021 20:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1IstFazhx3n; Wed,  8 Sep 2021 20:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 083B0830FB;
	Wed,  8 Sep 2021 20:01:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1104D1BF397
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00B0883312
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amJedJHZzf17 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 20:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4871830FB
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 20:01:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso2509321wmb.2
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 13:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bjbVAbnHXACWpd/NubB5mQ94P3jXc/RGwKBpxPe8Bhk=;
 b=HMB0Hz9xd+bT/7Lqa+IEIij19Gi0U8aM6dFsmJA4FV27gygAmp1xCz1s8tY9WSA3Jk
 gGgfiIPVMH/9MO6YUWLImKulKAhgudXi3CQyIYlJD1ayT30VMm3QBCJddwKwuhdzGI1Y
 S2b+Tt3lNryAV/9iI1T43Uy1GA0tUOSURM8XsQjAOH5gCe51nGAmrgdsRWYsmnt8jgaH
 vP0QWg6dy+paXXrznaigdGgqSM7Ob13aLrr8IvNICXr2gxrMP9FgBhZuV1hxtK16BvR9
 4kiJBB9TQBNQnI45bvyuh6vtTIG6jpOM04JgzpnJY5VKkcwPaW7TTl6kZuGM4/0sK+Lg
 bo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bjbVAbnHXACWpd/NubB5mQ94P3jXc/RGwKBpxPe8Bhk=;
 b=0kQuvFfSji1hVk0WqNRtQvREciKnv9V9vCGJt/rScDU0WDV05QwuWnAO0KZ7FZQsGK
 wly37IGchn+ZtHbqZEBXGu7AEidu7FFVt/Vt1d+X7G4BaHF3GVIiuuZZFuwbUMKU5bhV
 99jFeK6u2MXQtwKosT52Aen81ISfHJCA0fWmpMgKW05pj/BobxNLOH2jghRmTwbfuUTB
 SL/UeH8IWNv7hiYBQ8E5vMZ1Byk/8vHW1HBh263zzqp25RpeznMHEY6lvljlHCaYKh0v
 aODKfttpXhBSkSyfjgEnbMnH6qQYva0zvdTPZ/aau0W+5bxw+85ohnIpygffsDmvRein
 F3VQ==
X-Gm-Message-State: AOAM5313F0IFeZrDaKXZTnYY/lfuNpjVK6uzKdZrJTpnTRPh3aJlh2oN
 4jeQp0qbusQNX61LKIeYZAYnq4Penkc=
X-Google-Smtp-Source: ABdhPJwOCcv2tkElPYa62OLk7JoWx6MblRpx05yNMCfvKB7o8R7192/KhdRp5tmeMm6Ga53YpG/xmA==
X-Received: by 2002:a05:600c:3b26:: with SMTP id
 m38mr36671wms.155.1631131279790; 
 Wed, 08 Sep 2021 13:01:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id a12sm3059923wmm.42.2021.09.08.13.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 13:01:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 22:00:58 +0200
Message-Id: <20210908200058.593544-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tinycbor: bump to version 0.5.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/intel/tinycbor/releases/tag/v0.5.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...able-build-for-different-c-libraries.patch | 39 -------------------
 package/tinycbor/tinycbor.hash                |  4 +-
 package/tinycbor/tinycbor.mk                  |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/tinycbor/0001-Enable-build-for-different-c-libraries.patch

diff --git a/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch b/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
deleted file mode 100644
index 40f9288604..0000000000
--- a/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 085ca40781f7c39febe6d14fb7e5cba342e1804b Mon Sep 17 00:00:00 2001
-From: Ricardo Crudo <ricardo.crudo@gmail.com>
-Date: Sat, 30 May 2020 22:03:01 +0200
-Subject: [PATCH] Enable build for different c libraries
-
-The open_memstream.c was using GLIBC macro definition to test if the
-library is building on a Linux box. This makes impossible to build
-tinycbor against other C libraries, as musl for example.
-
-Signed-off-by: Ricardo Crudo <ricardo.crudo@gmail.com>
-[Retrieved from:
-https://github.com/intel/tinycbor/commit/085ca40781f7c39febe6d14fb7e5cba342e1804b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/open_memstream.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/open_memstream.c b/src/open_memstream.c
-index 18f3de8..3365378 100644
---- a/src/open_memstream.c
-+++ b/src/open_memstream.c
-@@ -38,7 +38,7 @@
- #ifdef __APPLE__
- typedef int RetType;
- typedef int LenType;
--#elif __GLIBC__
-+#elif __linux__
- typedef ssize_t RetType;
- typedef size_t LenType;
- #else
-@@ -101,7 +101,7 @@ FILE *open_memstream(char **bufptr, size_t *lenptr)
- 
- #ifdef __APPLE__
-     return funopen(b, NULL, write_to_buffer, NULL, close_buffer);
--#elif __GLIBC__
-+#elif __linux__
-     static const cookie_io_functions_t vtable = {
-         NULL,
-         write_to_buffer,
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 8ff706bb67..29f0cfabf0 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	956eb4b670ea4969eaee67395b5bb6437b153960385b77357d6692e979d1b12d	tinycbor-0.5.3.tar.gz
-sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
+sha256  e63668a71fd6d7abf1727dc31682ec7f107599a3c024a445c3e5da6af9328983  tinycbor-0.5.4.tar.gz
+sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index ef095ea67d..476da67363 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = 0.5.3
+TINYCBOR_VERSION = 0.5.4
 TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
