Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2BCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F3440575;
	Sun, 10 Apr 2022 15:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nkqk1NoAvAI3; Sun, 10 Apr 2022 15:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC20040569;
	Sun, 10 Apr 2022 15:09:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B67471BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C48A2825E8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtVYjx7twgxJ for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3F47826A4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:08:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 45BA283874; Sun, 10 Apr 2022 14:58:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:02:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80a9e9057daf587242548aa23f8cd7a8d88bfa1f
X-Git-Newrev: 129922140ed7ed03458398b5ec3bad1423f7e6cf
X-Patchwork-Hint: ignore
Message-Id: <20220410145854.45BA283874@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: needs
 C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=129922140ed7ed03458398b5ec3bad1423f7e6cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst1-plugins-bad needs C++ since switch to meson-package in commit
5d6c408e9535be4b5ba0c8a49215d2d03dcb5cd5:

The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-8/output-1/host/bin/microblaze-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-8/output-1/host/bin/microblaze-buildroot-linux-musl-g++'"

Rewriting the meson.build so it only requires C++ for the modules that
are actually written in C++ is quite complicated, so just let the whole
package depend on C++. Hopefully however this is going to be fixed in
some future release. Therefore, the dependencies for individual modules
are kept as well (even though they're redundant now).

Fixes:
 - http://autobuild.buildroot.org/results/8f924cebeb8a1ed73e57103bf3073fb8f8d8752e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-imx/Config.in         | 6 ++++--
 package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++++
 package/gstreamer1/gst1-vaapi/Config.in       | 5 +++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 7b46233b53..41ef8548c5 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -88,11 +88,13 @@ config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
 config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
 	bool "imxv4l2videosink"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 # V4L2_COLORSPACE_DEFAULT
+	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	help
 	  Elements for V4L2 output
 
-comment "imxv4l2videosink needs a toolchain w/ headers >= 4.2"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+comment "imxv4l2videosink needs a toolchain w/ headers >= 4.2, C++"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 || \
+		!BR2_INSTALL_LIBSTDCPP
 
 endif
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 234d57636b..669360adb1 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -1,5 +1,6 @@
 menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
 	bool "gst1-plugins-bad"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  A set of plug-ins for GStreamer that may be of poor quality
@@ -724,3 +725,6 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 endif
+
+comment "gst1-plugins-bad needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index 91bd4f85dd..ade8b83a5f 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GST1_VAAPI
 	bool "gst1-vaapi"
 	depends on !BR2_STATIC_LIBS # dlopen(), libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
+	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBDRM
@@ -45,6 +46,6 @@ config BR2_PACKAGE_GST1_VAAPI_ENCODERS
 
 endif
 
-comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library"
+comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library, C++"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_PACKAGE_HAS_UDEV
+		!BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
