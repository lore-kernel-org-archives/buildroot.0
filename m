Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5035FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:42:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A270460F42
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A270460F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512DB6068D;
	Sun, 25 Jul 2021 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id It3PtIIMlwE2; Sun, 25 Jul 2021 15:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74A6F605C5;
	Sun, 25 Jul 2021 15:42:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3A91BF41F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 844D94034E
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgZKW5649ikh for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 15:42:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E1BE40339
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 15:42:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 733B388EF6; Sun, 25 Jul 2021 15:08:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 17:42:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fbdf51596079b17ef360e942b604237efbcc217
X-Git-Newrev: 9cda982855315d683d4880e6bb2a129133ea7213
X-Patchwork-Hint: ignore
Message-Id: <20210725150803.733B388EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-driver: fixup libraries
 according to README
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9cda982855315d683d4880e6bb2a129133ea7213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create a symlink for libglx.so and drop libnvidia-wfb.so (aka libwfb.so)
since all selectable xserver versions in Buildroot provide their own.

VDPAU libraries should be installed into /usr/lib/vdpau/

https://download.nvidia.com/XFree86/Linux-x86_64/390.67/README/installedcomponents.html

Also, allow specifying target subdirectory per library and respect it in
the install loop.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nvidia-driver/nvidia-driver.mk | 57 +++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 44e34cb7b4..80221bc7da 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -62,7 +62,7 @@ NVIDIA_DRIVER_LIBS_MISC = \
 	libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
 	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
-	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
 	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS += \
@@ -92,10 +92,9 @@ NVIDIA_DRIVER_LIBS += \
 endif
 
 # We refer to the destination path; the origin file has no directory component
-NVIDIA_DRIVER_X_MODS = \
-	drivers/nvidia_drv.so \
-	extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)
+NVIDIA_DRIVER_LIBS += \
+	nvidia_drv.so:xorg/modules/drivers/ \
+	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
 
 endif # X drivers
 
@@ -154,24 +153,31 @@ define NVIDIA_DRIVER_EXTRACT_CMDS
 endef
 
 # Helper to install libraries
-# $1: destination directory (target or staging)
+# $1: library name
+# $2: target directory
 #
 # For all libraries, we install them and create a symlink using
 # their SONAME, so we can link to them at runtime; we also create
 # the no-version symlink, so we can link to them at build time.
+define NVIDIA_DRIVER_INSTALL_LIB
+	$(INSTALL) -D -m 0644 $(@D)/$(1) $(2)$(notdir $(1))
+	libsoname="$$( $(TARGET_READELF) -d "$(@D)/$(1)" \
+		|sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
+	if [ -n "$${libsoname}" -a "$${libsoname}" != "$(notdir $(1))" ]; then \
+		ln -sf $(notdir $(1)) $(2)$${libsoname}; \
+	fi
+	baseso=$(firstword $(subst .,$(space),$(notdir $(1)))).so; \
+	if [ -n "$${baseso}" -a "$${baseso}" != "$(notdir $(1))" ]; then \
+		ln -sf $(notdir $(1)) $(2)$${baseso}; \
+	fi
+endef
+
+# Helper to install libraries
+# $1: destination directory (target or staging)
 define NVIDIA_DRIVER_INSTALL_LIBS
-	$(foreach lib,$(NVIDIA_DRIVER_LIBS),\
-		$(INSTALL) -D -m 0644 $(@D)/$(lib) $(1)/usr/lib/$(notdir $(lib))
-		libsoname="$$( $(TARGET_READELF) -d "$(@D)/$(lib)" \
-			|sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
-		if [ -n "$${libsoname}" -a "$${libsoname}" != "$(notdir $(lib))" ]; then \
-			ln -sf $(notdir $(lib)) \
-				$(1)/usr/lib/$${libsoname}; \
-		fi
-		baseso=$(firstword $(subst .,$(space),$(notdir $(lib)))).so; \
-		if [ -n "$${baseso}" -a "$${baseso}" != "$(notdir $(lib))" ]; then \
-			ln -sf $(notdir $(lib)) $(1)/usr/lib/$${baseso}; \
-		fi
+	$(foreach lib,$(NVIDIA_DRIVER_LIBS),
+		$(call NVIDIA_DRIVER_INSTALL_LIB,$(word 1,$(subst :, ,$(lib))), \
+			$(1)/usr/lib/$(word 2,$(subst :, ,$(lib))))
 	)
 endef
 
@@ -181,18 +187,25 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
 	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
 endef
 
+# libglx needs a symlink according to the driver README. It has no SONAME
+define NVIDIA_DRIVER_SYMLINK_LIBGLX
+	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
+		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
+endef
+
 # For target, install libraries and X.org modules
 define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
-	$(foreach m,$(NVIDIA_DRIVER_X_MODS), \
-		$(INSTALL) -D -m 0644 $(@D)/$(notdir $(m)) \
-			$(TARGET_DIR)/usr/lib/xorg/modules/$(m)
-	)
 	$(foreach p,$(NVIDIA_DRIVER_PROGS), \
 		$(INSTALL) -D -m 0755 $(@D)/$(p) \
 			$(TARGET_DIR)/usr/bin/$(p)
 	)
+	$(NVIDIA_DRIVER_SYMLINK_LIBGLX)
 	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
 endef
 
+# Due to a conflict with xserver_xorg-server, this needs to be performed when
+# finalizing the target filesystem to make sure this version is used.
+NVIDIA_DRIVER_TARGET_FINALIZE_HOOKS += NVIDIA_DRIVER_SYMLINK_LIBGLX
+
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
