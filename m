Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD54C4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 17:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1550181374;
	Mon, 29 Apr 2024 17:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPjDy8wiQk9G; Mon, 29 Apr 2024 17:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27EAC81396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27EAC81396;
	Mon, 29 Apr 2024 17:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 635D51BF215
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 17:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DDB1600CC
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 17:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVC8eCtcqqzG for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 17:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=bobrofon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA308600CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA308600CA
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA308600CA
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 17:05:03 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51acb95b892so5814494e87.2
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 10:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714410301; x=1715015101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cq8Mfj0H3SRvJSO1s/6CI8rcsO/Juxnukuv3HCdHoa0=;
 b=QaoGHGnk0UFgxaTuHO0Fx3v25wwRxN54d96Jz+fA7Pbc3kEqyJHK8GcgNysJjPrzIi
 R8C8oJq62f/6bvslOwTx/MT1M+ZMmJr0zkjpbj1NsDaD+TGCp119D+8y3l1tRRe0gnNj
 rO4xTzgdLgJVzJhgJYrm7EJXOcrZoAOjY8LgDz5IVCd1QJOU5XudElFAHIQrIAGOgVA8
 /3U4DVfUPoRUZLSA+YmSqiLekx7KSbdsGO7LD9ANCvoHBfEX0BHMfr2eb/mY3MEaO+Kx
 1TfHQmvAzXJGBNZMDYdQVcKdQS+DYRnhB1ngjs0w1COOuCTR45wu6gGBWBEjxvA2uxrs
 udvw==
X-Gm-Message-State: AOJu0YyHL9oKW3rxk1FV4T11g7tO99fc6lKGl+fvrumx0Xl3dh0RdV31
 XMcfrFxC1Bo1UcWdl1uVy0lQtlM5YsaYoqnVmX+Wav42h8a1HvNsSXVXGQ==
X-Google-Smtp-Source: AGHT+IGku2Tos/g/zMjS+YtGk/M4j/RJnqt+MG/AtxDmI2j6NtnM6jzZOfI3EInfr/mL7FEPyoJfiw==
X-Received: by 2002:a19:9106:0:b0:51b:1e76:4ea9 with SMTP id
 t6-20020a199106000000b0051b1e764ea9mr9388811lfd.4.1714410301070; 
 Mon, 29 Apr 2024 10:05:01 -0700 (PDT)
Received: from nibiru.. ([2a00:1370:8186:6f6:6cad:b799:adf2:268c])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a199108000000b00515b1b2c17csm4226326lfd.262.2024.04.29.10.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 10:05:00 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Apr 2024 20:04:41 +0300
Message-ID: <20240429170441.996821-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714410301; x=1715015101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cq8Mfj0H3SRvJSO1s/6CI8rcsO/Juxnukuv3HCdHoa0=;
 b=GZCBK/oE+EVVox8aDYX624vI68xPwa5f8sWM2lS7CYGNrtZffPl9Qs8kSVGVGMl/pF
 hfqjGO43dNNgBUIEkPpzJH9hLKSD6zT+qLS9BxpZuXEYdY+RAsAOAEF0MLd8TcnNq5LU
 8dphS8kuGLh290oRrsxFp7tchtgb89KtKBs8D5KoK9MUGqxxHB/uANcwWZ+ixHNJyolP
 jPWmR6UXrJJdCAdlR+Ug4qQjU4Ecioozo/nJfZr6tqqiA4BK4vYA4MWbCP/ivCCqzf2E
 C1IQJ94NdhYiCNfQOutS8S//elfUdgPAc0I4t1hoEZC/ImrswLA2P+Bdw2HinKLbsJkz
 5ndg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GZCBK/oE
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 2.0.0
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.0.0

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index b5ca7ecdff..1350fc6781 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  577986929f911320fb9ef6a3e2badd464dc38411ebc25d2966f5cb85c39f0897  sdbus-cpp-1.5.0.tar.gz
+sha256  88af4569161a0d0192f0f4a94582a1af4e75722499d06984fb7f91f638f5afb3  sdbus-cpp-2.0.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 18fc6a88a9..675ed1fa1f 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 1.5.0
+SDBUS_CPP_VERSION = 2.0.0
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
