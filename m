Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3B8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9783281971;
	Wed, 27 Jul 2022 09:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9783281971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjO9dNPQQ9qu; Wed, 27 Jul 2022 09:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B319B81919;
	Wed, 27 Jul 2022 09:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B319B81919
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACE231BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84D7B4041C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84D7B4041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ImE0SYpHb23g for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:16:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F754028D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80F754028D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:16:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i8so360245wro.11
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qB2XZAafY6LgT3VSNxWtU/W+zXTIlQPpFGnPCDWm164=;
 b=426e3L2vFIin5TlRdJFimXwJ8CRGUYqH66gM7yox2q9hzCEFx/nAKDJGGO0QzZusZ2
 epVx3pgmN39ag4WG6E6DFSUkSU9M3teNHYFNg6Q/g7RRHU1z8962xYSPxDUrwyRBY1q/
 8gN454LlkqH2N5MOs2AmoXHv2HaMROYE3S4Hafp3TFMu+W2BoAbCJvg4t2TlxnURmWqu
 HgQYMLGtYeX0zLw1KCfXhHrbNzxgflZKA4YAqJVt1ckqxGA+acXE6T1oUkdTWrvH0JG6
 K57WkvD/tj1wDaUhC/fyugLf+cX8bo3xYrFFYE9jetRsW+FKX/UgIqkREbG2+sb0LXPm
 LWew==
X-Gm-Message-State: AJIora97xToEusGnj2EYarpF64E5irJjcC6hUGhsUCInnIEJGHrmd8p5
 DptYAdTthO2jSxrgrFrtiCmqx+G0iLw=
X-Google-Smtp-Source: AGRyM1tfW93ajtvsNft7IXkMrXL0voW8jdk0RMsF996sKKBe2RKbtsHG00cW2RLak6doYsbP3WhJyQ==
X-Received: by 2002:a05:6000:1549:b0:21d:bdce:1d01 with SMTP id
 9-20020a056000154900b0021dbdce1d01mr14019103wry.373.1658913376125; 
 Wed, 27 Jul 2022 02:16:16 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe10f000000b0021ee28ff76esm120539wrz.38.2022.07.27.02.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:16:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:16:07 +0200
Message-Id: <20220727091607.979180-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qB2XZAafY6LgT3VSNxWtU/W+zXTIlQPpFGnPCDWm164=;
 b=BEgYRg1CihmeLNEwsOiMFm5cpyp7GG644tOX+bFX5kGFlMZOg1VKRA1eD7omf4pdVx
 9sO+qk57gFMe7qut6OplkrtWZlRI88vS+5NTRgTl+Ee58CITGUAQdaFL0xAEH7wb2PKF
 OApl6fatTLwuQgKWxSIjKKyzJHx3gtsrVIU22Xqo+wZzaCmmW1PSraYr4ysJchWTxwJk
 DlZV+zcFlfSqub0/B3Nc342O9oXTtmBlr8zpGbppbOsrsLFFLMrxywL3IhgBOKCybgoL
 ByQLnhKa9xQWZ1bGfChDIkM2A/ezY7EJKLGYYon6fvCzTjmSHXmYPMgrdVbNk9dkI0xz
 u22g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BEgYRg1C
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: bump to version 2.42.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/blob/2.42.8/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash |  4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 5e7dc7e03b..4bb246aa50 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,3 +1,3 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.4.sha256sum
-sha256  fe9c5dd88f486194ea2bc09b8814c1ed895bb6c530f37cbbf259757c4e482e4d  gdk-pixbuf-2.42.4.tar.xz
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.8.sha256sum
+sha256  84acea3acb2411b29134b32015a5b1aaa62844b19c4b1ef8b8971c6b0759f4c6  gdk-pixbuf-2.42.8.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 329c05520e..57e8bbd511 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.42
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).4
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).8
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
@@ -41,30 +41,30 @@ GDK_PIXBUF_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-GDK_PIXBUF_CONF_OPTS += -Dpng=true
+GDK_PIXBUF_CONF_OPTS += -Dpng=enabled
 GDK_PIXBUF_DEPENDENCIES += libpng
 else
-GDK_PIXBUF_CONF_OPTS += -Dpng=false
+GDK_PIXBUF_CONF_OPTS += -Dpng=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-GDK_PIXBUF_CONF_OPTS += -Djpeg=true
-HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=true
+GDK_PIXBUF_CONF_OPTS += -Djpeg=enabled
+HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=enabled
 GDK_PIXBUF_DEPENDENCIES += jpeg
 HOST_GDK_PIXBUF_DEPENDENCIES += host-libjpeg
 else
-GDK_PIXBUF_CONF_OPTS += -Djpeg=false
-HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=false
+GDK_PIXBUF_CONF_OPTS += -Djpeg=disabled
+HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-GDK_PIXBUF_CONF_OPTS += -Dtiff=true
-HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=true
+GDK_PIXBUF_CONF_OPTS += -Dtiff=enabled
+HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=enabled
 GDK_PIXBUF_DEPENDENCIES += tiff
 HOST_GDK_PIXBUF_DEPENDENCIES += host-tiff
 else
-GDK_PIXBUF_CONF_OPTS += -Dtiff=false
-HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=false
+GDK_PIXBUF_CONF_OPTS += -Dtiff=disabled
+HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=disabled
 endif
 
 # gdk-pixbuf requires the loaders.cache file populated to work properly
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
