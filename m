Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBC0C004C0
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 21:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3D470354;
	Thu, 19 Oct 2023 21:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3D470354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2adR3EEefXH; Thu, 19 Oct 2023 21:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2899370352;
	Thu, 19 Oct 2023 21:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2899370352
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70FD31BF488
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 483DA4019E
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 483DA4019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcAZn6c8eKys for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 21:11:35 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0E8540106
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 21:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0E8540106
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c53c5f7aaaso1725311fa.0
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 14:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697749892; x=1698354692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TyT38jQleBikiHCifLabdhenh6ZFLZPpOznJ4VnXUlY=;
 b=o1HEXUrAohohZpVRivW/uxVKwkv4tVdlHy66Cv21XozzjGwd62eUVXw1pXqEq5kcP9
 S3uk/Hd2HEoAQCTw9jXcFRGLE4NetsXra413P7cy/RR2xkezfKMC+aH++pHCpB+8kmIu
 /p8NDhKh9aPkwryk7fkgV3qKzr3LB9SjYphs8Ia3GvpKO7XUYFI1t8Pfj+JLh/QTVLfM
 FsRvLDMp7NJCtDp/KCaYzc164i7ciKAxihG9sTWR8uqgL4T8tkmYtgAQfidCeUpwH/hj
 LfS8ghEnaqFJpD7rqr7q4nPH2Ej64nBoeF9lWwVaQHSpjx0IIJT1j1tRRvLMLS8X1+CI
 UHEw==
X-Gm-Message-State: AOJu0YxS/mVs/gF0j1CUl0rnZOHUJ+efVQ7q3Li5zqKzgkzXhcl/9Lv2
 Z65ZScYLjkPGnsW0/eLYwlIkdPAScTU=
X-Google-Smtp-Source: AGHT+IEMZUQ4/3d79mP3mjWgW82tDveTtlCoPRRbkI0acSgoJmFxKLkQGd4mFTV85Ue1iySu+wcfvQ==
X-Received: by 2002:a2e:a9a7:0:b0:2c5:18ed:180a with SMTP id
 x39-20020a2ea9a7000000b002c518ed180amr89381ljq.33.1697749892120; 
 Thu, 19 Oct 2023 14:11:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c150c00b0040586360a36sm5236068wmg.17.2023.10.19.14.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 14:11:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 23:11:13 +0200
Message-ID: <20231019211113.426849-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697749892; x=1698354692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TyT38jQleBikiHCifLabdhenh6ZFLZPpOznJ4VnXUlY=;
 b=XPzAGwzOfDB6hiX9774Bs4pCwBjMrdYgW/epM6go5QWv27LypqPKod7ugDJPBF+CSx
 5cvkr7GQ373ZAyoVAiHpz0vTLNBghpSqKSBdWKvr/XTQAg7NAtU2x4bZCKSoMg3xGkkQ
 Ku7gIlXv7W3Xpco7Gb9Yty8UAV6KMrq4sgpqPyz6fSMlNphIRoItAy9oMkefm/QLv0AA
 xflPh3HKK/9jqMQUDw6x5hGOw6us+GINU8Hwzx38xVFAc9U90BiZsGhcO5HyDTzPJVXP
 w5xrOIuloLlggU50bJDHTgXkx/GPesZ0dH2JZSUxNbH2Pr5Vouyp05s0XNCw2RcvrPqT
 BEYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XPzAGwzO
Subject: [Buildroot] [PATCH 1/1] package/suricata: security bump to version
 6.0.15
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

This is a security release, fixing a number of important issues.

https://forum.suricata.io/t/suricata-6-0-15-released/4068/2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 49341984a2..41befa61b9 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  cfa93de900d0fd8ba67c79fddec58fb7afb8f6c45b0773040035a15407b796ce  suricata-6.0.14.tar.gz
+sha256  1bd546149ac6671c2476d520a38eab7755e10c3080fd2ec2dc8624b0cf89ee75  suricata-6.0.15.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 2aa5a0c5ed..5b52635328 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.14
+SURICATA_VERSION = 6.0.15
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
