Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8824C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 21:43:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 381626103D
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 21:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 381626103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B460483C61;
	Fri, 22 Oct 2021 21:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwrkEM5GOeKr; Fri, 22 Oct 2021 21:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E7FD83C4E;
	Fri, 22 Oct 2021 21:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEE441BF289
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 21:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD4E740256
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 21:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sreXUvKNqAVl for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 21:43:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A264640112
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 21:43:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 84-20020a1c0457000000b003232b0f78f8so4995340wme.0
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 14:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=whdR2rhFmfG6Iq9+mbxd4x41r7sOTPdr2nlAvDglRhE=;
 b=ar2x1sFyZYdQU+ssHdjBeYlx1cKhhWLXyIOdbxDEMzHaY9nmpnpqFGRJynCwXfLrP7
 WN8WMF9YaPm8uSNluLFM1USr/5PmmUbzQo2s8Lfu+LWRHyU0fJvbxDNIJCVmGfmCECEs
 VfRXZzRPdTMJvKG+PZtmpJqUJHXuDIFBjf4r/9OJJ8wLRQ7CJzGmpYt7KIjzp2Gxq/rK
 Sb846hA0TlRdLfYxdpkrMZo3zWEC3AJyvwzdd02hM43bbZaw7yZiHcXVjfBlygNeoLZk
 hq1iEALEEVh+URxmAVyNpjRsBqsZed3DMDXGlr7PMfkucQR/uAspfTIRB9dMVA5rhHZ7
 kObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=whdR2rhFmfG6Iq9+mbxd4x41r7sOTPdr2nlAvDglRhE=;
 b=0QUPEJR+L4bqLQlVl0YlpKqS6nAWKcaGwbR2ouB74q9jOwCpk3/57GXl05pL7YRsgw
 j+Po5IRl/FW3vxBdhwD6onhXnAPgLmTtKGq60Q7t8//WU42YqcS4NUecAx6yyTY805oE
 tSnUy1KnpyePTM/pVsqD9T/slZmrSndMywHb/aYDhuaziJ4xMYyMwafYEQI6I/tRiLmG
 PaPskif8562qBJdHxvjMF7iIgvyEbznE57Jfq8WYs9kUdvgYp4lbzz+yjzat+FhRyMny
 iMgPqJkgcUJKvurNF2VpodG+QB+kAy+zjQPgON++v0lU8Mx8+oyTquKIwPIZoa5ZwD0I
 /XXg==
X-Gm-Message-State: AOAM530u6QUKoMJDSmjhzdk4WIK7qAfkFZgbYsFAsVzWItnKm7T6n8oU
 0szZaNguWsb9GaAsT0WBXTKEavXMZG8=
X-Google-Smtp-Source: ABdhPJzdA/WYfUho6pd1+ls3mRrWF/lL2KO7cjwzdyZJIfXr3P3ynlj72WVHeCrrfrQfrxZAGYjUaA==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr2523752wmk.51.1634939001457; 
 Fri, 22 Oct 2021 14:43:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id q141sm5882929wme.8.2021.10.22.14.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 14:43:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 23:41:51 +0200
Message-Id: <20211022214151.1944628-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/flite: bump to version 2.2
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch site to github to get latest release

https://github.com/festvox/flite/releases/tag/v2.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flite/flite.hash | 2 +-
 package/flite/flite.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flite/flite.hash b/package/flite/flite.hash
index f21a21d186..35ec61960a 100644
--- a/package/flite/flite.hash
+++ b/package/flite/flite.hash
@@ -1,4 +1,4 @@
 # locally computed hash
-sha256  c73c3f6a2ea764977d6eaf0a287722d1e2066b4697088c552e342c790f3d2b85  flite-2.1-release.tar.bz2
+sha256  ab1555fe5adc3f99f1d4a1a0eb1596d329fd6d74f1464a0097c81f53c0cf9e5c  flite-2.2.tar.gz
 # License files, locally calculated
 sha256  d31bceaf2823d56a8c9400f7bde3b17140e739e991eb4f203bdcf9827754ab59  COPYING
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index fd5f4ec172..79b2288fe3 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-FLITE_VERSION = 2.1
-FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
-FLITE_SITE = http://www.festvox.org/flite/packed/flite-$(FLITE_VERSION)
+FLITE_VERSION = 2.2
+FLITE_SITE = $(call github,festvox,flite,v$(FLITE_VERSION))
 FLITE_LICENSE = BSD-4-Clause
 FLITE_LICENSE_FILES = COPYING
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
