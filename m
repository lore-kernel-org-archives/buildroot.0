Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03237C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A64EA40647;
	Wed, 23 Nov 2022 19:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A64EA40647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOnrvQcHiqRf; Wed, 23 Nov 2022 19:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B004540C28;
	Wed, 23 Nov 2022 19:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B004540C28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACE761BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8935060BAE
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8935060BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rhwnk9AAwB2m for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC4F460B9A
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC4F460B9A
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:18 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 136so17673855pga.1
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5GP60bmQD1JWSrM4plp+TvYnpgE0DekOKAkyMSWaGU=;
 b=C+j6N3PaIr6toYX54P3AtDYJcvH2i6RX5nsisxIgyvWHIerQPp7t5dTNxxiLep9tRO
 mDoELdA/voO97VzmMVbDiCEZxH4GF4kPca6yBc3ejIMfyQpqtk5CNRflTcsHB0u8ADMn
 5WXAROuyDNfqk61EX9Ay/vcWOMLY09HZ4DKkeRz5QAAB5HMgQQnpD6ufdTfY+x2+5usy
 du0yLgS5vnjpJhvElOZxpwnfR+Cxi9zJV0jetoLL6QuoUkwpG2yRDTYbgUk1iPUA4INy
 oi/czw5qYuiPyQtnjY2kp8LIhLGLziJT4PXev986DU/MJIynLzSa/L0S4T6S6TLQgJQA
 s73w==
X-Gm-Message-State: ANoB5pkdLoH4BLLjYYaq7KNs2wPSVlFr7yRztaKhy3xqQufoeYSkiYlK
 pJUtvIS4ItBPY4MJx4yl6yl3FegLZbRiPw==
X-Google-Smtp-Source: AA0mqf64Oth9qUb8rXtqWAky8c5DP67ZyLDRALfER+D/i8GyLs2KH8eDK/dJC2dObZBS8hvDNZltEw==
X-Received: by 2002:aa7:9388:0:b0:56d:4c7e:777a with SMTP id
 t8-20020aa79388000000b0056d4c7e777amr32383833pfe.0.1669233197898; 
 Wed, 23 Nov 2022 11:53:17 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:17 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:52:53 -0800
Message-Id: <20221123195304.1582783-3-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5GP60bmQD1JWSrM4plp+TvYnpgE0DekOKAkyMSWaGU=;
 b=Ayt0MJlT1yv7Ily7YiLG4XxYgPFYLLB8A2ehs7ieNdBQFJaUO7nYVerfRW1c6BpmD9
 XbGdMZtp1NYG2cojf+Hhp/XPeCRg7cOBn+4nA/KsjPmTMXt5NVvTwcI4up6mhDKMMTDP
 5ow+Kra3lhBM7/od7RiXeZmk4EZff5Jczn0D8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=Ayt0MJlT
Subject: [Buildroot] [PATCH 3/7] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.3.p4.4
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 5.15.52-2.1.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v39.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 312eeb6f82..a0e6345b7a 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1324b1aaf190110b80ad9a6f6533f4f50dce9e9ab8d49d8503f59764b151d219  imx-gpu-viv-6.4.3.p2.0-aarch32.bin
-sha256  003c30baefb1655790b475c3cdfa5cefbf81ea89ef37c6649b64f151dd23a52e  imx-gpu-viv-6.4.3.p2.0-aarch64.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  5b9dd02cb2dfa564903872576cd6586fbf4a02abdb8e180978bd84205ab302a7  imx-gpu-viv-6.4.3.p4.4-aarch32.bin
+sha256  5c52bd15146c24d449638c6276c07103949c8efbc53d002518541bc37c57e424  imx-gpu-viv-6.4.3.p4.4-aarch64.bin
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 3c88b8b11e..06fbbc7343 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch64
+IMX_GPU_VIV_VERSION = 6.4.3.p4.4-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch32
+IMX_GPU_VIV_VERSION = 6.4.3.p4.4-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
