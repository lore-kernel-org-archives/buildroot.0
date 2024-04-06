Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53880C67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 07:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2311341B83;
	Sat,  6 Apr 2024 07:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ns6dENz6dFt3; Sat,  6 Apr 2024 07:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2D441974
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E2D441974;
	Sat,  6 Apr 2024 07:35:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE2EF1BF390
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7E5C41D78
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haVIXQDkyCrs for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 07:35:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5CFA41C62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5CFA41C62
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5CFA41C62
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:35:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cabe.dip0.t-ipconnect.de [79.214.202.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00985A4C2DBD;
 Sat,  6 Apr 2024 09:32:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60956)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rt0XD-000000000gm-0el2;
 Sat, 06 Apr 2024 07:32:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Apr 2024 09:32:16 +0200
Message-Id: <20240406073216.1054073-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240406073216.1054073-1-bernd@kuhls.net>
References: <20240406073216.1054073-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712388740;
 bh=JpOUTQsPs6iou1ide5ITXv2A++xLw+5BHlf1n/VEQpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lRrju1VMD8ps4fvFi9UyMc/pBwa9NLms6/2yUZpFywHVVxoov5SC5n1ZE1drwjL+F
 pCpFuxjlQUZ60t7KXSp6XzcCG6OAmPlK099U91g3rUlDLuWOEYSjXMR7bPhxk4ghxT
 4X+qT2Ot5fG2hcsmT+4Y07/hEWjNZ0G4WDdw572cQ77/uCQGv0hVpF+9JRHivD/Uv2
 iNgs/j6bWgIbpxOmh8ZC4wEDQAzZ4X7jtqm0U6XS1M670I5dsCoAOevtB64ZK0kT+1
 FpI8B9PZEgjS5eDix8UXxAZVcrl/xUKFf4eX5n+y6fwxtp1BNeoxfeyQzN+cEBKGfn
 MEA6t+/joN1Wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=lRrju1VM
Subject: [Buildroot] [PATCH 18/18] package/kodi: add optional support for
 pipewire
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Selecting pipewire is not possible due to reverse dependencies:

package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
package/gstreamer1/gstreamer1/Config.in:5:	symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_PIPEWIRE_GSTREAMER
package/pipewire/Config.in:35:	symbol BR2_PACKAGE_PIPEWIRE_GSTREAMER depends on BR2_PACKAGE_PIPEWIRE
package/pipewire/Config.in:1:	symbol BR2_PACKAGE_PIPEWIRE is selected by BR2_PACKAGE_KODI_PIPEWIRE
package/kodi/Config.in:220:	symbol BR2_PACKAGE_KODI_PIPEWIRE depends on BR2_PACKAGE_KODI
package/kodi/Config.in:54:	symbol BR2_PACKAGE_KODI depends on BR2_PACKAGE_PYTHON3
package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
package/jack2/Config.in:33:	symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
package/jack2/Config.in:1:	symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
package/fluidsynth/Config.in:38:	symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
package/fluidsynth/Config.in:1:	symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
package/gstreamer1/gst1-plugins-bad/Config.in:438:	symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 885550a542..c9df01ad02 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -221,6 +221,12 @@ config BR2_PACKAGE_KODI_RENDER_SYSTEM_GLES
 
 endchoice
 
+config BR2_PACKAGE_KODI_PIPEWIRE
+	bool "pipewire"
+	depends on BR2_PACKAGE_PIPEWIRE
+	help
+	  Enable Pipewire support.
+
 config BR2_PACKAGE_KODI_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index b9931f9609..97c60d49aa 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -374,6 +374,13 @@ else
 KODI_CONF_OPTS += -DENABLE_OPTICAL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PIPEWIRE),y)
+KODI_CONF_OPTS += -DENABLE_PIPEWIRE=ON
+KODI_DEPENDENCIES += pipewire
+else
+KODI_CONF_OPTS += -DENABLE_PIPEWIRE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_PULSEAUDIO),y)
 KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=ON
 KODI_DEPENDENCIES += pulseaudio
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
