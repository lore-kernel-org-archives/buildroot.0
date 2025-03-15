Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96E2C28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 534D880F87;
	Tue, 18 Mar 2025 15:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otm-v7yQpR4m; Tue, 18 Mar 2025 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FC1981065
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FC1981065;
	Tue, 18 Mar 2025 15:07:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A247ED5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A05440978
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_jsLeckwC_o for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E91740D93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E91740D93
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AB8681E08; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:19:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7289731adf333e92e43b53d5665fc296214befb5
X-Git-Newrev: ebbaac08e3f462bf023c12077f739ed1c0543eb2
X-Patchwork-Hint: ignore
Message-Id: <20250318150245.8AB8681E08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: new package
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
Content-Type: multipart/mixed; boundary="===============0103450204309125637=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0103450204309125637==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ebbaac08e3f462bf023c12077f739ed1c0543eb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Podman is a container manager not unlike Docker, but is daemon-less.

Similarly to docker-engine, quite a few kernel config options are
required; as they are very similar in goals and features, the options
from docker-engine have been duplicated for podman. As that was not
enough, a few additional options have been added after trial-and-error
testing (they are not explicitly listed in the documentation).

The documentation [0] states that seccomp can be disabled (i.e. not
enabled). However, without seccomp support, starting containers requires
--security-opt=seccomp=unconfined to be specified; it does not look
trivial to make that the default, though [1]. Furthermore, containers
are about security, so disabling a security measure does not sound too
good. So we make seccomp support mandatory.

Podman needs netavark as a the network backend (it missing is a hard
error at runtime). It is supposed to also require aardvark-dns, an
authoritative DNS resolver, but it missing does not look to adversely
affect networking, so it is not used (as not even packaged in Buildroot
yet).

Podman can run either as the root user, or it can run rootless, i.e. by
a non-root user, which requires a bit of setup (see below, in the
runtime test) and a few other dependencies: slirp4netns [2] (to provide
network connectivity in userland), and support for subordinate UIDs and
GIDs with the shadow library. Rootless mode is one of the main selling
point for podman, so we decided that this would not be configurable in
Buildroot.

Similar to Docker, podman can inject a minimalist init as PID1 in
containers, and like Docker, this is optional; podman however by default
uses catatonit as such an init [3]. As for Docker-engine, we offer a
choice of which init package to use to provide podman-init.

Podman requires at least three config files; they can be either per-user
or system-wide:
  - containers.conf [4]: defines various settings for the container
    runtimes;
  - policy.json [5]: defines what signature to accept to validate
    images; without one such file, podman just refuses to pull images;
  - registries.conf [6]: defines where to pull images from; without it,
    podman does not know how to pull un-qualified images (i.e. images
    where the registry is not specified in the path, and which Docker
    would fetch from the Docker Hub, e.g. "busybox:latest").

For those three files, we provide a very minimal default that (in the
same order as above):
  - uses the slirp4netns network backend for rootless operation (the
    default in podman is to use pasta [1], so we need to explicitly
    configure it to use slirp4netns);
  - allows pulling images which signature can't be verified;
  - pulls unqualified images from the Docker Hub, as is traditional.

Providing actual files is going to be use-case dependent, and interested
parties will have to provide their own config files, e.g. in a rootfs
overlay.

Finally, we add a runtime test for podman. Podman is a huge binary, and
may call other huge binaries (netavark...); this can be quite slow in
the emulated machine (even when running on a very fast host machine), so
we use a huge timeout for all commands involving podman, even those that
exit the containers, as that may need to tear down podman setup.

The default kernel used in runtime tests is missing a lot of features,
so we need to build our own; we use the same version as the bundled
kernel. We can't use cpio either, because we need a filesystem that can
be used as a lower and upper of overlayfs, which is not possible with
the filesystem the cpio is extracted into; ext2 fits the bill, so we use
that. We need a bit of space to store images and stuff, so let's be
generous and allocate 256M.

To test rootless operation, we need a non-root user that has some
special setup [7]; it is easier to run the commands from the infra
rather than carry a user-definition table and a rootfs overlay. We need
that user to have the same prompts (main and continuation) so that the
REPLWrapper still detects those; it has the unfortunate side effect that
it is not immediately obvious whether a command was run as root or not,
and one has to look back up in the run-log to see whether there was a
transition to another user earlier.

Still for rootless containers, podman/netavark expect /etc/resolv.conf
to be either a plain file, or a symlink that points either deeper in
/etc or anywhere in /run; if resolv.conf resolves to any other location,
DNS in rootless containers does not work. This is reasonable, and is
what already happens on a systemd-based system (and thus all major
distributions nowadays. However, in Buildroot, we put the actual file in
/tmp; this is historical, and dates back to the days where Buildroot did
not have a guaranteed-writable /run. So, we work around this limitation
in the test (for now).

The official busybox image on the Docker Hub supports a lot of
architectures, of which armv7 which we use for this runtime test.
Finding a small image that also supports armv7 on other registries was
a bit of a challenge; we eventually found one busybox image on quay.io,
but it is not an official busybox image; still, it fits the bill, so we
use it.

There is no runtime test with systemd, as this requires quite some
additional setup that does not look very trivial to do; when it detects
it is running under systemd in rootless mode, podman expects that a full
user session exists, or it whines about it every time it is started,
reverting to non-systemd behaviour; getting a full user session does not
look to be that trivial (PAM?), so this would not exercise the actual
integration with systemd, so the test would not be meaningful, so it is
not provided. This is left as an exercise to an interested party to
extend the tests.

PS: Hat-tip to Raphael, who provided some pointers and hints on this
change, especially for rootless mode. Thanks! 👍

[0] https://podman.io/docs/installation#get-source-code
[1] it looks like we can provide a custom seccomp profile, by specifying
seccomp_profile="PATH" in containers.conf; that would still require
seccomp support to use that file, though, so that does not change the
outcome.
[2] it is possible to use another backend, but it is not packaged in
in Buildroot yet: https://passt.top/passt/about/#pasta-pack-a-subtle-tap-abstraction
[3] podman expects a 'catatonit' helper in /usr/libexec/podman, so even
if tini would be usable instead, it would not feel right to use it to
impersonate catatonit. So let's assume that only catatonit is supported.
[4] https://github.com/containers/common/blob/main/docs/containers.conf.5.md
[5] https://github.com/containers/image/blob/main/docs/containers-policy.json.5.md
[6] https://github.com/containers/image/blob/main/docs/containers-registries.conf.5.md
[7] https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                            |   1 +
 package/podman/Config.in                     |  80 +++++++++++
 package/podman/containers.conf               |   2 +
 package/podman/podman.hash                   |   3 +
 package/podman/podman.mk                     | 110 +++++++++++++++
 package/podman/policy.json                   |   7 +
 package/podman/registries.conf               |   1 +
 support/testing/tests/package/test_podman.py | 203 +++++++++++++++++++++++++++
 8 files changed, 407 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2e081b84d3..7e98256cdf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2869,6 +2869,7 @@ menu "System tools"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
 	source "package/petitboot/Config.in"
+	source "package/podman/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
diff --git a/package/podman/Config.in b/package/podman/Config.in
new file mode 100644
index 0000000000..41834052f4
--- /dev/null
+++ b/package/podman/Config.in
@@ -0,0 +1,80 @@
+config BR2_PACKAGE_PODMAN
+	bool "podman"
+	depends on BR2_USE_MMU  # fork()
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # host-go
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp, slirp4netns
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp, slirp4netns
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon, slirp4netns
+	depends on BR2_USE_WCHAR  # conmon, slirp4netns
+	select BR2_PACKAGE_HOST_GO
+	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
+	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
+	select BR2_PACKAGE_CONMON  # runtime
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LIBSECCOMP
+	select BR2_PACKAGE_NETAVARK  # runtime
+	# podman officially only supports crun, but compatible runtimes are
+	# also accepted. So we do the select the other way around, to match
+	# docker-engine's own select and thus avoid circular dependency
+	# issues.
+	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN  # runtime
+	select BR2_PACKAGE_SHADOW
+	select BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
+	select BR2_PACKAGE_SLIRP4NETNS  # runtime
+	help
+	  The best free & open source container tools
+
+	  Manage containers, pods, and images with Podman. Seamlessly
+	  work with containers and Kubernetes from your local
+	  environment.
+
+	  https://podman.io/
+
+if BR2_PACKAGE_PODMAN
+
+choice
+	bool "support podman-init"
+	default BR2_PACKAGE_PODMAN_INIT_CATATONIT
+	help
+	  Support providing a minimal init process for containers.
+	  Required to use "podman container run --init".
+
+config BR2_PACKAGE_PODMAN_INIT_NONE
+	bool "none"
+	help
+	  Do not support docker-init.
+
+config BR2_PACKAGE_PODMAN_INIT_CATATONIT
+	bool "catatonit"
+	select BR2_PACKAGE_CATATONIT # runtime
+	help
+	  Support providing a minimal init process for containers,
+	  using catatonit.
+
+config BR2_PACKAGE_PODMAN_INIT_TINI
+	bool "tini"
+	select BR2_PACKAGE_TINI # runtime
+	help
+	  Support providing a minimal init process for containers,
+	  using tini.
+
+endchoice
+
+config BR2_PACKAGE_PODMAN_INIT_NAME
+	string
+	default "tini" if BR2_PACKAGE_PODMAN_INIT_TINI
+	default "catatonit" if BR2_PACKAGE_PODMAN_INIT_CATATONIT
+
+endif
+
+comment "podman needs a toolchain w/ headers >= 3.17, threads, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
diff --git a/package/podman/containers.conf b/package/podman/containers.conf
new file mode 100644
index 0000000000..1db48c1905
--- /dev/null
+++ b/package/podman/containers.conf
@@ -0,0 +1,2 @@
+[network]
+default_rootless_network_cmd = "slirp4netns"
diff --git a/package/podman/podman.hash b/package/podman/podman.hash
new file mode 100644
index 0000000000..734042df95
--- /dev/null
+++ b/package/podman/podman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6c31845cbbc54a0b65c4afba224048c002b40e863c4ba7ca19355a8d333b3d19  podman-v5.4.1-git4-go2.tar.gz
+sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
new file mode 100644
index 0000000000..48b4cd9b27
--- /dev/null
+++ b/package/podman/podman.mk
@@ -0,0 +1,110 @@
+################################################################################
+#
+# podman
+#
+################################################################################
+
+PODMAN_VERSION = v5.4.1
+PODMAN_SITE = https://github.com/containers/podman
+PODMAN_SITE_METHOD = git
+
+PODMAN_LICENSE = Apache-2.0
+PODMAN_LICENSE_FILES = LICENSE
+
+PODMAN_DEPENDENCIES = host-pkgconf libgpgme
+
+PODMAN_GOMOD = github.com/containers/podman/v5
+PODMAN_BUILD_TARGETS = cmd/podman
+PODMAN_TAGS = selinux
+
+# https://podman.io/docs/installation#get-source-code mandates that flag be
+# set, as device-mapper is not officially supported.
+PODMAN_TAGS += exclude_graphdriver_devicemapper
+
+# This is supposedly optional, but a basic (busybox:latest) image does not
+# even start without seccomp support, unless by passing extra options at
+# runtime (--security-opt=seccomp=unconfined), which can't be made the default.
+PODMAN_DEPENDENCIES += libseccomp
+PODMAN_TAGS += seccomp
+
+# This is required for rootless containers, i.e containers started by non-root
+PODMAN_DEPENDENCIES += shadow
+PODMAN_TAGS += libsubid
+
+ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
+PODMAN_DEPENDENCIES += btrfs-progs
+define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS_POSIX_ACL)
+endef
+else
+PODMAN_TAGS += exclude_graphdriver_btrfs
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+PODMAN_DEPENDENCIES += libapparmor
+PODMAN_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PODMAN_DEPENDENCIES += systemd
+PODMAN_TAGS += systemd
+endif
+
+PODMAN_INIT_NAME = $(call qstrip,$(BR2_PACKAGE_PODMAN_INIT_NAME))
+ifneq ($(PODMAN_INIT_NAME),)
+PODMAN_INIT_PATH = /usr/libexec/podman/$(PODMAN_INIT_NAME)
+define PODMAN_HELPER_INIT
+	$(Q)ln -sf ../../bin/$(PODMAN_INIT_NAME) $(TARGET_DIR)$(PODMAN_INIT_PATH)
+	$(Q)mkdir -p $(TARGET_DIR)/etc/containers/containers.conf.d
+	$(Q)printf '[containers]\ninit_path = "%s"\n' "$(PODMAN_INIT_PATH)" \
+		>$(TARGET_DIR)/etc/containers/containers.conf.d/50-buildroot-init.conf
+endef
+endif
+
+define PODMAN_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
+	$(PODMAN_LINUX_CONFIG_FIXUPS_BTRFS)
+endef
+
+define PODMAN_CONFIG
+	$(Q)$(INSTALL) -D -m 0644 \
+		$(PODMAN_PKGDIR)/containers.conf \
+		$(TARGET_DIR)/usr/share/containers/containers.conf
+	$(Q)$(INSTALL) -D -m 0644 \
+		$(PODMAN_PKGDIR)/policy.json \
+		$(TARGET_DIR)/etc/containers/policy.json
+	$(Q)$(INSTALL) -D -m 0644 \
+		$(PODMAN_PKGDIR)/registries.conf \
+		$(TARGET_DIR)/etc/containers/registries.conf
+endef
+PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_CONFIG
+
+define PODMAN_HELPERS
+	$(Q)mkdir -p $(TARGET_DIR)/usr/libexec/podman
+	$(Q)ln -sf ../../bin/netavark $(TARGET_DIR)/usr/libexec/podman/netavark
+	$(Q)ln -sf ../../bin/slirp4netns $(TARGET_DIR)/usr/libexec/podman/slirp4netns
+	$(PODMAN_HELPER_INIT)
+endef
+PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_HELPERS
+
+$(eval $(golang-package))
diff --git a/package/podman/policy.json b/package/podman/policy.json
new file mode 100644
index 0000000000..9333053f93
--- /dev/null
+++ b/package/podman/policy.json
@@ -0,0 +1,7 @@
+{
+  "default": [
+    {
+      "type": "insecureAcceptAnything"
+    }
+  ]
+}
diff --git a/package/podman/registries.conf b/package/podman/registries.conf
new file mode 100644
index 0000000000..d44d892da3
--- /dev/null
+++ b/package/podman/registries.conf
@@ -0,0 +1 @@
+unqualified-search-registries = ["docker.io"]
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
new file mode 100644
index 0000000000..e2b0598961
--- /dev/null
+++ b/support/testing/tests/package/test_podman.py
@@ -0,0 +1,203 @@
+import infra.basetest
+import json
+import os
+
+
+class PodmanBase(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_PACKAGE_PODMAN=y
+        BR2_PACKAGE_UTIL_LINUX=y
+        BR2_PACKAGE_UTIL_LINUX_MOUNT=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def do_test(self):
+        class _Emul():
+            def __init__(self, orig_emulator):
+                self.emulator = orig_emulator
+
+            def run(self, cmd, timeout=-1):
+                if timeout < 0:
+                    timeout = 60
+                return self.emulator.run(cmd, timeout)
+
+            def stop(self):
+                self.emulator.stop()
+
+        kernel_file = os.path.join(self.builddir, 'images', 'zImage')
+        dtb_file = os.path.join(self.builddir, 'images', 'vexpress-v2p-ca9.dtb')
+        ext2_file = os.path.join(self.builddir, 'images', 'rootfs.ext2')
+        self.emulator.boot(
+            arch='armv5',
+            kernel=kernel_file,
+            kernel_cmdline=[
+                'root=/dev/mmcblk0',
+                'rootwait',
+                'console=ttyAMA0',
+            ],
+            options=[
+                '-M', 'vexpress-a9',
+                '-dtb', dtb_file,
+                '-drive', f'file={ext2_file},if=sd,format=raw',
+            ]
+        )
+        self.emulator.login()
+
+        # Trick: replace the original emulator with one that always
+        # adds a timeout
+        self.emulator = _Emul(self.emulator)
+
+        # Do some preparation for rootless use
+        self.assertRunOk("mount --make-shared /")
+        self.assertRunOk("chmod 666 /dev/net/tun")
+        self.assertRunOk("useradd -d /home/foo -m -s /bin/sh -u 1000 foo")
+        self.assertRunOk("touch /etc/subuid /etc/subgid")
+        self.assertRunOk("usermod --add-subuids 10000-75535 foo")
+        self.assertRunOk("usermod --add-subgids 10000-75535 foo")
+        # If /etc/resolv.conf is a symlink, it has to point either into /etc
+        # (or deep in there), or into /run (or deep in there), as only those
+        # would eventually get used by podman/netavark for # rootless containers.
+        # This is considered a workaround to the current situation; resolv,conf
+        # should ultimately be in /run rather than /tmp.
+        self.assertRunOk("mv /tmp/resolv.conf /run/resolv.conf")
+        self.assertRunOk("ln -sf /run/resolv.conf /etc/resolv.conf")
+
+        # First, test podman as root (the current user)
+        self.do_podman()
+
+        # Now, test podman as non-root. We need a bit of setup
+        # We need to use the same prompts for the user as used for root, so that the
+        # REPLWrapper still detects the prompts. This means it is going to be a bit
+        # difficut to directly see that it was a user that executed a command.
+        self.assertRunOk('su -s /usr/bin/env - foo PS1="${PS1}" PS2="${PS2}" /bin/sh')
+        output, _ = self.emulator.run("id -u")
+        self.assertEqual(output[0], "1000", "Could not switch to non-root")
+        self.do_podman()
+
+    def do_podman(self):
+        # The podman binary is huge, so it takes time to load...
+        # Next calls will be faster, though, as it is going to be cached.
+        self.assertRunOk('podman --version')
+
+        # Check for an empty image store
+        output, exit_code = self.emulator.run("podman image ls --format '{{ json }}'")
+        img_info = json.loads("".join(output))
+        self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) already present")
+
+        # Pull an image; it can take time: network, hash checksums...
+        self.assertRunOk('podman image pull busybox:1.37.0')
+        output, exit_code = self.emulator.run("podman image ls --format '{{ json }}'")
+        img_info = json.loads("".join(output))
+        self.assertEqual(len(img_info), 1, f"{len(img_info)} image(s), expecting 1")
+        self.assertTrue("Id" in img_info[0], '"Id" not in img_info[0]')
+        self.assertTrue("Digest" in img_info[0], '"Digest" not in img_info[0]')
+        self.assertEqual(img_info[0]["Names"][0], "docker.io/library/busybox:1.37.0")
+
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "", "Already in a container")
+
+        # Spawn the container; that can take a bit of time
+        # Propagate the prompt so that the REPLWrapper detects it
+        self.assertRunOk(
+            "podman container run --rm -ti -e PS1 -e br_container=podman busybox:1.37.0",
+        )
+        # Twist! The command above is still running, but the shell it
+        # started exposes the same prompt we expect. This is all what we want.
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "podman", "Not in a podman container")
+
+        # Check that pid1 is the shell
+        output, _ = self.emulator.run('readlink /proc/1/exe')
+        self.assertEqual(output[0], "/bin/sh", f"PID1 is {output[0]}, should be /bin/sh")
+
+        # Try to get something off the network
+        # Using http, not https, as busybox' wget does not do https
+        # Using --spider to just check we can reach the remote.
+        output, exit_code = self.emulator.run('wget --spider http://google.com/')
+        self.assertEqual(exit_code, 0, "wget did not succeed to reach google.com")
+        self.assertEqual(output[-1], "remote file exists", "wget did not succeed to reach google.com")
+
+        # Exit the container
+        self.assertRunOk("exit 0")
+        # Twist, take two! We are now back to the shell in the VM.
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "", "Still in a container")
+
+        # Spawn a container, round two, but with an injected init this time
+        self.assertRunOk(
+            "podman container run --rm -ti -e PS1 --init -e br_container=podman busybox:1.37.0",
+        )
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "podman", "Not in a podman container")
+
+        # Check that pid1 is the init injected by podman
+        output, _ = self.emulator.run('readlink /proc/1/exe')
+        self.assertEqual(output[0], "/run/podman-init", f"PID1 is {output[0]}, should be /run/podman-init")
+
+        # Exit the container
+        self.assertRunOk("exit 0")
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "", "Still in a container")
+
+        # Use an image from another registry, spawn without pulling first
+        self.assertRunOk(
+            "podman container run --rm -ti -e PS1 -e br_container=podman quay.io/prometheus/busybox:latest",
+        )
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "podman", "Not in a podman container")
+        self.assertRunOk("exit 0")
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "", "Still in a container")
+
+        # Remove the offical image
+        self.assertRunOk('podman image rm busybox:1.37.0')
+        output, _ = self.emulator.run("podman image ls --format '{{ json }}'")
+        img_info = json.loads("".join(output))
+        # There is still one image(the unofficial one from quay.io)
+        self.assertEqual(len(img_info), 1, f"{len(img_info)} image(s) still present, expecting 1")
+
+        # Remove all remaining images
+        self.assertRunOk('podman image prune -af')
+        output, exit_code = self.emulator.run("podman image ls --format '{{ json }}'")
+        img_info = json.loads("".join(output))
+        self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) still present, expecting 0")
+
+
+class TestPodmanIptables(PodmanBase):
+    def test_run(self):
+        self.do_test()
+
+
+class TestPodmanNftables(PodmanBase):
+    config = PodmanBase.config + """
+    BR2_PACKAGE_NFTABLES=y
+    """
+
+    def test_run(self):
+        self.do_test()
+
+
+class TestPodmanTini(PodmanBase):
+    config = PodmanBase.config + """
+    BR2_PACKAGE_PODMAN_INIT_TINI=y
+    """
+
+    def test_run(self):
+        self.do_test()

--===============0103450204309125637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0103450204309125637==--
