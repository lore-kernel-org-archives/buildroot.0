Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28713C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 07:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F50404BB;
	Thu, 19 Jun 2025 07:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63UUscO0bKwa; Thu, 19 Jun 2025 07:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55046406F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55046406F7;
	Thu, 19 Jun 2025 07:39:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F54A16B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0623740092
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjqCUrpA-1OE for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 07:39:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E59F4009F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E59F4009F
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E59F4009F
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:54 +0000 (UTC)
X-CSE-ConnectionGUID: ZQ/nZU1VTOOpdiZUF7P24g==
X-CSE-MsgGUID: QB4s6hOySDOWzRfT4u5sdg==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 09:39:54 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 09:39:53 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 19 Jun 2025 09:39:52 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 19 Jun 2025 09:39:51 +0200
X-CSE-ConnectionGUID: xEqElL3DRBGfRIW+Ezn+Pw==
X-CSE-MsgGUID: Ut/aY5VpQhqmz8lWF1GqTg==
X-IronPort-AV: E=Sophos;i="6.16,247,1744063200"; d="scan'208";a="302221700"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Thu, 19 Jun 2025 09:39:48 +0200
Message-ID: <e9de3252ae9bdf50b1c7f4a32dca00e45e85b921.1750318763.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750318763.git.yann.morin@orange.com>
References: <cover.1750318763.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750318795; x=1781854795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lh+UbLlY7cxWDjYYF0gCZBWG9bFVh9FJuRZsTlRle9Q=;
 b=ZLs6Gx4IzeVB5+N1gdYywIPe4be2bHevDVZT6HZY67Hp2ET1SpRvvgyD
 nbv+1SmCG3vrIwlrfNGSvAEiCAtOEpCsqeZjLa/PB3KyCRrjbILsSDMxI
 6ZxGlX9nx2aeNik0gN/wzeMoppgUf67dioP8NCPVHbcjOIKyMGL2i6xtO
 HjOMrKyO0fahjxZwy8AKq1o/AWqkzaxL47GVW6fgMhPgt33H3S1Sd1kNV
 jf1fqjPUYGCx4Nwr3OhQidGbszC4CU1Pe3y18Y2g2qzjf/rbecMtXasPM
 Y+pKpDE6pjxK0MuTqz4RIliWHhJEPGEBzygd8MxhsULyi3YvetjdMq198
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=ZLs6Gx4I
Subject: [Buildroot] [PATCH 3/3 v2] package/distribution-registry: new
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

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

---
Changes v1 -> v2:
  - rename using the pkg-golan infra's _BIN_NAME and _INSTALL_BINS
  - fix flake8 warning in runtime test
---
 package/Config.in                             |  1 +
 package/distribution-registry/Config.in       | 17 ++++
 package/distribution-registry/config.yml      | 13 +++
 .../distribution-registry.hash                |  3 +
 .../distribution-registry.mk                  | 47 +++++++++
 .../distribution-registry.service             | 10 ++
 .../package/test_distribution_registry.py     | 96 +++++++++++++++++++
 7 files changed, 187 insertions(+)
 create mode 100644 package/distribution-registry/Config.in
 create mode 100644 package/distribution-registry/config.yml
 create mode 100644 package/distribution-registry/distribution-registry.hash
 create mode 100644 package/distribution-registry/distribution-registry.mk
 create mode 100644 package/distribution-registry/distribution-registry.service
 create mode 100644 support/testing/tests/package/test_distribution_registry.py

diff --git a/package/Config.in b/package/Config.in
index c4ed3235f9..75060ed892 100644
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
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
