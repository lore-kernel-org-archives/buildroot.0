Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FB2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 00:37:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10A1600AA
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 00:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D10A1600AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 903FD4066E;
	Fri, 10 Sep 2021 00:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qoa3g_QPeAbF; Fri, 10 Sep 2021 00:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AAA14066C;
	Fri, 10 Sep 2021 00:37:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 914441BF9C8
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 00:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 809E5849D9
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 00:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUfKCpnrjt8X for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 00:37:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E18C9849BE
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 00:37:28 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id a1so274526ilj.6
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 17:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+LR/Wckv5Ka+Pp5JIs4cmxDTB+jADGF3IPBeBPNwmg=;
 b=gIV5xy6f/3HJu+QQhOO1PP7FvXUlFKa2NPL20qM8uNW3bm140kEPSui+jU4vL6XFLJ
 cYHiWo2FLCWLRykKdCh4KqhLSQ0cMhhUv0awIaH8TerI9hD5S7H+KSp0DX5H5PAiFwbt
 jwmyM+v91Z2AHxk95n013CfRB7ymfDNw3NVIbGGITmnUO3h8wPVLxl0XXUvEc0UsDf8S
 f5MGvTydDVHzp2hJrANSsgxfB69mM7fRoRMncGewBpI1z3N4j+Yue1sr4ZxHKokXCSOG
 QRkgSUR8hXIyWcreIZ/c4BodSvjT/ecO5ce216IoSLtsCSyScEQPCM1Pj4Ng8j0AHO84
 uQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+LR/Wckv5Ka+Pp5JIs4cmxDTB+jADGF3IPBeBPNwmg=;
 b=BJ9twmeWUtW38WBAvL2L2NPAwhs4RUlFwuF1fSs/0YIDGLZ0YaUSVOP9FPhHLRtunQ
 jF7AMdJH2b6x8KLfP6fh9ZiRh78icmCL7MWxpkUb4K7aL2O3gZ3fEqCH55ez4FLyjXON
 RWLkPl0n4odUAXPT5MyYf11dOpTkHXtKvxaE/78qTNgr27OofXSm4LIVTvVuMcU11qZ6
 8htjmPg0ebCaHsES1Lfl6CD6+U5c/xkNy2KftHACm20zLz98so+zH9HtHBB1BwSIdcwZ
 bhKipARUu+odsJwx/7WPLjYUSJ6RlDMZXKmadoaBtjxVtTsGKFodJEB/WDjN90lPnvrF
 XCUQ==
X-Gm-Message-State: AOAM530rT7PRLU1XQTyNVVQwIwDr751QwJrr1vV6RV4h2PRmra/S1eOi
 KWM7xMCrKIGLy/aqllA5yi86Dj65ikQ=
X-Google-Smtp-Source: ABdhPJy10EFSc0BdtlwZVZIhpYD9M4Kc+/4WxYtXEvbgzWejqbQv/1qHQOxRha8JBbObs+V2k0z6ow==
X-Received: by 2002:a05:6e02:1a0e:: with SMTP id
 s14mr4292939ild.49.1631234247737; 
 Thu, 09 Sep 2021 17:37:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id x12sm1577982ill.6.2021.09.09.17.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 17:37:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 18:37:25 -0600
Message-Id: <20210910003725.3926456-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: add option to build
 examples
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/Config.in   | 5 +++++
 package/pipewire/pipewire.mk | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 6c61dd2021..b15bbfa8d3 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -14,6 +14,11 @@ config BR2_PACKAGE_PIPEWIRE
 
 if BR2_PACKAGE_PIPEWIRE
 
+config BR2_PACKAGE_PIPEWIRE_EXAMPLES
+	bool "pipewire examples"
+	help
+	  Build pipewire examples
+
 config BR2_PACKAGE_PIPEWIRE_GSTREAMER
 	bool "pipewire gstreamer plugins"
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 2317398088..472bb06dd7 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -13,7 +13,6 @@ PIPEWIRE_DEPENDENCIES = host-pkgconf dbus $(TARGET_NLS_DEPENDENCIES)
 
 PIPEWIRE_CONF_OPTS += \
 	-Ddocs=disabled \
-	-Dexamples=disabled \
 	-Dman=disabled \
 	-Dtests=disabled \
 	-Dspa-plugins=enabled \
@@ -35,6 +34,12 @@ else
 PIPEWIRE_CONF_OPTS += -Dudev=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_PIPEWIRE_EXAMPLES),y)
+PIPEWIRE_CONF_OPTS += -Dexamples=enabled
+else
+PIPEWIRE_CONF_OPTS += -Dexamples=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
 PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
 PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
