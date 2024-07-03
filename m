Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53119C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 19:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 359B760586;
	Wed,  3 Jul 2024 19:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJGnadfUBJOW; Wed,  3 Jul 2024 19:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DC3761016
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC3761016;
	Wed,  3 Jul 2024 19:33:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FD7C1BF2E3
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39883401C9
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zc1zSNoTOQKu for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 19:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03ABB4019E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03ABB4019E
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03ABB4019E
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 19:33:34 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-376069031c7so23278755ab.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 12:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720035214; x=1720640014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JtIzfZKHSJkV+yEOmMDQ5wnbpw6VcxkYGJPGQIbhsmk=;
 b=Qt8DnebI1f9ddURTeHGaS4FPsUD6iNaabWpllDjbtN4xwo+Wx9cxP4oKMiCxKdkrZ6
 oMU8AG5nBrU7jURJI2FZTjZV5xd2IGgTAFCGK1GVHoAZq1DB3ESWej3555x6ew569oIq
 XKttrpjTL8BhnteIh/CCpGqoX/d45/ahMU7J+fiIIhE0/DSUl1UZCE7JGuYLT0H+kpkL
 rlTp2dVOdtjKWdxuhjjPC6ZyRp82DuZPz32l2uh1kFoVZAEckzYfB4i+nrMHEddl10Uu
 qh7pxnfNqQwtCZhuAz3sIkpsIkJkACBwUByXrGDGEOoxu5qu1sBsI4MENAyL2aY8dZ0v
 l6nw==
X-Gm-Message-State: AOJu0Yz3XsxSB6AV8vtM2Ej2k1iq6m2EkQV6Y8uqHy5IlIJ8V7s8JGW3
 nXSZyZPUu72bIpI7yvZvct8a6fbROMfQhvuGuaK8yUSH1pGAsMs8Y2uWL2xExjYV++YZRpy79Kh
 fOgmD5aiO
X-Google-Smtp-Source: AGHT+IFMIf3y5WzF0T9QJ1CG1d/g8/al5vjIthU5LwZ0jSGGJ0uH4d8EJmSg4iIGtkNYOIq7jvUWwg==
X-Received: by 2002:a92:ca07:0:b0:37a:9165:52c7 with SMTP id
 e9e14a558f8ab-37cd358d3f9mr130905735ab.31.1720035213624; 
 Wed, 03 Jul 2024 12:33:33 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-75dd9622a24sm192494a12.71.2024.07.03.12.33.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Jul 2024 12:33:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 12:33:29 -0700
Message-ID: <20240703193329.6627-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1720035214; x=1720640014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JtIzfZKHSJkV+yEOmMDQ5wnbpw6VcxkYGJPGQIbhsmk=;
 b=PrsRFhIam+Oyf7e0T5s6dCMRPmbWg4TWEgXK1OfGCu8+7xjtjQVEWm7K0WHZ4af+KJ
 fRH1eaBkUntj1MdsUVclze4v2n7zMLYz43UWDWkam8M06Y2FipVgY5ErnlhjSEY9uQT6
 2gDQ6dOPxE+p1t7NvDXTxKkw+T0MUJT+GLgFPFYjdBnNgN7caMo/w4NNbuC3N47uWd0m
 /OEQ9Ulq3Dql/N8gXbMdLjMIcOS0hhfRcU+b6CluZVcT+EHnkAZcSfECoEXOUHDkbmZ/
 XwRcQ/qEpuXU2MUaULmXXWsyCpSaJC9bB7meT0hq7VlXt7/ZQV8/y4RiXgt85mP+fmnL
 21HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=PrsRFhIa
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump version to
 go1.22.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE:

CVE-2024-24791: net/http: denial of service due to improper 100-continue handling

https://go.dev/doc/devel/release#go1.22.5

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go-src/go-src.hash | 2 +-
 package/go/go.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 7952461f2d..d300f6e2c9 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  fed720678e728a7ca30ba8d1ded1caafe27d16028fab0232b8ba8e22008fb784  go1.22.4.src.tar.gz
+sha256  ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6  go1.22.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 91a8fb828f..bfbe997911 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.4
+GO_VERSION = 1.22.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
