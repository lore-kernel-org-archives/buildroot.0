Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5ACC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60A160F70
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C60A160F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982CA40503;
	Sat, 13 Nov 2021 13:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7ySHQ177Spa; Sat, 13 Nov 2021 13:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10043404FE;
	Sat, 13 Nov 2021 13:29:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 400601BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E8F540245
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0X9BOLtcJddV for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A5B840204
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 133so10026443wme.0
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gMgLjVlAKIXVjXUcq93RzQmDYAKxlmxcYCXrU1UI1cM=;
 b=aOS4YzmSzNBrKB2btXn8n/G7rj8FpIhjJ/V+hU9qLoRxYA9qJ1MoSridNuZ+C8llic
 BJEqDJKjYwakf68uivmejHxoEDHMLpxHnXu+weLWwkyEpkLJGLlq+AXCZIPxZLXL1j9r
 nkbP0GPex4l8FwKq2biA8jrLnTJ1xXoyy5UCgmK7zA45OaBn4UYdkb1+kjipzMLiuWq4
 frkJofKt9CYWXClxcK8OVW/+EJG2txstmrysX+uE1OwhN7ZXph1ABwtHlY7taem+HO3R
 i2eFw0EJ1Vt4RwiBQbswSuY6crwJL4Qwzk7z/N8cQkMS6pEJFA2LaFNri0QI0OuPeVum
 Z0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gMgLjVlAKIXVjXUcq93RzQmDYAKxlmxcYCXrU1UI1cM=;
 b=nhCQW3Fr8N6vOe97IPfrgjS9rqHQiR0DTDsjmwi9YnKY4kbJMnspdVXqA1Hwn8Jz+/
 a8NJ+0Uuhl7bnG9wzLN03T/c1PXmsLDrB9PiCpbd7uSD2dcchs//kZDgab3cBVUIE/R0
 p+Vsv2I0oQBGLz30qyOsSUyVq9bzs7ActVbYiyIJNsKx3ARsb0N+p/IQhTO1QJzIZJxQ
 Z/TXA/1Qypf2u0IpAA8NDasZxIdNez2U5az8z4ezPU9ikYHV6ZmNIkpDu0g74fpd6zIc
 Gpxa80jG7PeJvLrLkfpiPp9GMKan26nOQLfWCiOCev/IUrjLg0tZ0VRq9Ee3luLtShsx
 06iA==
X-Gm-Message-State: AOAM531ZQk0t/9rCXExNQtGe/Szad6DFSuwhIID2Km5qwXmAVkvLn7OH
 SplzSgBRYpqliGRkU0Po8ycR0c7WN5DFKA==
X-Google-Smtp-Source: ABdhPJyQ66iBypmfyZQre8Zh5LNEix005jK46PwdcEfS3ASaSVpViBUs+e8cSKEe8X9E9uMTgLhRcQ==
X-Received: by 2002:a05:600c:35c8:: with SMTP id
 r8mr26313981wmq.8.1636810111524; 
 Sat, 13 Nov 2021 05:28:31 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:31 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:16 +0100
Message-Id: <661e87dcda8a33ae3aa6416cf37427165982f119.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/16 v2] package/pkg-python: do not set empty
 variables
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Similarly to what we just did for conditionally-set-empty variables,
unconditionally setting empty variables serves no purpose in Makefiles,
as unset variables are just expanded as empty...

Even though we have numerous python packages, the speed gain was not
measurable, with delta much less than the noise.

Still, for consistency, we just do not set those variables.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-python.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index ce0fc97283..4cc416cea0 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -127,7 +127,6 @@ $(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
@@ -135,13 +134,11 @@ else ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifeq ($(4),target)
 $(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
