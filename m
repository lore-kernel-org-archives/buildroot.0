Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE6EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:55:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C32B9619F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C32B9619F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90B2E84692;
	Sun,  3 Oct 2021 17:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeWO86JQSnn0; Sun,  3 Oct 2021 17:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C0E845B9;
	Sun,  3 Oct 2021 17:54:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38EB51BF31E
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 281D2606E6
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dURWgVQ_LlHE for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 17:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 980A3605C2
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 17:54:57 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so6613630pjb.1
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 10:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VxvwfSo4LsJ7H3ALu0HQ1bwMbxI5r4Tx+DiIOz/xgdU=;
 b=YMr1mH+jJLOweolfHEUiek8sv+ho0fKsCH8X9OvhkjIzni1ndWdNTCXfOCkwqRagS+
 JxLcyU/0w1g+J7oNILEUeR7fUVS66WBspvpBHif+chEYr6qlc1zzZNRyjPrasoIllpoa
 f3CuPKj/V3wjUSQ17mDDitnth8DO4DXZer+XQLalAJdvsr2MwBwHOhe95Lzmy4vSAm+x
 tcQQI2GU3PaPjZ0qlJZwcDzSTH0n1i0IlGkVarBWxH9vvsmaHpVIzdkUtygj6NdH4+WW
 bAQ1ioiuKOKWSAittsMvnQB0XXMy2Nh+f9qzNPXdCyTQ/urq1HrtwLJ9fsccxclQwuli
 Uyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VxvwfSo4LsJ7H3ALu0HQ1bwMbxI5r4Tx+DiIOz/xgdU=;
 b=EKm2WLnbLvXM+15mSkwGEVVFxgJFEqKftdBWu0v0YfUj0J3Al14Gn4lIZSzyPuAkB3
 fwP3X09xbFmIHLCJbcBKiYozDTKa5RrkTH2VRrE7ZkR6KampToGtEFMVHYfPzhLfj1pi
 jZ15moUy95aWWQCv0nT8IoKGbJGyleB0VhhoeRZA7XLAwM2AeatCWyDFXLTIhIzOT/S0
 i7YLu0ROB24zNTFhFJbCO0CZISl9aXrRMIfZyXQZyArstdncdY70+llEoY3V1jvUyBMx
 JVOzmb+p8GEvwxW/fdp5/Sh4sMlQuPWW8kTHNCaRgBI+OUhkE5eS9dYZMjqRaXa5XHJU
 GzNw==
X-Gm-Message-State: AOAM530MfXCJWc9mp9OqrVHyTxrkWAzVvpsBV2Bpgxh7HSaXEv5SKBv0
 83D/cAynnJd647iktLoeoBSJii/SDDM+tA==
X-Google-Smtp-Source: ABdhPJwjvWS2cbW+liV+423dwMSXXkdEZ1scOITbPYq4Ss8lbcsnrmygbHJjE0GkKyztzohU35uX6g==
X-Received: by 2002:a17:90a:3b4d:: with SMTP id
 t13mr17667909pjf.115.1633283696914; 
 Sun, 03 Oct 2021 10:54:56 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:49ef:b97d:380c:f00c])
 by smtp.gmail.com with ESMTPSA id gn11sm10751257pjb.36.2021.10.03.10.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:54:56 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 02:54:46 +0900
Message-Id: <20211003175446.3076312-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: Support Device Tree
 Overlay
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Takumi Takahashi <takumiiinn@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building the Raspberry Pi GitHub official kernel repository
will generate a Device Tree Overlay Blob files under
`$(LINUX_DIR)/arch/$(KERNEL_ARCH)/boot/dts/overlays`.

This commit changes to install the Device Tree Overlay Blob file
generated during kernel build under the following conditions:

- `$(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)`
  - `n`
- `$(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT)`
  - `y`

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
---
 package/rpi-firmware/rpi-firmware.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 181650fa08..39962b3d70 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -30,6 +30,16 @@ else
 define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	$(INSTALL) -d $(BINARIES_DIR)/rpi-firmware/overlays
 endef
+ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
+# If you are using the official raspberry pi kernel, dtbo will be created under
+# the overlays directory, so use that.
+define RPI_FIRMWARE_INSTALL_KERNEL_DTB_OVERLAYS
+	for dtbo in $(LINUX_DIR)/arch/$(KERNEL_ARCH)/boot/dts/overlays/*.dtbo; do \
+		$(INSTALL) -D -m 0644 $${dtbo} $(BINARIES_DIR)/rpi-firmware/overlays/$${dtbo##*/} || exit 1; \
+	done
+endef
+LINUX_POST_INSTALL_IMAGES_HOOKS += RPI_FIRMWARE_INSTALL_KERNEL_DTB_OVERLAYS
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
