Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F360CC28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C33DE60597;
	Tue, 18 Mar 2025 15:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2iu8BNneXQU; Tue, 18 Mar 2025 15:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB1F605AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB1F605AE;
	Tue, 18 Mar 2025 15:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B47C9D8C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4D65409C4
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCmo_QC6HBb3 for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D8E40DA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0D8E40DA2
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD97981E08; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:23:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d038cc47cdf8877a7062c18e04bb687f38fcd1e7
X-Git-Newrev: 54f79d804f8fc78d1ebbc064b91adc6c26cf01cc
X-Patchwork-Hint: ignore
Message-Id: <20250318150245.AD97981E08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: add option to use passt as
 network backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=54f79d804f8fc78d1ebbc064b91adc6c26cf01cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

passt/pasta is the officially supported network backend, with slirp4netns
only considered a legacy solution. However, some people have experienced
corner cases when using passt/pasta (as it still is a young stack), so we
do not want to do a blanket replace of slirp4netns just yet. Still, we
make passt/pasta the default option.

As a consequence, the existing runtime tests will now test passt/pasta,
so we introduce two new tests for slirp4netns as a network backend.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/podman/Config.in                     | 22 +++++++++++++++++-----
 package/podman/containers.conf               |  2 --
 package/podman/podman.mk                     | 19 +++++++++++++++----
 support/testing/tests/package/test_podman.py | 19 +++++++++++++++++++
 4 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/package/podman/Config.in b/package/podman/Config.in
index 41834052f4..4378d9918d 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -4,10 +4,10 @@ config BR2_PACKAGE_PODMAN
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # host-go
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
-	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp, slirp4netns
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp, slirp4netns
-	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon, slirp4netns
-	depends on BR2_USE_WCHAR  # conmon, slirp4netns
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
+	depends on BR2_USE_WCHAR  # conmon
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
 	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
@@ -22,7 +22,6 @@ config BR2_PACKAGE_PODMAN
 	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN  # runtime
 	select BR2_PACKAGE_SHADOW
 	select BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
-	select BR2_PACKAGE_SLIRP4NETNS  # runtime
 	help
 	  The best free & open source container tools
 
@@ -67,6 +66,19 @@ config BR2_PACKAGE_PODMAN_INIT_NAME
 	default "tini" if BR2_PACKAGE_PODMAN_INIT_TINI
 	default "catatonit" if BR2_PACKAGE_PODMAN_INIT_CATATONIT
 
+choice
+	bool "Network backend"
+
+config BR2_PACKAGE_PODMAN_NET_PASST
+	bool "passt/pasta"
+	select BR2_PACKAGE_PASST  # runtime
+
+config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
+	bool "slirp4netns"
+	select BR2_PACKAGE_SLIRP4NETNS  # runtime
+
+endchoice
+
 endif
 
 comment "podman needs a toolchain w/ headers >= 3.17, threads, wchar"
diff --git a/package/podman/containers.conf b/package/podman/containers.conf
deleted file mode 100644
index 1db48c1905..0000000000
--- a/package/podman/containers.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-[network]
-default_rootless_network_cmd = "slirp4netns"
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 29c5591a0a..7ca9b9ddcb 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -62,6 +62,19 @@ define PODMAN_HELPER_INIT
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_PODMAN_NET_PASST),y)
+define PODMAN_HELPER_PASST
+	$(Q)ln -sf ../../bin/pasta $(TARGET_DIR)/usr/libexec/podman/pasta
+endef
+else
+define PODMAN_HELPER_SLIRP4NETNS
+	$(Q)ln -sf ../../bin/slirp4netns $(TARGET_DIR)/usr/libexec/podman/slirp4netns
+	$(Q)mkdir -p $(TARGET_DIR)/etc/containers/containers.conf.d
+	$(Q)printf '[network]\ndefault_rootless_network_cmd = "slirp4netns"\n' \
+		>$(TARGET_DIR)/etc/containers/containers.conf.d/50-buildroot-net-backend.conf
+endef
+endif
+
 define PODMAN_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
@@ -87,9 +100,6 @@ define PODMAN_LINUX_CONFIG_FIXUPS
 endef
 
 define PODMAN_CONFIG
-	$(Q)$(INSTALL) -D -m 0644 \
-		$(PODMAN_PKGDIR)/containers.conf \
-		$(TARGET_DIR)/usr/share/containers/containers.conf
 	$(Q)$(INSTALL) -D -m 0644 \
 		$(PODMAN_PKGDIR)/policy.json \
 		$(TARGET_DIR)/etc/containers/policy.json
@@ -103,8 +113,9 @@ define PODMAN_HELPERS
 	$(Q)mkdir -p $(TARGET_DIR)/usr/libexec/podman
 	$(Q)ln -sf ../../bin/aardvark-dns $(TARGET_DIR)/usr/libexec/podman/aardvark-dns
 	$(Q)ln -sf ../../bin/netavark $(TARGET_DIR)/usr/libexec/podman/netavark
-	$(Q)ln -sf ../../bin/slirp4netns $(TARGET_DIR)/usr/libexec/podman/slirp4netns
 	$(PODMAN_HELPER_INIT)
+	$(PODMAN_HELPER_PASST)
+	$(PODMAN_HELPER_SLIRP4NETNS)
 endef
 PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_HELPERS
 
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 44211b438e..4d9b19310e 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -239,3 +239,22 @@ class TestPodmanTini(PodmanBase):
 
     def test_run(self):
         self.do_test()
+
+
+class TestPodmanSlirpIptables(PodmanBase):
+    config = PodmanBase.config + """
+    BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
+    """
+
+    def test_run(self):
+        self.do_test()
+
+
+class TestPodmanSlirpNftables(PodmanBase):
+    config = PodmanBase.config + """
+    BR2_PACKAGE_NFTABLES=y
+    BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
+    """
+
+    def test_run(self):
+        self.do_test()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
