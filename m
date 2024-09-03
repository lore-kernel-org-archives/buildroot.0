Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB85CD342A
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 07:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C84402FB;
	Tue,  3 Sep 2024 07:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lym3otFb8Lhr; Tue,  3 Sep 2024 07:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B72F40336
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B72F40336;
	Tue,  3 Sep 2024 07:39:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 296B01BF414
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 07:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15D9C40960
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 07:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkkuhintmmbt for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 07:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D2A240226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D2A240226
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D2A240226
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 07:39:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5343617fdddso8521989e87.0
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 00:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349178; x=1725953978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IM2GZ/15wEeL+H7YREMF7SEaKjE3IJpOMT3pYJhYCGM=;
 b=FZ+S8EdltrZdZgyUNBdlVeX3Rk4cTUeq5/XbC+t9IvS9Rs3wb2VEZUV+FshXNVSrP6
 dKq5y9qFhZRf6D28l4lB6forRFk3RhsuAFr32pw5fvZcHNnuZjfG2OZTKH/RTZMeudE/
 89FMnTrUZ5O1xM+yc9ed9FUNpYCkd3gG7zUaslYrTHypy4Hg3uUM2pK/2JUKNzTwT47b
 2yoVOv5aSl/Cio3FVFi/NFHKoHrwealZinHEh/xXY9Gap0lMyjSUgeuBXajAWBOOWuf7
 NCSklsopsYpQLblDBTTy4Sbgu+fFIvT0FqRitqycADSCDpKqwcwy5HPFAA1vNADffjjm
 /VKQ==
X-Gm-Message-State: AOJu0YydUov8AAkNkai0l4aWfOJC2G4TYKxJmihzpSjZeW0BkDXz9joI
 /WuMxz0gZANBLPeZSTCEz+rvIcThfxmF8klPTlrYz3sDL+8iWsfi2bd+NJRNnuQ4MoZyjRaa/3x
 g
X-Google-Smtp-Source: AGHT+IFFrUPq6vvKWvGfHt0WYU/mBL6C+0DJ9y1s/vPBLDHNUmMllpb+mD6Rc93rPNgqgFodx1hJnQ==
X-Received: by 2002:a05:6512:238d:b0:52c:cd77:fe03 with SMTP id
 2adb3069b0e04-53546b32f72mr11188229e87.14.1725349176987; 
 Tue, 03 Sep 2024 00:39:36 -0700 (PDT)
Received: from monolith.tailb203e.ts.net (h-98-128-166-168.NA.cust.bahnhof.se.
 [98.128.166.168]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540827a4asm1918960e87.131.2024.09.03.00.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 00:39:36 -0700 (PDT)
From: Lars Wikman <lars@underjord.io>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 09:39:29 +0200
Message-Id: <20240903073929.3717568-1-lars@underjord.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725349178; x=1725953978; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IM2GZ/15wEeL+H7YREMF7SEaKjE3IJpOMT3pYJhYCGM=;
 b=DLykHvo+jVq5E15oZZbDhevyeBoPB02sDl/TET8s5+kM/rtmnXIsIxz0EQ186+0SM3
 zSOmqFyMy7tz1TMwL3WB0KJXYeRuA6iTi/zXfR2YwrkSLIxenRehZSHesxsQfrEehcbn
 gBxVXv+E90mflWLNQeCmKfdBmUkE/3KvBPki8wtFKuSlaWvDF6ezM4y1UBzzHaowoPkK
 IVFxB0i8yoj9YHLVEkNQva07WmDDW1yJHKovARSYs3mlGsTq6dXDEOdCPOoURIYsohT7
 oTtmQIGA3gCiGvzqV0sC/GaATN7MrxtVTCxjwcGIWulUZkbJTvIyxvO0kVoKVvTwyx0/
 qN2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=DLykHvo+
Subject: [Buildroot] [PATCH v2] package/wpa_supplicant: add Smart card option
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
Cc: Lars Wikman <lars@underjord.io>, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CONFIG_SMARTCARD was unconditionally disabled which has meant that
even if OpenSSL is compiled with engine support and the supplicant
is configured to use an engine it would warn that it was compiled
without engine support.

This mechanism is used to enable the more secure forms of 802.1x
networking authentication such as EAP-TLS with hardware-delegated
cryptography and private keys protected in hardware.

It is still disabled by default in case there was an original reason.

Enabling the option will allow delegating private key access to TPM2,
ARM TrustZone and other specialized secure hardware for establishing
a network connection.

Signed-off-by: Lars Wikman <lars@underjord.io>

---
Changes v1 -> v2:
  - Change option name to focus on smartcard  (suggested by Sergey)

Signed-off-by: Lars Wikman <lars@underjord.io>
---
 package/wpa_supplicant/Config.in         | 6 ++++++
 package/wpa_supplicant/wpa_supplicant.mk | 7 +++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 92953f69f0..2aee108fc1 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -175,4 +175,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	help
 	  Add introspection support for the DBus control interface.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD
+	bool "Smartcard support"
+	help
+	  Enable the smart card support. Required for OpenSSL engines
+	  to work using PKCS11 and 802.1x
+
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 984959f679..a7b7800c99 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_MATCH_IFACE
 
-WPA_SUPPLICANT_CONFIG_DISABLE = \
-	CONFIG_SMARTCARD
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_SMARTCARD
+else
+WPA_SUPPLICANT_CONFIG_DISABLE = CONFIG_SMARTCARD
+endif
 
 # libnl-3 needs -lm (for rint) and -lpthread if linking statically
 # And library order matters hence stick -lnl-3 first since it's appended
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
