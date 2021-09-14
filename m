Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4ACC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 16:17:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A004D610FB
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 16:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A004D610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB1780B5B;
	Tue, 14 Sep 2021 16:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qzAKsPCULRA; Tue, 14 Sep 2021 16:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B43B780B15;
	Tue, 14 Sep 2021 16:17:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5006D1BF42E
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 16:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D81480B15
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 16:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzJnovpbylbc for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 16:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15EB580B10
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 16:17:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g16so21183407wrb.3
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4Pxh8i/QxsfhJdwB3jYleFA4aHmsZZemavFN85L0uA=;
 b=GZOu13Cyi+gaOGcBUd7EPGNreiPfWTUKYKzVB0ubeP6L5YlhjkItBPWYBWW+XWjfQ1
 VQHw8aUc050OIPQecSp6woZSEGbliA35Aluq3y4I8/gZdRkiz6s1YelwzLl27SDcM66O
 3MNxGuHae/kxM5cxv/RVtIr8nbJoAfpo9JQ3V7NT3KFse4GkRSWjB+7Y9CyU3TBCdTsT
 ETEwSFy0XhJadrgE9pJ1bCqTWvYhZoyLkc2Vr3cjef3WJWf08AtwVDzXDgksm+dI0eGM
 X96GiWduLJaSlBpdPN/wQF+S0HGyNTlC4/SpyWgZRDa2JGEeFX6NA9vLJuE2Pu5S3UI/
 BTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4Pxh8i/QxsfhJdwB3jYleFA4aHmsZZemavFN85L0uA=;
 b=xAxVOC9eovg1g1TGTBQ4dL5HcLy41O9Rn6Hr7JX8ogI939lfXrOHrSid43dWS830xu
 mhrcKKhFwys2+U1mkehwlIJLfYqkAFfqkN1b/G8FH83b/RSajpqiOKIMTd/NhpLAn561
 622Fi2gJuJz+c0yoLKRkIlcbdcC7FN/2vPrUzKWURXVX4GvMfdO1DX6Sy0aY0AGhdXsj
 jsw3OoENwUOl/ahHZQpj6zMGLiOL6RAYEtKlB8AfP+8TE9tjbf0BojbtyEwj3KyqWTQK
 KC3TGu1sZXkbSp/xIRSZvgDwcP+xktVbVhUgan2mtswSuTi6GAGXOE8oe6ymWNTI+yvt
 zmfQ==
X-Gm-Message-State: AOAM530IzG6+GUQCo5MSgrACHVAdcWpF3mvWU2Mj8+sUWAfMG9qT5mdO
 1dMk52GSuhKOwcCYI67dp2Xrz25IHbI=
X-Google-Smtp-Source: ABdhPJw9eiotna98gbx16M5cBetdw+paWTGxeg/9qbjbiWwbpGJpkOdfliNPfrDamqOWWchxyEy6cQ==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr19714690wrd.87.1631636257971; 
 Tue, 14 Sep 2021 09:17:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id r2sm11556790wrg.31.2021.09.14.09.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 09:17:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 18:17:31 +0200
Message-Id: <20210914161731.45958-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914161731.45958-1-fontaine.fabrice@gmail.com>
References: <20210914161731.45958-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xapp_xeyes: add xlib_libXi
 mandatory dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Build fails since commit c47ebe7aeb70015614ff1d477dc1a71e8c161425
because xlib_libXi is a mandatory dependency since version 1.2.0 and
https://gitlab.freedesktop.org/xorg/app/xeyes/-/commit/420c2d8517246c9e422739cadb7acb29e35a3bed:

configure: error: Package requirements (xi >= 1.7 x11 xt xext xmu xproto >= 7.0.17) were not met:

Package 'xi', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/896f45fb9eadcd235aeab096db479ee0aa5d0860

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_xeyes/Config.in     | 1 +
 package/x11r7/xapp_xeyes/xapp_xeyes.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
index a7b77375fd..268bc5807e 100644
--- a/package/x11r7/xapp_xeyes/Config.in
+++ b/package/x11r7/xapp_xeyes/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XAPP_XEYES
 	bool "xeyes"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index a127e28ea7..68df8c9ab0 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -9,7 +9,8 @@ XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
-XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
+XAPP_XEYES_DEPENDENCIES = \
+	xlib_libX11 xlib_libXext xlib_libXi xlib_libXmu xlib_libXt
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
 XAPP_XEYES_DEPENDENCIES += xlib_libXrender
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
