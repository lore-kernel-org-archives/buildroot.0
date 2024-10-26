Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6772FD10BE4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1910D40BB3;
	Sat, 26 Oct 2024 05:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umSwUplRtHmF; Sat, 26 Oct 2024 05:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC0440BC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC0440BC3;
	Sat, 26 Oct 2024 05:11:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 202FD5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1CE40626
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KWPyo-Enhmu for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E4D840B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E4D840B87
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E4D840B87
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:11:13 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2e18293a5efso1885318a91.3
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729919472; x=1730524272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zw0HdqXM+imBTjkyKWU8Gl48wtb6FyI15vsTPfAl5Vg=;
 b=o6eUl77CMmVZ9Jg0pcNjLX+ghEg6s93cXUKaM8eg9IsmnZ0b566Oy9GqceSPyGvA2s
 FpTdgn4SSS7vryO63H4/U6c/zOxzylzc6cofDJ2laq2GLBmLpP4FJ3+gKl47Ivw49/+X
 UVImfsjOnKgJl7RMncvjeRPxuVvOrzfuKIV1h1BciAaiCUBQUms8vaC7bxpZU0Ii8l1X
 uiwTl0/bIJkBuUccfmg50fVO9vtcXgtXgDM4aO4gUZ3L6Vkd+uW+Sool6sb0jTeiz8l2
 aiT3rMR5Mt8mzjlm6yC9RET6UYmowsmntY9ZCrUTpQqSElBvNh6Z0Ry1blj1TnHZDfHN
 iP/Q==
X-Gm-Message-State: AOJu0YwCMiV/FK13LhsQLLaxMeRsOG3bveWtwqYNcpbzjknp9/+n/Vfy
 N4WgXKi6s+IIRTy9n2d6sRHfEDE7GB4TNQr5/nOZk73Njj+hiXp+z7JxC7ZO0VBI6wJYgXrrJv9
 0RF4=
X-Google-Smtp-Source: AGHT+IFzvE/a+kieFS5lot/TeCphH7uZe6BVqwx8mERPnSlee4XYQUU46giKIvL0GMQNMgsFJFU4gA==
X-Received: by 2002:a17:90b:1c03:b0:2e2:c636:d205 with SMTP id
 98e67ed59e1d1-2e8f11b96d4mr2169473a91.27.1729919472523; 
 Fri, 25 Oct 2024 22:11:12 -0700 (PDT)
Received: from localhost.localdomain ([192.145.118.141])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e3555c33sm2527024a91.3.2024.10.25.22.11.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Oct 2024 22:11:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 22:10:57 -0700
Message-ID: <20241026051057.52178-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729919472; x=1730524272; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zw0HdqXM+imBTjkyKWU8Gl48wtb6FyI15vsTPfAl5Vg=;
 b=LGnVv2HojOWywzENHQkTNx+G4v5rTrwXGSL0+mck/riHsAUtcmnZBmnQYfUtKb96x0
 OqJpwbbHQFbS1Z+dN075vM5YAtCgYKeUC3cQkcuC3FoW2mTY99eaQe8xUbSM20dX9w8N
 6EqpiJLEY0ZKdYJI9BoE7mpnRBbxo8L8C/l0ycC4r893fmhH42C6RX250e0lgQNI5ocK
 2OVSU9+fahsNXDNZfL7YcFqtxopCFXUkHtYx3Kooa6ubmN8CE3KGp6sNu2Kq/mvw9Q4h
 PjOVqI0BBm/PByam9/f6LA2N/Nhnf8hDSsiIERKj9khtUtlwqgJ8YNLKYL60nnIrggPf
 MYyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=LGnVv2Ho
Subject: [Buildroot] [PATCH v1 1/1] package/runc: bump version to v1.2.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/opencontainers/runc/releases/tag/v1.2.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 95d6c2ed19..711d7c61a2 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  be31b07d6a54a8f234016501c300ad04b6c428c56588e7eca8c3b663308db208  runc-1.1.12-go2.tar.gz
+sha256  25072beb84f4adae316a968241dc74ac30982d38e4459635074aa9e9d87d3de7  runc-1.2.0-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 273509b860..94b7b15900 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.12
+RUNC_VERSION = 1.2.0
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
