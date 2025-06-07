Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35B7C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 913DF614B1;
	Thu, 12 Jun 2025 08:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUcv3Tf7PWcp; Thu, 12 Jun 2025 08:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67EC26104C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67EC26104C;
	Thu, 12 Jun 2025 08:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 308341E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3209440794
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNlQMNuY84uo for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5709640708
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5709640708
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4863A805F4; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Jun 2025 21:39:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f4a9223765ea3c4fe3160fb8db80cea8c17e6c7
X-Git-Newrev: dba2912be3096ae815c03aa4552dbcbc9cd46f0a
X-Patchwork-Hint: ignore
Message-Id: <20250612083833.4863A805F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencl-headers: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=dba2912be3096ae815c03aa4552dbcbc9cd46f0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the "opencl-headers" package to install the OpenCL C API headers,
which are required at build time by consumers such as
opencl-icd-loader.

While Mesa provides these headers internally, they are not installed
by default since clover and opencl-gallium are deprecated and will
be removed starting from mesa 25.2

And since we should install them manually from mesa, it is better
use external headers. This ensures these headers are always
available and up-to-date independently from those provided by Mesa,
folowing the same logic used for "opencl-clhpp".

see:
https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies
https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/include/CL
https://github.com/KhronosGroup/OpenCL-Headers
https://gitlab.freedesktop.org/mesa/mesa/-/commit/5844dea31620f36c41ac738e17fefd57084b2dbb#feedf4d0444f717d7227468a9529c2cf9740b6fd

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Julien: add Medhi in DEVELOPERS for this package]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/opencl-headers/Config.in           |  6 ++++++
 package/opencl-headers/opencl-headers.hash |  3 +++
 package/opencl-headers/opencl-headers.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 548185cbf8..ccfc8d4e0d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -911,6 +911,9 @@ F:	configs/acmesystems_acqua_a5_512mb_defconfig
 N:	Eero Aaltonen <eero.aaltonen@vaisala.com>
 F:	package/docopt-cpp/
 
+N:	El Mehdi YOUNES <elmehdi.younes@smile.fr>
+F:	package/opencl-headers/
+
 N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
 F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
diff --git a/package/Config.in b/package/Config.in
index a46c459ff5..508cca23fc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1788,6 +1788,7 @@ menu "Graphics"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
 	source "package/opencl-clhpp/Config.in"
+	source "package/opencl-headers/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
new file mode 100644
index 0000000000..677349f727
--- /dev/null
+++ b/package/opencl-headers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_OPENCL_HEADERS
+	bool "opencl-headers"
+	help
+	  C language headers for the OpenCL API
+
+	  https://github.com/KhronosGroup/OpenCL-Headers
diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
new file mode 100644
index 0000000000..bd8697e43d
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.hash
@@ -0,0 +1,3 @@
+#Locally generated
+sha256  159f2a550592bae49859fee83d372acd152328fdf95c0dcd8b9409f8fad5db93  OpenCL-Headers-2024.10.24.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
new file mode 100644
index 0000000000..388a86e02e
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# opencl-headers
+#
+################################################################################
+
+# The opencl-headers, opencl-icd-loader, and opencl-clhpp packages
+# must always be updated together to compatible versions.
+# Version desynchronization may result in build or runtime errors.
+# When updating one of them, make sure to check and update the others.
+
+OPENCL_HEADERS_VERSION = 2024.10.24
+OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
+OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
+OPENCL_HEADERS_LICENSE = Apache-2.0
+OPENCL_HEADERS_LICENSE_FILES = LICENSE
+OPENCL_HEADERS_INSTALL_STAGING = YES
+OPENCL_HEADERS_INSTALL_TARGET = NO
+
+define OPENCL_HEADERS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/CL
+	$(INSTALL) -D -m 0644 $(@D)/CL/* \
+		$(STAGING_DIR)/usr/include/CL
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
