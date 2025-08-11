Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D961CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F6C583F0E;
	Mon, 11 Aug 2025 16:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QP--rxpb6lbd; Mon, 11 Aug 2025 16:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BF4983F17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF4983F17;
	Mon, 11 Aug 2025 16:55:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80A21154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66FD46148F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XltB844DRb4t for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABD1A61490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD1A61490
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABD1A61490
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-af94440f4ecso74449466b.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931349; x=1755536149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/B+Deq3znnNPEI1a9yZyfS10KK4AETIUdQYtMeRv5w=;
 b=ImnfdGnhScnZ8UxiAQGwYAOWFmmFJ8czKS50psUrZkIdY6hmwBh+KzRgtvD5kslKVB
 VpcUVvobxxkjpf5vHw1wh4rlLqDM4qrd4wLdcv5OMv5102EGhy2g45A+2VZ5vmqef/tu
 ilVoJiNYeOi9oVv6aAzdo/8ACWId+aVXwwr01j5Pv7PpjBZr1ozw9CNR70CVKe8ALGLZ
 QJOKjQl4H2C5dGU62iLJK/df+uxZ0od2RUyScXTx5gXbAFPuo0QhQw+f8L9aJB5SxdO2
 hVcNMIzz40KEw2Xk6YGHfwFOWde27NGMnwTCbMUVNWafRCpzcZ91s+0tVXmLSjkRQ/mG
 v4TQ==
X-Gm-Message-State: AOJu0YxWAYcwRjjoImUI088awIm8mZcS3jleWZfUhI6k/Fmty99BnaNo
 bNlXQpKc66sQQxSV98KzIFMU3nhyaLlxtLG4FnAbFNuQHGBGw7cDVFk4tZZh4g==
X-Gm-Gg: ASbGnct77K/IK6pcFCy58VIU2ViEVl6uZJ1gCyOXu7v2cMsJIgS4VfhVy8pcd4R8Vbb
 jf/+nVBhGj3beNJihz1ATGU5RHhFd1+SPNRTD31vumdbhP54cLcrWMLHEBdYNlWiwCBQh18E6oU
 2PTcQ7fNjby68xlRZh0P963+X9UxE2IqUWgnb1b5TYROty3ap9SzvXZwKdiQ2N6q5kAIeCu8tXS
 0mBbopqR4U38ivFjbYuQlWxZ7+kRuWXTtzPVLe3suWbRC16aHjWRSFqtJ4oK5G+Gi79GTX38SQI
 aSijZrgbywGvD9Qf0PF1IeAoQPgSeMPoQBmI+iM6bhoaHwhl/dPy8iwL0To3vzntpq+MBellGa9
 eMAw8NNmiPM6vTAMKITc=
X-Google-Smtp-Source: AGHT+IFn3TRxDTIaW4gmChLhs9HCY9IwgQgl8av/ThH431hMehIL5SQsAbObRUVZnVof34D2F+wrxw==
X-Received: by 2002:a17:907:3e13:b0:ae3:617a:c52 with SMTP id
 a640c23a62f3a-af9de923197mr399785266b.2.1754931348998; 
 Mon, 11 Aug 2025 09:55:48 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:55:48 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:22 +0300
Message-ID: <20250811165531.1533913-3-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931349; x=1755536149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/B+Deq3znnNPEI1a9yZyfS10KK4AETIUdQYtMeRv5w=;
 b=SxcfClGP6JFZscLxtZZgY438I/XH2eXCqCRAYujdux4XfNQyZ8JNKG2Cg4wZhj/mbR
 k8ojUf2IaUTG1JmV6lQKENlND8lr78P4W/MM2Rb6Q56eDPhUS2hvYooWemFN6kIWJuki
 C0NaqAVbzHDxdqUBOEhNQjbYAM4FTi5WQfjjQ8UJ0qx7+UyuLnBXbVULWUMEnzNBYfpr
 xyJmCZqj5Wgcm6kK5ddDRWoiqF8zJBIK36J95hG/7NcF4amTCmefAXHtMw7/aDuXnpf6
 8WoxKMZoeiL4DgglflW2z9FvLcr+3RyHXNVCI362hdnn3X9t3JOOUw6n2VimXVLp29Bx
 d4GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SxcfClGP
Subject: [Buildroot] [PATCH v3 02/11] package/fmc: bump version to
 lf-6.12.20-2.0.0
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

No change.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 package/fmc/fmc.hash | 2 +-
 package/fmc/fmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index c3197fa1af28..a096f0037357 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fa16eaece5744af1523e563dc1cc5af6cd1c448aa828bdfd86137be555760abc  fmc-lf-6.12.3-1.0.0.tar.gz
+sha256  690ecca4d36b678f028afe780fb6750cece540e621a1c3f50bd98f54fe97d15c  fmc-lf-6.12.20-2.0.0.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 26282313ba73..bea7c5299aae 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = lf-6.12.3-1.0.0
+FMC_VERSION = lf-6.12.20-2.0.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
