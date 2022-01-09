Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1A8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 831EF4010F;
	Sun,  9 Jan 2022 14:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQ65P-mwyv01; Sun,  9 Jan 2022 14:03:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 581B5401B2;
	Sun,  9 Jan 2022 14:03:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1681BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E46458174C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qly77bXVwBEK for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:03:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61E358174A
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 14:03:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B27181BF209;
 Sun,  9 Jan 2022 14:03:05 +0000 (UTC)
Date: Sun, 9 Jan 2022 15:03:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220109150304.45e12aea@windsurf>
In-Reply-To: <20200306203410.25008-1-ps.report@gmx.net>
References: <20200306203410.25008-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/2] package/qt5webengine: fix compile
 flags for arm
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
Cc: buildroot@busybox.net, James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Fri,  6 Mar 2020 21:34:09 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> The qt5webengine configure simple takes QT_ARCH ('arm') to determine the
> chromium compiler flags and uses some hard coded ARMv7 default values
> for the compiler command line: '... -march=armv7-a -mfloat-abi=hard
> -mtune=generic-armv7-a -mfpu=vfpv3-d16 ...'.
> 
> This results e.g. in an illegal instruction failure for rpi zero
> (reported on the mailing list, see [1]).
> 
> Disable all arm custom cpu flags (march/mfloat-abi/mtune/mfpu/mthumb) as
> these are already set by the compiler wrapper (via a patch to the chromium
> GN build system BUILD.gn file).
> 
> Despite the patch set all known values in the chromium GN build
> system config file chromium/build/config/arm.gni to not disturb
> the compile defines settings logic.

It's been a very long time since this patch was posted. Does the
problem still occur? There is a patch series from James Hilliard
upgrading qt5webengine:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=279766

Some more questions below.

> +diff --git a/src/3rdparty/chromium/build/config/compiler/BUILD.gn b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
> +index d223a4f6f..16dec5c6a 100644
> +--- a/src/3rdparty/chromium/build/config/compiler/BUILD.gn
> ++++ b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
> +@@ -672,7 +672,8 @@ config("compiler") {
> +     # TODO(pcc): The contents of .ARM.attributes should be based on the
> +     # -march flag passed at compile time (see llvm.org/pr36291).
> +     if (current_cpu == "arm") {
> +-      ldflags += [ "-march=$arm_arch" ]
> ++      # disabled for the buildroot compile
> ++      # ldflags += [ "-march=$arm_arch" ]
> +     }
> +   }
> + 
> +@@ -752,13 +753,15 @@ config("compiler_cpu_abi") {
> +         ldflags += [ "--target=arm-linux-gnueabihf" ]
> +       }
> +       if (!is_nacl) {
> +-        cflags += [
> +-          "-march=$arm_arch",
> +-          "-mfloat-abi=$arm_float_abi",
> +-        ]
> ++        # disabled for the buildroot compile
> ++        # cflags += [
> ++        #   "-march=$arm_arch",
> ++        #   "-mfloat-abi=$arm_float_abi",
> ++        # ]
> +       }
> +       if (arm_tune != "") {
> +-        cflags += [ "-mtune=$arm_tune" ]
> ++        # disabled for the buildroot compile
> ++        # cflags += [ "-mtune=$arm_tune" ]
> +       }
> +     } else if (current_cpu == "arm64") {
> +       if (is_clang && !is_android && !is_nacl && !is_fuchsia) {
> +@@ -1130,7 +1133,9 @@ config("clang_revision") {
> + 
> + config("compiler_arm_fpu") {
> +   if (current_cpu == "arm" && !is_ios && !is_nacl) {
> +-    cflags = [ "-mfpu=$arm_fpu" ]
> ++    # disabled for the buildroot compile
> ++    # cflags = [ "-mfpu=$arm_fpu" ]
> ++    cflags = []
> +     asmflags = cflags
> +   }
> + }
> +@@ -1138,7 +1143,9 @@ config("compiler_arm_fpu") {
> + config("compiler_arm_thumb") {
> +   if (current_cpu == "arm" && arm_use_thumb && is_posix &&
> +       !(is_mac || is_ios || is_nacl)) {
> +-    cflags = [ "-mthumb" ]
> ++    # disabled for the buildroot compile
> ++    # cflags = [ "-mthumb" ]
> ++    cflags = []
> +     if (is_android && !is_clang) {
> +       # Clang doesn't support this option.
> +       cflags += [ "-mthumb-interwork" ]

You're fixing the problem for ARM, but is there some similar mess for
other CPU architectures?

> +# configure arm architecture paramter for chromium compile
> +ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_ARM_CPU_ARMV4),y)
> +define QT5WEBENGINE_CONFIGURE_ARM_VERSION
> +	$(SED) 's/^    arm_version = 7$$/    arm_version = 4/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +endif
> +
> +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +define QT5WEBENGINE_CONFIGURE_ARM_VERSION
> +	$(SED) 's/^    arm_version = 7$$/    arm_version = 5/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +endif
> +
> +ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +define QT5WEBENGINE_CONFIGURE_ARM_VERSION
> +	$(SED) 's/^    arm_version = 7$$/    arm_version = 6/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +endif
> +
> +# no entriy for BR2_ARM_CPU_ARMV7A/BR2_ARM_CPU_ARMV7M, arm_vesion = 7 is already set by default
> +
> +ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> +define QT5WEBENGINE_CONFIGURE_ARM_VERSION
> +	$(SED) 's/^    arm_version = 7$$/    arm_version = 8/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +endif
> +
> +# not known by buildroot, set to some dummy to disable all default logic
> +define QT5WEBENGINE_CONFIGURE_ARM_ARCH
> +	$(SED) 's/^    arm_arch = ""$$/    arm_arch = "arm-dummy-arch"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +
> +define QT5WEBENGINE_CONFIGURE_ARM_FPU
> +	$(SED) 's/^    arm_fpu = ""$$/    arm_fpu = $(BR2_GCC_TARGET_FPU)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +
> +define QT5WEBENGINE_CONFIGURE_ARM_FLOAT_ABI
> +	$(SED) 's/^    arm_float_abi = ""$$/    arm_float_abi = $(BR2_GCC_TARGET_FLOAT_ABI)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +
> +define QT5WEBENGINE_CONFIGURE_ARM_TUNE
> +	$(SED) 's/^    arm_tune = ""$$/    arm_tune = $(BR2_GCC_TARGET_CPU)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +
> +ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> +define QT5WEBENGINE_CONFIGURE_ARM_NEON
> +	$(SED) 's/^    arm_use_neon = ""$$/    arm_use_neon = "true"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +else
> +define QT5WEBENGINE_CONFIGURE_ARM_NEON
> +	$(SED) 's/^    arm_use_neon = ""$$/    arm_use_neon = "false"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +endif
> +
> +ifeq ($(BR2_ARM_CPU_HAS_THUMB),)
> +define QT5WEBENGINE_CONFIGURE_ARM_THUMB
> +	$(SED) 's/^    arm_use_thumb = true$$/    arm_use_thumb = false/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> +endef
> +endif
> +endif

What are all those variables doing in the GN Chromium stuff?

I'm kind of worried by two aspects:

 - This is all very ARM specific, but we have other CPU architectures
   supported in Buildroot

 - We already pass the proper CFLAGS, so it's always annoying to
   duplicate this logic into package-specific flags

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
