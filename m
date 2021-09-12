Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54718C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:11:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09C261051
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E09C261051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A13D541585;
	Sun, 12 Sep 2021 09:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k19ZF8pTmpgt; Sun, 12 Sep 2021 09:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB544062C;
	Sun, 12 Sep 2021 09:11:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE8271BF47E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC47B40237
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WI9teBGEnl4U for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 09:11:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD4D2400AF
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 09:11:46 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y132so4370526wmc.1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEvIWurOu34mrMHbDZcx3cuQBXIvJyRTGUnTlMO3lns=;
 b=UQtOu505X2cD2G05yyG5g8HE9opzmgJJ8plCdHolpin1dt6P5kMnaQE32hD0JM1WtG
 O0h/WUFdfuniLAFBYE4ZiT8aMMlS6+X3bZ5S//J2/s7wdMawEF27/Coq9MtmfsNgffrP
 qeIj67uMZ0CVuLmi5/v/N86MoJkB5AjkCibHF/HwVSXp7EYQ5BMylJJIul0KWKdvslKh
 7sQnhtjAvFjfK2OxkX+K2zgi5+NBN4GY/I1TkRq9GTFjlqMe2T9OsCjOHXv20lQB1C9k
 OfqBvGw7To7XradHeT/tIw5VyxPfq6eqPCdG5uQZ1YjV59P1EICQpDu1Xw+dLsOwDTU2
 l6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEvIWurOu34mrMHbDZcx3cuQBXIvJyRTGUnTlMO3lns=;
 b=Va+vYsIHaa2PFHc5QmkME17MtEVEvdq+umI1XyyD2XEcGLuZYmhPUJUODCHDBgAOhf
 LJkaFh3EiRhHXDvErAGyVX3cXcHEk7SdL/aBq12XTDoWvqyHweYymAINbS1t/HYMi15O
 voDr53j6F4UDiYtUUyehEK6kjlSDlkIZFpuNggQYre+vi/dgN6n2HzWqvSOooX4EWKLM
 1caMHqTIX6FxnwbeTkwMgmpeTfrbCcN1NJLcn8zudZ9f/OKZL2VuiUKp9GOAJEhjPSaN
 T64mZiysfQJYYlwn4IXdifIL/hEMZmOaqDtjjKshPm27yOc16Z/R4icfO0IPMEiw0YO3
 9A4w==
X-Gm-Message-State: AOAM532gwRiq/R4c5jXh/w0TTjvGFeZiiS24cSZyL1WWRDVNfQ3H9zv6
 NWIOWZ9HH7rzUYUkTg5Kyw/lWjIM86g=
X-Google-Smtp-Source: ABdhPJzdpqfKNIyHiVHkjrmgiclryLlUebOJIbWcjGMFEqs4FdGGBFpGH7JtVo+uIiTiMyxzCNwFFw==
X-Received: by 2002:a05:600c:8a9:: with SMTP id
 l41mr5905568wmp.29.1631437904450; 
 Sun, 12 Sep 2021 02:11:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id r129sm3584490wmr.7.2021.09.12.02.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 02:11:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 11:11:36 +0200
Message-Id: <20210912091136.1048360-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: disable raw with kernel
 >= 5.14
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

raw has been dropped from kernel since version 5.14 and
https://github.com/torvalds/linux/commit/603e4922f1c81fc2ed3a87b4f91a8d3aafc7e093
resulting in the following build failure:

configure: error: raw selected, but required raw.h header file not available

https://github.com/karelzak/util-linux/issues/1442

Fixes:
 - http://autobuild.buildroot.org/results/d009d663a7c3c75872b19a92d3eadd3ecee2df63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/util-linux/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 1f33eb5514..f045361ab5 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -291,9 +291,13 @@ config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 
 config BR2_PACKAGE_UTIL_LINUX_RAW
 	bool "raw"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	help
 	  Build a linux raw character device
 
+comment "raw needs a toolchain w/ headers < 5.14"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+
 config BR2_PACKAGE_UTIL_LINUX_RENAME
 	bool "rename"
 	help
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
