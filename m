Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1097DC3ABC9
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9AD4611C9;
	Thu, 15 May 2025 12:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgmYm9Q7lRj8; Thu, 15 May 2025 12:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CB8E611BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB8E611BA;
	Thu, 15 May 2025 12:10:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7E7813D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C94C84154F
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hy54_UzbKwa for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3CB7415E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3CB7415E4
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3CB7415E4
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5f6f86580ecso179434a12.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311043; x=1747915843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7ZzgO6qgTww3UEKridBLp8EahOR6A8wgrTSKF22Lfw=;
 b=FrahOSD3xafdtm8u5o3FHofp9cUfEgpprUF8swLqxJh8aeUJuHGBVpY8zyKW1NwLKw
 xrkYWlEuipbefVIECgHji3wLSi19AIpp+pb0JWASh3P7KoMbxLxpdB/O7JBb78dNWAYb
 FKoabkh3Pa7dHywt84f4QyFE7pHF9DQvzcx8sWRA/D+8Xk/4G8jyNypV92CKijGbhvoq
 hXHwK+gT3bcIZ7VPN6y/I6wMg1wHV4KTuY3mg1pBjFXpn2LA99EVlquqWxRxmxWMH06b
 GeymNq2X/C0slRz1CLR8mJ4DA7jvLEzJAkrEgRzEPvNvX2SGXcs6Ns7sjTlmq1wjiDIt
 kRlQ==
X-Gm-Message-State: AOJu0Yzp96jrWlMBZJe6UdR3uU+0ol+7MSYFpYhcpd4u8Ggdna0P2xF1
 zcBeXnvtUt5YamA3U9E+X1C2lS+4Mv8c/fbjVRgSeRlN2LmUzqUnnsFh07ndYPOzpJib+dRTEHA
 Y
X-Gm-Gg: ASbGncsnkIklMKe97dfhsxHCI2YY0GsA0/RqDz8zvjY7x7QZ8WJ/YZjVSDJzM/ZiE5h
 oXRyw+SM7aF5eOc/oueKGGYoBFXNEj+3dpvuOuMwZEUo/AMrzD1ljAboRaZXPIXFkY/ccLLEudO
 NoTuLllZhivj4lyERCOHPtptKIUUltMukqxFMs6sUNb6wxCMNvGOEJ6kuiaVG3oI7NhOWnBwA6c
 Ba/QplHObMMsIHd18B27O9TwpfO1lfOtJFQ46b/N2Ku/j4Fe8wG7drkC/mip0WEmVvY2C4biUxR
 Igg4EWpLecSH/OQHbYAlcCsaU9zmBpMw1fs4G369I0jz44K5pNe4angdtno69zgQiYBAdbcfhO0
 q0HGoO4j5a0bI26xcfna/pwWYAbu8zOgK+5kChg+OFr5jYIfIXAN6wvioVLeCi2kfBI03kEn03+
 cQ/9TUEHkCo1E5USLswK2R
X-Google-Smtp-Source: AGHT+IElg/scgOm8LuHe4mBJ0F60ZunEb/o2FmIP1Upt4wKuFzlNkQKlJ3h0PkdxksnvCPTPEIYwfQ==
X-Received: by 2002:a05:6402:2709:b0:5fc:8d8a:ad42 with SMTP id
 4fb4d7f45d1cf-5ff988aafebmr2430721a12.3.1747311042655; 
 Thu, 15 May 2025 05:10:42 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:42 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:27 +0200
Message-ID: <20250515121027.561571-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311043; x=1747915843;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7ZzgO6qgTww3UEKridBLp8EahOR6A8wgrTSKF22Lfw=;
 b=NH2chzO5+kAOHy+CjOnrK+crO29ZDL1iiRzdE+WfGqwHLMIwYu+BxbVgrGekuJ6XIW
 zJWFqXnbu4UuXa9KqivzMqAWy3FYNRhsDp6ub9T3rV9Z1YYsrdz5c4LU6GEil6ovYXcb
 mHnscV25AVx+2zMGDmVCNRDoAjqjBvNFtTFVQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NH2chzO5
Subject: [Buildroot] [PATCH 10/10] package/refpolicy: bump to version
 2.20250213
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Add the dbus policy as a default module due to commit 523b279.
   This commit added dbus contexts to the selinuxutil module, which makes
   the dbus module mandatory. If the dbus module is set to no, refpolicy
   fails to build with the following error:

   ```
   policy/modules/system/selinuxutil.te:102:ERROR 'attribute
   dbusd_system_bus_client is not within scope' at token ';'
   on line 155976:
   ```

   As a temporary solution, the dbus policy is enabled by default and an
   issue has been raised here:
   https://github.com/SELinuxProject/refpolicy/issues/906

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 5e876d4a43..76bbf482ae 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  7ed41f4f45189b9ee9706da8ac357eccc103651b56daabaddb54c436e8117cf9  refpolicy-2.20240226.tar.bz2
+sha256  d2487c49420e8710e999b18bbe699fbff033fe5adc5127e3f0c7dafaa9b4d209  refpolicy-2.20250213.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 74ccb79624..a25a9c45ee 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20240226
+REFPOLICY_VERSION = 2.20250213
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
@@ -55,6 +55,7 @@ $(foreach dir,$(REFPOLICY_EXTRA_MODULES_DIRS),\
 REFPOLICY_MODULES = \
 	application \
 	authlogin \
+	dbus \
 	getty \
 	init \
 	libraries \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
