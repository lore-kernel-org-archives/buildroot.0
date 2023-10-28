Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B16AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A49D41FE4;
	Sat, 28 Oct 2023 20:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A49D41FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUbqXJ2UtwhC; Sat, 28 Oct 2023 20:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88DC741FC8;
	Sat, 28 Oct 2023 20:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88DC741FC8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9603A1BF25F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D15F41887
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D15F41887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2hrjhJmeASV for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:40:29 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E2F54187C
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E2F54187C
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso44949481fa.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 13:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698525627; x=1699130427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0GAOrX+Dg4+mopFu4jt9ZLcuMfsU/U84EHS0JoXOe/A=;
 b=hzD6pbEISqdXokYEHHWSqaUx7BS2nfewPQTli7cezw3TRuJUw6t+V37Zo7/EJ01Y8+
 dbaitqSQcvJsR7Wy/L0C2gBfYvSfJt8ujdA4CkLuY/7+3+S/lHiK5ATxlNPIN4eREoIq
 lza8J/2CK3YBKxPy3DpGBXcAmemwvmE7bokiSRBS29eB40p1Rj7zO6iVTNOV0lBTTwjO
 LbVQzJQ20XgZiEuMJCm6uu791ZPRYjQ7wN3cIDxJTatPnKJ77yoMz4+TflyH3gVY8hQT
 VeHW3NDPbaY/m3Sy36CuhgJH+tGcNXxLTnU2mBPgzvyFQXTUtCPujStLZlXY7mD8trPQ
 RjuA==
X-Gm-Message-State: AOJu0YxygmiSubfrw8Axjywl0384fULtgSQrerbEWrL76GT11pal6JvH
 Slbvu6CmTY60VcZyyetuwMY3dXVoQ/0=
X-Google-Smtp-Source: AGHT+IH+pr99+yJrVMIx3WBdYe5ZezVBSb+uybCC3bkjvR2RLZXd/h4a9S8y2+UsjUr5Edt2N+hGRw==
X-Received: by 2002:a2e:9410:0:b0:2c4:fe14:a85 with SMTP id
 i16-20020a2e9410000000b002c4fe140a85mr5168182ljh.18.1698525626625; 
 Sat, 28 Oct 2023 13:40:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s14-20020a5d510e000000b0032da471c0c1sm4547703wrt.7.2023.10.28.13.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 13:40:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:40:24 +0200
Message-ID: <20231028204024.1193680-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698525627; x=1699130427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0GAOrX+Dg4+mopFu4jt9ZLcuMfsU/U84EHS0JoXOe/A=;
 b=axjE9OrHjsXl3JaphRb+zqe3gTHy27/PG6RcMWXiJLMyl8ZTzvAKxbXw3jRFbRUJoP
 AzfEQLT4UkkW/nm4+BBoTcIWHZUKMBlepZcs66esC9jw163X7WPavJGqMtQ6XxN5dzJU
 HX+/XSDsArGMvsn8JpewubximTtlIF3K/9bYQOK22kYIOVlJCGmmKOnwc3e9K3Fyp48O
 qPR993/Whm8XoqRMRIK6tLh62COr4QFTee7laA2uby8oVJrWhOYV9n08VNav8ieBF24C
 VEE4OsDBN55hkykWoGSob4Qu+DiGAbHtRO7YCc1TNMMHUS0iPIEiq0B66V4w24NbBFUw
 dDUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=axjE9OrH
Subject: [Buildroot] [PATCH 1/1] package/cppzmq: bump to version 4.10.0
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/zeromq/cppzmq/releases/tag/v4.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppzmq/cppzmq.hash | 2 +-
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 3fbee7af28..dd6e06494a 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3fdf5b100206953f674c94d40599bdb3ea255244dcc42fab0d75855ee3645581  cppzmq-4.9.0.tar.gz
+sha256  c81c81bba8a7644c84932225f018b5088743a22999c6d82a2b5f5cd1e6942b74  cppzmq-4.10.0.tar.gz
 sha256  7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index d702cc174e..90213ec0f6 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.9.0
+CPPZMQ_VERSION = 4.10.0
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
