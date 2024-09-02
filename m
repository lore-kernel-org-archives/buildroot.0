Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2769BCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E90F8402ED;
	Mon,  2 Sep 2024 20:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zv1n7f0z-swF; Mon,  2 Sep 2024 20:35:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DCE640313
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DCE640313;
	Mon,  2 Sep 2024 20:35:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 516C31BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CCEC80B0D
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWWGNLiligR2 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3C3280B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C3280B07
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3C3280B07
 for <buildroot@busybox.net>; Mon,  2 Sep 2024 20:34:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42c7a49152aso25251525e9.2
 for <buildroot@busybox.net>; Mon, 02 Sep 2024 13:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725309298; x=1725914098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqmxnaw/ATj8qc+n7ahRizLRLzgnz+jYdIOkif8x0Eo=;
 b=EZL1UO1pp0DfFZkF7PWGnxSBn4KMIWC0tT3CYAEZJKJq6ZPXzeGdRl1QEnset2Y8n0
 dxVeOVMTQsKGPT/Pv2ucxGXIlUjhVXUU24TPPtRv1Vy0vC3ogUwh+PZHETi5y4Zkjzuy
 H0JdSAzi+ixHT5b/DAajK9xh6Fnf52/vUk7/6B+C3nl5WJKaXr3eYP1ThHHOyQUbp3mW
 wwmCV6ejninz17Xw2Hknc4Csao67NkKI4XIxdFV21TfTyLvPlMI298k8wbjxWHLQE7iN
 NaR447ZOCp6LuboR0i+XW/WZ3urBphEB9M/5yOIJwKKhDp010ULWB+SrB8TYeXn/zdFz
 fjtg==
X-Gm-Message-State: AOJu0Yzwkl0HFFoCnupmz/TTshTnr/3N18OclrYo0/t3jkRDn7AKsZcc
 q0LMKAjbbI+2eGTHiYREEL0XM5//zX/t32iFhILfwbOk4WV7p5+XHVOn2mK8RrlaPuCTl42Apf9
 DUw==
X-Google-Smtp-Source: AGHT+IGZFNz5iIRBYfDRouYxhxitY8/B7Br0HrfwxC/ujMeqYAogfF4Yp41CaHpC0UKMFiUWteG2WQ==
X-Received: by 2002:a05:600c:3b11:b0:426:6714:5415 with SMTP id
 5b1f17b1804b1-42bb01edd2bmr112554155e9.30.1725309297372; 
 Mon, 02 Sep 2024 13:34:57 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbc36bd88sm119913715e9.24.2024.09.02.13.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:34:57 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Sep 2024 22:34:54 +0200
Message-ID: <20240902203454.2649413-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725309298; x=1725914098; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wqmxnaw/ATj8qc+n7ahRizLRLzgnz+jYdIOkif8x0Eo=;
 b=hJszkNHlukgA/Yr4ht73XrkiyEm+ux7XZWarypx3simBHYbGCH/i5YEtbgk2KjeD2M
 +7LlWF1i+XLTuu/01Nu/6fZ82gsyfX503930VZQRjoMJvjbKgFW7rteWnrh7NWfLjT+Q
 tGq2QBsS9HCTKOo1xhJtrf/627mvcB475ltxuiXm4pV3Bk/CYotZ30ozfMQsf3PbZtrB
 ITafA4Ahg9aeZvQdIWaAZ9g/CTSipp2XHQI1ARNA+JxV61lnYilJN5ZIzlTu1dAcLQpb
 bwJ+Mr/POoXdGL9y6xohVvzpvEJPscc/+PS1jL+KUmRrRQTKSRM6y6tdebiPbrCsX4mv
 d32Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=hJszkNHl
Subject: [Buildroot] [PATCH] package/dbus-broker: bump to version 36
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

diff subprojects/libcdvar-1/AUTHORS
    +        Kostadin Shishmanov <kocelfc@tutanota.com>

diff subprojects/libcrbtree-3/README.md
    + * **Documentation**: <https://c-rbtree.readthedocs.io>

diff subprojects/libcstdaux-1/AUTHORS
    +        Copyright (C) 2022-2023 David Rheinsberg
    -        David Rheinsberg <david.rheinsberg@gmail.com>
    +        Adrian Vovk <adrianvovk@gmail.com>
    +        David Rheinsberg <david@readahead.eu>
    +        Nikita Popov <npopov@redhat.com>

diff subprojects/libcutf8-1/AUTHORS
    +        Copyright (C) 2022-2023 David Rheinsberg
    -        David Rheinsberg <david.rheinsberg@gmail.com>
    +        David Rheinsberg <david@readahead.eu>
    +        Jan Engelhardt <jengelh@inai.de>

diff subprojects/libcutf8-1/README.md: minor wordings

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dbus-broker/dbus-broker.hash | 12 ++++++------
 package/dbus-broker/dbus-broker.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index 06c8f229b..fd4f43d16 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,17 +1,17 @@
 # Locally calculated
-sha256  23713f25624749fdb274907e429080fa2d8f4dbe76acd87bb6d21a3c818c7841  dbus-broker-33.tar.xz
+sha256  d333d99bd2688135b6d6961e7ad1360099d186078781c87102230910ea4e162b  dbus-broker-36.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
-sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
+sha256  ce7b8b8fb05126e556b3f9ed97fe21aa654e4ff411c00a9fd219ecbaae26abe0  subprojects/libcdvar-1/AUTHORS
 sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
 sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcini-1/AUTHORS
 sha256  fc92d49d69aa9aa91919bac79242abee3eda27a567b4573ed3690b5cef0cf2fd  subprojects/libcini-1/README.md
 sha256  a30deb6dde90366bfaf054bc689a209b974f80c1cceac950c4378c14abaa243a  subprojects/libclist-3/AUTHORS
 sha256  75f4c76441ac69ba9474bb7ad0958389ca0f1f2fc90c5f7b033be3461652f5a6  subprojects/libclist-3/README.md
 sha256  23f24eeaaded5fedd6e7840b6f7b73838f9a4e2112ad6a12fe1ef958f73d0214  subprojects/libcrbtree-3/AUTHORS
-sha256  05113a24aca4c537819dd0d91b95b13edb85bea4b6a77a6d9269becb397ed374  subprojects/libcrbtree-3/README.md
+sha256  a2ab28f3a7b4b29c0a361c96e220555904bfd713c78134e66b7551774749b453  subprojects/libcrbtree-3/README.md
 sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcshquote-1/AUTHORS
 sha256  cad109dd33062518a437ebee145ba863fe0e047d4e3db9c28b0bf3c6148f10c2  subprojects/libcshquote-1/README.md
-sha256  e796182869fe0892347d069f3f423774124987d6c45d016854fc51530633c177  subprojects/libcstdaux-1/AUTHORS
+sha256  ec71c7ba4dfd282c434a00bde0c17bc347685be9d3df38d3a0df03adceb9d996  subprojects/libcstdaux-1/AUTHORS
 sha256  92006886d7f28894fef08bf97e35ef52147067bd3c4d4d6381da7c59f9901dae  subprojects/libcstdaux-1/README.md
-sha256  7e660796fea0400a1a9a539226c345b3c656a745a334e323e33258de7864e985  subprojects/libcutf8-1/AUTHORS
-sha256  106099cc1c488cbf8911f56da7977a955f6b27a7bb5b815985e59d9fae0e6fe7  subprojects/libcutf8-1/README.md
+sha256  0dcfdbd0298538023ac93ed6be1f5dfd2fa973615b07e3b85d8b1c89970db423  subprojects/libcutf8-1/AUTHORS
+sha256  a8d41713b802ad31c6c69bdcf475aa73f7be942986064e662039351ebb266d13  subprojects/libcutf8-1/README.md
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 4266441ac..0bbdd304a 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_BROKER_VERSION = 33
+DBUS_BROKER_VERSION = 36
 DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
 DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
