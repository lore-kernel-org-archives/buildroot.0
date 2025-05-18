Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E551C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 09:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEAA8409AD;
	Sun, 18 May 2025 09:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGqi6kaYwxDG; Sun, 18 May 2025 09:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E82034089A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E82034089A;
	Sun, 18 May 2025 09:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 656C2DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AC7F4089A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNQ9Wgxybtz1 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 09:13:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8126B40752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8126B40752
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8126B40752
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:13:04 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-23035b3edf1so28053345ad.3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 02:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747559583; x=1748164383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRnxlHdAAbDFlNF8kKCGzr6F+VmvNNGzEM5AdW/Ey8o=;
 b=QLv6E8BZcmA22KlwkObPdLelN1fzhCmMhapzn+mn45nhllqGaj7KmPXd4JffKeiOQs
 zsFt6KFYg0RlGgp/NHbU9WaKOZ1QJrKY/NmQA7ofTimJUgBbOviocdQVfyUvGLmNJ/jm
 o1DqIHtPpcr0zsKwk/CQZE/bCQ5os/LR4/TwhI+l+DtGwUEwwgauN4pNZ5sWejoMWjoP
 ttAZ4+lQDeMbz4tWLLbEvxh7dLkyFzodcgQpc59wFNf2R/f2ILKxVgUuwbGOSatLB6Vj
 HC4F+u+TyaNffkibFhVaV03LbfaLqiXtwwnuBHz4kNu/AnvkhLcdIOWU7PI4vIQH6kpy
 q/Qg==
X-Gm-Message-State: AOJu0YwX4Ag7N/3DkWpJqZ+TvMXmn2FnK5MbvzkJwzmV7q+cr/rAFWwq
 xfeUT/a2uJm2y4QqIBoeQ3QWf/ONFENfvlK1bkTe/MIHBpQ9G01GBfcO8CdEfuto
X-Gm-Gg: ASbGncuCcVRW/n+wiPqlsrxRFpHtNsAeJ3UZGAhZQnYRj5Z+I4DjpYporia80oGaFNg
 ZzA/NTTdTM3W49GuacmRXV6vDUlekhb/G6SfibMUCsaHJ0fFW0T98yHnZ40oCEpQ+CBq/61Q4Vo
 pwa481Un3qPvYJOLllZB0VAh5sS672Pi32HTnCFcfvBwDFgymSFJPfxHp6sYwEGy6YTKRX2WP98
 XWDh1Mn6otK85pKUEweVglfmzg+Agz80smxRq6RBaIjvmbLd2HJBMvi6Gll8HtqOT70EWlK+nna
 bBU5G7agtJXuJOzCrVhXGUxnL1a1nWP3NS6fqEq/lNuWb8fqbgeoKI5PQweyHTha8MtKUyV3M0G
 LJDlWkINHaKZGupYCfmibqDbIne90t8tNF3kFb87hvs3jzGMO
X-Google-Smtp-Source: AGHT+IHBTkpoLQnU5gJniPrFHY5k+k97EQpw5630RekuDJzm2/fUKq8Qvz3xyvEMxiqw+vlHB3nGkA==
X-Received: by 2002:a17:902:ea0f:b0:22e:72fe:5f9c with SMTP id
 d9443c01a7336-231d454daabmr122439155ad.42.1747559582924; 
 Sun, 18 May 2025 02:13:02 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e970cbsm40822615ad.136.2025.05.18.02.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:13:02 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Sun, 18 May 2025 02:12:59 -0700
Message-Id: <20250518091259.58493-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747559583; x=1748164383; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pRnxlHdAAbDFlNF8kKCGzr6F+VmvNNGzEM5AdW/Ey8o=;
 b=DRk6wAQE54JM55eX+fSXeL1zkb0BGbcNCw+ihMplCAkj5HVqZRzKg+mF8tA3kjrMwF
 NG8Gn5lmSPKHXxHACkuvd0J+Q+FhMKy28d8G57sz3Bbm/eWyD6NV0+ysLqkese/zWMnt
 oa8M+2uGgGhxYWvMpFqz5jh3pSrEbcOvPgJhK0Z5jtaOLrBtdOTw64Na0rbJbu9XPCJQ
 z6WUJbTXAIyLtwZiu4T8NR88doy/pFbE3EBvVkSdobINKtpPtmswUD8n7wjHBLMTTC7U
 Il61+pYkrrom0tSVfeYsBSXCb0kggbR56EvhAeBpWEZk0x6gUnYdq/YELwyxDCR3tV8S
 X9lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DRk6wAQE
Subject: [Buildroot] [PATCH 1/1] package/gzip: bump to version 1.14
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

Release notes:
https://git.savannah.gnu.org/cgit/gzip.git/tree/NEWS?id=fbc4883eb9c304a04623ac506dd5cf5450d055f1
https://lists.gnu.org/r/bug-gzip/2025-04/msg00022.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/gzip/gzip.hash | 4 ++--
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 4d9d0c721b..90c9be4e6e 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.13.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.14.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057  gzip-1.13.tar.xz
+sha256  01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6  gzip-1.14.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 330321352c..e79de4c99e 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.13
+GZIP_VERSION = 1.14
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
