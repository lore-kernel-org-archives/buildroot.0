Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0D9EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 21:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9EE2409FE;
	Thu, 22 Jun 2023 21:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9EE2409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZub16W9C-PB; Thu, 22 Jun 2023 21:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8C04405FA;
	Thu, 22 Jun 2023 21:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8C04405FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73E711BF424
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 21:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A48460B88
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 21:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A48460B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A01L8_bmbDX9 for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 21:39:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7644E60B6E
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7644E60B6E
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 21:39:29 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98bcc5338d8so290269066b.1
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 14:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687469967; x=1690061967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xms5V9lBrpjnVW0b/aFVSvE7C2hdVDR94Y0r5MAl8NY=;
 b=WVKe9OzUoNyCT3kBqstkJa11rmJtIBpTJK9iPypLlkHyAkuHP4si2Bqimy9jEZWzbT
 UXONKmiIxAklLOosZ3RDHi3D/27Z90H9ybzlbvlXZrfI9NnN6n8dk700Lb20Z9h9s4Zx
 yr+AWK9Aq07CHrjAhoGqhh3WR4Q1lGANazA+Lwri1be4W3RaKWD1h0hQAK9xNF89rIzT
 p6U5bQYdDCCrShMZUJ+k2ahuNjlgRYaMG9m7IpeTdQAH5FO6BP5YpcgmyM/85L5AdmaQ
 VwuAbJpyWHyaVdt/hgdy/60TQUQb7lZSKaOS0iw9mjC4pP6mflDkAv+lEZOcll2Ci/rN
 nVfg==
X-Gm-Message-State: AC+VfDxdoUAjtwerk65ZzCXPFKzp8E9KazGLNTXB1FLU9adzOd7g8lqO
 T4gMXB7xkOrnNfJXWXFvkVTkvIR6QzFVXt1Fwuzz7g==
X-Google-Smtp-Source: ACHHUZ5/5MDlXHAL0Qns/0+O2TZt9rwAMXzl58bkFOWVNbWFmEGLuHUoI3NOhW8TFwYV1Jl1E4cw4A==
X-Received: by 2002:a17:906:fd89:b0:988:8be0:3077 with SMTP id
 xa9-20020a170906fd8900b009888be03077mr11515524ejb.31.1687469966966; 
 Thu, 22 Jun 2023 14:39:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 lx3-20020a170906af0300b0098278f0903fsm5222577ejb.38.2023.06.22.14.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 14:39:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 23:39:17 +0200
Message-Id: <20230622213917.3772910-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687469967; x=1690061967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xms5V9lBrpjnVW0b/aFVSvE7C2hdVDR94Y0r5MAl8NY=;
 b=Q15fRoVN3NDed3dc6XfOJ52MZu7Kde7WVeTUx124EkOBCA3OoWJwKwa5wwfj4BfPAC
 +lQUvp3jahNDxmXOzxnGRi2xC4hkIfdk6a0RdUn4LnM2uHQonOV4oE0PSdcH316HSB66
 Lg9tMGvs/6LuCg/16AegqJKUfhLpsnA5B4c3A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Q15fRoVN
Subject: [Buildroot] [PATCH v2,
 1/1] package/gstreamer1/gst1-plugins-good: add adaptivedemux2
 plugin option
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
Cc: Peter Seiderer <ps.report@gmx.net>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently there is no explicit way to enable/disable the adaptivedemux2
plugin. Create a menu entry allowing users to disable or enable the plugin,
like we have for other features.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Move the option below the 'comment "plugins with external dependencies"'.
- Add plugin dependencies (i.e. libsoup libxml2) in gst1-plugins-good.mk.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 7 +++++++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index d7ec16e80014..9d849580c52f 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -258,6 +258,13 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
 
 comment "plugins with external dependencies"
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
+	bool "Adaptive Streaming 2 support"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBSOUP
+	help
+	  Adaptive Streaming 2 plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
 	select BR2_PACKAGE_LAME
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index bbcd3aecabd1..41f4c727f3a8 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -58,6 +58,13 @@ GST1_PLUGINS_GOOD_CONF_OPTS += -Dorc=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += orc
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=enabled
+GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup libxml2
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=enabled
 else
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
