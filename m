Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAC9CEBF61
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 11:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993A360DBD;
	Mon, 17 Nov 2025 11:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdTdoyZpTVYu; Mon, 17 Nov 2025 11:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E8D360DBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E8D360DBB;
	Mon, 17 Nov 2025 11:01:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C22661A9
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 11:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4C3A4050C
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 11:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO6LYkQAvUPw for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 11:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B787A404B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B787A404B5
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B787A404B5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 11:01:23 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-640b4a52950so5927124a12.1
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 03:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763377281; x=1763982081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=myRZZd9iu8JDi7ZQYMG6wJfRTqfH1PIC23yiMSLvFwQ=;
 b=DlwoA1iwKF2zmt6bGnN4EalVSpa3/CC4r56xAmWdK9kuS/HPEw7fGBnKwYfMPP51UU
 NvTsTtIWOSgNOOuMJ85L84s/38Wbf71zFsFOHxH36jhiaPMeHiPDqGM+sZ5X0DfsUNUK
 MFLbcmGGp5dyjjN5nqLHDMEfQUTog05CTv3JQ2oq0G+I+OX7xb7eaeAUEXuRhjmVIjPS
 heNzsHRU0qGpO70MKtaJ64mXHU5SraPnS1fOQHyEXHCc0PnpcXHByZCXmI7RYlfN0++6
 KrDB5gee5nsET+3/9YEMl4UcAY3EReOiMpSYjGEEJU3N7y2k8fU6jIrsWq8ed9feyCBU
 g2Kg==
X-Gm-Message-State: AOJu0Yyv9TYZSvc4DM7npZNkj9mhYYeo2K4X58M2eEVH1+c/Ia0aE1If
 f/G/4gM/dmDhlGcgO7ysacWg6PsHkvj1ESeL7ccj0NCpuK+4qylgrn2U6Se6
X-Gm-Gg: ASbGncuXgmt684/Cc6XiyjOfDZhCivWCGySOeonW/qFF6lgKz0FQIpphF+DPZ47mjIY
 b3QGJEYRGAWwrZEGo9qsCqHU0iAa+GwMD7K0FbjXYQhqKWjThfMPEVzLLWzgN/Fzzvldqd+JEn6
 X9VS8KTEoZpR4n+fZMMY4eCo0aoemTLNmr0ontxPYJM1kahpagwX/wn9UPOXsVmWycc3oxgxwxH
 p7k0q42ItLBfbfxcSp9sQ0xFbgpCaDKaCnZi1bYF/Og+ZeqUkeAXXyWRsFu0ZM3LJQtQyBlPXT7
 lm9etfeSdbllgdInMLKheEBbsYGC28Xu+hrVuaHmRgJ88sc4NDs4+WjqkNp3xtn+ygBrVF/QwM3
 OTLPjNRF0o504hUURXejvuMdpDhcYcWRl1Y+1CrjGZAb8ljHI9V3lCEsw2P8fSSV+X6MDnCZjQa
 dj2T6hDXKGqZWb8GpMfecsEVIqpRPPqEoN9LHj
X-Google-Smtp-Source: AGHT+IGqshUFleL0c7irm7Hda0MrHC8hbZaGVad+FUxj7Sd2lOVTtbx+gqCSd12yeUTwvxnLVyZnUA==
X-Received: by 2002:a05:6402:5188:b0:640:eb29:fc7e with SMTP id
 4fb4d7f45d1cf-64350e89d2bmr11642481a12.20.1763377281075; 
 Mon, 17 Nov 2025 03:01:21 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a49806csm9958263a12.18.2025.11.17.03.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:01:19 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon, 17 Nov 2025 12:01:06 +0100
Message-ID: <20251117110117.40028-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763377281; x=1763982081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=myRZZd9iu8JDi7ZQYMG6wJfRTqfH1PIC23yiMSLvFwQ=;
 b=Mk8EMj+DNbUEOAX6GtulAuEDERF+zRRWc3cIcXlASApLgyT8gxuiHPTKbd/xFFHJnP
 zhak+m52WSXVR4EKP1/NYwYKpKIPPfUNF3D+gZlG9gPE9XqhrbR1EzTnFLG0VeVgpyd5
 OxQC9pPOynVaghFECWW1m94SpxMx7Y7nmvAAVVmmeZQc7sQWptutL7rvZaIA+6hgK6Vd
 qlWfSnjzegY/idC4BMz2L4m8cY+bYJTAP5f7vBO5dbil2Q738qb8cYGygH2vkeqBAuaR
 uZjb29GgJTD0W7DGg75EK5UlTkAxDFUzC/2n1W2iqt5OJDfBlznjwuGmMr2myyOTCpsF
 +2uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mk8EMj+D
Subject: [Buildroot] [v1, 1/1] package/broot: bump version to 1.53.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/Canop/broot/blob/main/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 09dd907bf5..e01762f275 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  2f9fc93d3e3b547108d66ac0baafb8f60a9506fc189b509821ab301d9ea75a19  broot-1.52.0-cargo4.tar.gz
+sha256  a006e15ec340d05451459f6e95a52789b6f55c93617129ca9178d00d43437cef  broot-1.53.0-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 9b60d35857..a5c5ba2271 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.52.0
+BROOT_VERSION = 1.53.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.51.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
