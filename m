Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808DFC28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 07:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F60182D04;
	Sun, 30 Mar 2025 07:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFZhbSpNAQqK; Sun, 30 Mar 2025 07:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA27182D14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA27182D14;
	Sun, 30 Mar 2025 07:02:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EC3A121
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 07:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45B1360B12
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 07:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5iqOSxHW5WH for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 07:02:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.46;
 helo=mail-wm1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E86E60650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E86E60650
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E86E60650
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 07:02:34 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so25572725e9.0
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 00:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743318151; x=1743922951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/cz8/coFYc6JDDm+34ofQF+bDw/CN80SLct880gc8pw=;
 b=cfAKI/6iqfK4Co4Dbj45DwUDMxT7gsoUHkrZL2GUPkuONABoTcypODbbJu8HYFtsYZ
 Rbk1GvO25k+QFUuMDEol/8rvN9Qx+y2DxVM8X/Hc/L9AHWhvag+GPk9i3cCczTd9zRzS
 UpLfMWOwR5JBJbNwos+JIga4+aQjjLN6tYiEPY8JgsH2IH1kNCkfpNGl2jihRyril3Pf
 SkItymcsNvDu9j0QUXfRTPFDt/enHX21wG9dFt9juyxaSjsczgaSpUEb0XuFSz2wlxkA
 SKJqJchOfPGabRiJFGqzyUWubhvfh3aunBcVmtRQTEop2CAIgb6oHIsHU7aW4Tyu6Q6V
 ONhA==
X-Gm-Message-State: AOJu0YwHAo2/ecdHv5RBJ7VmlOdgkOUB+Rxo+1LBgupGzvz2+t7WfSPK
 P45wwUBGaRtAl3CdUKRZPJlafbyEkIM3j7nHP0Flil7yVfzKF4A4qXgacg==
X-Gm-Gg: ASbGncs61ApBR6qQdMrCvcXinVZ0aD5nYTiwykQUOizj1mitH7arjiTwBmFLpWjy14f
 auNeVZcKrdplrs+Nylzp7h5sI+oY2s0enJs1fDj+7NyUMPXtqQMQgPQ4ZbstxUF3AqBkMalEqa5
 X0ClpjstdS89hMkQdDGVc5/Xips0A2GJZ3aG+Nu/87k3U0oP/K4OxERw95PoWx6FI2RSpZ7wPnH
 pqvGHa9XOazL2/uZ9mLvkHQLTOEqXudi4RsxYzcJraC30Fk2Rt2neXs+mQPo+ioHVfZKkvCoUxE
 TjVl0McK5+Lha6CrHgNGy5+Ur1IYWxf7hXZFAlB4AwNUygcnGst+clAKRlufy8OIVh2iyi67Rxc
 =
X-Google-Smtp-Source: AGHT+IFUKHhRGcT7rLrtEvLTil29xNfaQ4TVPv2aX0LHFP6OJT5QBNjfpcZ/6h4EtxrXCENqWp5SXA==
X-Received: by 2002:a05:600c:6053:b0:439:91c7:895a with SMTP id
 5b1f17b1804b1-43d9105bb78mr73402455e9.7.1743318151217; 
 Sun, 30 Mar 2025 00:02:31 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:418a:c8de:a7c8:4861])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff02f84sm83058005e9.25.2025.03.30.00.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 00:02:30 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 30 Mar 2025 09:02:27 +0200
Message-ID: <20250330070227.1252414-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libsrtp: bump to 2.7.0
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

https://github.com/cisco/libsrtp/releases/tag/v2.7.0

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsrtp/libsrtp.hash | 2 +-
 package/libsrtp/libsrtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 95daf0d792..232c106387 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bf641aa654861be10570bfc137d1441283822418e9757dc71ebb69a6cf84ea6b  libsrtp-2.6.0.tar.gz
+sha256  54facb1727a557c2a76b91194dcb2d0a453aaf8e2d0cbbf1e3c2848c323e28ad  libsrtp-2.7.0.tar.gz
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 269c1ae3f8..ba58b900d4 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.6.0
+LIBSRTP_VERSION = 2.7.0
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
