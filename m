Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46E6C7EE39
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 16:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3905060D64;
	Sun, 29 Jun 2025 16:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJ39jWoHJCU9; Sun, 29 Jun 2025 16:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB4C60B4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB4C60B4A;
	Sun, 29 Jun 2025 16:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69BA9DF
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BCD340203
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF7LfD4Xrvch for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 371D740082
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 371D740082
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 266CD83914; Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Jun 2025 15:57:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed75eaa6ee8f05ef9bdd77b0628e282f4c8b1615
X-Git-Newrev: 0365d4e45b424e0f53bc14b439dfc587146022de
X-Patchwork-Hint: ignore
Message-Id: <20250629165657.266CD83914@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/distribution-registry: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0365d4e45b424e0f53bc14b439dfc587146022de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a reference, functional implementation of a
registry for distributing container images. Formerly the Docker
registry, it now also handles OCI images, so can be used to distribute
all kinds of container related images: classic Docker images, OCI
images, but also helms [0] and the likes, which are also packages as OCI
images in fact.

The upstream name of the package is just "distribution" [1], but this is
a bit too generic and unsearchable; distributions like Debian and Ubuntu
traditionally provides it as the "docker-registry" package, but this is
now misleading as it is not just for Docker anymore. So we decided to
name it "distribution-registry": it contains the upstream name and will
be searchable with the 'registry' part as well.

The built executable is named "registry", which is also a bit too
generic. Again, for the same reasons as above, we name it
"distribution-registry"; this also incidentally makes our golang-package
infra "just work" and do the right thing when it installs the package.

The upstream package provides a wrapper Makefile to build the package,
but it does not do more than our infra already does; the only little nit
is that it allows updating the version file (with git infra et al.). We
can just ignore that and update the version ourselves.

We also provide a minimalist configuration file: it exposes the registry
to localhost only, as a security measure. This file will have to be
overridden (e.g. in a rootfs-overlay) with proper authentication, and
with further locally meaningful setup anyway.

Finally, we also implement a run-time test that validates that we can
push and pull images to/from the registry. Since the registry is a big
go package, it takes time to start, so wait for it a little bit (and yet
a little bit more after it starts logging), and increase the timeouts
for commands that deal with the registry.

For this simple test, the registry is directly exposed with plain HTTP,
not HTTPS, so we must declare it as insecure, so that container tools
can reach it without custom options (e.g. without using skopeo's
--{src,dest}-tls-verify=false options).

We re-use skopeo to talk to the registry. This allows us to grab an
image from the Docker hub registry, and push it to our local registry,
then retrieve it back. Since we want to diffferentiate failures to grab
the image from the Docker Hub [2], from failures to push to our
registry, we do it in two steps: copy from Docker Hub to a local OCI
image, then push that to our registry.

Since both distribution-registry and skopeo are big go-based, statically
linked binaries, running both in the standard virtual machine does not
work: the 256MiB emulated in vexpress are not enough and cause segfaults
when running both at once. The vexpress also only accepts at most
256MiB, so we must use another machine; we decided to use the same as is
used by the podman teest case, which allows at least 1Gib, which is now
enough.

[0] https://helm.sh/
[1] https://github.com/distribution/distribution
[2] in case we reach the 100-pulls-a-day limitation

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                  |  1 +
 package/distribution-registry/Config.in            | 17 ++++
 package/distribution-registry/config.yml           | 13 +++
 .../distribution-registry.hash                     |  3 +
 .../distribution-registry/distribution-registry.mk | 47 +++++++++++
 .../distribution-registry.service                  | 10 +++
 .../tests/package/test_distribution_registry.py    | 96 ++++++++++++++++++++++
 7 files changed, 187 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f2c868415f..5109ebed78 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2855,6 +2855,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
+	source "package/distribution-registry/Config.in"
 	source "package/docker-cli/Config.in"
 	source "package/docker-cli-buildx/Config.in"
 	source "package/docker-compose/Config.in"
diff --git a/package/distribution-registry/Config.in b/package/distribution-registry/Config.in
new file mode 100644
index 0000000000..af650171b1
--- /dev/null
+++ b/package/distribution-registry/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_DISTRIBUTION_REGISTRY
+	bool "distribution-registry"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	help
+	  The toolkit to pack, ship, store, and deliver container
+	  content.
+
+	  The goal of this project is to provide a simple, secure, and
+	  scalable base for building a large scale registry solution or
+	  running a simple private registry. It is a core library for
+	  many registry operators including Docker Hub, GitHub Container
+	  Registry, GitLab Container Registry and DigitalOcean Container
+	  Registry, as well as the CNCF Harbor Project, and VMware
+	  Harbor Registry.
+
+	  https://github.com/distribution/distribution
diff --git a/package/distribution-registry/config.yml b/package/distribution-registry/config.yml
new file mode 100644
index 0000000000..77944827a5
--- /dev/null
+++ b/package/distribution-registry/config.yml
@@ -0,0 +1,13 @@
+version: 0.1
+storage:
+  cache:
+    blobdescriptor: inmemory
+  filesystem:
+    rootdirectory: /var/lib/docker-registry
+  delete:
+    enabled: true
+http:
+  addr: 127.0.0.1:5000
+  net: tcp
+  headers:
+    X-Content-Type-Options: [nosniff]
diff --git a/package/distribution-registry/distribution-registry.hash b/package/distribution-registry/distribution-registry.hash
new file mode 100644
index 0000000000..38d7b5a487
--- /dev/null
+++ b/package/distribution-registry/distribution-registry.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6330e6b625c0232b43cee8ea32800a660a7d7a0c79f4f53e4d9a8a6707138d46  distribution-registry-v3.0.0-git4-go2.tar.gz
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
new file mode 100644
index 0000000000..901b9c40e5
--- /dev/null
+++ b/package/distribution-registry/distribution-registry.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# distribution-registry
+#
+################################################################################
+
+DISTRIBUTION_REGISTRY_VERSION = v3.0.0
+DISTRIBUTION_REGISTRY_SITE = https://github.com/distribution/distribution
+DISTRIBUTION_REGISTRY_SITE_METHOD = git
+
+DISTRIBUTION_REGISTRY_LICENSE = Apache-2.0
+DISTRIBUTION_REGISTRY_LICENSE_FILES = LICENSE
+
+DISTRIBUTION_REGISTRY_GOMOD = github.com/distribution/distribution/v3
+
+DISTRIBUTION_REGISTRY_BUILD_TARGETS = cmd/registry
+
+# distribution-registry builds and installs the 'registry' executable, but
+# that name is a bit too generic. Rename it to match the package name.
+DISTRIBUTION_REGISTRY_BIN_NAME = distribution-registry
+DISTRIBUTION_REGISTRY_INSTALL_BINS = distribution-registry
+
+# Inject the version as if done by upstream's wrapper Makefile
+define DISTRIBUTION_REGISTRY_SET_VERSION
+	$(SED) 's/^var version = ".*"$$/var version = "$(DISTRIBUTION_REGISTRY_VERSION)"/' \
+		$(@D)/version/version.go
+endef
+DISTRIBUTION_REGISTRY_PRE_CONFIGURE_HOOKS += DISTRIBUTION_REGISTRY_SET_VERSION
+
+define DISTRIBUTION_REGISTRY_CONFIG
+	$(INSTALL) -m 0644 -D \
+		$(DISTRIBUTION_REGISTRY_PKGDIR)/config.yml \
+		$(TARGET_DIR)/etc/docker/registry/config.yml
+endef
+DISTRIBUTION_REGISTRY_POST_INSTALL_TARGET_HOOKS += DISTRIBUTION_REGISTRY_CONFIG
+
+define DISTRIBUTION_REGISTRY_USERS
+	distribution-registry -1 distribution-registry -1 * - - - Distribution registry
+endef
+
+define DISTRIBUTION_REGISTRY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D \
+		$(DISTRIBUTION_REGISTRY_PKGDIR)/distribution-registry.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/distribution-registry.service
+endef
+
+$(eval $(golang-package))
diff --git a/package/distribution-registry/distribution-registry.service b/package/distribution-registry/distribution-registry.service
new file mode 100644
index 0000000000..767786bc99
--- /dev/null
+++ b/package/distribution-registry/distribution-registry.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Distribution registry
+After=network.target
+
+[Service]
+User=distribution-registry
+ExecStart=/usr/bin/distribution-registry serve /etc/docker/registry/config.yml
+
+[Install]
+WantedBy=multi-user.target
diff --git a/support/testing/tests/package/test_distribution_registry.py b/support/testing/tests/package/test_distribution_registry.py
new file mode 100644
index 0000000000..956b76aa8b
--- /dev/null
+++ b/support/testing/tests/package/test_distribution_registry.py
@@ -0,0 +1,96 @@
+import infra.basetest
+import os
+import time
+
+
+class TestDistributionRegistry(infra.basetest.BRTest):
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
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_DISTRIBUTION_REGISTRY=y
+        BR2_PACKAGE_SKOPEO=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="armv5",
+            kernel=kernel_file,
+            kernel_cmdline=[
+                'console=ttyAMA0',
+            ],
+            options=[
+                '-M', 'vexpress-a9',
+                "-m", "1G",
+                "-nic", "user,model=lan9118",
+                "-dtb", dtb_file,
+                "-initrd", cpio_file,
+            ],
+        )
+        self.emulator.login()
+
+        # Allow unfettered access to the local registry:
+        registry_conf = "\\n".join(  # \\n to be interpreted by printf in the target
+            [
+                '[[registry]]',
+                'location = "localhost:5000"',
+                'insecure = true',
+            ],
+        )
+        self.assertRunOk("mkdir /etc/containers/registries.conf.d")
+        self.assertRunOk(
+            f"printf '{registry_conf}\\n' >/etc/containers/registries.conf.d/localhost.conf",
+        )
+
+        # Check we can at least run
+        self.assertRunOk("distribution-registry --version", timeout=30)
+
+        # Spawn the registry and wait for it to be ready
+        self.assertRunOk(
+            "distribution-registry serve /etc/docker/registry/config.yml >/tmp/registry.log 2>&1 &",
+        )
+        for i in range(60):
+            time.sleep(1)
+            _, ret = self.emulator.run("test -s /tmp/registry.log")
+            if ret == 0:
+                time.sleep(2)  # Wait just a little tiny bit more...
+                break
+        else:
+            raise SystemError("Cannot start the registry")
+
+        # Get a multi-arch image from the Docker hub registry
+        # Huge timeout because qemu-system-arm has slirp issues
+        self.assertRunOk(
+            "skopeo copy -a docker://busybox:1.37.0-glibc oci-archive:busybox-1.37.0-glibc.oci",
+            timeout=600,
+        )
+
+        # Push the multi-arch image to the local registry
+        self.assertRunOk(
+            "skopeo copy -a oci-archive:busybox-1.37.0-glibc.oci docker://localhost:5000/busybox:1.37.0-glibc",
+            timeout=120,
+        )
+
+        # Pull the image back
+        self.assertRunOk(
+            "skopeo copy -a docker://localhost:5000/busybox:1.37.0-glibc oci-archive:busybox-1.37.0-glibc-2.oci",
+            timeout=120,
+        )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
