Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C36C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 10:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62CE403B2;
	Sat, 29 Mar 2025 10:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vu8u4wgcE4kT; Sat, 29 Mar 2025 10:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4DD402FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF4DD402FA;
	Sat, 29 Mar 2025 10:11:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 909C419C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 768D460AE2
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kt9PJ0ZJBfls for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 10:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84FB9606D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84FB9606D4
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:11:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D31A835A5; Sat, 29 Mar 2025 10:11:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 11:08:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a5a0772c238d1bd9acc61cd0017ce1ef305195c
X-Git-Newrev: 5d85d23e16fdf9e6574e2a3cbdf4d27d17cd6942
X-Patchwork-Hint: ignore
Message-Id: <20250329101124.7D31A835A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/v4l2loopback: fix v4l2loopback-ctl
 compile/install
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d85d23e16fdf9e6574e2a3cbdf4d27d17cd6942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit [1] the original v4l2loopback-ctl bash script was
replaced by a C version, so add a proper compile step (and remove bash
runtime dependency) to fix '[help] v4l2loopback package build fails for
raspberrypi5' [2].

The issue can be reproduced with the commands:

    cat <<EOF >.config
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
    BR2_PACKAGE_V4L2LOOPBACK=y
    BR2_PACKAGE_V4L2LOOPBACK_UTILS=y
    EOF
    make olddefconfig
    make v4l2loopback

Note: upstream commit [1] was introduced in version v0.13.0.
Buildroot bumped v4l2loopback to v0.13.2 in [3].

Fixes:

  /usr/bin/install: cannot stat
  '.../build/v4l2loopback-0.13.2/utils/v4l2loopback-ctl':
  No such file or directory

[1] https://github.com/v4l2loopback/v4l2loopback/commit/33922fa4e9965d400edcc2761e55fedf84bbb22a
[2] https://lists.busybox.net/pipermail/buildroot/2025-March/775911.html
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/02540771bccf7b10c7daecce5f0e1e41a73c1e07

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Julien:
 - add commands to reproduce the issue
 - add reference to buildroot commit introducing the issue
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/v4l2loopback/Config.in       | 4 ----
 package/v4l2loopback/v4l2loopback.mk | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/v4l2loopback/Config.in b/package/v4l2loopback/Config.in
index d8ca31e577..4bfa9a4fdd 100644
--- a/package/v4l2loopback/Config.in
+++ b/package/v4l2loopback/Config.in
@@ -14,10 +14,6 @@ if BR2_PACKAGE_V4L2LOOPBACK
 
 config BR2_PACKAGE_V4L2LOOPBACK_UTILS
 	bool "utils"
-	depends on BR2_USE_MMU # bash
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
-	select BR2_PACKAGE_BASH # runtime dependency
-	select BR2_PACKAGE_SUDO # runtime dependency
 	help
 	  Install applications to interact with v4l2-loopback devices
 	  ("virtual video devices").  Currently there is only a single
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 0e1d20c0cc..a4ddf5e2d9 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -11,6 +11,10 @@ V4L2LOOPBACK_LICENSE_FILES = COPYING
 V4L2LOOPBACK_CPE_ID_PREFIX = cpe:2.3:o
 
 ifeq ($(BR2_PACKAGE_V4L2LOOPBACK_UTILS),y)
+define V4L2LOOPBACK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) utils
+endef
+
 define V4L2LOOPBACK_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/utils/v4l2loopback-ctl $(TARGET_DIR)/usr/bin/v4l2loopback-ctl
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
