Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BD5D5B16E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07EB481493;
	Mon, 15 Dec 2025 11:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0B7ai0gF-Ziz; Mon, 15 Dec 2025 11:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2365C81495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765799007;
	bh=QMGn3B4mTVkU4JEaFPIiNR1wWZmSF7vDCLRkOvscQF0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DvggaYbEuAkEi+LAtpZLXc2LvXRKeCTW8Gsv3rtnkBj+aOZGwHIUiouQafYCC7PwX
	 EcFD1rmq+dszDVoUOWYTVkVU9kUJLP6hjqmwzHPMxkCAbE22sk6PEadJdb9BCknQCm
	 sJaqTRvr8SmcbQfx7xqNci9LGfKdtOlH8rtB/58+OhEfB1FT7ipWdPGjfOrHiARue8
	 O4J3AIASrD3sygZii3XAYfBvfyJnq2J2qg/flFgoDy9A/+j+HhFmUmWSSjh0qIz4uR
	 7XEitZgOXk0ZyYfcsOGV6jforMC32mPedBawwPmkMfh9k03187d2M2FzD2hPazyXsF
	 5b/71/6QImeEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2365C81495;
	Mon, 15 Dec 2025 11:43:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D2C2117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F094605E6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pyZoYiQC8G5 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EF5B605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF5B605C9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EF5B605C9
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so1866490f8f.1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 03:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765799000; x=1766403800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDnVT8EFC9PZeGG6xQbOx7Yg6fkM2yJxcFNAmCR520g=;
 b=t7dAJImefMWfnj2yL9RGiCb8uPG8jqqTF3yvp1+GeQyfN7bMi3UqMvFctrMOITGPu1
 vGkQd9jh1N2BaedX/x63JwuNzSbgb8VqB35XMR9Uk/RrVZEyB7Ig/Pf0MjOxurvkzRoL
 x1eq0DRY+iXhxoBVk4g2aT91c25J/i9TfnEMCIasjfKzA2yyGr87HwYkaPb14I2s/Nnn
 Vx+j7+caBw4mXm0AKWK/UuPXdQ6oJMEqKOxV66S412eIUr8wbYoqW0bULg3IXMRs6Uck
 +OQFTVfRRTJzv3diff4ft0JOGtUDaUMWU9qWig8LemZdWhscB0FTYTiAUfBNXC/Oenuu
 bxpA==
X-Gm-Message-State: AOJu0Yw0rv8syw/p5jc6bIsumK/+imod1TYMl0pUS2GWUjan6t3VajDJ
 Rc+YwJ7dX8xjBXbWLUgCVxLqy7WSAtfUJABouVZ84/bVl+iTdduUyzeZS7bydg==
X-Gm-Gg: AY/fxX4KN6WgoOEtwKG83AUen3J86V59pj/rGWae6BeHNQjjivWnllnzNWNonwdevlq
 Cr0znv7jOZOkeKAgN0s9HYIO97DXBWLcSuVvKPMmbq4rOoki1rt0y6irD/QCGPJJaMUOgPGe+w3
 xSmN3HqY1F8D6LLpK1nFxTaLw2d0gZ1zpwmvVAaZVDctf47cfsXETPcqSnjvztTdXeZNLn/HwCB
 FmT0iUajIQaf0OckBoAz8KTuiofmkFZTuDhgcYZKhOm32ZTmQEj4s6rKCZpQrOt+YkomaLPrbgC
 7KgejcakpJVm0hHMFlZTZI9NTgpsP8qXAPFe2Ck92hozbq/u9WxCZ1priJJ42F8kukv7qWhvV9P
 BZhszRjUt0zMzeE5fLRKZbtvcBF1Oy+62EjthkiYpczjrcxRUL9kp6j5IIRvw1YLXSn/FBYPQ0g
 Jacwk=
X-Google-Smtp-Source: AGHT+IH68BpuEIBMpbYKG3B6k5rk+eQEzDleOeB1uj90PvX8RHr/An+d/nzNw9Q3uhNxtO2jzpOcQg==
X-Received: by 2002:a05:6000:4383:b0:430:f182:7896 with SMTP id
 ffacd0b85a97d-430f1827af4mr9405344f8f.23.1765799000250; 
 Mon, 15 Dec 2025 03:43:20 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a136:2350:a5d3:b428])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16349117f8f.15.2025.12.15.03.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:43:19 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 15 Dec 2025 12:42:59 +0100
Message-ID: <20251215114302.32596-5-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765799000; x=1766403800; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pDnVT8EFC9PZeGG6xQbOx7Yg6fkM2yJxcFNAmCR520g=;
 b=SLPJf2UBnvRL51D/IKuuUEcexBu9E49XjC9r8hTHOMX+A8WGIEBFluR+9TrogMGnrd
 DVQ/59Yf0V4CCpofm7gR4Ehy+yT88JjfuGy7koZ9POdhpy4KykdBND9UGz7+1UIEPz7w
 gLw9e127vpYt+cQ6/r9XrhhB0Y9vlu9JEIEFwiGAyXz8iTOfr16pEnaVZGFNOiRCtzQp
 vBm7VMBbGwSO6ILFEOhuxsUi2G+EQvNGS5xMH820Ffacxz73RKNQmwp2ZAA6oOnNjGvu
 BrjscFzxWKQIxWlhii6ptYrNQqoEZMBmBpGsgxLrpuTgvedO3lfci8+aNr1+DAQasj8Y
 dqjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SLPJf2UB
Subject: [Buildroot] [PATCH v2 4/7] package/dpdk: make apps selectable
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

Add BR2_PACKAGE_DPDK_APPS_LIST to control which DPDK applications are
built:
  - empty : use DPDK defaults
  - none  : disable all apps (-Ddisable_apps='*')
  - list  : pass to -Denable_apps= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 200d151a7f..627683d283 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -85,6 +85,27 @@ config BR2_PACKAGE_DPDK_LIBS_LIST
 	  Buildroot packages for external dependencies. DPDK
 	  configuration will fail in case of missing dependencies.
 
+config BR2_PACKAGE_DPDK_APPS_LIST
+	string "List of enabled applications"
+	help
+	  Controls which DPDK applications are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no apps
+	    list   : e.g. "test-cmdline,test-pmd"
+
+	  To list all applications found in the DPDK source tree:
+	    find app -mindepth 2 -maxdepth 2 -type f -name meson.build \
+	      -printf '%h\n' | xargs -n1 basename | sort -u
+
+	  Note: providing manually a list of dpdk libraries to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index d0c7caaa48..080f924329 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -65,6 +65,15 @@ ifneq ($(DPDK_LIBS),)
   endif
 endif
 
+DPDK_APPS := $(call qstrip,$(BR2_PACKAGE_DPDK_APPS_LIST))
+ifneq ($(DPDK_APPS),)
+  ifeq ($(DPDK_APPS),none)
+    DPDK_CONF_OPTS += -Ddisable_apps='*'
+  else
+    DPDK_CONF_OPTS += -Denable_apps='$(DPDK_APPS)'
+  endif
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
