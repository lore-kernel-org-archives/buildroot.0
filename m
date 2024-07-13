Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06EBC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A80A6400BA;
	Sat, 13 Jul 2024 20:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrsU3HI34yDU; Sat, 13 Jul 2024 20:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA0040279
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BA0040279;
	Sat, 13 Jul 2024 20:06:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87D0F1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74F2F40279
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l43Dk-BmyVqb for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43FF0400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43FF0400BA
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43FF0400BA
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:06:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c79so4336944e87.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720901192; x=1721505992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tEeDY+AiEKNjFNNNODOp3C6i+gVVnkgqawDpo3nTjGs=;
 b=aj5wE9mP7KsFfuKqanhsEICnRpmzErZn9CD793iXXwVNVo4kC28H1vFtXVz6OVsByV
 ZYMoRPqdh1gCAVi+ieIJ3UAhm7g8sJnhLmkKdsvR597g8uPQigJfwI0Zu2JV0NHPGRxH
 AGhYvi44g7KvCiXkvHLO+DHkhT9Zei/oRsvV8MbNFhXXlNtGFpCj6H0ts0Fwyv2OOKUF
 Jij2De+LwyjO+DKtzjEe5KayZI172G2+AVC/zh+gNIMcu4DD2rjO/GnKAVr54T8kbF/U
 7j9OmgLAPalevQGuFwo/nYrR1mYFgY9rrhPZ8SgFyvl8fusOsOltI9DQAghQncVL9dlN
 xnKg==
X-Gm-Message-State: AOJu0YwG58mILtQCP/XTt+xQm9+BZoJb8sMyIl7EBchVY70bqqsIZ9ci
 gO92qsqz9zoIY8IR46BSZjdTJw2YIUcuKjq1QDzFttqHMyatbNX20smnnQ==
X-Google-Smtp-Source: AGHT+IHKkSGbgqefrte8jKjE+nHSO7nlRad+yJlG+iwvYw2bMXK1edWRUMq5UJ4TvPjOgICm+lCXkQ==
X-Received: by 2002:a05:6512:3ba4:b0:52e:9f17:8418 with SMTP id
 2adb3069b0e04-52eb9991963mr11588908e87.12.1720901191964; 
 Sat, 13 Jul 2024 13:06:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef44a9sm31505115e9.40.2024.07.13.13.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 13:06:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:06:26 +0200
Message-ID: <20240713200626.565477-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720901192; x=1721505992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tEeDY+AiEKNjFNNNODOp3C6i+gVVnkgqawDpo3nTjGs=;
 b=alu/09vrwlF3i/HDF5phlEv3gF7V9QlSomO7KTeIBh+yuwg86bFJnt5RT47P2Z/eVD
 UxARXEDV9TQglT+BaKv6tg275SgM+oP2oFrUspCi8stvbIRjkIZP3XhFtjSMBPW1RQCS
 NXg+l5hTMLHScyIldi7DCl4vv+tWVTUppRVVqSGZwU9JrSyx4VtHtjT7KuWrDyYUbDHh
 /mgW3x2z2AOjgnLn09LPfPSwlGCVSUfYSR720442DjN1q7AA4z4LczpQuY2i9yMoeXbu
 pQAVxjnXHI41RYdM8kIYHt3GdTeZzf9XL2ExH5xfMpwN1/+hAWb1bZnyaxGZER1RJa82
 49KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=alu/09vr
Subject: [Buildroot] [PATCH v2,
 1/1] package/libavif: add LIBAVIF_CPE_ID_VENDOR
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:aomedia:libavif is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/5F25E3BB-870F-4513-96DB-34FF4FCF156C

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix title typo

 package/libavif/libavif.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index b87597995a..1ca3add82b 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -8,6 +8,7 @@ LIBAVIF_VERSION = 1.0.4
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
+LIBAVIF_CPE_ID_VENDOR = aomedia
 LIBAVIF_INSTALL_STAGING = YES
 
 # Only the dav1d decoder is packaged at the moment.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
