Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD81C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35F9F60AD2;
	Sat,  8 Jan 2022 22:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulUh-yzV9PEw; Sat,  8 Jan 2022 22:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D60860B02;
	Sat,  8 Jan 2022 22:37:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23A781BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 554E660A93
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgMxYS56_Qt4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F5360AA9
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6945883466; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d5749d2de9f2d4b0681593fbe0d95096612a1c2
X-Git-Newrev: 342fd3e7350479dc368541ac77a5130ebb53194c
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.6945883466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ripgrep: convert to cargo
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=342fd3e7350479dc368541ac77a5130ebb53194c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 package/ripgrep/ripgrep.mk   | 37 ++++++-------------------------------
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
