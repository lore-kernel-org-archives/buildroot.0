Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED10ACAC583
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F576120F;
	Wed, 10 Sep 2025 11:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sMYLvniNUC8; Wed, 10 Sep 2025 11:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1D6A61210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D6A61210;
	Wed, 10 Sep 2025 11:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DFA3E1F
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B92660651
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ur7Dts47rHJ for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444DB60BBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 444DB60BBB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3332983D35; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 13:08:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd4ece315109f327613ff9ca26d02894c73d8be6
X-Git-Newrev: eb007fe2db461425d9e6ba70d7542c13bfd58f84
X-Patchwork-Hint: ignore
Message-Id: <20250910111949.3332983D35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: drop default _INSTALL_BINS in
 golang-package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb007fe2db461425d9e6ba70d7542c13bfd58f84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the pkg-golang infra automatically sets _INSTALL_BINS by
default to the list of notdir of _BUILD_TARGETS, there is no need to do
that in packages anymore.

Most packages were already using the notdir construct, so those are
trivially fixed; a few had a hard-coded list that matched the built
targets list, so they too are trivially fixed.

host-mender-artifact was slightly different, in that it explicitly set
the _BIN_NAME to mender-artifact, which happens to be the default; it
also set _INSTALL_BINS to _BIN_NAME, so again using the default. This
package can also be fixed easily.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk | 1 -
 package/containerd/containerd.mk                                     | 1 -
 package/delve/delve.mk                                               | 2 --
 package/distribution-registry/distribution-registry.mk               | 1 -
 package/docker-cli/docker-cli.mk                                     | 2 --
 package/docker-engine/docker-engine.mk                               | 2 --
 package/mender-artifact/mender-artifact.mk                           | 3 ---
 package/moby-buildkit/moby-buildkit.mk                               | 4 ----
 package/tailscale/tailscale.mk                                       | 1 -
 9 files changed, 17 deletions(-)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
index 06bc98bc79..5ac416912c 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -15,6 +15,5 @@ AMAZON_ECR_CREDENTIAL_HELPER_SUBDIR = ecr-login
 
 AMAZON_ECR_CREDENTIAL_HELPER_GOMOD = ./cli
 AMAZON_ECR_CREDENTIAL_HELPER_BUILD_TARGETS = docker-credential-ecr-login
-AMAZON_ECR_CREDENTIAL_HELPER_INSTALL_BINS = docker-credential-ecr-login
 
 $(eval $(golang-package))
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 1f70a26ebf..2ef70ab5d7 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -20,7 +20,6 @@ CONTAINERD_BUILD_TARGETS = \
 	cmd/containerd-shim-runc-v2 \
 	cmd/ctr
 
-CONTAINERD_INSTALL_BINS = $(notdir $(CONTAINERD_BUILD_TARGETS))
 CONTAINERD_TAGS = no_aufs
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index 408286e3b4..8206721fe2 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -12,11 +12,9 @@ DELVE_DEPENDENCIES = host-pkgconf
 
 DELVE_TAGS = cgo
 DELVE_BUILD_TARGETS = cmd/dlv
-DELVE_INSTALL_BINS = $(notdir $(DELVE_BUILD_TARGETS))
 
 HOST_DELVE_TAGS = cgo
 HOST_DELVE_BUILD_TARGETS = cmd/dlv
-HOST_DELVE_INSTALL_BINS = $(notdir $(HOST_DELVE_BUILD_TARGETS))
 
 $(eval $(golang-package))
 $(eval $(host-golang-package))
diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
index 901b9c40e5..a01a3c1710 100644
--- a/package/distribution-registry/distribution-registry.mk
+++ b/package/distribution-registry/distribution-registry.mk
@@ -18,7 +18,6 @@ DISTRIBUTION_REGISTRY_BUILD_TARGETS = cmd/registry
 # distribution-registry builds and installs the 'registry' executable, but
 # that name is a bit too generic. Rename it to match the package name.
 DISTRIBUTION_REGISTRY_BIN_NAME = distribution-registry
-DISTRIBUTION_REGISTRY_INSTALL_BINS = distribution-registry
 
 # Inject the version as if done by upstream's wrapper Makefile
 define DISTRIBUTION_REGISTRY_SET_VERSION
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 511ec1c8dd..abe0aac348 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -38,6 +38,4 @@ define DOCKER_CLI_FIX_VENDORING
 endef
 DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
 
-DOCKER_CLI_INSTALL_BINS = $(notdir $(DOCKER_CLI_BUILD_TARGETS))
-
 $(eval $(golang-package))
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 28905b28d6..37d42edaea 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -70,8 +70,6 @@ define DOCKER_ENGINE_FIX_VENDORING
 endef
 DOCKER_ENGINE_POST_EXTRACT_HOOKS += DOCKER_ENGINE_FIX_VENDORING
 
-DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
-
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index bcab91890a..7d6f0929e2 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -115,7 +115,4 @@ HOST_MENDER_ARTIFACT_GO_ENV += \
 
 HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
-HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
-HOST_MENDER_ARTIFACT_INSTALL_BINS = $(HOST_MENDER_ARTIFACT_BIN_NAME)
-
 $(eval $(host-golang-package))
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index 91560c1ed1..4ae1abde3a 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -17,12 +17,8 @@ MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
 MOBY_BUILDKIT_LDFLAGS = \
 	-X $(MOBY_BUILDKIT_GOMOD)/version.Version="$(MOBY_BUILDKIT_VERSION)"
 
-MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(MOBY_BUILDKIT_BUILD_TARGETS))
-
 HOST_MOBY_BUILDKIT_TAGS = cgo
 HOST_MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
 
-HOST_MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(HOST_MOBY_BUILDKIT_BUILD_TARGETS))
-
 $(eval $(golang-package))
 $(eval $(host-golang-package))
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index c63710c131..3c6c7bce1e 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -11,7 +11,6 @@ TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
 TAILSCALE_CPE_ID_VENDOR = tailscale
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
-TAILSCALE_INSTALL_BINS = tailscale tailscaled
 TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
