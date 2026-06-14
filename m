Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FF4CD98C5
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B5C860F00;
	Sun, 14 Jun 2026 15:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtV-kq9im9ET; Sun, 14 Jun 2026 15:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E7D760F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452433;
	bh=Zz2Rd2APssam986GJ3C/xunIso0ZTtUuA732Z3tSRd8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bATOnyx/w2DY1YRzyzSeODxoamSE5uuw28/Yhq8+wfY2Ir1PHRHvc22zH3dsjDmYv
	 wJhGNMFtK53ijhtgM2vcvT9R0HLL7wRh21IzX4tChLHSc4A0WATOmhTsP+BiapxRNY
	 UfFYlyhBY2EuZvG8wFUaqL1rpLDGgsAst1oVupSg/C3WD9uCWZKQ7+pBD6f2Gs0v/5
	 I4yrgx/bhhL6cJ0695zHpTF9J2YF1gtxOCywD/9ZkGXQ2RwYTD5/2KSY+/zgDtL9+l
	 ibI5hMEMKxENw0L5Adtqfo/Y/m1HgmlB5pMCKHqXfI1UGBVxaaD+7M3JSX//BrHdyp
	 T4vf5iP9dapxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E7D760F04;
	Sun, 14 Jun 2026 15:53:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 080A02EF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E277740680
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vcj2-ZQNE7N for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:53:51 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A577E4039C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A577E4039C
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A577E4039C
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:50 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5aa68d65d24so2349983e87.1
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452428; x=1782057228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8KqZc0dHTPTxs80LXUdOttXZI4WFWTO5yLC6sCZ05hY=;
 b=mjdvW4fypg5YU1kOTyJ/LX0GcD7Ro9yj3W0iMUWEAX/Zr+HYj3yMAcXuF5cxrQfi4Y
 2IFX/QRRfz5V3WxEDY55tpxad820EOEhEyKIYdOfJVOpZ5HYVUdpLiLR1FG0cymsZ277
 8HVJGH+b8fFv4Jjpm1nNVsJ/shsMlDrxA3k1nxdWaZ0RswQZe1KGOSlxWLysLzs5afDE
 tfPurNRYzbmXQ0Em7BIApiElVqzKLe5HeMNK8Lvj+S6xMOa9qzCFLrjHrNlREzgSFvIK
 pC1o8Mi7VVu11FGEgz2fYSQpeQkWL0lUfadqJuYjZGM4UuHdzSCVvJKb4rV9EEJ6EhBd
 Ln1g==
X-Gm-Message-State: AOJu0Yzg8a9asvlIv3rMJ5oyRIrv21CtrCs9DqZUsS7Vas9NXK3V8Zat
 yQpXXrMEUwtTAmqg6vnsNYMTD72YKAPDvyFm9nqrbBDm1CzIHwbg8VVhlnd4QAgg6AqzFSDJJTG
 b3Ew/+d7TSQ==
X-Gm-Gg: Acq92OHdWLEZYS9tb0lOihs2MnibARXL9cZUxcbzWuV0GGzGyz9L2cPw7O6RGX/zUTN
 5z4IgxQD1D5lqNWM+EXhzYcV3EjUaqY7snjYX/ZDwjzfSs9H8hqAHWZcyjDKgkywwOPuZHhxxT2
 ZgBN+PhDCv/32IkhspK6pFO/zsHWMze72stAkGDqv09Qg6nkrCe8d4ddcbwSQEIphfVPShamX12
 B5tyCgR+HQoc3X10hUexc5u2z2+BJej4cMSKnjm3AoOkXyGKGK7Ryv92ASIAAe6i71n/sv9fvuu
 eDrd5QDL/795CtcrTwABK/EqhD8iMePsrBNWuQoPEPrpvRjrq7DL8+8qaGlc1wNmcW5uTo63EJx
 nsMnN/YOlgYSTxMXcEhNgthl0UThn9JQ9ot+j+qdo+XvyuAqNMlSGbLPxV0+HY0IUxvJ9owK2BL
 UhiUEM0Dxriyf+N3g0AJfRiMjGAqx8v+M0KqsyAKxs5mcZe/MCoPXfMA==
X-Received: by 2002:a05:6512:23f0:b0:5aa:5f11:ddb9 with SMTP id
 2adb3069b0e04-5ad2db6cb24mr2124313e87.40.1781452428331; 
 Sun, 14 Jun 2026 08:53:48 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5ad2e1a7362sm2052386e87.43.2026.06.14.08.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:53:46 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun, 14 Jun 2026 17:53:23 +0200
Message-ID: <20260614155328.304282-4-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155328.304282-1-j@j-ernberg.se>
References: <20260614155328.304282-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452428; x=1782057228;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KqZc0dHTPTxs80LXUdOttXZI4WFWTO5yLC6sCZ05hY=;
 b=FvKBLjxBRd18/uvGABqLAkOZ8gu6V1QxguVl+XT+XO4YXJumYR0JICHFZ8YfuTVfYP
 pvhVB/htAd21NCbXbleRhrhJUIUz49N1/NTBw65YPEuyqm5M9hjcP9zZmM3uoNxVKydn
 T1D1qSj2aDqwUlazA6aevKqNJiX3D7kpLnpYhh6vS+IhlplQtgmPH34mZB2XMeLYHo7B
 hqQuFJCfiKONxTHz7FEDTOSiLtLldxPkaSNfSdT+Fm2kiDC6NKoujB5QnuK9vej6L3cl
 rp29cacadZL5zk7evvkaP91Fa5Q8Y3W+UQey+8esmJTx4qtc5HWoihMOb796JafiulqE
 w0lA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=FvKBLjxB
Subject: [Buildroot] [PATCH v2 3/8] package/rtl8188eu: Conflict with the
 linux-firmware rt81xx sub-package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Due to partial rtl8188eu support in the upstream Linux kernel
linux-firmware packages the firmware for this chip now, under the same
filename and path. However that firmware is a much newer version.

linux-firmware carries version v28 from 2017 [1] while the firmware blob
bundled in the repository is from over 13 years ago [2].

Since it cannot be confirmed that the newer firmware works with this
driver, add a conflict with the specific firmware sub-package.

The reverse conflict cannot be added since Kconfig sees that as a
circular dependency.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/WHENCE?id=fe1a0a75caa69da62849cbf549c32531c6d1da4b#n3628
Link: https://github.com/Benetti-Engineering/rtl8188eu/commit/a27737ea39d72040d7421600949373982d78a0d2
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

v2:
 - Go with the alternate approach of adding a conflict since it was not
   possible to obtain test results from anyone with hardware. (Arnout)

RFC/RFT: I don't have any of the hardware for this chip and cannot test
that this doesn't break stuff.
---
 package/rtl8188eu/Config.in    | 5 +++++
 package/rtl8188eu/rtl8188eu.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 102e8d7bf7..fc3199f303 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RTL8188EU
 	bool "rtl8188eu"
 	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
+	depends on !BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX # conflicting firmware
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
 
@@ -10,3 +11,7 @@ config BR2_PACKAGE_RTL8188EU
 comment "rtl8188eu needs a Linux kernel to be built"
 	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
+
+comment "rtl8188eu bundled firmware conflicts with the linux-firmware firmware"
+	depends on !BR_s390x
+	depends on BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5f378e0b6e..1f826266fd 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -16,6 +16,7 @@ define RTL8188EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_RTL8XXXU)
 endef
 
 define RTL8188EU_INSTALL_FIRMWARE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
