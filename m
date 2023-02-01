Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C5FC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC0F260E55;
	Wed,  1 Feb 2023 05:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0F260E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUudCdbl3vbg; Wed,  1 Feb 2023 05:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B40360E4B;
	Wed,  1 Feb 2023 05:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B40360E4B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEBA51BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C63E2410C7
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63E2410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vl9TOcokzMzE for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9063E409EB
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9063E409EB
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id l7so5600712ilf.0
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMskcIO4ebDLDCYWQSdiubqOrIBOIQvD4TLcfPJ1bac=;
 b=wjTPsh0FYrF8kWN/uqS3tfZi449SeT30dMUfMRO1VivHcLvfaa+BLTn0q93A8YlnqA
 tk4h1Bknts0YEp9oMSiIiZ+NdD7PpY7CxDzpGT5kpAzidjTEp9vPp+Tkr3FFzIFs94mN
 51dI++0LklyJRUINysimKpdFXxUpHgMiYhANO2r1VWxLajbWa1GNKcKDNKHBK5dp+LSo
 D4La0r4l6Ts0GCm3aLttnI6wGZthcxY5HGFx+niXsP9RXCfSAeznXs7afN/zyEojD7xq
 42/e1Wvxqxruzk2OFWYzw2U4UL5+umr1R4npOzSzP/ynw6nbMC4Ey8qy7cAI5WAXGeVM
 aHjg==
X-Gm-Message-State: AO0yUKXxZRt0ax/yzmLFSIeodmkpXMVC4DaXlZVP21pLskc5wefOE33d
 0OXZgsb7LY7yPFCMLl3dcSPITN7x3Jugsw==
X-Google-Smtp-Source: AK7set8tQlKhAzxCF2fAkwxI/OB5hAJGn3UoGNqto7X+X8PCTDO/jjL8jpQdkvvS1HpOf1uYOrdkBA==
X-Received: by 2002:a05:6e02:1888:b0:311:12ad:4925 with SMTP id
 o8-20020a056e02188800b0031112ad4925mr1275798ilu.2.1675228633372; 
 Tue, 31 Jan 2023 21:17:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:51 -0700
Message-Id: <20230201051658.383420-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMskcIO4ebDLDCYWQSdiubqOrIBOIQvD4TLcfPJ1bac=;
 b=peXZSOklkopriU1xghYspd9hBrmm1eHgQfTrTznik9N9jetFgQaa9Ls9TzvzfN/H9V
 nQ0SgLzIxhOoRcxldfCgWYgdpE+bs7t6ivfqH4P92bkCg58SQmc9a8o9qHhSa8mlGt17
 4o6ElEvT4Sqpb/EGHrPhTh1FJT3a+SmVuEVDXWp13busrGwLei3/M/lMARbvBlNDUef6
 i4GHHuQ6NDTGOy7SjHdsZm/OtXiKIIPE7Beu9yK9TpR9D75ptQzeMdNB44jTF1e/WwdV
 Te21QM9whkzqCJnvUHC3erjibwZRcw4Y+D/LxcI870DagSS4iVmE3LnuW0C7Wz/ZHk0D
 Z+lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=peXZSOkl
Subject: [Buildroot] [PATCH 06/13] package/gst1-plugins-ugly: bump version
 to 1.22.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove xingmux config option which has been moved to the
gst1-plugins-good package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Config.in.legacy                                          | 7 +++++++
 package/gstreamer1/gst1-plugins-ugly/Config.in            | 5 -----
 .../gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 8 +-------
 4 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3fff2b1ddd..1c5af2652a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX
+	bool "xingmux moved"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_XINGMUX
+	help
+	  The xingmux option has been moved to gst1-plugins-good.
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	bool "videoscale removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index ba19989892..54766ffa8c 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -26,11 +26,6 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB
 	help
 	  DVD subtitle parser and decoder
 
-config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX
-	bool "xingmux"
-	help
-	  Add XING tags to mpeg audio files
-
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA
 	bool "realmedia"
 	help
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 4ec29e6894..21579216df 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.4.tar.xz.sha256sum
-sha256  5c9ec6bab96517e438b3f9bae0ceb84d3436f3da9bbe180cf4d28e32a7251b59  gst-plugins-ugly-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.0.tar.xz.sha256sum
+sha256  a644dc981afa2d8d3a913f763ab9523c0620ee4e65a7ec73c7721c29da3c5a0c  gst-plugins-ugly-1.22.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 20382719c3..9f16fa3da8 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.20.4
+GST1_PLUGINS_UGLY_VERSION = 1.22.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -51,12 +51,6 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdsub=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += -Dxingmux=enabled
-else
-GST1_PLUGINS_UGLY_CONF_OPTS += -Dxingmux=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
 GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=enabled
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
