Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F14C71155
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 08:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F88D40DB4;
	Fri, 20 Jun 2025 08:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V7vjOibkhJt7; Fri, 20 Jun 2025 08:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7014240DC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7014240DC5;
	Fri, 20 Jun 2025 08:10:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19BCAE2
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15E9960E34
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmcbOGbWhopc for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 08:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC49F60E39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC49F60E39
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC49F60E39
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:23 +0000 (UTC)
X-CSE-ConnectionGUID: 2xrERDg3TOuq+91yKa6XOA==
X-CSE-MsgGUID: 3lj3/nSYRXamrtfD10aU5w==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 10:10:21 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2025 10:10:15 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Jun 2025 10:10:13 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Jun 2025 10:10:13 +0200
X-CSE-ConnectionGUID: qFJ+4biaSsedpPxcmw8D/w==
X-CSE-MsgGUID: IwPDxR4yQ0mBJDFhxpwEcA==
X-IronPort-AV: E=Sophos;i="6.16,250,1744063200"; d="scan'208";a="303900259"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Jun 2025 10:10:09 +0200
Message-ID: <220e6498385625f49804474a119a63f8a55c4b03.1750407006.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750407006.git.yann.morin@orange.com>
References: <cover.1750407006.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX303.corporate.adroot.infra.ftgroup
 (10.115.26.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750407024; x=1781943024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XpjddJ+PAdculN62mn2J6l5iASeTixtmlz8qfd3rOeU=;
 b=gTiwrBihkilp/DF9i/j6hAfbUP+5wlquMFF0ZyBUIRflaLfFL30cufvD
 rKgoi6CsuXR76Ttzg2sz8s0obCD9gkrXn20j50MFEKGA+SQJK4O31Qzra
 ZpXlZUxWOpvixyrGhXfQUsw4ese5xyeVpMsoDkr0gl2dsCixZc9hHo36m
 gNqngY+ki5w/ho0Gw2sjOjeQyPI4R1ljwRALM2bjqYdPuF5E22Gv2mPgS
 hSwa7xY8xTKHe1PzgAWDZj6DMwlmNKmJ2BFkLBD+0/iKuHT5wh2i6joCG
 WKlaBZMFMFDIcZ5CPef2S/ci3u3vZizLi8JNZeqIXhi/sEO4TUmt5/eWq
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=gTiwrBih
Subject: [Buildroot] [PATCH 2/4] package: drop default _INSTALL_BINS in
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

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
---
 .../amazon-ecr-credential-helper.mk                           | 1 -
 package/containerd/containerd.mk                              | 1 -
 package/delve/delve.mk                                        | 2 --
 package/docker-cli/docker-cli.mk                              | 2 --
 package/docker-engine/docker-engine.mk                        | 2 --
 package/mender-artifact/mender-artifact.mk                    | 3 ---
 package/moby-buildkit/moby-buildkit.mk                        | 4 ----
 package/tailscale/tailscale.mk                                | 1 -
 8 files changed, 16 deletions(-)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
index acfeea16fb..ad75ed3360 100644
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
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index e118481838..7386b007cd 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -38,6 +38,4 @@ define DOCKER_CLI_FIX_VENDORING
 endef
 DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
 
-DOCKER_CLI_INSTALL_BINS = $(notdir $(DOCKER_CLI_BUILD_TARGETS))
-
 $(eval $(golang-package))
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c39dc2b440..181975b26b 100644
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
index 7019b9afc9..8f25b0cbd1 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -10,7 +10,6 @@ TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
-TAILSCALE_INSTALL_BINS = tailscale tailscaled
 TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
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
