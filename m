Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D321C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6798E4012B;
	Tue,  9 Jul 2024 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cip_liVKCq16; Tue,  9 Jul 2024 20:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47CAB40EDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47CAB40EDF;
	Tue,  9 Jul 2024 20:25:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53F0C1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F10410C3
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRRH6s_zv_yg for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30269408D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30269408D2
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30269408D2
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:25:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso368485766b.0
 for <buildroot@buildroot.org>; Tue, 09 Jul 2024 13:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720556700; x=1721161500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CJx+uE4A2cd4iZIAkguFN84e/nGLP1GkT1O4epiEQzQ=;
 b=O01N7eI8Gt+CSCdYefNpRye99D94+TZCEjJxr3p6QmeQFC23at16wl0QmlhAgm9Vq0
 nj981HrF+g2ySTVm1fFfdmcFVQ6OyyX5NtP4iidwK+yFf8wDnaRlCwrBJ5gvHR2kiPGF
 VepBOkryZ8umfq2v7JEcBaWROmZTaN8Sk5MX47eR4Qq4fik9095PjQcCTeauMM4cb9ue
 KqJ2aTKS5kWWeFwFcpuy9+ffJXU1uP/51vGVGkwClKuBcTNRet9VgPL4EDp9FmRvne/p
 jCElh9rUVLTMp+928E7hDId1lFqSc++q8Yww/rLw+ea3qW0BfxO7tlEu0BcFYyHbeexD
 I6tQ==
X-Gm-Message-State: AOJu0YyB+WbOlyEYoSNYvhQQ7EAzUc69vKNBlGIG8m+plFh6DZoAevHG
 /4oJdiohk2ZGAV4PIqWIzu6hV1CMi6wk4ylJKcYk4tL6KvCAcHqiOY4n1g==
X-Google-Smtp-Source: AGHT+IHvVwc2fvMQyyo1IwfJOMp9h2XIaYA0PN83HGbQa71TaCxeLt4gi6blBBrTafJtEEUI9ZWocg==
X-Received: by 2002:a17:907:7284:b0:a77:d1ea:ab36 with SMTP id
 a640c23a62f3a-a780b68a2d7mr296080766b.6.1720556699821; 
 Tue, 09 Jul 2024 13:24:59 -0700 (PDT)
Received: from t450s.fritz.box ([2a02:810b:5a40:2a43:ebf9:27c4:a10a:331c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7fef4esm103988966b.121.2024.07.09.13.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 13:24:58 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jul 2024 22:24:39 +0200
Message-Id: <20240709202438.27298-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720556700; x=1721161500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CJx+uE4A2cd4iZIAkguFN84e/nGLP1GkT1O4epiEQzQ=;
 b=XodOiCMALcElnb4Cr78Bvt2DqnUlqBGbrbyWiQV6hybM3+CD9mvVH475dmzCxlJgQ0
 LSlSuWH6/6YtmqzY4/V/rGOSVBIfIuSXCRDOenDiQqPrwGM9B168t9WL4dVVl1dJ75Qe
 g8MTO4IotOMtVM0fhcTt95hlxeBuyeMpzAVxWXIbIKCLtRR6IgjF1jkXLr65XGW0db3l
 UvVIysBlGTJbSuGGMa1JXQgP+1YVwgmZQVOgyn7jfhNSRuaRUmSKJ49iEYU4743VzhhE
 +iySlVIc9VGcqyNpONfgOCptJBddfq6vJm0DvdfLWZ4A57OIeKUw/i47IjQh8BkM3cef
 Aw2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XodOiCMA
Subject: [Buildroot] [PATCH] package/libssh: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes link time errors, undefined references to various ENGINE_*
functions in case libopenssl backend is used.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 1f271a692e..eaec754414 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_LIBSSH_LIBGCRYPT
 config BR2_PACKAGE_LIBSSH_OPENSSL
 	bool "openssl"
 	depends on BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 
 endchoice
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
