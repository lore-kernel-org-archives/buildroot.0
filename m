Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5C4E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 14:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3052641780;
	Sun,  1 Oct 2023 14:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3052641780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPmwqsetvJUZ; Sun,  1 Oct 2023 14:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38189417CB;
	Sun,  1 Oct 2023 14:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38189417CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451361BF59E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EC8240571
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC8240571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-kksitZa4k3 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 14:24:05 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F420240004
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 14:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F420240004
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-405361bb94eso161157895e9.0
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 07:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696170242; x=1696775042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pdik2uRy10II1TncR/EmSKWg9BpYR+ZqO6rJobYgRRg=;
 b=cWNd5eyAVPDiqTzA5a48vlpq5ZO6pyyJkA5EsLoKBmG4ePkDGvfQcbsRquJWQIheZS
 QEO451Gw7p37FIm2LzRJpSdE+vVXpl1NPXfE+y0V6CQNSA5YnHRRDEpqUrFurPUCYjMu
 CQDlsEhC+vvWyhDWnJZfvHPHFn04AUxN64wwhAOeijNAb+6OjjNmeAm2TXvD/jZeIYs0
 0o1rKeLb5C/4cBCH/vUm+uAjuW7hokAoxlOrNmdWKDJ2p6Mp96Zj9wvayppK0g7kTQ9X
 VbaASXnYwZYJiOb/4AAyvB+0OW38YSN481c0afXFt8d1iSJ+0zK6SI8+dXiiq7i24GC3
 LtMw==
X-Gm-Message-State: AOJu0Yxz50DxT0Ab4ZX6ck08z9Giw6XaRR2W+Yw1XcniFdx+IDfjHSyo
 yEU/Dij3oMWhuezS1b3EKMuIpOhydr4=
X-Google-Smtp-Source: AGHT+IE7YKctivx9j7pl6H4RtHaR7Mt7BEz7uo6WnpI+MqColKn71ZkGF2PzURobfTGafYaLvcfzYw==
X-Received: by 2002:a1c:f717:0:b0:402:e68f:888e with SMTP id
 v23-20020a1cf717000000b00402e68f888emr8401607wmh.4.1696170242306; 
 Sun, 01 Oct 2023 07:24:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y19-20020a1c4b13000000b00405bbfd5d16sm5350174wma.7.2023.10.01.07.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 07:24:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 16:23:56 +0200
Message-Id: <20231001142356.908755-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696170242; x=1696775042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pdik2uRy10II1TncR/EmSKWg9BpYR+ZqO6rJobYgRRg=;
 b=ZlfX7WWa3wcRieohVsl8keBrEvhxIgRrpNc7M6XyREFJj4Xc2FNCoOn2ThlSaDMQAN
 c6IGknnB/1WZUr0oiECrFzYFJJUhr5ca//Oj4HC4CJatRoNR4v1i3RGyG7qq3HFWKm3c
 S6rzOf2YWWONfs4UBvUcFTWa62Mtcf8CGtM5FfgRqdp6r9le6Ag2yBkqUr8qVVfzNJuK
 zg4766Jym2bTSDGv2JXlhJHR9myB8mQt/epF8IqjHubxRspb0kgqTx200PWFYAEJeytJ
 tQFBbyOoavNXVd60TJWpBCRR6mJbGTqBF4+kjZKwDLGEd9RKK0vMw1UHuqwMH1A0IFdf
 0b0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZlfX7WWa
Subject: [Buildroot] [PATCH 1/1] package/tar: security bump to version 1.35
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

- Fix CVE-2022-48303: GNU Tar through 1.34 has a one-byte out-of-bounds
  read that results in use of uninitialized memory for a conditional
  jump. Exploitation to change the flow of control has not been
  demonstrated. The issue occurs in from_header in list.c via a V7
  archive in which mtime has approximately 11 whitespace characters.
- Update hash of COPYING (http replaced by https)

https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tar/tar.hash | 6 +++---
 package/tar/tar.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 1914a9f3b4..108a95ee62 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-sha256  63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28  tar-1.34.tar.xz
-sha256  51337b19c71df92cd4f51c50efe4dc6ddc267d31fd54679be9e9bc2e6ce8132b  tar-1.34.cpio.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16  tar-1.35.tar.xz
+sha256  c77a38fcf25b21fd8209d20d35638744344ded239cfc7df80138bf46d3c6b16d  tar-1.35.cpio.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 690a5952ba..eea112ebc7 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.34
+TAR_VERSION = 1.35
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
