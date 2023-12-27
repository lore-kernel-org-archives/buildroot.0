Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C08C4706F
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 18:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 578E740492;
	Wed, 27 Dec 2023 18:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 578E740492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKWNHjHg_1AC; Wed, 27 Dec 2023 18:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F8E404C8;
	Wed, 27 Dec 2023 18:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F8E404C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99B041BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73197823DD
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73197823DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uMhRWtDi00q5 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 18:30:20 +0000 (UTC)
Received: from relay4.mail.vrmd.de (relay4.mail.vrmd.de [81.28.224.58])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B33E2822AA
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 18:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B33E2822AA
Received: from [95.90.241.14] (helo=murray.fritz.box)
 by relay2.mail.vrmd.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mail@sebastianbauer.info>)
 id 1rIYaM-009Brb-N3; Wed, 27 Dec 2023 19:24:54 +0100
From: Sebastian Bauer <mail@sebastianbauer.info>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 19:24:28 +0100
Message-ID: <20231227182429.1215185-2-mail@sebastianbauer.info>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231227182429.1215185-1-mail@sebastianbauer.info>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
MIME-Version: 1.0
X-Relay-User: mail@sebastianbauer.info
Subject: [Buildroot] [PATCH 2/3] packages/libcamera: Fix libcamera build
 with rpi pipeline
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The name of the pipeline was renamed from raspberrypi to rpi/vc4 in
version 0.1.0 of libcamera, which is why, without this fix, the build is
broken.

Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8dce67f60f..c0c5a02368 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -52,7 +52,7 @@ endif
 
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
-LIBCAMERA_PIPELINES-y += raspberrypi
+LIBCAMERA_PIPELINES-y += rpi/vc4
 LIBCAMERA_DEPENDENCIES += boost
 endif
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
