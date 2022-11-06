Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E344DC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82D5A81D02;
	Mon,  5 Dec 2022 12:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D5A81D02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmYMUxQH7JBu; Mon,  5 Dec 2022 12:07:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB7B81778;
	Mon,  5 Dec 2022 12:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB7B81778
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 376901BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7383408AE
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7383408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1J5bvl8B4r9L for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 066BF40616
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 066BF40616
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0486E85B9B; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 16:10:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1459b7a86324b7d444fa3be635533c62341b7031
X-Git-Newrev: 3dde2792693bda14bebcdb907ba81c0db3a18c60
X-Patchwork-Hint: ignore
Message-Id: <20221205112608.0486E85B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo: provide a single
 definition of CARGO_HOME value
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

commit: https://git.buildroot.net/buildroot/commit/?id=3dde2792693bda14bebcdb907ba81c0db3a18c60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of replicating $(HOST_DIR)/share/cargo in several place,
define BR_CARGO_HOME. This will help when we'll want to change this
location.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-cargo.mk         | 6 ++++--
 package/suricata/suricata.mk | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index f7e3f39503..5923725f5e 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -20,8 +20,10 @@
 #
 ################################################################################
 
+BR_CARGO_HOME = $(HOST_DIR)/share/cargo
+
 PKG_COMMON_CARGO_ENV = \
-	CARGO_HOME=$(HOST_DIR)/share/cargo
+	CARGO_HOME=$(BR_CARGO_HOME)
 
 # __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS is needed to allow
 # passing the -Z target-applies-to-host, which is needed together with
@@ -79,7 +81,7 @@ $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
 $(2)_DEPENDENCIES += host-rustc
 
 $(2)_DOWNLOAD_POST_PROCESS = cargo
-$(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
+$(2)_DL_ENV += CARGO_HOME=$$(BR_CARGO_HOME)
 
 # If building in a sub directory, use that to find the Cargo.toml
 ifneq ($$($(2)_SUBDIR),)
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 8c38b7c713..72b72cc94d 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -29,7 +29,7 @@ SURICATA_DEPENDENCIES = \
 
 SURICATA_CONF_ENV = \
 	ac_cv_path_HAVE_SPHINXBUILD=no \
-	CARGO_HOME=$(HOST_DIR)/share/cargo \
+	CARGO_HOME=$(BR_CARGO_HOME) \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
 
 SURICATA_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
