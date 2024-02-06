Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41450C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E342641EFD;
	Tue,  6 Feb 2024 14:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E342641EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Gmm6POIcLGd; Tue,  6 Feb 2024 14:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED95941DEF;
	Tue,  6 Feb 2024 14:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED95941DEF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36BE71BF423
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BCA141E40
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BCA141E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyZ4UQSzhMur for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:35:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9BCB41F01
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9BCB41F01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F438870A2; Tue,  6 Feb 2024 14:35:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 15:35:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2298ceb213e4ce858f048603c44113057766efcf
X-Git-Newrev: 5b0094c1057ba9e38caa98067f695a87e67b5b1b
X-Patchwork-Hint: ignore
Message-Id: <20240206143519.9F438870A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo: configure cargo profiles
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b0094c1057ba9e38caa98067f695a87e67b5b1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-cargo currently sets the --release flag unless BR2_ENABLE_DEBUG is
set. However, this does not accurately reflect the configured build
settings. In addition, it only works for packages that use the cargo
infrastructure directory and not with packages using the cargo
environment indirectly, such as pyo3 based python packages. To support
these, we really want to pass the necessary flags in PKG_CARGO_ENV.

In order to accurately reflect the configured build settings
(optimization and debug levels), we set the appropriate environment
variables according to the global settings.

There is no way to specify the profile to use through an environment
variable, it has to be set through a cargo flag like --release. Since we
can't easily control the profile flags used by non-cargo package
infrastructures, we instead set the env variables for both root profiles
(dev/release). For the aspects that are not affected by the global
settings (incremental, codegen-units, split-debuginfo), we set them
equal to the default for release - which in our context is the
appropriate choice even when BR2_ENABLE_DEBUG is set.

For reference the default cargo root profile settings are:
https://doc.rust-lang.org/cargo/reference/profiles.html#default-profiles

Cc: Moritz Bitsch <moritz@h6t.eu>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Moritz Bitsch <moritz@h6t.eu>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Reviewed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-cargo.mk | 100 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 2c277f7079..47ce68bf02 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -53,6 +53,106 @@ PKG_CARGO_ENV = \
 	CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
 	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
 
+# We always set both CARGO_PROFILE_DEV and CARGO_PROFILE_RELEASE
+# as we are unable to select a build profile using the environment.
+#
+# Other cargo profiles generally derive from these two profiles.
+
+# Disable incremental compilation to match release default.
+#
+# Set codegen-units to release default.
+#
+# Set split-debuginfo to default off for ELF platforms.
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_INCREMENTAL="false" \
+	CARGO_PROFILE_RELEASE_INCREMENTAL="false" \
+	CARGO_PROFILE_DEV_CODEGEN_UNITS="16" \
+	CARGO_PROFILE_RELEASE_CODEGEN_UNITS="16" \
+	CARGO_PROFILE_DEV_SPLIT_DEBUGINFO="off" \
+	CARGO_PROFILE_RELEASE_SPLIT_DEBUGINFO="off"
+
+# Set the optimization level with the release default as fallback.
+ifeq ($(BR2_OPTIMIZE_0),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_OPT_LEVEL="0" \
+	CARGO_PROFILE_RELEASE_OPT_LEVEL="0"
+else ifeq ($(BR2_OPTIMIZE_1),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_OPT_LEVEL="1" \
+	CARGO_PROFILE_RELEASE_OPT_LEVEL="1"
+else ifeq ($(BR2_OPTIMIZE_2),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_OPT_LEVEL="2" \
+	CARGO_PROFILE_RELEASE_OPT_LEVEL="2"
+else ifeq ($(BR2_OPTIMIZE_3),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
+	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
+else ifeq ($(BR2_OPTIMIZE_G),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_OPT_LEVEL="0" \
+	CARGO_PROFILE_RELEASE_OPT_LEVEL="0"
+else ifeq ($(BR2_OPTIMIZE_S),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_OPT_LEVEL="s" \
+	CARGO_PROFILE_RELEASE_OPT_LEVEL="s"
+else ifeq ($(BR2_OPTIMIZE_FAST),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
+	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
+else
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
+	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
+endif
+
+ifeq ($(BR2_ENABLE_LTO),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_LTO="true" \
+	CARGO_PROFILE_RELEASE_LTO="true"
+else
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_LTO="false" \
+	CARGO_PROFILE_RELEASE_LTO="false"
+endif
+
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_DEBUG_3),y)
+# full debug info
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_DEBUG="2" \
+	CARGO_PROFILE_RELEASE_DEBUG="2"
+else
+# line tables only
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_DEBUG="1" \
+	CARGO_PROFILE_RELEASE_DEBUG="1"
+endif
+else
+# no debug info
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_DEBUG="0" \
+	CARGO_PROFILE_RELEASE_DEBUG="0"
+endif
+
+# Enabling debug-assertions enables the runtime debug_assert! macro.
+#
+# Enabling overflow-checks enables runtime panic on integer overflow.
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_DEBUG_ASSERTIONS="true" \
+	CARGO_PROFILE_RELEASE_DEBUG_ASSERTIONS="true" \
+	CARGO_PROFILE_DEV_OVERFLOW_CHECKS="true" \
+	CARGO_PROFILE_RELEASE_OVERFLOW_CHECKS="true"
+else
+PKG_CARGO_ENV += \
+	CARGO_PROFILE_DEV_DEBUG_ASSERTIONS="false" \
+	CARGO_PROFILE_RELEASE_DEBUG_ASSERTIONS="false" \
+	CARGO_PROFILE_DEV_OVERFLOW_CHECKS="false" \
+	CARGO_PROFILE_RELEASE_OVERFLOW_CHECKS="false"
+endif
+
 #
 # This is a workaround for https://github.com/rust-lang/compiler-builtins/issues/420
 # and should be removed when fixed upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
