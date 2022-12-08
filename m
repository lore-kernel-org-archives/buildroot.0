Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C112C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D25AC40339;
	Thu,  8 Dec 2022 21:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25AC40339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBXpkKZUKrXx; Thu,  8 Dec 2022 21:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C308740102;
	Thu,  8 Dec 2022 21:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C308740102
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 424761BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 192D4820EA
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 192D4820EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBBfSAIp3MUr for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:30:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26CB8820B0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26CB8820B0
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:30:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id co23so3266655wrb.4
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/HaU9QXYHkR8EuB2R/4NAbQ2XFqT82D3Rv/lukt/88k=;
 b=D4owi5plZ5xI6Hqec5c9n4YV9X39hUntjLbs9p7on1f0prTTkPd1uMwAz07GmujQsX
 fl9l3xWO6Ayx/VfK43EyX5GY9ZcHxtyglMaeI3mR4Y0OQkVBkgKXTaZl0ReM06W/sCvA
 ovRRi81WQKCZmk5TEEDUtcACOM3qqaDZHepwHlDuFRbRiMu7lAjqiJsYOCI3Og3SpWqs
 zLWMECuvM2kXSsoaQdrVrHmY83cK7dBg0vorzD0G9+TF2doaOoRqomWnmb0gk+0rxX+m
 BJeCc+GpI7O3PRWWw04kgPcCiopIPLVRxBETVXvtyUSsopIS+SOblu4cp1KeFvSgyMYc
 VVpA==
X-Gm-Message-State: ANoB5pmYy/YEDpdOebQPtaB0nlostZX7oPqQ/ka45D0GZSlUwOBfccUn
 LFQ8CVRv121+tUQAMx5N9+f+ALoZq6s=
X-Google-Smtp-Source: AA0mqf46tH3Ek5aVRVYraTX0jtNryFMgUNz4drbsSTHRXblZqfHALA2fB4o51kIZu0de9o6PxfdX1A==
X-Received: by 2002:a5d:6b12:0:b0:236:84b5:6658 with SMTP id
 v18-20020a5d6b12000000b0023684b56658mr2077677wrw.64.1670535043737; 
 Thu, 08 Dec 2022 13:30:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t2-20020a5d42c2000000b002365b759b65sm23084417wrr.86.2022.12.08.13.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:30:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 22:30:40 +0100
Message-Id: <20221208213040.64370-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/HaU9QXYHkR8EuB2R/4NAbQ2XFqT82D3Rv/lukt/88k=;
 b=eQgAzlI0ltH77etMQ+Mvs4suJq0P7stJidaPIiamAVV8GGt+43PVadtx6dpEBrxSUx
 PqDo8wXd5vVkcZSRfYhdS3nyap/ZlA1yCsyKCEOTrGtJXkiIm397hnvvkgUI3WroUook
 sI5nET0DG1VQQnaw2136j5RebqTFz3o27y2tds0peY4BviGB5Q349lDsCLnRBBp4oZYl
 Qv+jb5XXVGslMomKFjpupXY7SGS2xLwy2j4qP3yVe1Gbj8V/6rjj995siAbvaYqv42X3
 fHtIgzhYgQ1ehnn+ZbAq4MsFKWg4r+057WVxFBGtcWxTwpbgIcym7qJcTOzMHBFdddLs
 jWyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eQgAzlI0
Subject: [Buildroot] [PATCH 1/1] package/usbutils: bump to version 015
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

https://github.com/gregkh/usbutils/blob/v015/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbutils/usbutils.hash | 2 +-
 package/usbutils/usbutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index f5d55bb4a0..caedf5fd80 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
-sha256  3a079cfad60560227b67192482d7813bf96326fcbb66c04254839715f276fc69  usbutils-014.tar.xz
+sha256  c3b451bb1f4ff9f6356cac5a6956a9ac8e85d81651af56a29e689f94fa6fda6e  usbutils-015.tar.xz
 # Locally calculated
 sha256  91412672119c72352b76c1d48fa1a8b7cdc7f70be7929e468c8805db468e23e4  LICENSES/GPL-2.0-only.txt
 sha256  4631da83311d27f99078d0d102e31bd34a4fcbcc2dae2aa40f1454a5b48125dc  LICENSES/GPL-3.0-only.txt
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 50b1a5a0cc..84a6a625cf 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBUTILS_VERSION = 014
+USBUTILS_VERSION = 015
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
