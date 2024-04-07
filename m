Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3400CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71ADC81E6D;
	Sun,  7 Apr 2024 11:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xepTHZ-bnQSp; Sun,  7 Apr 2024 11:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69B5381AAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69B5381AAB;
	Sun,  7 Apr 2024 11:48:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2A6F1BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBA9681384
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMn5Bmtdf4bM for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01D5381456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01D5381456
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01D5381456
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:48:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42EEBA4C2EB6;
 Sun,  7 Apr 2024 13:44:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx8-000000005Wv-0SrM;
 Sun, 07 Apr 2024 11:44:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:45 +0200
Message-Id: <20240407114445.683504-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490290;
 bh=JpOUTQsPs6iou1ide5ITXv2A++xLw+5BHlf1n/VEQpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c+Wshpw/wHHY+tVOdADUNLZz7X+G/T5Q/vp7ZUXID3Et50s3OQF7nrqX6LgqnWPGD
 OZ/shWQUr0tr3vkHTgytVJIjxBF6RWsQE8DMStkjzrTePL1aUz3//zPZ53cIP+gbXv
 ZUgHNI5T3w/jeM7vSgUegpJcF85bUn9wWUmU22TDMXvuvq3OtP4eFC418fOs9XQLM/
 8j4ci3OF4QO685cv/XZRgS0LwqVmxOWUhrgiSQ1NzFaIyy+EFc1H8BtPksAWnqSGoa
 dfW9Gru1ISBoeJaOX3WQc4BAesnSAI67BUCb5YeUYwIvkNqH/4BwlsS07AO5tOYMp3
 6ku3wGYg3SAeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=c+Wshpw/
Subject: [Buildroot] [PATCH v2 20/20] package/kodi: add optional support for
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
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
