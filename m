Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B2C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 08:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7779381455;
	Sat, 29 Oct 2022 08:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7779381455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFdN1f-qv5eR; Sat, 29 Oct 2022 08:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D8038142E;
	Sat, 29 Oct 2022 08:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D8038142E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9941BF348
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07CD4401A0
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07CD4401A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyWOKNWl6A_F for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 08:45:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B53DF40017
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B53DF40017
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 08:45:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bp11so9330725wrb.9
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 01:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4DuFvX2fbc4BW16mAcsBL40mpP1o297L666OU+osAhE=;
 b=q7+dUZECGOyObRFPmPBPa39vmd0YIYjzJ5UpX6iu3Vj58ewBxdy2gaHloHd9iObZtE
 Gma4w9n1x8NYqjgz+46cs67z5LKnNZW++KIS85VUT4pemPw5sWpj/O+viFNLn3uOppGO
 NbVRq6Pm175x1W/fWHulCyEKkUXcde0iAR8b5VDIsY32ezApAGQnckbEfNEKLyZ+/Pdh
 +jgUn5EZPpizqOxUcSXznQ7OHvu1CRUOI2ZZyJQOGLoU+ULABFRBfbIG0tvlc1oFJrL3
 eJ73DZ6k1MBgc0wEElQpxIMkaVBkIQIdjATrn+mJlFifzPwRTfnQShnbMzP/QwsgC0eC
 vahg==
X-Gm-Message-State: ACrzQf2Uvfb89JYJuqF/wg59CcQXLyYhVg8GT4imuYO8I1xFFBeYcF+u
 3l3icRKtoV2xAe6ebTuluNaGp5HYnTM=
X-Google-Smtp-Source: AMsMyM7dqdNkso9pImk92GUBKhuMEyuXje8ZRo6E3PCc2X+okS8JzBT1xvkQ2CPFPAoih7EACz8YPQ==
X-Received: by 2002:adf:f187:0:b0:236:6dca:37e5 with SMTP id
 h7-20020adff187000000b002366dca37e5mr1816304wro.171.1667033104385; 
 Sat, 29 Oct 2022 01:45:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m19-20020a056000025300b0022cdeba3f83sm935899wrz.84.2022.10.29.01.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:45:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 10:44:54 +0200
Message-Id: <20221029084455.97704-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4DuFvX2fbc4BW16mAcsBL40mpP1o297L666OU+osAhE=;
 b=Y943unrczUvIYVz8M6gI7JT5D0PyqPdIZ55QQACXJwrMPPy3DhDXpcQoTGDSv8gXcF
 XmtJYb2xZjtfynKy1jrubyVt6GoIQIofiojBc6tiKdlIlizxgZBh70mMlejUB+rY969h
 lYdNhIv95z8IT6v8tG+zL0PZ24JFjhNNZEMh3RrJZxW2iYV0KgUnWlSTj+VNE+QJ6mBW
 jFcnWaski8H3G/qPCcL9lx7tkUNNblIaOWAwJVwSMCI/coxevFFYUP+SjKksT8nGYRYH
 yGGj5K9HXxzzqpTy0Ca0E+yZ9/7UofVGf8VsINnCG612wR5/+plY2amHpkRWYo+XHFPz
 5Hvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y943unrc
Subject: [Buildroot] [PATCH 1/2] package/numactl: use official license files
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use official license files available since version 2.0.13 and
https://github.com/numactl/numactl/commit/b4d36f6a34b045a67ed5c0314ec26f5514f4ee44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/numactl/numactl.hash | 3 ++-
 package/numactl/numactl.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index 802175d360..a261eab9d0 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035  numactl-2.0.14.tar.gz
-sha256  e2b738b1303c088421b09933a78c1326fe43692e2c05a7c510a2eb7e7a8eb575  README.md
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index cf9c759693..6ff94091e9 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -7,7 +7,7 @@
 NUMACTL_VERSION = 2.0.14
 NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
-NUMACTL_LICENSE_FILES = README.md
+NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 NUMACTL_INSTALL_STAGING = YES
 NUMACTL_AUTORECONF = YES
 NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
