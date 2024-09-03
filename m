Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA15DCD13CF
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 10:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C1944099B;
	Tue,  3 Sep 2024 10:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFlRKdv8QeRH; Tue,  3 Sep 2024 10:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB32C4096F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB32C4096F;
	Tue,  3 Sep 2024 10:10:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84B5C1BF263
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 10:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 729BC80ABC
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 10:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl4KFcl-8omc for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 10:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0502080AA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0502080AA9
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0502080AA9
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 10:09:57 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53351642021so5522444e87.3
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 03:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725358195; x=1725962995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3kGzmb/9wlF2CppmPSO6jH0ZZmD9rv9rlyCcbEMQkBs=;
 b=h+RAiEHKR5oL7oy22r20Ql0CqFNtLkHxjE4+x7a1GKj6BWkOTICpsX+CRQ2NwkHLHC
 pBbt395pV6MGHHWfeFlK+cmc2D0w1/jkjYr5tFou4nDfcKJ1hjVKwpGEIemx+asEXHHM
 mcEEtpxxw5gEDfJosZCAAxTwabGSAs5wEtJPI9TojUnz/CzSSZ7afhwwg+6C36PrGqAn
 F8fzl5l52yhixuNCYOVWiBGV46RybRc0nwNQ3PYQrktNVLHxF3ijUHt/Gq8vze1+wL9R
 x2eFfCsAO1FImkMTuL1iohuKHPxqtzj7pkpNWQvflXEZ+aI0GCN+qpBCeM3FU7Ivf5Ns
 tPvw==
X-Gm-Message-State: AOJu0YzfzfNBWWFq3e+3ZjyqJjqVopZpvVj1bY3/cZp1V4dB1l0FhDq5
 wBGBnfUj5AbfaqOPAxQv8AvJTmM/E2lJ+9wOTtpgMqDMOXfgInTpHaZZCFj0EnXAF910iLRs9Fp
 0
X-Google-Smtp-Source: AGHT+IEY9RWYlnzW+riDUFOw+wPqapBpXMY3LE0YPl8RrRkCSveRpR840c3/zR1OBv/JeTOwzv6jFw==
X-Received: by 2002:a05:6512:1390:b0:52f:cc06:c483 with SMTP id
 2adb3069b0e04-53546b26a80mr9015681e87.24.1725358194476; 
 Tue, 03 Sep 2024 03:09:54 -0700 (PDT)
Received: from monolith.tailb203e.ts.net (h-98-128-166-168.NA.cust.bahnhof.se.
 [98.128.166.168]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac512sm1929210e87.79.2024.09.03.03.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 03:09:54 -0700 (PDT)
From: Lars Wikman <lars@underjord.io>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 12:09:52 +0200
Message-Id: <20240903100952.3789698-1-lars@underjord.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725358195; x=1725962995; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3kGzmb/9wlF2CppmPSO6jH0ZZmD9rv9rlyCcbEMQkBs=;
 b=E3KJJhg5/SaikfQe3uldnjLf8JOhfvSNgqNiFFBD6k+N8DusnbVuJ+PVBaEHAp1uuW
 6c8Ece8NdjD4v3V9YbCWrQ6uQ9hlRAlTrYAj/9YMu9MRCzMCYH+bWH9+k/32XlPVR2Sh
 0h47g5xhaosEEjn4F/5kqXFFa2kvL32IAAr2bJF5TC3f86R01AskwNhEH6kvyE9cd7de
 NUzG848Ecxalbdvs0xoVYWu1Nt+rebRIzWW1HoOarZzer31Yw+hhWjCSsrLkYd7d99j3
 E30Oa1ZdkG0DuVPGjipfPiSiM/C/SyIw7sYJlGztEN9Klloa2f7etUJCnlZNCj9QaMj0
 4m3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=E3KJJhg5
Subject: [Buildroot] [PATCH v3] package/wpa_supplicant: add Smart card option
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
Changes v2 -> v3:
  - Change setting disabled to match convention (suggested by Baruch)

Signed-off-by: Lars Wikman <lars@underjord.io>
---
 package/wpa_supplicant/Config.in         | 6 ++++++
 package/wpa_supplicant/wpa_supplicant.mk | 9 ++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

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
index 984959f679..6199e584d0 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -24,9 +24,6 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_MATCH_IFACE
 
-WPA_SUPPLICANT_CONFIG_DISABLE = \
-	CONFIG_SMARTCARD
-
 # libnl-3 needs -lm (for rint) and -lpthread if linking statically
 # And library order matters hence stick -lnl-3 first since it's appended
 # in the wpa_supplicant Makefiles as in LIBS+=-lnl-3 ... thus failing
@@ -180,6 +177,12 @@ WPA_SUPPLICANT_DEPENDENCIES += readline
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_SMARTCARD
+else
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_SMARTCARD
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)
 define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
 	sed -i '/ctrl_interface/s/^#//g' $(TARGET_DIR)/etc/wpa_supplicant.conf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
