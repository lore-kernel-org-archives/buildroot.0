Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E16D10BE4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 04:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90603606C8;
	Sat, 26 Oct 2024 04:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC865VqDq5Hl; Sat, 26 Oct 2024 04:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA3760AAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA3760AAF;
	Sat, 26 Oct 2024 04:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8A55C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1779D81B7B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3ZCkjnYixoJ for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 04:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1980881FF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1980881FF2
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1980881FF2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:54:40 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20cdda5cfb6so24431765ad.3
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729918480; x=1730523280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sXJha2IZagpe7GtVmXfq+w8Muk9ZnX0w+bJRIV2B9lg=;
 b=LgEaTgij8lO9VnAf4fst6I9wD2fYk4qQmRC+E/rdGKHTrHQ/+lTFE4TA05LAbHbrIK
 0aH+ZP7uhUZ6NT6/kF9eF92ybMEtSAkg3M6nd8EEEx1HXVoTrJGojCPN8kL+/EEeVMFe
 yWqO1RpY/8bQhK/g+OV8QdfMuBlEd0fjJf9HIvq0gX/pfMtm5kwIFtRDkxNmQ708vLC9
 blpLyhFb+39QRYU46oqsCWMad6Ejco8Y7AxfTuDvcR+7La9nNrCyb20JZsj0b0+OHLIW
 P1ep/6wwug20/DYb8lmqHzglfExN8LmEvv9YaRGvG7iYrBJwaAXa7ug0vrt1MyIRiJ1x
 RvMw==
X-Gm-Message-State: AOJu0YzbQyeuOUZ7Es2YNCfsSG9dYJXIx4QDinqsBBlgNB35M6N8JbaC
 tdAwvWRIh+jHnD7ZrYZ+jXE7K63/4JIDAwxCb3WWC8fbN2zOpbNZTskE4CqACxs/+isOUZBVvpx
 P
X-Google-Smtp-Source: AGHT+IGkQtLLUREdVtsHLBN6i/1ZKOOzh1dfZbMePorYKk96iFGyG/G7tl5kaZMLit7+8AKPdaZS6w==
X-Received: by 2002:a17:902:d545:b0:20b:8325:5a1e with SMTP id
 d9443c01a7336-210c6c92793mr17239105ad.36.1729918479783; 
 Fri, 25 Oct 2024 21:54:39 -0700 (PDT)
Received: from localhost.localdomain ([192.145.118.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf6d3a0sm17368995ad.79.2024.10.25.21.54.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Oct 2024 21:54:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 21:54:21 -0700
Message-ID: <20241026045421.44823-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729918480; x=1730523280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sXJha2IZagpe7GtVmXfq+w8Muk9ZnX0w+bJRIV2B9lg=;
 b=MkFLuyDOqQ6O83mQgvGBhlUmPGKCQDx+Mu9yLt4fCCi3OqIU+9K/B+JaQAKcju78+R
 eMD0jFmWoF/NF+nKhffHyT2KaMG3sDuackaZNJC1/2BE1isWYi4zshU2pMnb5WW3wQSD
 D/GNKQeurL4PjD3O6gyp+HlxSY4UvPnRB1D4XO6+OecffKhhROo4mwxn7qrPobUbQyMe
 MUWvnEBIeaCtg8mmu9rLhNddYEqh3zrZ6ZE3Y02sc0k6m02jrFdDINqT6ci+3nhIVQ9/
 fW+Du189NL6XF7ra6wdfhEXNkqK1HmztROapxXQn6swxkdIo0C/JknB65dTAz0osEl6p
 IZQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=MkFLuyDO
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump version to go1.23.2
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Go 1.23.0 is a major release of Go.

Most of its changes are in the implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.23
https://go.dev/doc/devel/release#go1.23.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index 4d18e0cd2e..cc87cac3a6 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8  go1.22.8.src.tar.gz
-sha256  0c8e9f824bf443f51e06ac017b9ae402ea066d761b309d880dbb2ca5793db8a2  go1.22.8.linux-386.tar.gz
-sha256  5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f  go1.22.8.linux-amd64.tar.gz
-sha256  5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a  go1.22.8.linux-arm64.tar.gz
-sha256  5191e87a51a85d88edddc028ab30dfbfa2d7c37cf35d536655e7a063bfb2c9d2  go1.22.8.linux-armv6l.tar.gz
-sha256  c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27  go1.22.8.linux-ppc64le.tar.gz
-sha256  fabb3adc241474e28ae151a00e1421983deb35184d31cc76e90025b1b389f6bf  go1.22.8.linux-s390x.tar.gz
+sha256  36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  go1.23.2.src.tar.gz
+sha256  cb1ed4410f68d8be1156cee0a74fcfbdcd9bca377c83db3a9e1b07eebc6d71ef  go1.23.2.linux-386.tar.gz
+sha256  542d3c1705f1c6a1c5a80d5dc62e2e45171af291e755d591c5e6531ef63b454e  go1.23.2.linux-amd64.tar.gz
+sha256  f626cdd92fc21a88b31c1251f419c17782933a42903db87a174ce74eeecc66a9  go1.23.2.linux-arm64.tar.gz
+sha256  e3286bdde186077e65e961cbe18874d42a461e5b9c472c26572b8d4a98d15c40  go1.23.2.linux-armv6l.tar.gz
+sha256  c164ce7d894b10fd861d7d7b96f1dbea3f993663d9f0c30bc4f8ae3915db8b0c  go1.23.2.linux-ppc64le.tar.gz
+sha256  de1f94d7dd3548ba3036de1ea97eb8243881c22a88fcc04cc08c704ded769e02  go1.23.2.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 40cb5c801a..b475ec4a46 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8  go1.22.8.src.tar.gz
+sha256  36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  go1.23.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 68fd359ed0..33dc681358 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.8
+GO_VERSION = 1.23.2
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
