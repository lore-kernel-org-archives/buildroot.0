Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45110C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B2F61040
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3B2F61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA57E4046B;
	Sun,  1 Aug 2021 22:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BkLq6_qVWr46; Sun,  1 Aug 2021 22:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23FD740447;
	Sun,  1 Aug 2021 22:11:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FA3C1BF855
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BD3B40447
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_9e2o7fqymq for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 22:11:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B12B24031F
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 22:11:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so9847045wmq.2
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 15:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IWYb+X9zirKCtZki/PDO9+P/H/lHZqg6Wwt3gmOlYDw=;
 b=pf7N4kH+n/IxnYYCTnhDsYt38iqs9rXvlInIwfA6EjXJ17A7xnWlIV1s+7XiTq9TTx
 JSZm5Ubp41U6akoX5r5HwS6BqjzsuID4BugGw7qiikNfNQfafOg/JU4vUBxXWamcU54W
 WPxl4OGNvvFqwb1KmJgM51BOuw5y6w984rcUEBzRtwb08j0dh5kd0Dzdg4nRmXW8grpa
 VXdkBYI7L10IVcmBzCE6zVJjYeLHGZetQXuJI5uqjVrjuST2BA6RxvwLoMNOERB4V9Et
 fj6xo99AwnHms1v/JBC/Qc0Ta3N2yLRaJrptrNDiMeUm6ut2BvVUHKlpSYYjQ92eXD4E
 Uf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IWYb+X9zirKCtZki/PDO9+P/H/lHZqg6Wwt3gmOlYDw=;
 b=ud+3mathDqfXQjdxma8LVuzrGnkx6NZFUgtdmfzY2EZ/1F9l/syE/KXHS7yD4Pwmuw
 cI9q8z+xiHK0BB/o9RPzXX+PEvEbqTrA+IF73FWZjyLz5717zHeNUw1sukTj6sjABqQy
 MZMZqIk5w77ZJeSRD9xKcjfgJ9zfBCztNBazauwlmfxGFqP4h6SHNbFrZ2rp5aeGGA3I
 6aSyeKGjqc5GtE+I7SJ+xcgJet64SFlc09fPrEd8agd534wIvoMbWVXnqklzQX5gjnwN
 MjnuoFTxjShKjNKiwXCWXuns4xXugsmTmWyLCpAa3Veu6IfHPTEJ33UYtXVgV4un5GYb
 rmhw==
X-Gm-Message-State: AOAM531CP66S3z/HLvzYeufZsqgXhkLOqsuFrFub+4x2DT/U9eyk91so
 1sU+RRCddnBQucPlV22gX4XRLau8VMiqeA==
X-Google-Smtp-Source: ABdhPJweT60e0f8XzOXdSNoRcRWlAgYhHNar0o5a/M3po8tcdf8ov2SWObTvFC1NLCPvgoHbgAYy/w==
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr14020515wml.42.1627855886732; 
 Sun, 01 Aug 2021 15:11:26 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id g11sm2235770wrd.97.2021.08.01.15.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 15:11:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 00:11:18 +0200
Message-Id: <20210801221118.1010991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/msgpack: bump to version 3.3.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

https://github.com/msgpack/msgpack-c/releases/tag/cpp-3.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/msgpack/msgpack.hash | 2 +-
 package/msgpack/msgpack.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
index 3829a70222..5d432ba0ec 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  464f46744a6be778626d11452c4db3c2d09461080c6db42e358e21af19d542f6  msgpack-3.2.1.tar.gz
+sha256  6e114d12a5ddb8cb11f669f83f32246e484a8addd0ce93f274996f1941c1f07b  msgpack-3.3.0.tar.gz
 sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 81670deddc..996b5a2f7c 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 3.2.1
-MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
+MSGPACK_VERSION = 3.3.0
+MSGPACK_SITE = https://github.com/msgpack/msgpack-c/releases/download/cpp-$(MSGPACK_VERSION)
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
