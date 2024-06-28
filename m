Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4621AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03492419C5;
	Fri, 28 Jun 2024 16:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7brtcSgAml3O; Fri, 28 Jun 2024 16:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C11D741E0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11D741E0B;
	Fri, 28 Jun 2024 16:12:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 273871BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 152716080B
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eU4zUEd7-5NR for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:12:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3D4B6075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3D4B6075B
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3D4B6075B
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:12:31 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3760121ad45so3412125ab.0
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719591151; x=1720195951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cvp/75Sjifz1rOQyQXhl78Sj4cp9FBBCg4YqXurYmSQ=;
 b=vIJrJixQolcdNYfH2KvNDbvwbhicvFturRSkou78h3C5wgF+n5sjg6dJ+QPlrq8KjR
 XqxIhUXWOXvNTVMiO/Bsvx3F8aP7X3YYXAzizxqlkMFbfh8BW1IKpRxL6La5Ld2hqQ8R
 D0JWR27zUPzAU1GbpzXmtZoZWLQnK0vIYNrCWMS0/pKotrS2QgRSsVMCLb2qDLx8Uzio
 JyODkKhS00T1sg2swqLNVq0YIHCkX8xpfpxV2yMI0G/pisRVvp4BEvR4pVMiA4glxagX
 BTeis0BVYobNHazjqqsgPaC+Z+NuYPD6396AkOhArqssMMuRSVaOr31bJ2zUbMGvSFAa
 r7HQ==
X-Gm-Message-State: AOJu0YyD78TayJpIJwnBM5aUu6SgW0CiVOwpr0pPPzbiGUZtKzogmAlS
 upXuDZyuO1FXcg39MvGVIjz/5E8xX1nBWyAKiFMF/nfm17mFA2zHnFY4BRXfeaI3G2br69XHAJz
 9Q1qzMZ6z
X-Google-Smtp-Source: AGHT+IHLiO1gHhr36DWItQItW+vP97ExOKcgJOhVH2s+vN36DyRgLN0Gojt1wq7XGaUUCX+sdPORFg==
X-Received: by 2002:a05:6e02:1a87:b0:375:dc39:cfd2 with SMTP id
 e9e14a558f8ab-3763df8e5b7mr227277115ab.11.1719591150656; 
 Fri, 28 Jun 2024 09:12:30 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6a31f603sm1465087a12.24.2024.06.28.09.12.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 28 Jun 2024 09:12:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 09:12:27 -0700
Message-ID: <20240628161227.50575-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1719591151; x=1720195951; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cvp/75Sjifz1rOQyQXhl78Sj4cp9FBBCg4YqXurYmSQ=;
 b=YOwdVIXmNQu9s3THyw/sSltF0zgl2mvcY4hmRWLwmmDIQXfU20FhKSi46FM2uul+1R
 lKY9CAKYwiKVxBI8BsOQig1qE5PhqAl3D9jdY0YDVKw3p9gmXwcWVd90qb5tnycVf6Sg
 GTxd97IpF3G8KbTx76INA/2kGDDW5GEnTMoqkAuytG4Pi0luhkQJtS0D1ggwY5kKzwKb
 B9lExFz4+wnTaToxKSRfOalrNbk4hJdNbL+EAAiZKTo44RWdScPf/tYOWlwNikcG8t2w
 kAT80MpwCkcvtvjEQSziMdjMnTZTk9fXm9eLyAbU4MBbHucJIhh2XJk3hCyi5wJBwk/V
 7J/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=YOwdVIXm
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.18
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

https://github.com/containerd/containerd/releases/tag/v1.7.18

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 1b2609e880..03964ace3f 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ae55b25fb04b45dfbbde8280b034783a48ae7c40350d17fd272be5cbf0284cf1  containerd-1.7.14-go2.tar.gz
+sha256  91685cebd50e3f353a402adadf61e2a6aeda3f63754fa0fcc978a043e00acac4  containerd-1.7.18-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 81875f763c..b822516938 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.14
+CONTAINERD_VERSION = 1.7.18
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
