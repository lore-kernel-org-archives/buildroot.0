Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F4EC40A93;
	Tue, 26 Apr 2022 20:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKnyBnm_uERQ; Tue, 26 Apr 2022 20:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47E2B40AA7;
	Tue, 26 Apr 2022 20:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 262DE1BF3DE
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE6083E41
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdQuA_kst7bh for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:33:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EFE983E3F
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:33:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w4so26992304wrg.12
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ai/jTP6glNLwxUxEV7jWecSbBCHV6PunHS6T16FhIFo=;
 b=Z5m9sDlA+iDHACJXb1jJeDpXRnQKa4dzhIXqpLhUtN59wzgbcmmrr7IGHpkkXdN+eA
 bFbdWuSWjnb7D17S/79F1Y6MHW4+moZOxhk2pHb8XSNQLen6HeQTk9gwqHgAKEs0fvqY
 cav1an+XDdj7UTLFfmPpuGfWypmrLiRs9lpdWJshXU0HWXxKqXWyA1TnyycbLxXcWIsu
 CiZgK4kY3s6sgpqYI5E7jW8emupAhhDkcFnkeZpXS8YgMg3fzoi2qDS5wbnVTqcXtUhM
 CvrjdupF8NvzjfgBd3K6p8KJc+DKXLXpRDcqC8i+5EhGiXs6kpZKwvmcLETqBdZKz/tF
 n1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ai/jTP6glNLwxUxEV7jWecSbBCHV6PunHS6T16FhIFo=;
 b=BywXaajbPxRq3k45E/JYpH9HtIiCInz6z+OcNmmxF+LCwaBOs89re/RgO3AKG8QewZ
 murdWd2kpz9cwVyJbgf7KB/izzPeyui18D+X9D/PVW7s4KvBkpp6952WYUE+IdvMddDg
 OmkWl5fxjOXDnFuAGvef88+jEUna0hobE0vZfc0Z/NDfE/sJYhfE2zDm3QeauoAIkhRv
 iNonXbsl+5ryqY+dsxpmI+oeJtZDol8jiytT8LnQw63rsQfqpNoBYxqfNRpJ7Svtpurw
 qJGrE1i3Lu5S4Wb0n1fSCrTpAvmD6cQ0+HJOLIRErbwzsV1QIXD8fK7Cede5+2eij6/l
 iLaA==
X-Gm-Message-State: AOAM530Kf+0mv3+wqaDO34kGry+qb+8pRMG9umTrflOQ93FP1B1bsyqe
 lcfs+uvB6StoXUAp9a6b1HpnijCXwfo=
X-Google-Smtp-Source: ABdhPJy//kwwJHHJXroMmNEmZVuhGuPDn+5zpVjp7OaQ0wkDEFWeOxX+Ao3k1e7IqUF/OSJrugU2xw==
X-Received: by 2002:a05:6000:1f0d:b0:20a:e22d:85bf with SMTP id
 bv13-20020a0560001f0d00b0020ae22d85bfmr5394387wrb.453.1651005202887; 
 Tue, 26 Apr 2022 13:33:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b0038c8fdc93d6sm71324wmc.28.2022.04.26.13.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 13:33:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 22:30:36 +0200
Message-Id: <20220426203036.2446167-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openobex: fix static with libusb
 and libatomic
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Force LibUSB_VERSION_1.0 to ON to fix the following static build failure
with libusb and libatomic:

-- Looking for libusb_get_device_list in /nvmedata/autobuild/instance-4/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.a
-- Looking for libusb_get_device_list in /nvmedata/autobuild/instance-4/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.a - not found

[...]

/nvmedata/autobuild/instance-4/output-1/build/openobex-1.7.2/lib/transport/usbobex.h:30:10: fatal error: usb.h: No such file or directory
   30 | #include <usb.h>
      |          ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/52b0edc4278f65fb4a9671b65c655cc4544a3103

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openobex/openobex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index bc4a47e3d7..7109bffa8d 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -20,6 +20,7 @@ OPENOBEX_DEPENDENCIES += bluez5_utils
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
+OPENOBEX_CONF_OPTS += -DLibUSB_VERSION_1.0=ON
 OPENOBEX_DEPENDENCIES += libusb
 endif
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
