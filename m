Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0416E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 04:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9543A60613;
	Mon,  6 Jan 2025 04:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1KlwxfAWFys; Mon,  6 Jan 2025 04:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A177960623
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A177960623;
	Mon,  6 Jan 2025 04:39:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59161DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23D7A80C74
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7_060y3Weru for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 04:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31FE580C6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31FE580C6D
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31FE580C6D
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:39:31 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-21675fd60feso262959245ad.2
 for <buildroot@buildroot.org>; Sun, 05 Jan 2025 20:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736138371; x=1736743171;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cfgaq22hF8LpruZVL+dmU1dbP0/OoYftEuC/I0RXd/c=;
 b=Iy5lGmmDvQ929ct0KewG44xwspisXKQfWSq7ohIvTeeHgNzgnH8ZzVB7JshTJU2Xz6
 G9VjNPJHq+P3jm3uEYjE+uhtiBMAKzK3wieuSYE7wU1LMfBwfBTEwUfcOTaaYDN0TK1i
 65MTlxUtUnf/MdM8ezZ81yv10O1w6NHIdNFuVMMpzJjFymKYImA3Z+wGzM7TCQ6UPMaq
 7dW/aF4zjB4LhzuNS1qkYDfmD5Eu1WUlIlilOdIASQfKazo2cjNpGCJKrSMIewDErDok
 Lb2goRb5PFjg6s9lq+VGIt18A5fhoPTPmeW3DsUJm6iPupa59TkcoD9DxcpAQGuv3vDd
 FAzw==
X-Gm-Message-State: AOJu0YxigXuYzeudzgOfhn5ojmi3jmxXiIm9MwAl4MOLnrJVNsff8jDv
 4UUjmdLNE10i9DYXGHS2uqyvrZsaRJRFhYup76QD5anXPhOdNQTyBxvH3w==
X-Gm-Gg: ASbGncsgRBaBq1VrWDlB7H1pR7XtM3nY4pscHKT2NYOtz2sonuY6Qt6jvGeGAV7mzEU
 1XfNeJzGR1wtNLE9BSbiRFmU4n+Ih+qvP/dhCNoVG3D42v7sefGqkGOzPiXErXLAwAF/EAEq7hm
 ObLQ+z0MZ1RpH0S9tNy+TR3tF6D/UIXQkfkBj8Ox6CwiQ8JDiY4FJPU3ZJNFcim0LSpbMJ/VKM+
 AsiRlI+58E4f7IXGrWLcNdDesYaI59DNBxb056hRQ9a/cbCry32RB8BSr4+mUup4fGlEDkzgnxc
 pxfFU5Ahsm3bZXZQwEz/VwNSEht0JD3b+dAoLw4k
X-Google-Smtp-Source: AGHT+IFBCBDZ6UrSVmCqvNflCGeXp1ZvZEJ4XO6iOKjGxM575ha/cjH7pFp2cE6Zsx6bonnim+yOIA==
X-Received: by 2002:a17:903:2383:b0:216:4122:925f with SMTP id
 d9443c01a7336-219e6e9f8d8mr790265705ad.14.1736138371121; 
 Sun, 05 Jan 2025 20:39:31 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9cde5bsm283622975ad.116.2025.01.05.20.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 20:39:30 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun,  5 Jan 2025 20:39:27 -0800
Message-Id: <20250106043927.154476-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736138371; x=1736743171; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cfgaq22hF8LpruZVL+dmU1dbP0/OoYftEuC/I0RXd/c=;
 b=Edy63VDxvJP7ONKmxvCNUJNzon0GGHEUyB7xH7lwNW39p/OvHM6xx9QG/qJTqUjOaZ
 vOPHgv/0bROP3XgqHJlKnhtSvEUqBBJltnLXboFsqA61ZuhAPhZFV/xEI1mqqojQlOgi
 zExsc6XGLMZBilh+K8phWxNiFEbXWMWopmL2uO4vrwXAhE6oJaT3vqlY2IHJVG56aknc
 PfIW8OCaFj8mknH7kA3GKVzMJeQmtgc2z22iNNkz73fsZsWxU6E8f93ipmy6IPY+kiVq
 W5lpE3zkwmXKOZ/feEisOKIgEyVreMxiNXMbp2O2qnMbXhAvJWQYua1/q6R0FApZysdL
 8Ojw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Edy63VDx
Subject: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.27
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

Release notes - https://marlam.de/msmtp/news/msmtp-1-8-27/

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index ba4ef02746..eb80029626 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.25.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.27.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738  msmtp-1.8.25.tar.xz
+sha256  94030580a63a747faa0a3b9b1b264ae355aad33a4d94b832bfeb5b21633c965e  msmtp-1.8.27.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index b964970bfa..f3543bff1b 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.25
+MSMTP_VERSION = 1.8.27
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
