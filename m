Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16738C71153
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 18:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9027940A66;
	Mon, 28 Aug 2023 18:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9027940A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIt6bChO2pkO; Mon, 28 Aug 2023 18:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD4C940A5B;
	Mon, 28 Aug 2023 18:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD4C940A5B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB551BF5A8
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 18:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 664218130C
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 18:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 664218130C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JO5QsKMuuS8j for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 18:43:42 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81968812D8
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 18:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81968812D8
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c0db66af1bso16753845ad.2
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 11:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693248221; x=1693853021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fdXUR2/5qlC71WRy67VyHF0NvNpOdmezTRMVaahE70A=;
 b=aNNrx4sjKxOsc49JJohbHL2/9YxKKi8Q+AhTVcRCvlHOsf8x4C83cxqhXRLGloaRXg
 o7ava1fVuHjzFw3s/xvi5oYRGtuEapu/DPBpi32cdN0uk0OUATmBUnqQB/L0dF5hDgX2
 AkpHaahP8jXX4WMhtkHo5rWKduKQFg1/fjWw14qqU2SnxArcNmI0NfrOswX95ET1K+B4
 WjRLqhqbdWInkDFYme1uWzq/pwIY6IlsXXA+9vo5LuZ7+6iMLOfWO+sHherFcSP0NTY7
 TilWGinOHb3giHH3x11dcCCdBBTuz1ORWXkFv53yRMuLSZ4YFl4wgR9BJi6OaYRhYT+H
 93+g==
X-Gm-Message-State: AOJu0YxaEhdM8P4W1oWsXmDXrAC6emn8CW1OQOqAEj5fLu0LGkELNHG8
 WgjEWdZIW8hqcRzcaf1mu3+OHjfMrvE=
X-Google-Smtp-Source: AGHT+IFsBPmYn2Z/ZcVf74WFC/Ld1bv1gUmgJigabgGfFB275gHgCN38T2+zNc0sFJEs22JQOeZOqw==
X-Received: by 2002:a17:902:c70a:b0:1b8:a569:f980 with SMTP id
 p10-20020a170902c70a00b001b8a569f980mr19285564plp.65.1693248221367; 
 Mon, 28 Aug 2023 11:43:41 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a170902e99500b001bdeb6bdfbasm7765091plb.241.2023.08.28.11.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 11:43:40 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 12:43:35 -0600
Message-ID: <20230828184335.938826-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693248221; x=1693853021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fdXUR2/5qlC71WRy67VyHF0NvNpOdmezTRMVaahE70A=;
 b=qmEFOwD5mSMOPIgy2duvvyQZYVTOPUDzXepgITJsWE1et3z5dBjeXNi9l1Q18Swaot
 w7SjwJyVtvnHYgUv+2E281b/UKQQbnfew1HtSDk10Cvb110ZdA39rnfT4gSRnLjnL99o
 ge/7NrKfVP5h1YtsuhBDPxOJI+o/u5NZ4VpQICqqAZ/WZOqJxTPy06w2jQsosP2Fhyie
 Jt2R48dZTrk/TuGd6JIWWlmbAIEtxNn/w5CW9/UEk34ZYbNvx5QQ/SF5XZLuhmJuryNx
 0/bMKRSVWUn/05zWe7l0zKYFp9r1bBWcw7ibzBn1kcysf5MJnickWvctkoMOYYG8u5BE
 E3MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qmEFOwD5
Subject: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: security bump
 versions to 11.0.19+7 and 17.0.7+7
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
Cc: Tudor Holton <buildroot@tudorholton.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

* CVEs
  - CVE-2023-21930
  - CVE-2023-21937
  - CVE-2023-21938
  - CVE-2023-21939
  - CVE-2023-21954
  - CVE-2023-21967
  - CVE-2023-21968
* Security fixes
  - JDK-8287404: Improve ping times
  - JDK-8288436: Improve Xalan supports
  - JDK-8294474: Better AES support
  - JDK-8295304: Runtime support improvements
  - JDK-8296676, JDK-8296622: Improve String platform support
  - JDK-8296684: Improve String platform support
  - JDK-8296692: Improve String platform support
  - JDK-8296832: Improve Swing platform support
  - JDK-8297371: Improve UTF8 representation redux
  - JDK-8298191: Enhance object reclamation process
  - JDK-8298310: Enhance TLS session negotiation
  - JDK-8298667: Improved path handling
  - JDK-8299129: Enhance NameService lookups

For details, see the announcements:
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021900.html
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021899.html

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch       | 0
 package/openjdk/openjdk.hash                                  | 4 ++--
 package/openjdk/openjdk.mk                                    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename package/openjdk/{17.0.7+7 => 17.0.8+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)

diff --git a/package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 3b36289628..ba398b84be 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  43b80a5aec5fce908e80858e9b34efdf1b49255a12ce303650325af65141d3e8  openjdk-17.0.7+7.tar.gz
-sha256  25fd9ab3042a284aa4e6348969403016404bc2706a4a02c149a0054fbe477337  openjdk-11.0.19+7.tar.gz
+sha256  643ff42dcdf8751e0fee716c1a1914ddc7348b174e871a5eb2636578a181f20d  openjdk-17.0.8+7.tar.gz
+sha256  b2a37ef209ae7eaf8f34182b7c9aa3252af20a214d02970f96ce62242c805479  openjdk-11.0.20+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 39d461a87c..d1a2fa23ee 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.7+7
+OPENJDK_VERSION_MINOR = 0.8+7
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.19+7
+OPENJDK_VERSION_MINOR = 0.20+8
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
