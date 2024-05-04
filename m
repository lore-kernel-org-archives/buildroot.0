Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B84C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D38C3404DC;
	Sat,  4 May 2024 21:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJ_xUdVOq0Tt; Sat,  4 May 2024 21:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A2A841589
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A2A841589;
	Sat,  4 May 2024 21:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E069F1BF86B
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE37B606AF
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXfHsk7LxcQJ for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 54C286068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54C286068F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54C286068F
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41adf3580dbso3912165e9.0
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858831; x=1715463631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EGC9MeV3phHuds6LPINn/2RDL1MIaldxPtoWbFCCnOE=;
 b=kE0Ksfry/0MZ6fhMlBzQmVrCsZNhOpqm6VMWvZ72pSrsr0rW+0MdcqHdUmzFwwuNSi
 1SxDQWrs90DRbJabXfFh3QvlZIMvMSm26P8hwFvsJoou+kytxs27UqInLfQvp+Lhcozk
 P74WQ8gAWeADDvf+Z5fBz/98uoRQE6jAX/Xydd4AaS/GBPaILfpbszhm1S49qMJtbZYl
 lycQpR8UyStc3W+kjxFxP0FfgKSnAKF9qvbOgp8HbyKUUFD6sryz+CnUvclv2l18S3rJ
 hmUW4PsAeuWVbcnvEOmb8dMPLwGI/H9djLQ+Hfqt7dI0TlTOsw6QQJ3l28Ork3SC0K7F
 RI3Q==
X-Gm-Message-State: AOJu0YxCUR9bwRLNPKwFZ3U5sciTbfR8ZS+PndotQKX29/dicja8PmEy
 Oe9R0Qo750j2B9f9CjN0zG59b0XpP+eBS5Whvi6dQlpoN2o/KSG7ddFQ3g==
X-Google-Smtp-Source: AGHT+IHnh7Yhzf7I9lDXlWerzs2mnmvVKQn8y8BtYpFPG2TdrdhgScOP8ecZ+XMvdWgV7EubZPdwtg==
X-Received: by 2002:a05:600c:4f16:b0:41c:66:18c2 with SMTP id
 l22-20020a05600c4f1600b0041c006618c2mr8312643wmq.4.1714858830923; 
 Sat, 04 May 2024 14:40:30 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:30 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:11 +0200
Message-ID: <09a1503be96b286bd2c4f9733f5ea648a20c6147.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858831; x=1715463631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EGC9MeV3phHuds6LPINn/2RDL1MIaldxPtoWbFCCnOE=;
 b=UNImtVW4ylsnRGS4XjDlx/iNjYgmAd6xIhKzU6L33f2mitFBwPfMINciIa4kbdtmWs
 YOB+JRaB974s735BClAnRFauX7wi2q8Q1CS8Zw6Ht+WmjZ5pGsXmkL08xi+F022Z0aCP
 BzQEkjX+1XCFdhUwHb9F6pX91OVHkNOfD/ceQpq+f8siobkHuBtVpEmEgQXYBXt8+xOS
 dDw8EVmX16CcFiD1NEAt21dF/LOcwBE6I2IgHS+ZwnjVhSSDcGqF4yqETks558dA6XPz
 qtrfSQeOORpEZg5oXBOqlvBczPWCfopx4ElRcuODa1zC9CFVIik/rw9ZphP/hOS6swyw
 dFhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UNImtVW4
Subject: [Buildroot] [PATCH 10/22 v3] package/pkg-utils: add vendoring
 mechanism into generated archive filename
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When we change the way we vendor packages, either because our download
backend or helpers evolve, or when the vendoring tools themselves change,
we must avoid generating new archives with the same name, or there would
be confusion when using older archives with newer Buildroot versions, or
the other way around (and that would mess with local caches, like the
one we share on s.b.o).

This is going to be the case for example, when we enforce a better and
more reproducible set of modes on archived files in the following
commits.

Introduce a version suffix for post-processed downloads, that we can
bump when needed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6181ae7a99..d1964299af 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -48,7 +48,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
 # Helper to build the extension for a package archive, based on various
 # conditions.
 # $(1): upper-case package name
-pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD)).tar.gz
+pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS)).tar.gz
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
