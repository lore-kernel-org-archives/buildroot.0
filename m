Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC823CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 13:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF7D40A93;
	Wed, 22 Oct 2025 13:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2_vgUcdF3XD; Wed, 22 Oct 2025 13:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D090E4095A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D090E4095A;
	Wed, 22 Oct 2025 13:39:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C63170A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 13:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3242080DDD
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 13:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcCzHIPkQIn2 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 13:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0983180DB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0983180DB6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0983180DB6
 for <buildroot@busybox.net>; Wed, 22 Oct 2025 13:39:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso1233550866b.0
 for <buildroot@busybox.net>; Wed, 22 Oct 2025 06:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761140353; x=1761745153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q3TCMn6jRWRz1Q54L2eo5/YvCMZEzVDuHURVS2/oq4g=;
 b=S7LDkNDVOM6MwMIRHv1WSlI+bgh2Gm1RW4GV59wcTgclje5zPl36GHM+mNaDE2tBvH
 SQrOZTAUp/xsRQgN0k7oYA+DPf8nBUkcRGW3FeFz19nXDslfr9N+Hs45lvzWxEIGGHej
 L268pKYDPSsq/0HP7X9fW9GYP5Dw2V2yYDerBZvOhMXiAzvU/iIlcW87jtCzSV+xSrFZ
 U5Ahz8fjv1CguMzpQl9qnuoz60y7/pKj/EYkkGqaNSw/BjlvM9J1gk54jmAdZNyyCA2Y
 Uurw2ABZhHBlLBBpYzp2Ixu/14RX/Qe7K3Yj3f2RCDy2vxjZ+nmtBWMjcDelj74fx4rQ
 rV5Q==
X-Gm-Message-State: AOJu0Yw1ruGgpJR93CdW/rJQur/TXrycOAgcoWt4sGnqX36DA9+f2fCD
 iPs7jdnuutNP9vjjsk5OwcyK7cELb3DUNLzX1Fqy19MdfuCX/jC5xJxtPnVj71BcNvvlOg9uAdH
 lzn2p4Q==
X-Gm-Gg: ASbGncvqShmXYj5XRtrctM2c8fZbQibcACtI8NFunJBxewDQ1e4xw8Ga5XuVKgWIaMr
 IdFYSYCMjniemkBWeRZrUV5UirzmAb3L/v/xZeGnT/nPXWWHvYQsyDM/i9aYyF7RuZQfv9MWGLR
 L+ZYUpqeFO4CgK1I/UHs5ljB249VeSSQATLkzWsvKMX2Aw2hFjBUkSMRxSrSV81m03T0XlAfUvC
 OzDsuxqfUysPg1iWSvaJrQbnLkezLZ9Fa07DbfQ/GiSylzyWjvMB8jIK8hDXI7EcYlIkc2w0In6
 kx1e1e13RoVfHetTtsAMZn5/t13h037haSUKcHLrEeMxQhGyYZGtXXq+3xYBOROhqHlPCefPSku
 tqmAp7xyzE35EwCTVDFZkh3x/cBOPJrv2dYfTOztBDdQJtjDELSPBzMz8ChaAKpVeKzShY7WiIq
 v4hUuDGrOR/Wb5FFkdVIG1pbTb6vvTxS44oaeXW2f4braJ
X-Google-Smtp-Source: AGHT+IGGzonD4qwQnupBugRaZROJc5YtDnP1qLpJDktnzHcSFhxoNBBtldXnjeUSHlRe1KqwGasPVA==
X-Received: by 2002:a17:907:25c6:b0:b2d:a873:38d with SMTP id
 a640c23a62f3a-b64749408dbmr2751004866b.43.1761140352520; 
 Wed, 22 Oct 2025 06:39:12 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c49430145sm11903621a12.19.2025.10.22.06.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 06:39:12 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 22 Oct 2025 15:39:07 +0200
Message-ID: <20251022133908.230789-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1761140353; x=1761745153; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q3TCMn6jRWRz1Q54L2eo5/YvCMZEzVDuHURVS2/oq4g=;
 b=XjSZvpws7nSENYWwZw5svNTILwiMX7reyUf6HdRXI85hobEvRUkd0rnK5QrozRyno3
 bsox+565gaaZ7RjHLbbxR8UuSODq8uSldDRF4JkkFFyD1gQutkt14odxsisSX8K5Re/e
 MuCQ1rnq/R+XF6rvm0LdWFjJHVQcEh0KMfiOYuqkehBDfudx47nxyrAVvKGfvIiemGeP
 8JIZvuLbJ7luZNyHbIE6w3Vz85TuXxNwut1FzUp/3+BH9v2o3DViQfjd2ZrtU9HeFd/3
 rui3mTgjVUeKEZ43IrDj+QDozj6PuwkSIK2r8xGV4BIMb47k4JWqzDZo7oh9qdWrh6gD
 sYSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=XjSZvpws
Subject: [Buildroot] [PATCH] package/at-spi2-core: bump to version 2.58.1
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 4257ba03a..780456dca 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.sha256sum
-sha256  e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc  at-spi2-core-2.50.0.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.58/at-spi2-core-2.58.1.sha256sum
+sha256  7f374a6a38cd70ff4b32c9d3a0310bfa804d946fed4c9e69a7d49facdcb95e9c  at-spi2-core-2.58.1.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 828280de1..f6d2b5264 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.50
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_VERSION_MAJOR = 2.58
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
