Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7531C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E8BE80C01;
	Thu, 30 Dec 2021 16:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-H8Xg75O1o6; Thu, 30 Dec 2021 16:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF21E80BAE;
	Thu, 30 Dec 2021 16:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A68201BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94CCD803C0
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6h-WEcb2zq1 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:36:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C150D82813
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:36:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 91B1082DDE; Thu, 30 Dec 2021 16:30:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 17:35:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79c5f60ad5738a7f4887ae1a1e35a87d49e48b19
X-Git-Newrev: f2f9523c554ad4a78a6f01b931c8f0a224146a8d
X-Patchwork-Hint: ignore
Message-Id: <20211230163029.91B1082DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 option to enable uvch264
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2f9523c554ad4a78a6f01b931c8f0a224146a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in       | 21 +++++++++++++++++++++
 .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  8 +++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index ad08615256..138b55a055 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -595,6 +595,27 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SRTP
 	bool "srtp"
 	select BR2_PACKAGE_LIBSRTP
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_UVCH264
+	bool "uvch264"
+	depends on BR2_PACKAGE_HAS_UDEV # libgudev
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev, libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_USE_MMU # libgudev
+	depends on BR2_USE_WCHAR # libgudev
+	select BR2_PACKAGE_LIBGUDEV
+	select BR2_PACKAGE_LIBUSB
+	help
+	  UVC compliant H.264 camera source plugin
+
+comment "uvch264 needs udev /dev management"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+comment "uvch264 needs a toolchain w/ threads, wchar, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 	bool "voaacenc"
 	select BR2_PACKAGE_VO_AACENC
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index d3f089bfed..ac00fd59e1 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -36,7 +36,6 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Davtp=disabled \
 	-Dopensles=disabled \
-	-Duvch264=disabled \
 	-Dmsdk=disabled \
 	-Dvoamrwbenc=disabled \
 	-Dbs2b=disabled \
@@ -722,6 +721,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dsrtp=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_UVCH264),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libgudev libusb
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
