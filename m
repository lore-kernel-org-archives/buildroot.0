Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E58EB64DD
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 09:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C0940650;
	Sat,  5 Aug 2023 09:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2C0940650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ouCvaIv35JbU; Sat,  5 Aug 2023 09:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44A52408FC;
	Sat,  5 Aug 2023 09:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A52408FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 699B51BF348
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 09:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B42FC4092E
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 09:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B42FC4092E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rpERUwszpsc for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 09:03:16 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9819D4006C
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 09:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9819D4006C
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F03AA4C0366
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 11:03:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53712)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSDBp-0005L5-0Y
 for buildroot@buildroot.org; Sat, 05 Aug 2023 11:03:13 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 11:03:13 +0200
Message-Id: <20230805090313.3618649-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691226193;
 bh=icTYTeR+Jpvr62qdl0Jhi3PfkzXOAzlSVplj9nBCico=;
 h=From:To:Subject:Date:From;
 b=SUzqY5JgfwE41Jj8OSJGoH05vNUPDCpdn4SJ9BW2nw+TAN8vSEqeG8/t8HDhuIIZ+
 JWz8XxEow/Fgj6fevdTp5TZocIC5qjUzRtDh0gHVJR71qvOCu+zHo5ZYHDLh6ZLzVB
 pYcGc8eid639oqpKQc/I825Kovi0TMpThLNi/sq6E8w81vc9cPosM9Je22gfsAeJ6U
 1S12eCKNKK+NO7q5K1wup9NWpcH/AKTiSFIO+lQyclJ70ClbICtHiN18LZTkfbMl/y
 xLvAIAy+0KpMYxe/3qlHF8ljKiCESZstFvE3DcHDqOn+r7WVVEK27J3r9utcFb2//7
 Kg6YNBbFoznOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=SUzqY5Jg
Subject: [Buildroot] [PATCH v2 1/1] package/kodi: add optional support for
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
v2: fix dependency hell

 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6b68e6d504..07a2665581 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -217,6 +217,12 @@ config BR2_PACKAGE_KODI_RENDER_SYSTEM_GLES
 
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
index aff272d014..0f558372cd 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -361,6 +361,13 @@ else
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
