Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B2C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E682E41F73;
	Thu,  9 May 2024 17:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id En1fF7YP50Lm; Thu,  9 May 2024 17:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CFD41F66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CFD41F66;
	Thu,  9 May 2024 17:24:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 709971BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7F3941DAB
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liTYFLEyn741 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8245041DAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8245041DAA
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72A5D86CDE; Thu,  9 May 2024 17:23:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 19:04:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 969f5558bee8afd030f08a199d52002ea1eeacbb
X-Git-Newrev: 4c956bb7e3974b8769f6160a99309e9d2b06c57a
X-Patchwork-Hint: ignore
Message-Id: <20240509172345.72A5D86CDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: add optional support for
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c956bb7e3974b8769f6160a99309e9d2b06c57a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5710b0b31f..0ec41785b1 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -222,6 +222,12 @@ config BR2_PACKAGE_KODI_RENDER_SYSTEM_GLES
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
