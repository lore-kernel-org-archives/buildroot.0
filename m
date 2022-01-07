Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3F9C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82EA240227;
	Fri,  7 Jan 2022 18:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_MdLwnIMziW; Fri,  7 Jan 2022 18:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDDF640209;
	Fri,  7 Jan 2022 18:01:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0A7E1BF2FE
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EC6A400E5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SX6KfUkJmGKx for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:01:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F86440192
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DE61083493; Fri,  7 Jan 2022 17:55:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:01:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 685ef8d47a8dc8abe679600386a112f4b8bbf235
X-Git-Newrev: b2af6bef9c11b6438338f4ddb2f968a7f0141adb
X-Patchwork-Hint: ignore
Message-Id: <20220107175523.DE61083493@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: introduce
 BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS
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
Content-Type: multipart/mixed; boundary="===============8003339837115001690=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8003339837115001690==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b2af6bef9c11b6438338f4ddb2f968a7f0141adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In both bayer2rgb-neon and gst1-plugins-bayer2rgb-neon, the Config.in
comment was not displayed on aarch64, even though both packages are
available on this architecture.

To fix this, this commit introduces
BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS, and makes use of it in both
packages.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Thomas: add BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS, use it to fix
both packages]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bayer2rgb-neon/Config.in                         | 9 +++++++--
 package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/bayer2rgb-neon/Config.in b/package/bayer2rgb-neon/Config.in
index 7822171020..b0e3017b9f 100644
--- a/package/bayer2rgb-neon/Config.in
+++ b/package/bayer2rgb-neon/Config.in
@@ -1,6 +1,11 @@
+config BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm && BR2_ARM_CPU_HAS_NEON
+	default y if BR2_aarch64
+
 config BR2_PACKAGE_BAYER2RGB_NEON
 	bool "bayer2rgb-neon"
-	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
+	depends on BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
@@ -12,6 +17,6 @@ config BR2_PACKAGE_BAYER2RGB_NEON
 	  https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb
 
 comment "bayer2rgb-neon needs a toolchain w/ C++, dynamic library, gcc >= 4.9"
-	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	depends on BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
index d3e4d0e243..57bafd33e2 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GST1_PLUGINS_BAYER2RGB_NEON
 	bool "gst1-plugins-bayer2rgb-neon"
-	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64 # bayer2rgb-neon
+	depends on BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # bayer2rgb-neon
 	depends on BR2_INSTALL_LIBSTDCPP # bayer2rgb-neon
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # bayer2rgb-neon
@@ -15,6 +15,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAYER2RGB_NEON
 	  https://gitlab-ext.sigma-chemnitz.de/ensc/gst-bayer2rgb-neon
 
 comment "gst1-plugins-bayer2rgb-neon needs a toolchain w/ C++, dynamic library, gcc >= 4.9"
-	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	depends on BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

--===============8003339837115001690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8003339837115001690==--
