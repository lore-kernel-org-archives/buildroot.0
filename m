Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFA4C369D1
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1588406B8;
	Sat, 19 Apr 2025 20:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJ9yK_xCTm5n; Sat, 19 Apr 2025 20:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8728406C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8728406C1;
	Sat, 19 Apr 2025 20:25:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD51A230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 701284015A
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQYEYSrZu-lZ for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B914240162
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B914240162
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3B9B85CB8; Sat, 19 Apr 2025 20:25:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 22:20:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 569272be91ec02b35a94c545188a879dc78a7851
X-Git-Newrev: ef3c3bc9b17dad16e63d6519c0f037e7ec65e976
X-Patchwork-Hint: ignore
Message-Id: <20250419202542.A3B9B85CB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: improve future
 reproducibility by forcing auto features to disabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef3c3bc9b17dad16e63d6519c0f037e7ec65e976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

meson allows to force all features set to "auto" to default to disabled
except if explicitly enabled via the auto_features argument, c.f.
https://mesonbuild.com/Build-options.html#features

"""
If the value of a feature option is set to auto, that value is
overridden by the global auto_features option (which defaults to auto).
This is intended to be used by packagers who want to have full control
on which dependencies are required and which are disabled, and not rely
on build-deps being installed (at the right version) to get a feature
enabled.
"""

The only auto feature that we hadn't disabled explicitly is the
gstreamer plugin. It is however expected that this wasn't a mistake as
the dependencies for the gstreamer pluging wouldn't have been met
thanks to the explicit LIBCAMERA_DEPENDENCIES we have based on the
presence of the gstreamer symbols in the global config.

This should make it less likely for future releases of libcamera to
regress in terms of reproducibility because of "auto" features (though
changes from "auto" to "enabled" wouldn't be caught and would be
susceptible to race conditions with their dependencies in case they
aren't properly specified and built after libcamera is).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 0f52f08e39..ac5c12ff72 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -16,9 +16,9 @@ LIBCAMERA_DEPENDENCIES = \
 	libyaml \
 	gnutls
 LIBCAMERA_CONF_OPTS = \
+	-Dauto_features=disabled \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
-	-Dqcam=disabled \
 	-Dtest=false \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
@@ -48,8 +48,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
 LIBCAMERA_DEPENDENCIES += python3 python-pybind
 LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
-else
-LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
@@ -71,8 +69,6 @@ LIBCAMERA_CONF_OPTS += -Dpipelines=$(subst $(space),$(comma),$(LIBCAMERA_PIPELIN
 ifeq ($(BR2_PACKAGE_LIBCAMERA_COMPLIANCE),y)
 LIBCAMERA_DEPENDENCIES += gtest libevent
 LIBCAMERA_CONF_OPTS += -Dlc-compliance=enabled
-else
-LIBCAMERA_CONF_OPTS += -Dlc-compliance=disabled
 endif
 
 # gstreamer-video-1.0, gstreamer-allocators-1.0
@@ -84,8 +80,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBCAMERA_CONF_OPTS += -Dcam=enabled
 LIBCAMERA_DEPENDENCIES += libevent
-else
-LIBCAMERA_CONF_OPTS += -Dcam=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
@@ -95,15 +89,11 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCAMERA_CONF_OPTS += -Dudev=enabled
 LIBCAMERA_DEPENDENCIES += udev
-else
-LIBCAMERA_CONF_OPTS += -Dudev=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LIBCAMERA_CONF_OPTS += -Dtracing=enabled
 LIBCAMERA_DEPENDENCIES += lttng-libust
-else
-LIBCAMERA_CONF_OPTS += -Dtracing=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
