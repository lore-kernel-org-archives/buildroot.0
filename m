Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2611E77194
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFD2A80D50;
	Thu,  2 Jan 2025 10:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLEVq9Yxy63V; Thu,  2 Jan 2025 10:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34F580D52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C34F580D52;
	Thu,  2 Jan 2025 10:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C8EF29
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C142B80D53
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_ifuENVDW5G for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBBA280D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBA280D50
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBBA280D50
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:06 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa69599b4b0so172587166b.3
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 02:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735812543; x=1736417343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XI58C/dew1lbfyaTloSNYHlHk/Y4n7TOz1SELt/j1WU=;
 b=BKC8ffADLb8YZZrzKO1ZbZFxsczs5tzIQ4vkUayF42E3/bN/HOecm49gqe/qsa4zmB
 z+KNFmMtWHkAMys3eoslhzWkUj0f6e5EWwX0te54ctuH4//HEpJYLsN5hZuOS17incI7
 e/sovjwCgy4KcieN4ctnTpQxeUpnsiUYcrSVwtg/cT0tdOgQEteNj/xow7YcVR/uvkOQ
 EJxbueyQFVmMsZo64LhQM6oHsNPtIxsfG32crIWjPvNdJEJre6M/1xK+TemX+AI+SL/p
 fQc7duDHDxzNG8z+owSEtmaKzYjyWzVyfnnR+OBzV3g8yzlYl3U/9RTzCyFEPFXyG6K/
 cPuA==
X-Gm-Message-State: AOJu0Ywb5gX/FYIMxOmP83oyTNJOau5LDm8shqE+JIGMy50uneGeCl3o
 sku+lQyezCk7DAdAQfwLX/HAwly08xo4nHGY/36Pbsly0dD/CCbMn/6pFMfMPonqO82hUkFuL+6
 4IwY=
X-Gm-Gg: ASbGncu6tsU+fEhOkMW5ILd+oIJZBwBkLaf9E6hc+Ah3KccpqFYcNLi7HIo4hBJVj/6
 FeDuNsVNO1Af+tUSH+bgQvuEiiZDDRAx68anmJJnbMYT4cvL0klR5srfxPCFvhqo8ixYLbiT/pv
 yDaYLW1f+HP45WBoIgs5ArwgeVTLAi2RmiWMLOWAk+JYVXZkn6uAZpaALUCp8LoRlNsMtcXvA8I
 K2bAzFBvYqrRoEas1zxW1WdIKD3vLxcmNWrmNNLkGioXpEY0+Y9jMrClqZHwqMOcwm7tBthHqXf
 6Ah1nymqv5Uu
X-Google-Smtp-Source: AGHT+IFia7XpDOM0/0Fc88W7oSQ8wajNSa7uFQcyMK9UGtaIEDrYmdeO83DFY3jVycoRa1jJ8xO02A==
X-Received: by 2002:a17:907:1998:b0:aa6:6e2e:b7f with SMTP id
 a640c23a62f3a-aac269824f0mr1396812966b.0.1735812543266; 
 Thu, 02 Jan 2025 02:09:03 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830b10sm1759295866b.37.2025.01.02.02.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 02:09:03 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu,  2 Jan 2025 11:08:52 +0100
Message-ID: <20250102100854.8937-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
References: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735812543; x=1736417343;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XI58C/dew1lbfyaTloSNYHlHk/Y4n7TOz1SELt/j1WU=;
 b=YV0KFx0ue1vbkSvp2/trplYEESEec95Xv6JgPk3CcLBFq8uSLkDeD6pW4ClYs+SS0d
 IXQYqkM0JZL4mkKPllgvvafdbICmmzynVVKxtVnJgWWDyQFmg8o1sOIip8zzvTg96yia
 jUN4IlXZvuitFgzN3tYE+FJvsC930UiO+Zhak=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YV0KFx0u
Subject: [Buildroot] [PATCH 3/5] package/flutter-engine: bump to version
 3.27.1
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

Other changes:
  - Upstream dropped the --enable-impeller-vulkan configuration option.
  - Add a .hash file for the LICENSE file
  - Change the wording of the comment to reflect the addition of the
    .hash file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.hash | 1 +
 package/flutter-engine/flutter-engine.mk   | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)
 create mode 100644 package/flutter-engine/flutter-engine.hash

diff --git a/package/flutter-engine/flutter-engine.hash b/package/flutter-engine/flutter-engine.hash
new file mode 100644
index 0000000000..3309082139
--- /dev/null
+++ b/package/flutter-engine/flutter-engine.hash
@@ -0,0 +1 @@
+sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 7f41defe68..a399296247 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -19,9 +19,10 @@
 #  - Create a source tarball.
 #  - Copy the source tarball to the $(FLUTTER_ENGINE_DL_DIR) directory.
 #
-# There is no hash provided, as the gn binary (used for configuration) relies
-# on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.24.4
+# There is no hash provided for the source tarball, as the gn binary
+# (used for configuration) relies on the .git directories. As such, a
+# reproducible tarball is not possible.
+FLUTTER_ENGINE_VERSION = 3.27.1
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -145,7 +146,7 @@ endif
 
 # There is no --disable-vulkan option
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
-FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan --enable-impeller-vulkan
+FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
