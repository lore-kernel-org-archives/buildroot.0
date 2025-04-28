Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23CEC369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 12:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 742C9606F3;
	Mon, 28 Apr 2025 12:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Lr0I5Fucu_n; Mon, 28 Apr 2025 12:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99E9E60701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99E9E60701;
	Mon, 28 Apr 2025 12:20:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A45194
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 12:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 234F981222
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 12:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18x4b_agXMRK for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 12:20:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1195880B25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1195880B25
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1195880B25
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 12:20:09 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5edc07c777eso5889074a12.3
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 05:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745842808; x=1746447608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rwyajz4Nb1YrNYwxqko/s0JaKFw2AWH21DYrDwdVpUc=;
 b=qlqgwfAVzcPoSIGdSYioabVeedrefs4lSdiJ+EejpOCRUOqYqHhrYFsixrcrjBxoTF
 3KStLIbzmR3TPlGCmj3ppIfCjRsdf5fLZVmnWPCm63K15lQlA+r/R8/JEZ/ZBifQEvyC
 QRf6JwivtqaVDLhUQ8TE7zrYLD3CIpmbKE0WygXLC5XRanDzTeWbnzu/cszcB+bd75Er
 5E1qhnW+fr2Nvp+w9GNVWmesZOv8dJMY6jqHIYleRsSPCm760K0Fit9T31eIVMS2AOD+
 ERm36xeK1mDU6i+5xEIoJhJqLWZgh8OjlYlzUPDO1REyyG9UKy112b4UbgoXd0/DmJ9X
 xEaw==
X-Gm-Message-State: AOJu0YxLb+RqjwRttUdpoPdd2Gv5rG0soQVwwPbsevLS3IXEynDrLeLJ
 MGX4bBUqTX6ZZmOG2vjgTWc0v/KdSzPfQzkQRG/UhAuxUfqMGL2l9WuvMMXirUBiLbowYSi61jR
 v
X-Gm-Gg: ASbGnctU4iYld+TLo6bba8iq1kbyjW370bfsBkRxlz3NywS0miDMOkfLZrP5Di1c/YQ
 KeHeK5zoY7HAtAvDAj4rXc9gojl5Ti25tSaOjFLlgjJ4Msc2JubqfHJXs9EoOQWxII7ysZmXB9X
 IgAt99oUw6gM35o1JJNRfiFaY0tKmjqnD6Ki5p5yeL2YeL6gEZTiY/eujPRYJdAtT1gBR1TQaTq
 GUl1niM1fu4twkq5b/FzmqteNd5yZmyf3gC5IgE8I3RN3s9hUWn181c2eEddlY4VF+ZKcB4uNaJ
 OuGosG1th4UNfhfwCN013Czbc1ZWUnn38yFoA4wq0TbUBr4uobdlGFBxTFViUqTVzg5L4YHMlNy
 2YzVmnw==
X-Google-Smtp-Source: AGHT+IGf9SjOxsofJPTza5x+6YNvn3jdV3t5/CB3JUYTD83ihWyvMWGf+ai0XNOqihb3f2+XDuzfxA==
X-Received: by 2002:a05:6402:e9b:b0:5f6:4a5b:9309 with SMTP id
 4fb4d7f45d1cf-5f72297e1e7mr9153719a12.20.1745842807850; 
 Mon, 28 Apr 2025 05:20:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.204])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7011fbcbfsm5748233a12.9.2025.04.28.05.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 05:20:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 28 Apr 2025 14:20:05 +0200
Message-ID: <20250428122005.3952218-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745842808; x=1746447608;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rwyajz4Nb1YrNYwxqko/s0JaKFw2AWH21DYrDwdVpUc=;
 b=o1MHWiDC9mHbU/ojKMgDDKKhdMikyWocLHXPkQcD6jEclVJoWP5km0jUBJSW1imRGq
 pn6yQqrw4XpdKCXQlb+Z5/SmVTlHPkGsHgLk9fBlY5ZpD3aIuk0OeBg/msseIoxmshit
 ogI/pS+K/m/VXEj11EsoT8imlVIS3ZygaH9y0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=o1MHWiDC
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.4.2
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 3161d2df8797..61ed4d85283d 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  26ce272bfdc8246c278e6f8cfa53777a1efb14ef196e88082fee05da1a463491  armadillo-14.4.1.tar.xz
+sha256  6dfddcfbd91e70679d7c11e94a5963a7efda002fec351e6f4875ac8e245c5117  armadillo-14.4.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index c41e60625e2f..3ebec29cf3b6 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.4.1
+ARMADILLO_VERSION = 14.4.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
