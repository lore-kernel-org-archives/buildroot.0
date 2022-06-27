Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBCDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB0E4186A;
	Mon, 27 Jun 2022 05:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB0E4186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0S2-pnton24; Mon, 27 Jun 2022 05:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182D441839;
	Mon, 27 Jun 2022 05:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 182D441839
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D82E01BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B33804182E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B33804182E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvrSV3uiMuML for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE8BA4171B
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE8BA4171B
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:32 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id r133so8490377iod.3
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ITngpdaDfRyYBVBfhOo8FFBGLwss7B7P64CkjuZX1fU=;
 b=jme3AS/KGuaE55bWxocfDVJ+UxCZ5IITO2yAxcdkT8WmemzI3udYCVVmzbvX8Ma9rA
 WLl4ldhcIK8p78ZWje8uVK1h5/2GT87lNKSthe1oIBDr14C2YBL6AkK2GcmG6lRhCOeo
 SxTITuzmlSE2QZhXCXmGrIr+2NY/fg6szRBkbBJpKIwUfSoSxIYFOILtFHWfsRqvIxfQ
 TK8njf4t/gNZCvC9Qedfd6j9r1rGY/KGoJIU4Dq2T33OhZpI7wR2yZ839kj8QytVyvl+
 9YlAiviTZSneADLAc+GrsnlakKzDE7psc4rzf3dEeMTl0fuyNoVpC7D2Z76iGToz8EBf
 oGdg==
X-Gm-Message-State: AJIora+Y38Xd4PstN1EqhmvlkXpxeDRyqGjA+B01hONf07jcdisQMXNi
 +1ggmIYpTZUnf5BxQjcxUhWEvJEJcds=
X-Google-Smtp-Source: AGRyM1uf3bpGR1a4nXEh3PP0x30Xh+mgDBWPT0ZBgsuSrN2vYKJIpnj5a3q1zr3xBfjUFxX5FBOCnQ==
X-Received: by 2002:a05:6638:3d06:b0:33b:c6c5:8865 with SMTP id
 cl6-20020a0566383d0600b0033bc6c58865mr6662569jab.192.1656308072433; 
 Sun, 26 Jun 2022 22:34:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:18 -0600
Message-Id: <20220627053422.618280-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ITngpdaDfRyYBVBfhOo8FFBGLwss7B7P64CkjuZX1fU=;
 b=DY4+PwLyaELfa2rL6qgX0voepkmUH+TjEsHvRRrVtwR05CEkKyHi14PNDZ+5NUHznM
 In5mY3ssxO79tFYjjT9BfTNc2IGBI46/mD3vQNqc5M2MPo4smReyckoafPdt+xo6bWgp
 A0jLkUhOKPorkzCwA9WAuuCePuKRRTiQp3mSGBJjzzr0uanXAhkkcOw07x9WZBttG7F3
 AdqQG+Zo74N3xJXo3HxmFTYWfG1h8tvVY9tbvDq7wG/Hfph0ivF/QDR7J9KO6UDTnteB
 qKm0TfSRCK4hdfpR6D5w1KxlR2wlntPtQ2q0Vha+R1zwrwpl6SyE/J2WTp8Y2YxDPzkD
 9rbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DY4+PwLy
Subject: [Buildroot] [PATCH 08/12] package/gst1-vaapi: bump version to 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 26a1f52ba0..fce687774a 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.1.tar.xz.sha256sum
-sha256  87fbf6c537af9079c99a9aefe951da119e16e5bcc9cc8614f5035f062bf21137  gstreamer-vaapi-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.3.tar.xz.sha256sum
+sha256  6ee99eb316abdde9ad37002915bd8c3867918f6fdc74b7cf2ac4c1ae0d690b45  gstreamer-vaapi-1.20.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index e0502914b6..8b137c37ec 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.20.1
+GST1_VAAPI_VERSION = 1.20.3
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
