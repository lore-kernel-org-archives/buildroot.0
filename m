Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33015C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76DF81E0E;
	Thu,  3 Nov 2022 22:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76DF81E0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNcqsLQnBsom; Thu,  3 Nov 2022 22:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F30D681BB0;
	Thu,  3 Nov 2022 22:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F30D681BB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04C141BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7CC040520
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7CC040520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdgiLFb18PJq for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:45:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D64E4403C8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D64E4403C8
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:45:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 367EA1C0006;
 Thu,  3 Nov 2022 22:45:46 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Thu,  3 Nov 2022 23:45:37 +0100
Message-Id: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667515547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=r3OkUa8fbylosKBURoKCYPgvVM2noRmrrIqMUU3mPZ0=;
 b=AoaKnglmqQroUlH+JlZwdfidhsZIoAGUDfT0b/e2o56DrrmsXw4WNL6k7Of1E8VqKoUtIA
 Fcva4qoP7hHvJvtYyaOfmP8ldpif2/g+xPDx6qNTth49mRlfLAtc2i/WnVr2lx5KJ4emEm
 jQxuBguQNIGAAr9f1o867HzdIP8494fxEX3TiTbSmtruu/mwcYgB+QoT37di0H4aMeHufc
 6JGNHevUdzJ/qLvfvS0OWNaDwkD5DAR+kkIwHe/AUpyNraiICxXm6pAcM+LNG7qk+U8Ukh
 uF+OiuZN3QCj1JW1Mht1/aCePNI32k7F9JG2zwCe8MWK06nfo7Ib3LA7lW/2tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AoaKnglm
Subject: [Buildroot] [PATCH next 1/2] package/pkg-cargo: provide a single
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Moritz Bitsch <moritz@h6t.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of replicating $(HOST_DIR)/share/cargo in several place,
define BR_CARGO_HOME. This will help when we'll want to change this
location.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
