Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8418C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 23:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F49960E45;
	Mon, 19 Dec 2022 23:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F49960E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaO3rkkGZ9Q7; Mon, 19 Dec 2022 23:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C7260E3E;
	Mon, 19 Dec 2022 23:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C7260E3E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2EF11BF319
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 23:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6BF34151E
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 23:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6BF34151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTPuv5p7ujW5 for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 23:22:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA847410E7
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA847410E7
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 23:22:40 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 82so7273137pgc.0
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 15:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x+RErbhZ0wcO5uChtQ7zFPxeN3LWbEmgfbprMmXTwBw=;
 b=dANtLhEQ0asIC63M6aPIhaNgIlFEiOby19J7s8YuIfQfNU52kRdlad0ZEg6qBzqF1S
 TflS/qTao5CNo2noLNaABzbKNIdnBdABFfSG2ItZce+IxsM3iIEq7Yde545sWaLSIwoc
 89XGobPtjNmc5por4IyUkF7TS57UAJQ0gsTuCEvxZjhhT+CfTPWJHn4MP1vzFcoVvMxj
 nE5vMUVGnJU4TV+aZvrx4VUsW/YyA4uoryKWxSgsOWzMLxiGE3z/83mhJLu3wce34/up
 bec7UpfMO7FJ7UFLhVLbIDKQIDhIw4dwlAuGelDcD83NqVVhzwZmFBk9Fr2v2ytQjqxU
 NJsw==
X-Gm-Message-State: AFqh2kpBxuXnpKy8DXLdk6AhVC5X8NRQanDZOiO/9hHyfYMwB5cLQkQe
 WmG4T6yBG/WFyLv2ZvUgX98e/G2dzqUP0A==
X-Google-Smtp-Source: AMrXdXvWgU1JHYuIcqdSIkXUovaOlNhnKCbj6NY12N/yKjI1Bs+pV/Dqm17D21PRTRtxEFntk7tDAw==
X-Received: by 2002:a62:1845:0:b0:577:9182:199a with SMTP id
 66-20020a621845000000b005779182199amr11008985pfy.29.1671492159600; 
 Mon, 19 Dec 2022 15:22:39 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 e14-20020aa7980e000000b00577dd531b47sm7160936pfl.189.2022.12.19.15.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 15:22:39 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 15:08:02 -0800
Message-Id: <20221219230802.2602798-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x+RErbhZ0wcO5uChtQ7zFPxeN3LWbEmgfbprMmXTwBw=;
 b=Sl1B00xA0YJ38rxMe1PbJeCmiief1F8XU54bwS9WDLBIFi4mJdoKooSHV4Xjb/gMq3
 TLOk3F6F440cf+iTluEfnb06ExM2VGXCCfJHlTu/HIWHCeiMPb0MtBYL693HI16PDDim
 b2pQbcZqbEb9tPVEl9hsZ7md3otGezuktCNEv2RQPpWImPlRWU6AKfpOfcH43G/2kiWa
 DOnfMSkxXwJ5yvqglx/wPa25aePAe+80ptu6natHIkwJNXnFVzG4PXklD2Gb3VuQgGGU
 AV56HU7EtXnGWuD/0SPLxNFpJMpfXxEEa+h+G5afen+GsDyJIcOFcmSHY9+/j8eDgCsO
 xzNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Sl1B00xA
Subject: [Buildroot] [PATCH v2] package/libgpg-error: Disable unused files
 installation
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com,
 Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable a number of unused files that were being installed into the root
filesystem and thus inflating its size needlessly:

* Disable the building of documentation

* Disable support for other languages which is comprised of Common Lisp that
  buildroot has no package for

* Only install binaries and shared/static libraries, remove libtool archive

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- remove header files, pkgconfig and other unnecessary files

 package/libgpg-error/libgpg-error.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 86dea6ad2acd..6ce1f8d908de 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -14,7 +14,9 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = --disable-tests \
-		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
+		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
+		--disable-languages \
+		--disable-doc
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBGPG_ERROR_CONF_OPTS += --enable-threads
@@ -22,4 +24,9 @@ else
 LIBGPG_ERROR_CONF_OPTS += --disable-threads
 endif
 
+define LIBGPG_ERROR_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install-exec
+	rm -f $(TARGET_DIR)/usr/lib/libgpg-error.la
+endef
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
