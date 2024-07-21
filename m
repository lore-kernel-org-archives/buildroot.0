Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2FCC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D70605D4;
	Sun, 21 Jul 2024 16:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRJbi6qPl12Q; Sun, 21 Jul 2024 16:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 297B0605DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 297B0605DD;
	Sun, 21 Jul 2024 16:57:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5ED11BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A325640120
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NVjh_D0eqHv for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16A44400F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A44400F3
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16A44400F3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:57:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3687fd09251so1297782f8f.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 09:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721581041; x=1722185841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ghARpuOJmEVX9ylRlfjawosjTxGsE5uPyqCnO6Cp4YU=;
 b=lID5Qh71cw/tJpMC2VmH7KHMtPQb0SxzghDpPuEMmJxmsKIGnbIumsYB2e1Vq+XXE6
 u2UPsBEgOdNKK7i1KkxQq8RsR2A3at99nW/2eax960WrcTAEYa3QAyX0BBagzFOpsadz
 11Qkpqxhx5K6emjFJ+NjvvggxxlaoOF+u5T1Re1BeA/xif7shOITYxkLwnVaf30DhNwH
 MMGMy6Q8fZGC7rzUrXvV5o0t4+dxS5+W+rpuoRYRBStHwu/cB7M/+ftZNayq/UwPreXh
 wwB6rz+lKgM33zFK7TzoeT9IKCRUTQOjrUn6CGLYZs4ZJPj8aEm8ibfTdmetO/nTIVeH
 8lNw==
X-Gm-Message-State: AOJu0YwkDPCn59Yr4nymAQCunkgb7qzp5u5I4TWCOjqR9jDlIFbFZPI8
 PHbtRwlSPun8nq3kljzYptDyxn2lhb31NBcBPPgVICCPg5nZ6hDVKjN8iA==
X-Google-Smtp-Source: AGHT+IH08YjlkL6p2prhK6PPD9sk+QC1H6aL74ibuXtjepLEmcXuCg9qafwa/TttXbHMw6j4GhJM9g==
X-Received: by 2002:adf:a35a:0:b0:368:6633:c550 with SMTP id
 ffacd0b85a97d-369bb2ba6d7mr2683729f8f.52.1721581041377; 
 Sun, 21 Jul 2024 09:57:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ced05sm6353476f8f.67.2024.07.21.09.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 09:57:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:57:17 +0200
Message-ID: <20240721165717.1996106-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721581041; x=1722185841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ghARpuOJmEVX9ylRlfjawosjTxGsE5uPyqCnO6Cp4YU=;
 b=DqtccdWXBwsZGWkScvzVN+LfpvZOHUOE6IXWDxjrgmV2bjA0gFmogOoCSdME+wQHFz
 yc2Ogtc0qDOOEN6JwnlCzeELaH5nOLPIXkhnwe9sRzMdmezHQm4PRY3Hw64Ub0Dvq3cy
 LR2rDkpkOIEmSqb3C+KDHljVKOtSF9hCMWLmbBk8hA2XM6m0hFT1jdNAt24SYVyWBSZq
 ryn7Q2iqJO97VKn8mDqNDBOk3kcUDpGaeyKN/oIrBO1gRq1IdhaPoL+MIBQ+xQruow2W
 wUbzyDJgT/nmHzcnaijzdD2HLq8To2BQfxvZ+hAC43MYy11Y2xt0LNy/XhcWKqXqF865
 7pBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DqtccdWX
Subject: [Buildroot] [PATCH v2,1/1] package/gnutls: disable tpm2-tss
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable tpm2-tss to avoid the following circular dependency if
BR2_PACKAGE_TPM2_TSS_FAPI is selected:
tpm2-tss -> libcurl -> gnutls -> tmp2-tss
resulting in the following build failure of libcurl or rtmpdump since
commit caff4179a4481233257f5f475ca57ce9061af900:

configure: error: TLS not detected, you will not be able to use HTTPS, FTPS, NTLM and more.
Use --with-openssl, --with-gnutls, --with-wolfssl, --with-mbedtls, --with-schannel, --with-secure-transport, --with-amissl, --with-bearssl or --with-rustls to address this.

[...]

In file included from rtmp.c:32:
rtmp_sys.h:110:10: fatal error: gnutls/gnutls.h: No such file or directory
  110 | #include <gnutls/gnutls.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes: caff4179a4481233257f5f475ca57ce9061af900
 - http://autobuild.buildroot.org/results/72e1843de650c9ed4795f1141e9fd485b71a14c3
 - http://autobuild.buildroot.org/results/918f0f7efa810b17f6d2266a890bf0150cbed146

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Baruch Siach):
 - Add --without-tpm2

 package/gnutls/gnutls.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8302194812..cf2f02cc9d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -30,6 +30,7 @@ GNUTLS_CONF_OPTS = \
 	--without-librt-prefix \
 	--without-libz-prefix \
 	--without-tpm \
+	--without-tpm2 \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools) \
 	$(if $(BR2_PACKAGE_GNUTLS_ENABLE_SSL2),--enable,--disable)-ssl2-support \
 	$(if $(BR2_PACKAGE_GNUTLS_ENABLE_GOST),--enable,--disable)-gost
@@ -99,13 +100,6 @@ else
 GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
-ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
-GNUTLS_CONF_OPTS += --with-tpm2
-GNUTLS_DEPENDENCIES += tpm2-tss
-else
-GNUTLS_CONF_OPTS += --without-tpm2
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GNUTLS_CONF_OPTS += --with-zlib
 GNUTLS_DEPENDENCIES += zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
