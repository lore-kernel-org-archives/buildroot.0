Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F24C4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5430A83AAD;
	Fri, 26 Apr 2024 18:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7DeCtSjNEvb; Fri, 26 Apr 2024 18:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E89F83AB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E89F83AB2;
	Fri, 26 Apr 2024 18:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ABD21BF3BB
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 18:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15C3283AB2
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 18:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nf6-hjozuFLb for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 18:02:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E252C83AAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E252C83AAD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E252C83AAD
 for <buildroot@busybox.net>; Fri, 26 Apr 2024 18:02:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41b79450f78so8570665e9.2
 for <buildroot@busybox.net>; Fri, 26 Apr 2024 11:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714154540; x=1714759340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQOqwXRCUsEoyUIXoyGESFmsWmtaxyB0Yt73/EClNj8=;
 b=tbmuv9qqu25Zz3WjOytZguXybLTc1IK7FS5Q01W2zacXx6XSobzM2dh3GuP9pXEMQL
 hx8sPIPOM+wti3lmMlbJWlfD4s1KR3+5tzwcGeAEO1V2ciuELveCQh1FvVN2w+vo55BV
 Vm5oWYJxXiy+F19tEnQy2kLVdY04v48Ee0fIVMenf+xpYLpfd17QvJOGUEDbBKQya/JK
 y37DHO8zC8l7JPrEKVKCUNX3smQmMJjxZl/pO4Sh1G4u3W8N8kIQNt2Rc52Up7yaoenA
 AlFVs8zRXuG4uIhHnCa5gQ4dl4Xt91F+4/Ys7QTy/Mb1hoyhS2FO5K0+Sd+lks0qY1Sx
 OEWg==
X-Gm-Message-State: AOJu0YxpXh/dAAzvMNjq36kWGmMi2RNmlQ13V8mXSV9+eGaeFcABe71F
 azn51RWUsdO5bduTaF5P36ISUeDIuRLY2H8hhetQhXxWkrprJSWiqok4/ZFuIi6o1oht1ATVPzB
 u1A==
X-Google-Smtp-Source: AGHT+IHmmNNDMlNs9WcwxX/15PJKYmQVeCJZMjMbI3qgZKXtIqRlCCQ21ODLdUXpFNmUyTiN40RFoQ==
X-Received: by 2002:a05:600c:1992:b0:418:f8c2:c3bc with SMTP id
 t18-20020a05600c199200b00418f8c2c3bcmr2806055wmq.33.1714154540215; 
 Fri, 26 Apr 2024 11:02:20 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0041638a085d3sm35240226wmq.15.2024.04.26.11.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 11:02:19 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 26 Apr 2024 20:02:17 +0200
Message-Id: <20240426180217.20885-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1714154540; x=1714759340; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQOqwXRCUsEoyUIXoyGESFmsWmtaxyB0Yt73/EClNj8=;
 b=cEaR7qXsEuUZ/4b1Jjb8lTTpbzQQNDJAD/KWDXE81nj4SZm4GM1zBHnR30Gyduyk+V
 T+8H8IELgei1nTqLYhbaFI9xnTL9GK6JpnWRQcEN+zD0u0gQfz1BtrwZiIYkEuTBOSqU
 CBQNeNvST23a1eVHEQxZ3wtMpooSHBgRze/Ntg+9/TCS5+yzcA2aktwCQVpf9/jYXQpZ
 19SnkWbhkeeqdBZyF407Iuq7SRyrCc+vJWTSYi3CMJGlgV0Jn2T3YZuLzeuKAMGx8bqm
 DGzaxwxWukcZotZkG5LPyPkoa2Ya+7rVtlrBervGFKpXvqgnaTL++natL/znB7/rnyC4
 rajw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=cEaR7qXs
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2024.85
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 675715dde..a901656e5 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  16e22b66b333d6b7e504c43679d04ed6ca30f2838db40a21f935c850dfc01009  dropbear-2024.84.tar.bz2
+sha256  86b036c433a69d89ce51ebae335d65c47738ccf90d13e5eb0fea832e556da502  dropbear-2024.85.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 1571c5d95..d9504c552 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2024.84
+DROPBEAR_VERSION = 2024.85
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
