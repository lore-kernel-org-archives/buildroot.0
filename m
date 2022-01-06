Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060FFC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC3A581318;
	Thu,  6 Jan 2022 21:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuzT133qMhMk; Thu,  6 Jan 2022 21:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 170BD81260;
	Thu,  6 Jan 2022 21:01:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 760661BF340
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63A2C4018D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9ygXtRB_P4R for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:00:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21AD8400E5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:00:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6480D6000F;
 Thu,  6 Jan 2022 21:00:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  6 Jan 2022 21:59:55 +0100
Message-Id: <20220106210000.397694-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 07/11] package/ripgrep: convert to cargo
 infrastructure
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
 Sam Voss <sam.voss@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Patrick Havelange <patrick.havelange@essensium.com>

This commit converts the ripgrep package to the cargo
infrastructure. This causes the vendoring mechanism to kick in, which
changes the contents of the tarball. To avoid a clash on the hash, we
change the version of ripgrep to the Git commit hash matching the
13.0.0 tag, so there are no functional changes, but the tarball name
is different.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ripgrep/ripgrep.hash |  2 +-
 package/ripgrep/ripgrep.mk   | 37 ++++++------------------------------
 2 files changed, 7 insertions(+), 32 deletions(-)

diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index b2f03a95e6..cd2dbedfb4 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0fb17aaf285b3eee8ddab17b833af1e190d73de317ff9648751ab0660d763ed2  ripgrep-13.0.0.tar.gz
+sha256 6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
 sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 7c2b79a4a7..d587441cfa 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
-RIPGREP_VERSION = 13.0.0
+# Same as 13.0.0, we use a Git commit hash because the hash of this
+# tarball changed when moving to the cargo-package infrastructure, and
+# we can't change the hash of existing tarball. Please switch back to
+# a Git tag at the next version bump.
+RIPGREP_VERSION = af6b6c543b224d348a8876f0c06245d9ea7929c5
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
@@ -13,33 +17,4 @@ RIPGREP_CPE_ID_VENDOR = ripgrep_project
 # CVE only impacts ripgrep on Windows
 RIPGREP_IGNORE_CVES += CVE-2021-3013
 
-RIPGREP_DEPENDENCIES = host-rustc
-RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
-	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
-	CARGO_TARGET_APPLIES_TO_HOST="false"
-
-RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_BIN_SUBDIR)
-
-RIPGREP_CARGO_OPTS = \
-	-Z target-applies-to-host \
-	--target=$(RUSTC_TARGET_NAME) \
-	--manifest-path=$(@D)/Cargo.toml
-
-ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
-RIPGREP_CARGO_BIN_SUBDIR = debug
-else
-RIPGREP_CARGO_OPTS += --release
-RIPGREP_CARGO_BIN_SUBDIR = release
-endif
-
-define RIPGREP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(RIPGREP_CARGO_ENV) \
-		cargo build $(RIPGREP_CARGO_OPTS)
-endef
-
-define RIPGREP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(RIPGREP_BIN_DIR)/rg \
-		$(TARGET_DIR)/usr/bin/rg
-endef
-
-$(eval $(generic-package))
+$(eval $(cargo-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
