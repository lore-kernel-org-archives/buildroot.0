Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD207C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 22:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D833D81E1E;
	Sun, 19 Feb 2023 22:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D833D81E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbZr4j9F7ftP; Sun, 19 Feb 2023 22:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00D7E81DE7;
	Sun, 19 Feb 2023 22:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00D7E81DE7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 572CD1BF404
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3062D81DE7
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3062D81DE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Su0IMgAX4KZ for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 22:45:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E6781DAB
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26E6781DAB
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 22:45:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id l7so1051352wms.0
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 14:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WvMHzXgjNMYxN30MMvWRe3K9N5MhKRGhdT24A9bRV+4=;
 b=3tv5sau/6PXLz7euBI61KphibSPfcPfinCnsoAjrfwxV7VHFUIgfoeKZ1RJz+Z7Frq
 V12EEJfW57ZOE/i0jBq/FyGLMesa2omz9opyQkUHiurPPh69HyLM4GX/foksbt49WIBg
 6oQVk6MPTvh+FVuRBZ/9AiCchAwVAz0v+FVvR78LeaCxVPLO9r/IpM1z0JdPY4mGAVdu
 mz9Zq0p0TSsn9b4Ui/J+cgJsItOIFHRELeXnCqUQnmbOpNiiFxh+Yt+lUcfnrxAEE+l9
 8lIK5GZaOXfq8CeGgvBrEGw4h3EMCDeXPFGzEFwQbytJwn3Q46QgL6r7vqdNrEpBL/pV
 L3mQ==
X-Gm-Message-State: AO0yUKXMmm/0b1u97Nzg7IrNObZBXyq4ChCedXr3dr8PaREU6rAnQ7/y
 Ml4IsXVqB9GY2N/WgkjLWKjZ+QBVsqI=
X-Google-Smtp-Source: AK7set9WSfkslJ116Ru1N/PbGXqqeIThq86jXSlbf9q5U/TvLmAq+qbBKTcNBAo+g+DOIyWdc2UNVg==
X-Received: by 2002:a05:600c:319a:b0:3da:acb1:2f09 with SMTP id
 s26-20020a05600c319a00b003daacb12f09mr6032977wmp.19.1676846751693; 
 Sun, 19 Feb 2023 14:45:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c4d0900b003e1f2e43a1csm11484250wmp.48.2023.02.19.14.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 14:45:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 23:45:46 +0100
Message-Id: <20230219224546.1232023-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WvMHzXgjNMYxN30MMvWRe3K9N5MhKRGhdT24A9bRV+4=;
 b=HsL1hBAgrP8ho658v9XQ3I+jL6WPHyzsX2geriK04XHhGtoJuu5mRAPAZhnLEddcPk
 R34xdAhvagU6pSjuvy3EzahQk935Mo3xpxF1U8+f7Gnv6rtsuvPf9ne1lfw6LtKfXXhb
 95+a0/koI9BS3HBHtkB3KYKgD301Vo6FZ3B+UkybqjWSd31rqmeohVDv7g4EFHpV3G3U
 FqhEERoV98fycuIXZpuk3SvziVnMO29qP9AvYJKL9zkMmSGQMcAO0QTr5MnjZmU0yQ+b
 X5djbzn+9CLr8n3WjfKxnu+iu594s1vEUpubHrIHVkxAiq7Cstla5gLQSS+XDZC95Qtq
 tZeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HsL1hBAg
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: fix static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d769cfc13f6c2544f8bc5b6339d23763319a2383 was incomplete as
plugins/meson.build still unconditionally calls shared_module. So
disable plugins to fix the following static build failure raised since
bump to version 1.20.2 in commit
b95334b71fbdde0f7621b58ed35fa98df9e0966d:

[238/417] Linking target plugins/libmm-shared-telit.so
FAILED: plugins/libmm-shared-telit.so

Plugins could be enabled back through builtin_plugins as soon as
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/commit/1c4da332ee6e0d948f85a63f74cb27e89075c011
lands in a stable release

Fixes:
 - http://autobuild.buildroot.org/results/deb2a752accb021392bb9dc3d06b2b1bf151535c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/modem-manager/modem-manager.mk | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 979a80a8e9..824b9eda5a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -80,6 +80,50 @@ else
 MODEM_MANAGER_CONF_OPTS += -Dbash_completion=false
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+MODEM_MANAGER_CONF_OPTS += \
+	-Dplugin_generic=disabled \
+	-Dplugin_altair_lte=disabled \
+	-Dplugin_anydata=disabled \
+	-Dplugin_broadmobi=disabled \
+	-Dplugin_cinterion=disabled \
+	-Dplugin_dell=disabled \
+	-Dplugin_dlink=disabled \
+	-Dplugin_fibocom=disabled \
+	-Dplugin_foxconn=disabled \
+	-Dplugin_gosuncn=disabled \
+	-Dplugin_haier=disabled \
+	-Dplugin_huawei=disabled \
+	-Dplugin_intel=disabled \
+	-Dplugin_iridium=disabled \
+	-Dplugin_linktop=disabled \
+	-Dplugin_longcheer=disabled \
+	-Dplugin_mbm=disabled \
+	-Dplugin_motorola=disabled \
+	-Dplugin_mtk=disabled \
+	-Dplugin_nokia=disabled \
+	-Dplugin_nokia_icera=disabled \
+	-Dplugin_novatel=disabled \
+	-Dplugin_novatel_lte=disabled \
+	-Dplugin_option=disabled \
+	-Dplugin_option_hso=disabled \
+	-Dplugin_pantech=disabled \
+	-Dplugin_qcom_soc=disabled \
+	-Dplugin_quectel=disabled \
+	-Dplugin_samsung=disabled \
+	-Dplugin_sierra_legacy=disabled \
+	-Dplugin_sierra=disabled \
+	-Dplugin_simtech=disabled \
+	-Dplugin_telit=disabled \
+	-Dplugin_thuraya=disabled \
+	-Dplugin_tplink=disabled \
+	-Dplugin_ublox=disabled \
+	-Dplugin_via=disabled \
+	-Dplugin_wavecom=disabled \
+	-Dplugin_x22x=disabled \
+	-Dplugin_zte=disabled
+endif
+
 define MODEM_MANAGER_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager \
 		$(TARGET_DIR)/etc/init.d/S44modem-manager
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
