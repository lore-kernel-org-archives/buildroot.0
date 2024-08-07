Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43B5C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A28ED60A9B;
	Wed,  7 Aug 2024 14:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4ZHcGMPL_ZA; Wed,  7 Aug 2024 14:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CFC360A84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CFC360A84;
	Wed,  7 Aug 2024 14:35:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 145221BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 748DE608B8
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtCnK75m2T5t for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E612E6088E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E612E6088E
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E612E6088E
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:48 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef7fef3ccfso19790731fa.3
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041286; x=1723646086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxOE7FBmfSbL3ucf4kZCU9U1QOwVibBKi7ZxfRSsQCU=;
 b=rdtEBq2NtxnTrtIPpSuDnFEb05PLfXwvvOGdipDdn87uC7TtdisQzonnte3s3ORWfd
 b6jqCmD8DM+bV83WWh5nI/HP95SKXPE4h7U21KWism+/73iYJA1sJl2Woz+n/+Aes31y
 Qo81NLh04UFgR2uYCgfpT3rZSqV/RrT7+KG3Hr0Pk7dwE4HY0RzINwmCdSAgBbFetMLl
 HXU4mapo/8tI891FaTSlQrpmnlJ14AIF4lrOEe9FFz8xJOa6tOmYHANpWWlRnGv1P+5S
 LvOARlkSbnDjhUwtdV3beZnkLZhpRL82Zr2NSyYQKJMxiXxP0fgcLIQkexGriJ6QCj2E
 wWUg==
X-Gm-Message-State: AOJu0YxPI//k4bbCP9gsQrtYqatmXAco+a1fF8TW0GcPDt5NTywMVKA6
 uKrFcEvFrtZy0yldKDTIp1Swf0PyYjZZf7AFauklUNQ1zQKZZZaAr+nXbQ==
X-Google-Smtp-Source: AGHT+IHtZlxts4w2uQeUo1az+mefSN86dLXzbu+4BZ+ZYtH7QUDcleqkEpyLmfIdQk7P5gn/fUdeUA==
X-Received: by 2002:a2e:984d:0:b0:2ef:21a6:1d72 with SMTP id
 38308e7fff4ca-2f15ab3ce0amr124153161fa.48.1723041286065; 
 Wed, 07 Aug 2024 07:34:46 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:45 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:16 +0200
Message-Id: <20240807143318.439619-17-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041286; x=1723646086; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxOE7FBmfSbL3ucf4kZCU9U1QOwVibBKi7ZxfRSsQCU=;
 b=XWAIh/KHJoRuT5sy5ilgDi+VuQvZbQqguutm4tMM6oozgBVGA/DpWA03uMDRWYJGrx
 Jv4PD+y5Qzile/olcNIUolc/L6WmvFpD6FnF4rXtXrB9jMusgcCBepJxHYdSdriquWD9
 9FfROEpI6uKfkyZZvPxVkYd0JOxBoWi6tcjUJ0GMY7M5ePj4NYQusZDGZWZtg2Vp3CtA
 sHbhGrALrGs3gRYIK2jW6z3KfYIXIIK43iANpXYq6vKv2dFAe3x+E7xhZpvolihYJv5D
 v9Q6PLkv3X6jOhycqGDUyJnLw63bniWSYKvfxpttrl62NtHq+RsXOeePj8/Az329wRrN
 jmGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XWAIh/KH
Subject: [Buildroot] [PATCH 16/18] package/erlang-p1-sip: bump version to
 1.0.54
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 87c0742bfc..d2e40e8fdc 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  895a143fc90f0222649d103dd524def7fed6665c52600c2bba61e9f69d132372  erlang-p1-sip-1.0.49.tar.gz
+sha256  9336f02ea99cfad359c78c50fdd9c3061aac7b31966abdc3223f56b3ed7cc377  erlang-p1-sip-1.0.54.tar.gz
 sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 45c70e8899..36758b8681 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.49
+ERLANG_P1_SIP_VERSION = 1.0.54
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
