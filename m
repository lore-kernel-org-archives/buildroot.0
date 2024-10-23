Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D94ECFA45F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 18:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DC480B6E;
	Wed, 23 Oct 2024 18:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liEQqUObazjS; Wed, 23 Oct 2024 18:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16DB081137
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16DB081137;
	Wed, 23 Oct 2024 18:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF1C27F2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 769AD4061A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R87l_P-rMBKO for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 18:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ED5A40625
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ED5A40625
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:57:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4573D86321; Wed, 23 Oct 2024 18:57:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 20:36:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a9a4c3cd5f416b44b8ab6c3c7cdfc3cc991a5de
X-Git-Newrev: 81ae3116e42b4b08fae4c54e269afba6aeff5303
X-Patchwork-Hint: ignore
Message-Id: <20241023185718.4573D86321@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: Enable python bindings
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=81ae3116e42b4b08fae4c54e269afba6aeff5303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since libcamera commit f513fd70ba1a ("subprojects: Drop leftovers of
pybind11"), merged before libcamera v0.1.0, libcamera has no longer
relied on an external subproject branch of pybind to build the python
bindings.

Provide a new package option to allow enabling the python bindings on
libcamera when python3 is available in the buildroot configuration.
Enabling the python bindings will select and bring in pybind as a
dependency.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcamera/Config.in    | 7 +++++++
 package/libcamera/libcamera.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index e84b8d342e..4699e382c7 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -24,6 +24,13 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 
 if BR2_PACKAGE_LIBCAMERA
 
+config BR2_PACKAGE_LIBCAMERA_PYTHON
+	bool "python bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  Enable libcamera python bindings
+
 config BR2_PACKAGE_LIBCAMERA_V4L2
 	bool "libcamera v4l2 compatibility layer"
 	help
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index dfcd340b75..100934a97d 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -19,7 +19,6 @@ LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
 	-Dtest=false \
-	-Dpycamera=disabled \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
@@ -45,6 +44,13 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
 LIBCAMERA_CXXFLAGS = -faligned-new
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
+LIBCAMERA_DEPENDENCIES += python3 python-pybind
+LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
+else
+LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
 LIBCAMERA_CONF_OPTS += -Dv4l2=true
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
