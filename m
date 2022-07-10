Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06F4C43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 21:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A5341715;
	Sun, 10 Jul 2022 21:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A5341715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1u5fGtKCoezN; Sun, 10 Jul 2022 21:31:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1424B4171A;
	Sun, 10 Jul 2022 21:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1424B4171A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7CB91BF3F6
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B21A041715
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B21A041715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Sz8HuGiTeu9 for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 21:31:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58D7B4161C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58D7B4161C
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 21:31:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id l68so2057786wml.3
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 14:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cERrM3PfDl4nsGRcyMPXgnzzLY8HUa4MC01uhA8FDD4=;
 b=C1EIDvgZf2xs3wh82K9Hp5SUPt0XYyP6KljN/FqQkWar5fXR+OeR/JincFyVyzNrSB
 Dqg2UlUXFzIRLzQYiMjZCNRPvQrksNEU0eyN+3LykOAgusB5eZ4VVk5KNnSQOWxMqZVo
 auKQiZtZuAkJCPacRuICpRYzU1i1TPkDBiGTKz3CawEGQ6FVK9+N+Ocwt3AmCJKLnpGe
 fZ8oie1HqOeXf9fzPotbPMEL9f6/Ycsq3qG078SszlDag6ZqZCcNNd93q8M3eUIFnZRz
 fcnXpnTrbHG/iEz4Sxp8IsoYwDxVYH/hNR3GGZ5+rwf2mnwz6XjPQS82YJ3k/sQrE7zO
 PWdw==
X-Gm-Message-State: AJIora+FFsqgGktlamrzvRH8vsO74+Cet2tFJN5rHTQK8kDmn3jnhyrD
 CE1PkD9lDVOBrXzOV9pbaMgcNw7RGEQ=
X-Google-Smtp-Source: AGRyM1teClC0J6e4aG1ETedZ/RQGBsIS065GV1jWa/kq1WiuI+cI1MpGXgROyNGsx/BAfeRzZsFDFg==
X-Received: by 2002:a05:600c:3d0e:b0:3a1:8cf3:3f1c with SMTP id
 bh14-20020a05600c3d0e00b003a18cf33f1cmr12324653wmb.0.1657488679313; 
 Sun, 10 Jul 2022 14:31:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b0021cf31e1f7csm4235706wrb.102.2022.07.10.14.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 14:31:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 23:28:21 +0200
Message-Id: <20220710212822.876720-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cERrM3PfDl4nsGRcyMPXgnzzLY8HUa4MC01uhA8FDD4=;
 b=jf5y0rWbNlwTOOhRRKFI4LpW1NvS3vr58v2qcrKYQOkvrlqUom2rvUJQRZ/fqi1ZKL
 +5MgTIu2W+5M6LdbnnYpehPgjibUH4MiTCWXWNwsqYLgdCtHdg+DfWPSnDxTHcN6H5Vo
 QZULONDS8fwqtwx2LiUG1T0tYIi2uzO2+MOp89Q9B7XPEMjhmrV+qQPEnrRQVw1pOCQz
 pD76eku9fs3a57KwWFB8XuFR7p9qcqeUnU7RMmiram6qPfS3adFiuAjNviKaY1boktvb
 IRPTOlq0cBYU0Uz/Mbo2siYAi1x7Laklg4r1Z0db89eSEDXS8pBfkAtJ8czAtU7OL8xe
 2kgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jf5y0rWb
Subject: [Buildroot] [PATCH 1/2] package/kvazaar: bump to version 2.1.0
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball and so drop autoreconf
- License is BSD-3-Clause and ISC since
  https://github.com/ultravideo/kvazaar/commit/57883369ca05bee0dbc0b36fb2c78985f906a523
- Update indentation in hash file (two spaces)

https://github.com/ultravideo/kvazaar/releases/tag/v2.1.0
https://github.com/ultravideo/kvazaar/releases/tag/v2.0.0
https://github.com/ultravideo/kvazaar/releases/tag/v1.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kvazaar/kvazaar.hash |  6 ++++--
 package/kvazaar/kvazaar.mk   | 10 +++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
index fe3255a6c7..20b8e5918e 100644
--- a/package/kvazaar/kvazaar.hash
+++ b/package/kvazaar/kvazaar.hash
@@ -1,3 +1,5 @@
 # Locally calculated
-sha256 480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9  kvazaar-1.2.0.tar.gz
-sha256 531712277c3543b9ee86c4c4e0e424f531b893a44cc021c74a24b038d8de4d2a COPYING
+sha256  a76998462924ab8409cf8de4947ba5a5023daa33207676e9c4eefc2bbd46c834  kvazaar-2.1.0.tar.xz
+sha256  4caf7852236f62bfd77aac10a7b9a42372b00aa461ad8912780cd865a39062ff  LICENSE
+sha256  16f569c87d5ec20b7474b55ee0a8877b8f8b4dc13f9567ebe0b8fe8afdeb34d2  LICENSE.greatest
+sha256  f84c0f33873a015f399d8171cf321af2f09ef915ae7ad5a9edaa7d0286cf9d5e  LICENSE.x264asm
diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index 29433d6eb3..e2ab132203 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-KVAZAAR_VERSION = 1.2.0
-KVAZAAR_SITE = $(call github,ultravideo,kvazaar,v$(KVAZAAR_VERSION))
-KVAZAAR_LICENSE = LGPL-2.1+
-KVAZAAR_LICENSE_FILES = COPYING
-KVAZAAR_AUTORECONF = YES
+KVAZAAR_VERSION = 2.1.0
+KVAZAAR_SOURCE = kvazaar-$(KVAZAAR_VERSION).tar.xz
+KVAZAAR_SITE = https://github.com/ultravideo/kvazaar/releases/download/v$(KVAZAAR_VERSION)
+KVAZAAR_LICENSE = BSD-3-Clause, ISC (greatest, x264asm)
+KVAZAAR_LICENSE_FILES = LICENSE LICENSE.greatest LICENSE.x264asm
 KVAZAAR_INSTALL_STAGING = YES
 KVAZAAR_DEPENDENCIES = host-pkgconf
 KVAZAAR_CONF_OPTS = --without-cryptopp
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
