Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5A7C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 445D8843EE;
	Fri, 21 Oct 2022 22:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 445D8843EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfsLd-Y9LH4f; Fri, 21 Oct 2022 22:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F23684303;
	Fri, 21 Oct 2022 22:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F23684303
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4401BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56FA084303
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FA084303
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNKP2Mzb09hZ for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:45:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55FA1842D0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55FA1842D0
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:45:17 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id n73so3491282iod.13
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSnnEjm6rKDPfr/eqsPO89F8K6Flj5SSn+jBpPVCnSI=;
 b=rGTKZd/Zf6jvLfJQeJADHq0lv4eCt1pHi7nnAL1stC/DRHbL8zYYMVHUazw1ndWz53
 D4SjnK4viTaVu9lGalMTYgNBrAZDSDuvQziTA4BaxZ0rxRoWwdL4tja34JmZbdYEbrJQ
 5sRhRTz0h2mj8WMwmcAOt86/eJ8hoe8TNKt7p4jzmloU21FU9PqoUt+k8CKRNlZP92/O
 Br2SdbNTGFwK0k5k/iMHUPkAHbfqWtr629ZKWdk/RUzPiI8vBOVMZfmttKVmILy9mNsA
 cd4kD6qELfQrR4lpaWc8cPPGz/EVIEeCNB9mDYoBwRFjEJhnEnB4muVplSXSwtykzdt6
 cyHQ==
X-Gm-Message-State: ACrzQf26laI7e3DBCP/5+oBm72skdYkc6gdUN0qxVO46FdIblgz6W0Vb
 THD653S2hKdzJaFpQkqBNyUVF9jvWvNbSg==
X-Google-Smtp-Source: AMsMyM4QbGc9FWINBlCtys5I4Kx/TKS7UI3CWwAHs2FUChLmqnKZpqUvBI/LoBFvRNem0a5wKsVOAQ==
X-Received: by 2002:a05:6602:27cd:b0:669:3d8d:4d77 with SMTP id
 l13-20020a05660227cd00b006693d8d4d77mr14831841ios.216.1666392316027; 
 Fri, 21 Oct 2022 15:45:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m25-20020a026a59000000b0035a498d222asm4544432jaf.35.2022.10.21.15.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 15:45:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 16:44:48 -0600
Message-Id: <20221021224448.3502942-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pSnnEjm6rKDPfr/eqsPO89F8K6Flj5SSn+jBpPVCnSI=;
 b=BF3GtcSq1iJK+sW5cZq7gIWE/DvSb4OM3u3Q7i8Wfe8xCS05hPsrcnshWg9MJHFsfC
 cPph8G4VzBxZEQ7qK4/tejZHEzGN7uP8cbK6mlswsNsolI4Tagvyac/0NYgyqKejIgs+
 jFhjCtLiRVbvHsb18cUh3PNNZDq/OqCun1U1gyyOdcfeptvhGpR+biYj+bbyKbiRcaAh
 nwubg6q8m5wjA+i9c3UWQwaFVDLm2K/K5JSEqO1w8i1hTe6Smsu2Q/CHVBTzIZGmuv16
 gfo72u9EKi3VW5RSf0Uj5EyS/wUfepc1NV8RUnmIHb2au9t/XxHvo9A5s0A/akVj7OzV
 /zOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BF3GtcSq
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo: configure cargo profiles
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
Cc: Moritz Bitsch <moritz@h6t.eu>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cargo profile flags currently only select a cargo build flag which
does not accurately reflect the configured build settings, setting the
cargo build flag also only works for packages using the cargo
infrastructure directly and not with other packages using the cargo
environment such as pyo3 based python packages(which indirectly invoke
cargo build via the setuptools-rust and maturn python build backends).

To ensure that cargo uses the correct profile settings for the build
we need to set env variables for the two root profiles(dev/release)
based on the buildroot build settings.

For reference the default cargo root profile settings are:
https://doc.rust-lang.org/cargo/reference/profiles.html#default-profiles

As applications not using cargo infrastructure do not have a standard
way of configuring a specific build profile due to the selected
profile being determined by the cargo command line flags, the only
reliable way to configure profile settings is to set both root
profiles in the environment as this will ensure that they are used
regardless of which cargo build flag(such as --debug or --release) is
used.

Cc: Moritz Bitsch <moritz@h6t.eu>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-cargo.mk | 100 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index f7e3f39503..4945770079 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -46,6 +46,106 @@ PKG_CARGO_ENV = \
 	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
