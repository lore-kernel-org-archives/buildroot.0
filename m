Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA63EE748E7
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 21:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C067610BA;
	Sat, 30 Sep 2023 21:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C067610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_q-xDtiXH5v; Sat, 30 Sep 2023 21:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31FFB6117A;
	Sat, 30 Sep 2023 21:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31FFB6117A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8801BF2CE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 21:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4647681200
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 21:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4647681200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3u3m652pjQFW for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 21:20:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFBB5811A9
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 21:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFBB5811A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCD7F83D3C; Sat, 30 Sep 2023 21:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 23:19:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21a2b1d2f08aa1e2834e65699a3b2028bbbaabe7
X-Git-Newrev: d41386a8ac176f3df73418359d097ee16f02df95
X-Patchwork-Hint: ignore
Message-Id: <20230930212012.DCD7F83D3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-persistenced: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d41386a8ac176f3df73418359d097ee16f02df95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NVIDIA driver persistence daemon.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Arnout:
 - disable on BR2_STATIC_LIBS;
 - only depend on tirpc if toolchain doesn't have RPC;
 - use unstripped binary - the strip support in the makefile is utterly
   broken (and we anyway strip in target-finalize);
 - define NVIDIA_PERSISTENCED_USERS directly rather than with another
   variable;
 - install all the systemd stuff in
   NVIDIA_PERSISTENCED_INSTALL_INIT_SYSTEMD.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/nvidia-persistenced/Config.in              | 14 +++++++
 .../nvidia-persistenced/nvidia-persistenced.conf   |  1 +
 .../nvidia-persistenced/nvidia-persistenced.hash   |  3 ++
 package/nvidia-persistenced/nvidia-persistenced.mk | 47 ++++++++++++++++++++++
 6 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2827477bbd..bc4027932c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2511,6 +2511,7 @@ F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
 N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
+F:	package/nvidia-persistenced/
 F:	package/shadow/
 F:	package/slirp4netns/
 F:	package/sway/
diff --git a/package/Config.in b/package/Config.in
index 8cf4fe3f51..d6364f976a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -564,6 +564,7 @@ endmenu
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-modprobe/Config.in"
+	source "package/nvidia-persistenced/Config.in"
 	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
diff --git a/package/nvidia-persistenced/Config.in b/package/nvidia-persistenced/Config.in
new file mode 100644
index 0000000000..82303d006e
--- /dev/null
+++ b/package/nvidia-persistenced/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_NVIDIA_PERSISTENCED
+	bool "nvidia-persistenced"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  NVIDIA driver persistence daemon.
+
+	  https://github.com/NVIDIA/nvidia-persistenced
+
+comment "nvidia-persistenced needs a toolchain w/ threads, dynamic libs"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/nvidia-persistenced/nvidia-persistenced.conf b/package/nvidia-persistenced/nvidia-persistenced.conf
new file mode 100644
index 0000000000..48f24cfb1d
--- /dev/null
+++ b/package/nvidia-persistenced/nvidia-persistenced.conf
@@ -0,0 +1 @@
+u nvidia-persistenced - 'NVIDIA Persistence Daemon'
diff --git a/package/nvidia-persistenced/nvidia-persistenced.hash b/package/nvidia-persistenced/nvidia-persistenced.hash
new file mode 100644
index 0000000000..06c71b35f5
--- /dev/null
+++ b/package/nvidia-persistenced/nvidia-persistenced.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  b84fb8eb86127a725d0134a2c64a64e7844e125dece137e7fe8adf8a33cbe817  nvidia-persistenced-515.48.07.tar.gz
+sha256  279d814320adc07ca5a4ee101a0b428ddf22a6f3513b8c051f9eb7be47b2e797  COPYING
diff --git a/package/nvidia-persistenced/nvidia-persistenced.mk b/package/nvidia-persistenced/nvidia-persistenced.mk
new file mode 100644
index 0000000000..662d4d4349
--- /dev/null
+++ b/package/nvidia-persistenced/nvidia-persistenced.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# nvidia-persistenced
+#
+################################################################################
+
+NVIDIA_PERSISTENCED_VERSION = 515.48.07
+NVIDIA_PERSISTENCED_SITE = $(call github,NVIDIA,nvidia-persistenced,$(NVIDIA_PERSISTENCED_VERSION))
+NVIDIA_PERSISTENCED_LICENSE = MIT
+NVIDIA_PERSISTENCED_LICENSE_FILES = COPYING
+
+NVIDIA_PERSISTENCED_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+NVIDIA_PERSISTENCED_DEPENDENCIES += libtirpc
+endif
+
+define NVIDIA_PERSISTENCED_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		OUTPUTDIR=. ./nvidia-persistenced.unstripped
+endef
+
+define NVIDIA_PERSISTENCED_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nvidia-persistenced.unstripped \
+		$(TARGET_DIR)/usr/bin/nvidia-persistenced
+endef
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
+define NVIDIA_PERSISTENCED_INSTALL_SYSTEMD_SYSUSERS
+	$(INSTALL) -D -m 0644 $(NVIDIA_PERSISTENCED_PKGDIR)/nvidia-persistenced.conf \
+		$(TARGET_DIR)/usr/lib/sysusers.d/nvidia-persistenced.conf
+endef
+else
+define NVIDIA_PERSISTENCED_USERS
+	nvidia-persistenced -1 nvidia-persistenced -1 * - - - NVIDIA Persistence Daemon
+endef
+endif
+
+define NVIDIA_PERSISTENCED_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/init/systemd/nvidia-persistenced.service.template \
+		$(TARGET_DIR)/usr/lib/systemd/system/nvidia-persistenced.service
+	$(SED) 's/__USER__/nvidia-persistenced/g' \
+		$(TARGET_DIR)/usr/lib/systemd/system/nvidia-persistenced.service
+	$(NVIDIA_PERSISTENCED_INSTALL_SYSTEMD_SYSUSERS)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
