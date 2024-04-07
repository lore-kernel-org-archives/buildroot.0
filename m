Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6C9CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76BD240715;
	Sun,  7 Apr 2024 15:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pJis0JiX8un; Sun,  7 Apr 2024 15:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EAFD4073B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EAFD4073B;
	Sun,  7 Apr 2024 15:34:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 499A61BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4271E4073B
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alUKJ73wsnuZ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05AB240715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05AB240715
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05AB240715
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:34:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343f62d8124so1476657f8f.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 08:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712504064; x=1713108864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2XIrZNOOh08t4RkGCXeybJ8uHFjEDhChhM8U6SJEIY8=;
 b=bwxIbVj7TwSza+CG3qoascuQYqGE6iQJg0HDmqQujK37LhP1E8Z0yOKpX1NUvx6/Bc
 ClvGLxKY+IpIM+QvlqnV3P/OwpSdd4vCZ0eNXo3UOQB6I2a8MNj7fWc488Z7GrCXxnUx
 qSa17r/l/Tn2Ha3eBFCQgdGCRH2tBqZfr+YfWvpPFe4e2SYEh9w5mjbk+ZFi7WTazd6M
 Oxj+PfPG5Zg4rplLvuCxs5iAyRyhHj9ofU70Pa/uKPvZBFsJWy8MTb8DlFtJCIxqPX1n
 Dtlye0P4mc+0kod0BbcFgwgLZBPiQyH3/2uQ/9faSbtNb5L5QDTWZ/BlUuN9wUE4Grq5
 a7qg==
X-Gm-Message-State: AOJu0YyC5/8+90+qXFKmnhoORP8w9deCeKsE59pd2+Wdd+3F9L6fvczt
 OC8moI8TXDR1iLxOK2Xx04QEiyy/IfM2sYaA1jNCjktKC7E5xCnge4zy3UsC
X-Google-Smtp-Source: AGHT+IGKIeGpNXm9+lJMcXQHpEFdVl3qfBZkvujVTvgYdYDBBwO6uppzsfTwvivMi7obxN8Je98eFg==
X-Received: by 2002:a5d:64cf:0:b0:343:60c1:eeb4 with SMTP id
 f15-20020a5d64cf000000b0034360c1eeb4mr5613403wri.1.1712504063569; 
 Sun, 07 Apr 2024 08:34:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p9-20020adff209000000b003432d61d6b7sm6854508wro.51.2024.04.07.08.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 08:34:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 17:34:17 +0200
Message-ID: <20240407153417.2030051-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712504064; x=1713108864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2XIrZNOOh08t4RkGCXeybJ8uHFjEDhChhM8U6SJEIY8=;
 b=jxP6m3P1Lv8n0TgBqTvbAL4/bUmLpA7D9ETXAfV8Yny+XYbQQ/V206zWbHw9ht36Kd
 9wA/4svrBHzmXqzcta7O6Tll4XZb6leXaydPeWKm4+o9jyaze25eWPOW19J6loVPpASr
 5w8iC5HZVcXaadZKSCIil1j9+XWvd25dpxJmQpcdrU8FfuUPNEgNJnIaI/y86TfLZfbK
 +JUUoX0onqb1RLp84RoPBGvR/cSvv87vNatj5Oq8yA9do9quiFhiu+bhNKeN2l8odF52
 RzlQD3pkREA3+EGDD2hMUF4PETFvuoSudd0PQ+MkUs+sOi8p1SKolSWDWSpYBsdduWyU
 RDhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jxP6m3P1
Subject: [Buildroot] [PATCH 1/1] package/openblas: fix build
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 0.3.27 in
commit 59b48b5cff057f2429b1143d6f50c39d93ca8ef3:

/bin/sh: ./xccblat3_3m: No such file or directory

Fixes: 59b48b5cff057f2429b1143d6f50c39d93ca8ef3
 - http://autobuild.buildroot.org/results/52acc2d95bbc07155b9d446ab8625f9c9eb81b52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-should-not-be-run-in-cross-compiles.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch

diff --git a/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch b/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
new file mode 100644
index 0000000000..44883b2c26
--- /dev/null
+++ b/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
@@ -0,0 +1,33 @@
+From 48e017de095018c60d83355804a3075658b4970c Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Fri, 5 Apr 2024 22:54:34 +0200
+Subject: [PATCH] fix position of endif - gemm3m tests should not be run in
+ cross-compiles
+
+Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/48e017de095018c60d83355804a3075658b4970c
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ctest/Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/ctest/Makefile b/ctest/Makefile
+index bbaf96f8ed..6c7cc1ed56 100644
+--- a/ctest/Makefile
++++ b/ctest/Makefile
+@@ -203,7 +203,6 @@ ifeq ($(BUILD_COMPLEX16),1)
+ 	OPENBLAS_NUM_THREADS=2 ./xzcblat3 < zin3
+ endif
+ endif
+-endif
+ 
+ ifeq ($(SUPPORT_GEMM3M),1)
+ ifeq ($(USE_OPENMP), 1)
+@@ -222,7 +221,7 @@ ifeq ($(BUILD_COMPLEX16),1)
+ endif
+ endif
+ endif
+-
++endif
+ 
+ 
+ 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
