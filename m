Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F02C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 07:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D3C980CC8;
	Tue, 22 Apr 2025 07:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyypBFympckW; Tue, 22 Apr 2025 07:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB1180C74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB1180C74;
	Tue, 22 Apr 2025 07:27:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0479F1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEFB680C74
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTexrqy8Zmjo for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 07:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08ECA80BD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08ECA80BD4
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08ECA80BD4
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:27:32 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30effbfaf4aso46909371fa.3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 00:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745306851; x=1745911651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RQ7CIlt3ryYXGIJBJ09TGe9ZcR0DwFkbHbbCdMbveak=;
 b=WyqU4SgMqGKopXVJPn5Rxgq1e3deIEyUa1/gPO/cNqEnAXyp30zBMXp/pMeRdDZIzt
 7JGEI+fJvcPhBz+5HqEf+yqS1fW9lLcSikB4v8EKNYb7oYVLN15W//B30UI3uEyqMk9l
 +88QYvhyiye0lxgWqexRtG29Q6UVNxK9d5K2ZCwNnnXhaSlVezS068vqTdgsp4XxmiCo
 a8xhB6IvFUbfGVqcEluT9JopiDPeiHTdU0gh43BKWIhAjGWJT4tFVne3jAjj1EOW8W+W
 +CBzIaZsIh0HY7zSKRZL19BWgZJswDBYbriSfmfE++vq4grdloFwFrCk94Jng10VUtf6
 cIgQ==
X-Gm-Message-State: AOJu0YybXi9ClztJlTqFRXz24/ATnet4FlVpyiT5ElTE+9rYft1bVDXU
 6H+c0RNsimtV+bT8+SeIn1QWMeZy92B2NZyDyGPbpb3Eh33NgFg+UV//vWBXrkJaPyvp3ILLO41
 HbAw=
X-Gm-Gg: ASbGncudT4b69bSbHXcve98pVRlV26Enwzr6xSrv9WMZIg2l++SPSg80tRireMvcBzY
 x8fvOYH7X4bpDIJ74kUbOCqqyB//+AyWuf4HwfIJFIhk18Exf72tvtopz28RTDOeltOp0bBPxyv
 uXI73nTRejBh6CbMnZDhWkK3o8aUQ/Hr4Zf4uoQXN02/lYZ1XVaHVkqdagMZXv1zCIJc0mlUSt4
 omEIlEaAqmhv0RPKqxOT6iROMlW1w95fC7A4dAyOy92rg2HMOTtCnhJeFrkezKpJvzJrbGvgyz1
 P1WWETB35NLp73UKE/avlwJlNPswt0rbaqX35PXVluxR4R7qDHodfocJP8R8gYgNmTArgC2AzbV
 yvcq9uAqmZTypz3D7cXQ=
X-Google-Smtp-Source: AGHT+IFfCs8suTwev+thlpRCNURN9+ZCm3g9WFQqwjlBkLWK5DvnK0biqIkWdsTdmOJ4eo9gHzWqZA==
X-Received: by 2002:a05:651c:244:b0:307:e0c3:5293 with SMTP id
 38308e7fff4ca-31090579385mr43462691fa.36.1745306850491; 
 Tue, 22 Apr 2025 00:27:30 -0700 (PDT)
Received: from monolith.tailb203e.ts.net (h-98-128-166-168.NA.cust.bahnhof.se.
 [98.128.166.168]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-310907838casm13773611fa.40.2025.04.22.00.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:27:30 -0700 (PDT)
From: Lars Wikman <lars@underjord.io>
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 09:27:17 +0200
Message-Id: <20250422072717.153123-1-lars@underjord.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1745306851; x=1745911651; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RQ7CIlt3ryYXGIJBJ09TGe9ZcR0DwFkbHbbCdMbveak=;
 b=K4Z6+T+yL8n3h8qn3maF38qC0nsE5a/MehxB/aVW/PbhIddx8Psp/vqbBhbxLQ3giI
 Wr509GhGlkizORLwBmYLXPCHXGPdxhxDlj2h1dW4tCZgDta8SUJdMR9JgrgTek/Ry91Z
 8hYCoaakbv6Uykc7XPZ2L7HcDsrvatTZcJW3eEDkx8DfptYB94ob1sFVb63TTWwLI++i
 OsQw0XgYekRWpdc/GRjgQo4tA8aloktUVWoP+wbnW39v6S1VwqEHNLSh9WwG7cq8ZnPv
 GkmQgf+BYOXGZTaTDGKZtGn/hnSrYC6CF25oaKt5HpdW6Mg7xb2ZiexJ+C1JU5W7+MoJ
 OkcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=K4Z6+T+y
Subject: [Buildroot] [PATCH] package/wpa_supplicant: add Smart card option
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
Changes v3 -> v4:
  - Add selecting OpenSSL for smartcard (suggested by Thomas)
---
 package/wpa_supplicant/Config.in         | 8 ++++++++
 package/wpa_supplicant/wpa_supplicant.mk | 9 ++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 92953f69f0..e385d762e6 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -175,4 +175,12 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	help
 	  Add introspection support for the DBus control interface.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD
+	bool "Smartcard support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  Enable the smart card support. Required for OpenSSL engines
+	  to work using PKCS11 and 802.1x
+
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 44cfed495b..9de536b943 100644
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
@@ -191,6 +188,12 @@ WPA_SUPPLICANT_DEPENDENCIES += readline
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
