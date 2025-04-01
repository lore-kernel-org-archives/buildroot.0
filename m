Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107A5C36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 21:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E4880527;
	Tue,  1 Apr 2025 21:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hh4-ODhth3Ty; Tue,  1 Apr 2025 21:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89DD583EDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DD583EDE;
	Tue,  1 Apr 2025 21:55:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2021F137
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 21:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1188D61140
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 21:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaLUlpynAG_u for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 21:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FA0261003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FA0261003
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FA0261003
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 21:54:57 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2295d78b45cso31089095ad.0
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 14:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743544497; x=1744149297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=knMd+v+IC1PcNNe8nhpqob4OAfVpmdL3oepyzLJUyuo=;
 b=Hw2nz3ZxMQ6NKo/YRNfXRO88CQcMgMFxlRHCmPj6LRR2TScigcx5D1zdejT7A0Ut6K
 FYlxPrUPxBpbIeE63yyqS1LF6QbbykE3NstNksnvAJOFoJOjYgcwtMhIsNjPlIBSCuz4
 cZbnnzW1+wvNoBZx6RfUguWvemN9Bqf/CHetnSKVHl4mTJsfTRMztEwaNWiGD6AAxQ4E
 g/qu+cpTsbZf54uoSfbQsXm8hnqJuJ1biHs+yJV+27UgFmfwl4H94y8843r87/g/ex+2
 UfikSKb2L513j3+G2Uu1MqglO3o8fi8ENkT/syILa9bpnGyCi4DTgBsHcSYWjZMqvdXV
 0WiQ==
X-Gm-Message-State: AOJu0YxvR0mmhIPb1RC2GbKxShnDxJSnrAFSDePRfTkMpoYhxmr8pWyh
 bSxclbznvb1rdTiKhSQ3eZSGwIgio6Tmibd0IjBLPvu0rRj0mDV7KzzKGoqebTl4bi/hHsIJesO
 9
X-Gm-Gg: ASbGncvDXk7fhlZ3A1WUUDx5FdtHJpM4diH337V4xvj5Sz+fIarMMDqEJeMZOIl8sba
 ZrrFy2Ju9t+UWjAqEdb9Xn4hltrAqMYH++9lG6ZqR4hx+0JxEGDy63LGRWr4XiY5jJ3KREP3f/v
 zLIJX4Ild5VuaU++b1d9VHDhNinvzLTyRV06xnYazj+O8isrPCM5etXLB9/sbCThl4vUV0qcrYJ
 G3FxCavf0fEb0J3sptnzmuAxyRdhQ6yhHE17JPZ07cpNMMeXdrjBlIYiUZ0Uf5ti+Mmzedvazsn
 yXFCOJXjkzpbcGle9zbbjwCiQSbX8q/+o5Wrlw93efzHOvleDkOqfvEZH6B+qUMcjIKUBJ8=
X-Google-Smtp-Source: AGHT+IG7jXE8M49Mg0A8LSgE3PAwsu0kKnm72pe6kPZQPOZoLqlKdY3XNAj6159arcZi70k7JQzyPA==
X-Received: by 2002:a05:6a21:108a:b0:1fe:61a4:71d8 with SMTP id
 adf61e73a8af0-2009f644bc2mr24154103637.22.1743544496923; 
 Tue, 01 Apr 2025 14:54:56 -0700 (PDT)
Received: from localhost.localdomain ([194.113.66.227])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739710d4d71sm9480644b3a.161.2025.04.01.14.54.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Apr 2025 14:54:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  1 Apr 2025 14:54:35 -0700
Message-ID: <20250401215435.60567-1-christian@aperture.us>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743544497; x=1744149297; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=knMd+v+IC1PcNNe8nhpqob4OAfVpmdL3oepyzLJUyuo=;
 b=S3YYNrZWsrC32HeyKMdXFG42/7M8GPIbqAxLSZj4+H/1ucPR5XdRZh9ugY0+GGqy/s
 c0AnWzs/rtJjZnN2BwZTBBfVyO8SpZUbsW1bmhwcHINTL9ts8kvzk6jFNku8oAT0Qgfg
 lE4OncMPYTkuvm+3TVnIEvHFfvTrnSTfsveg5T08TJi19FQSs4ZC+41JSaRHSPv/vCQb
 r3dMdwUbpOcQc375CeYMSbP3NCVqfwVaeyeVKsc0zgyGFDp9l1UOU6XBg2K0CstGcqwy
 9pL9pAuAfA4P7XReqpFqTWKvzm5/QOfFgeX0RqBSJJkZm4VSRfS5QDEFxwBEOEBnOOxK
 QozQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=S3YYNrZW
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.23.8
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
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.23.8 (released 2025-04-01) includes security fixes to the net/http package,
as well as bug fixes to the runtime and the go command.

https://go.dev/doc/devel/release#go1.23.8
https://github.com/golang/go/issues?q=milestone%3AGo1.23.8+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 8b9541642d..48ba6b7fd9 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  7cfabd46b73eb4c26b19d69515dd043d7183a6559acccd5cfdb25eb6b266a458  go1.23.7.src.tar.gz
-sha256  9115f7d751efe5b17b63a7630d24cd0a2479976465eecb277b5deec8aa0f4143  go1.23.7.linux-386.tar.gz
-sha256  4741525e69841f2e22f9992af25df0c1112b07501f61f741c12c6389fcb119f3  go1.23.7.linux-amd64.tar.gz
-sha256  597acbd0505250d4d98c4c83adf201562a8c812cbcd7b341689a07087a87a541  go1.23.7.linux-arm64.tar.gz
-sha256  c9e9ecd6a8cf1429f1c65d81115c450258258ac65833d95a82d5f4e5ad7d2d7a  go1.23.7.linux-armv6l.tar.gz
-sha256  3ffc310bfd11fd0bcc713a764a0f7252c4d52d03f12abebfaebaaae77e027028  go1.23.7.linux-ppc64le.tar.gz
-sha256  af1d4c5d01e32c2cf6e3cc00e44cb240e1a6cef539b28a64389b2b9ca284ac6c  go1.23.7.linux-s390x.tar.gz
+sha256  0ca1f1e37ea255e3ce283af3f4e628502fb444587da987a5bb96d6c6f15930d4  go1.23.8.src.tar.gz
+sha256  714b9d004063bfa27686f9ff0e5648bb190b3a5bc1e86b0aa16c134d8d8c315f  go1.23.8.linux-386.tar.gz
+sha256  45b87381172a58d62c977f27c4683c8681ef36580abecd14fd124d24ca306d3f  go1.23.8.linux-amd64.tar.gz
+sha256  9d6d938422724a954832d6f806d397cf85ccfde8c581c201673e50e634fdc992  go1.23.8.linux-arm64.tar.gz
+sha256  d14e0bea9fb25344a0460f395880d5589bbcd413ffd5555be48e46c0de084437  go1.23.8.linux-armv6l.tar.gz
+sha256  0cadab469e612b159f5f68b1a30d75aa7b7e1ed5292746005a6a3c8ff04e6f35  go1.23.8.linux-ppc64le.tar.gz
+sha256  cbe954ee534eb02aa782639716d8c25706dd171445f7c8336bd2fc0b8f6fe38e  go1.23.8.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index da380483ef..d618a7a262 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.7
+GO_VERSION = 1.23.8
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
