Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEC3C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 08:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD37660B9A;
	Sun, 21 May 2023 08:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD37660B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgPuAOIxRz6L; Sun, 21 May 2023 08:29:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D245560B12;
	Sun, 21 May 2023 08:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D245560B12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67A8E1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4147C821B4
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4147C821B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qL1HNmDXvKG for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 08:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F35F4821A7
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F35F4821A7
 for <buildroot@busybox.net>; Sun, 21 May 2023 08:29:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30959c0dfd6so1923199f8f.3
 for <buildroot@busybox.net>; Sun, 21 May 2023 01:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684657743; x=1687249743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vGESp/4XovIn8U1F6CNbQ6vHHT64CbfXXm8SqtD2itA=;
 b=d2EI8GxFOggVDixu6QhNSeR280VJ7IwvCxgnfKPqkvAyfh3GQ99jiYtu60sj9WFGxf
 gxGXCOj8/cSn7tNgX3cBixirFMHN8LnPQkNoejHYtFqB+83g9gw97ytN46lYzntNFFkv
 Qe10HaS+QkD2SLzrc5WpEm3mlpgCByLY4KjcIOC1zgtrNIV/Is5RqTH3d4hkZ+tygVn3
 K+uxKxRXrAtVkME6zljQiN2lfFiWm3+Xlzfl6ERAgRil9vPKMhvAN0FfrBR9VEDYKj9U
 SnFo0bnf2H/vzXDupfibMqBgB2t7cJ8GxZ8mrVpmIsd0sRQbsWeWU/jh6qjP70/d3Vze
 yMhg==
X-Gm-Message-State: AC+VfDwfCkl+xegT/HLK3UMZ4IsY5f1pGFmmWDXrQfS0anVieIFA9rXD
 DJfCT2qOKZ+VC6JwJFd2ndHPzcPnZ8A=
X-Google-Smtp-Source: ACHHUZ48daFdl1a6z3Jjj6BycvCXJK9OrkgkaoKAdNkH40JDE1N05n8MLbtHeZX8HqvXbsd7Hymi6g==
X-Received: by 2002:a5d:595a:0:b0:306:492c:cdd8 with SMTP id
 e26-20020a5d595a000000b00306492ccdd8mr4940410wri.15.1684657742517; 
 Sun, 21 May 2023 01:29:02 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:e03:bd00:5ffe:deec:ec3f:c958])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a056000110400b00307972e46fasm1863966wrw.107.2023.05.21.01.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 01:29:02 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun, 21 May 2023 10:28:58 +0200
Message-Id: <20230521082858.500-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684657743; x=1687249743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vGESp/4XovIn8U1F6CNbQ6vHHT64CbfXXm8SqtD2itA=;
 b=oG6ap1tbHyRAKByUbWLpb0sM1Nb8BMpuVUFQWECln6UXh5wEG11AN1Ri+6XqGLqJGv
 C2/xwqoYDW9u9Eai09OmRZRN4SnRF3qR2Z+6mPM0Q1VVAB5v1fSK+0yrab0d48uvJPTo
 GmqS0YEkICNiNbx3B6eWcQkm11i25mH6SECKHC9PTFeBih8X0ygoiS3+3tSZ0rhMvGN4
 o89Bf7mH3gpht/gfr5i8IlNkphgqVvatdeOI0nFy1AOUDFfrhmdckNX89OkUy9dmactH
 FhcisKbS5f2l2ZLYUuO4FbNA5Zc6JhRjcW1NxEg/+8gYsBzo4vvWcySVmL7r+bXGD85a
 MZhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oG6ap1tb
Subject: [Buildroot] [PATCH 1/1] package/pixiewps: bump to version 1.4.2
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/pixiewps/pixiewps.hash | 2 +-
 package/pixiewps/pixiewps.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pixiewps/pixiewps.hash b/package/pixiewps/pixiewps.hash
index 99a09741a3..c3c213906c 100644
--- a/package/pixiewps/pixiewps.hash
+++ b/package/pixiewps/pixiewps.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d3d3cf57851e3e734fb1797aa078239ef161d1cbeffc4438497d58a425ef22a2  pixiewps-9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59.tar.gz
+sha256  c73ffd58c461a88504cca36e5a29981dc68b78f8fdd31d7c546bc204fad7c435  pixiewps-1.4.2.tar.gz
 sha256  ccb349b4132ed7737f25e5adebfe61f3d52dca33708df1e50352320438d1d4c2  LICENSE.md
diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
index 1f84bbeb34..a6fb2527d9 100644
--- a/package/pixiewps/pixiewps.mk
+++ b/package/pixiewps/pixiewps.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PIXIEWPS_VERSION = 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59
-PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
+PIXIEWPS_VERSION = 1.4.2
+PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,v$(PIXIEWPS_VERSION))
 PIXIEWPS_LICENSE = GPL-3.0+
 PIXIEWPS_LICENSE_FILES = LICENSE.md
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
