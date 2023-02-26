Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EBBC64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 12:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D64C360C0C;
	Sun, 26 Feb 2023 12:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D64C360C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzcTWsnQT5Qo; Sun, 26 Feb 2023 12:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10FF160BE4;
	Sun, 26 Feb 2023 12:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10FF160BE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A36F1BF3A7
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 12:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F40654021C
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 12:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F40654021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aH0yVtM8j971 for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 12:06:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A6A640214
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A6A640214
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 12:06:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bw19so3471911wrb.13
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 04:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Srook1HjwCQZr6kwDMxLLQcS4TPBF9h+X/kTembaSQ=;
 b=D065BJYvfqILMPVBa3ip0JspfFXYe476NpBFAy3h+aXumXgx7kIPNpn54kliY9z3Zx
 1taupAKTj82RIHKM2Y424HTEVGlgQd2dw5ZJrL8dJyX8Xd2LbLBkYjEE0zYegEF5I4J6
 lTL4Cjlog3dCrLh377RUKxUZvSeUq6m7LFj2fHsCYB7rxvLOpkb2nKSAedTMvvwuy8yo
 sB3FMkoOMEVpOTfO5XfFuANR0dfA9aMxCJXArlcviR5sctXfm6xduvBzYClePRBTSaX6
 gtNVLaJ2Ev67N1mVoswlURIL6kGtrJw3hF5dsht2AUE0slodLqJ4/T9bWi5pve90+Wey
 8CPg==
X-Gm-Message-State: AO0yUKVlKHly3QHyOjlEG4nnl8WnycmVJuvRn+bmWFtWUNNGsUo0GZxc
 pAtOLuzfQ6cdKIx0didq9Gb0yFnSDUY=
X-Google-Smtp-Source: AK7set8M6Pv3m0OP35Yy9FhdujIzuf3m7y++LY+ft7i6NyhXzRjGGVGGEUX86xX+24nHsV/XUKzP9w==
X-Received: by 2002:adf:fc12:0:b0:2c3:e20b:82aa with SMTP id
 i18-20020adffc12000000b002c3e20b82aamr19488219wrr.22.1677413205802; 
 Sun, 26 Feb 2023 04:06:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay26-20020a05600c1e1a00b003e21f20b646sm5793418wmb.21.2023.02.26.04.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 04:06:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 13:06:36 +0100
Message-Id: <20230226120636.39100-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Srook1HjwCQZr6kwDMxLLQcS4TPBF9h+X/kTembaSQ=;
 b=kpVWzpsXynvuV/y8LayU+KV0CFjPlmtnEn/zWWzCfuXnjjZ7femXIibLKSJvD79HQr
 2I4wm0te9K24WJtupA2jHYjLZcb3hkgHR6SPkvm28dLXDo67LpKMNhhTs3Y/Hdvh1uID
 fSyA7nu0Pr0RTIYJppqpcJUnUh9sgIvmKMzW8iAcXmqtT7rcir1Md+Df9q2sbxrRBOm5
 wpUgJ6czqx3PMZbGgxGo9ErNf8VKUlVqwbEielDhVW6mFaEycG6Vs771rQxhbkfF7V3l
 G46qJt7Wb/3FKBg4BQbxP8Y5hGtELHteEdZQNnZ3e99aqoTRw0EKd82JrzjmQiTyvDwX
 TR7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kpVWzpsX
Subject: [Buildroot] [PATCH 1/1] package/pcm-tools: needs NPTL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pcm-tools needs NPTL since its addition in commit
60eb2cec80e5258a0c43090f539749606744e182:

cpucounters.cpp: In constructor 'pcm::TemporalThreadAffinity::TemporalThreadAffinity(pcm::uint32, bool)':
cpucounters.cpp:252:9: error: 'pthread_getaffinity_np' was not declared in this scope; did you mean 'sched_getaffinity'?
  252 |         pthread_getaffinity_np(pthread_self(), set_size, old_affinity);
      |         ^~~~~~~~~~~~~~~~~~~~~~
      |         sched_getaffinity

Fixes:
 - http://autobuild.buildroot.org/results/8bbf9c36af332bbf5e7c1abcbb594a0b231ef97e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcm-tools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pcm-tools/Config.in b/package/pcm-tools/Config.in
index ca9719dc5f..6bf05f32d7 100644
--- a/package/pcm-tools/Config.in
+++ b/package/pcm-tools/Config.in
@@ -1,11 +1,13 @@
-comment "pcm-tools needs a toolchain w/ C++"
+comment "pcm-tools needs a toolchain w/ C++, NPTL"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_PCM_TOOLS
 	bool "pcm-tools"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_HWDATA_PCI_IDS
 	help
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
