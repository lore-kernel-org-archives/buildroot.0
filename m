Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A071C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BC481289;
	Mon, 15 Jul 2024 14:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaJQB_gWjThe; Mon, 15 Jul 2024 14:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A33812C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A33812C4;
	Mon, 15 Jul 2024 14:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 450AD1BF969
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DC58405E9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Taafrxdo4Mn for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B415A405F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B415A405F2
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B415A405F2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:02:37 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-427aeebaecdso6738285e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721052156; x=1721656956;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=egnmVaHHQvXxt+Ru5635TZmtTlZVhNeNtJkR/bTrpE0=;
 b=t1QvRnGRl/8AnHxJQwVsPGjeEt41EQalGOVIW2/a4UiOGdti+K1h+1EfiTisAU4CPT
 P8F0IVpl601jaQIXCZFEXC3M2KMdFbg6hFGzcr9Wd9ZzaOAJlpFj3X2+EhWUZhh0w32U
 mpGr9vmAqpF6wEUff89Snx5RUEPbKKrSBMlrTXX4uB3pmCWOqrRHkwrbw02SxGijBEbb
 2aW5W3NZQTUR1f5SnD8tXwzydk8psiqxov/8tIAACeQzb7DeyhP5bkzIhngMZaHXz5Wx
 xrw0yCpJHpCiBVGO90rZPYZmtzSej6wchh6qOPvFPSV80rATt6jG2joCuzHGNSrB7aoD
 RNZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6yNhMs8qfxEmhcelDv9i+XmwoLhnCCVg/NvZFiOZNX196yCDD3xOZYR81P7ap3rfQrF9R0kyuBD8wMZxzrHjpev21Tz7gww==
X-Gm-Message-State: AOJu0Yw0lFFzYExCzz7il91VK0ZoktIn4bgcUELuoeqNXoN5eoNaFsEn
 eXNUWVJp4kZWRRWbhSTbZdxlq5I94U6CX0dMndpAbIVTrTa7CSRb/L/paJ3rhe4=
X-Google-Smtp-Source: AGHT+IEoekWo14YBvLUTZmk87Cz33UggGeyefYJt82q2pcGeQ/H7H3Uxlt9E4gKkVN9PcWOjcqNxRw==
X-Received: by 2002:a05:600c:4797:b0:426:6945:75b8 with SMTP id
 5b1f17b1804b1-426708f14ccmr124953935e9.31.1721052155598; 
 Mon, 15 Jul 2024 07:02:35 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm89727045e9.3.2024.07.15.07.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:02:35 -0700 (PDT)
Message-ID: <e3336d84-a3a1-49c3-9f48-849c71aceffd@mind.be>
Date: Mon, 15 Jul 2024 13:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20240712153509.2583089-1-kory.maincent@bootlin.com>
 <20240712153509.2583089-5-kory.maincent@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20240712153509.2583089-5-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721052156; x=1721656956; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=egnmVaHHQvXxt+Ru5635TZmtTlZVhNeNtJkR/bTrpE0=;
 b=ET+gfXRjinJeidAOAnJ7q8X04QHYDttjoiV69BMYKMg+EWNpnmAbwZVshBCYtSLEGL
 OBLLhfeTDWWHdymn7MEDueMWDtG8/awK6dBKMJrmDTlSM7POVu4tbVZws9JR6EdPjOnx
 2fCdnm8cJFxxRBcS3w7/SQadiuj+iYAIMuvhYWgFvQ5CigLrzS+kKaQbmHIRME0vddpv
 eddc55xJCFujXjUae3iz8L71GWnrJBr1xxXr/yv5mvC4g4bUXWxZbketDvs+XjadONDt
 KplZNAoX2Sts4JW5sk1cVyhqVvAe2WHsPBnc4k/Mea93js4QK0s7/2SR8Bj7eZ99EXQF
 BGEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ET+gfXRj
Subject: Re: [Buildroot] [PATCH v4 4/4] boot: Add support for
 TrustedFirmware-M package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Asaf Kahlon <asafka7@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Kory, all,

  Lot's of comments on this one! Joy! I'll mark the series as Changes Requested.

On 12/07/2024 17:35, Kory Maincent via buildroot wrote:
> Add support for TrustedFirmware-M:
> https://trustedfirmware-m.readthedocs.io
> https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git
> 
> Trusted Firmware-M (TF-M) implements the Secure Processing Environment
> (SPE) for Armv8-M, Armv8.1-M architectures (e.g. the Cortex-M33,
> Cortex-M23, Cortex-M55, Cortex-M85 processors) or dual-core platforms.
> 
> Use subpackages to download the third-party project sources to be able to
> apply patches located in the TF-M sources. This approach is also necessary
> because the tfm-tests git host produces non-reproducible tarballs.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> Changes in v4:
> - Fix a recursive dependency loop issue. TF-M was depend on 3rd parties
>    which where was patch dependent on TF-M to have access to their patches.
>    Instead patch the 3rd parties sources in the TF-M packages.
> 
> Changes in v3:
> - Add select BR2_HOST_CMAKE_AT_LEAST_3_21 to avoid cmake configure error
>    due to old cmake version.
> - Fix a Kconfig check-package too long line warning.
> 
> Changes in v2:
> - Add TF-M to DEVELOPERS file
> - Fix few nit.
[snip]
> diff --git a/boot/trusted-firmware-m/Config.in b/boot/trusted-firmware-m/Config.in
> new file mode 100644
> index 0000000000..1571d35360
> --- /dev/null
> +++ b/boot/trusted-firmware-m/Config.in
> @@ -0,0 +1,102 @@
> +config BR2_TARGET_TRUSTED_FIRMWARE_M
> +	bool "TrustedFirmware-M (TF-M)"
> +	select BR2_TARGET_TFM_TESTS
> +	select BR2_TARGET_TFM_MBEDTLS
> +	select BR2_TARGET_TFM_MCUBOOT
> +	select BR2_TARGET_TFM_QCBOR
> +	select BR2_TARGET_TFM_CMSIS
> +	select BR2_HOST_CMAKE_AT_LEAST_3_21
> +	help
> +	  Enable this option if you want to build the TF-M for your
> +	  ARMv8 microcontroller.

  Shouldn't that be ARMv8-M? Kind of implied by the "microcontroller" part of 
course.

> +
> +	  https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git

  I think https://trustedfirmware-m.readthedocs.io is a better link.


> +
> +if BR2_TARGET_TRUSTED_FIRMWARE_M
> +choice
> +	prompt "TF-M Version"
> +	help
> +	  Select the specific TF-M version you want to use
> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_LATEST_VERSION
> +	bool "TF-Mv2.1.0"

  Just "v2.1.0" should be enough?

> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION
> +	bool "Custom version"
> +	select BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
> +	help
> +	  This option allows to use a specific official versions

  versions -> version

> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL
> +	bool "Custom tarball"
> +	select BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT
> +	bool "Custom Git repository"
> +	select BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
> +
> +endchoice
> +
> +if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL

  This should be a 'depends on' rather than an 'if'.

> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL_LOCATION
> +	string "URL of custom TF-M tarball"
> +
> +endif
> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION_VALUE
> +	string "TF-M version"
> +	depends on BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION
> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_VERSION
> +	string
> +	default "0c4c99ba33b3e66deea070e149279278dc7647f4" \
> +				if BR2_TARGET_TRUSTED_FIRMWARE_M_LATEST_VERSION
> +	default "custom"	if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL
> +	default BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_VERSION \
> +				if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT
> +	default BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION_VALUE \
> +				if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION
> +
> +if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT

  This block should come before the BR2_TARGET_TRUSTED_FIRMWARE_M_VERSION 
definition.

> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_URL
> +	string "URL of custom repository"
> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_VERSION
> +	string "Custom repository version"
> +	help
> +	  Revision to use in the typical format used by Git
> +	  E.G. a sha id, a tag, ..
> +
> +endif
> +
> +menu "TF-M 3rd party projects"

  I wouldn't make a submenu for this. We decided that the cut-off point for 
submenus is 5, and we do reach that level, but then the submenu should be at the 
top level under BR2_TARGET_TRUSTED_FIRMWARE_M, i.e. the version choice itself 
should also be in the submenu.

  I don't remember if we usually use "menuconfig" or "if .... menu".

> +config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
> +	bool "Use custom tarball for TF-M 3rd party projects"

  I don't think this option needs to be user visible - is there ever any point 
to have upstream TF-M but custom cmsis?

> +
> +source "boot/trusted-firmware-m/tfm-mbedtls/Config.in"
> +source "boot/trusted-firmware-m/tfm-mcuboot/Config.in"
> +source "boot/trusted-firmware-m/tfm-qcbor/Config.in"
> +source "boot/trusted-firmware-m/tfm-cmsis/Config.in
  As explained below, I don't think we need sub-packages for these. Still, this 
is the place where the sub-versions should be specified. So here we should have:

config BR2_TARGET_TFM_MBEDTLS_TARBALL_LOCATION
config BR2_TARGET_TFM_MCUBOOT_TARBALL_LOCATION
etc.

> +source "boot/trusted-firmware-m/tfm-tests/Config.in"

  This one unfortunately needs to stay as a sub-package.

> +
> +endmenu
> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_PLATFORM
> +	string "TF-M platform path"
> +	help
> +	  Target plaform path to build for.

  This is not explained very well. Maybe an example?

> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_ADDITIONAL_VARIABLES
> +	string "Additional TF-M build variables"
> +	help
> +	  Additional parameters for the TF-M build
> +	  E.G. '-DTFM_ISOLATION_LEVEL=2 -DTFM_PROFILE=large'
> +
> +config BR2_TARGET_TRUSTED_FIRMWARE_M_DEBUG
> +	bool "Build in debug mode"
> +	help
> +	  Enable this option to build TF-M with -DCMAKE_BUILD_TYPE=Debug.

  We don't normally have such options, why do we want it now? And anyway, if you 
really need it, you can do that with _ADDITIONAL_VARIABLES, no?

> +
> +endif
> diff --git a/boot/trusted-firmware-m/tfm-3rdparty.mk b/boot/trusted-firmware-m/tfm-3rdparty.mk
> new file mode 100644
> index 0000000000..1a7bab4011
> --- /dev/null
> +++ b/boot/trusted-firmware-m/tfm-3rdparty.mk
> @@ -0,0 +1,7 @@
> +################################################################################
> +#
> +# TrustedFirmware-M 3rd parties
> +#
> +################################################################################
> +
> +include $(sort $(wildcard boot/trusted-firmware-m/*/*.mk))

  There's no need for an additional .mk file for this, you can do this directly 
from trusted-firmware-m.mk.

  Also I wouldn't use wildcard here, but that's more of a personal opinion.

> diff --git a/boot/trusted-firmware-m/tfm-cmsis/Config.in b/boot/trusted-firmware-m/tfm-cmsis/Config.in
> new file mode 100644
> index 0000000000..3774b2d9bc
> --- /dev/null
> +++ b/boot/trusted-firmware-m/tfm-cmsis/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_TARGET_TFM_CMSIS
> +	bool
> +
> +if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
> +
> +config BR2_TARGET_TFM_CMSIS_CUSTOM_TARBALL_LOCATION
> +	string "URL of custom cmcis tarball"

  cmsis

> +	default "$(call github,arm-software,cmsis_6)/d0c460c169.tar.gz"

  I think we should always have the tarball location specified in Config.in (see 
also below in the .mk file), so here I would put:

config BR2_TARGET_TRUSTED_FIRMWARE_M_CMSIS_TARBALL_LOCATION
	string "URL of custom cmsis tarball" \
		if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
  	default "$(call 
github,arm-software,cmsis_6)/tfm_cmsis-d0c460c1697d210b49a4b90998195831c0cd325c.tar.gz"

  Note:
- because it's no longer a subpackage, it becomes an option of
trusted-firmware-m itself, so we need that as a prefix;
- we can drop the "custom" part because it's always used.

  Now I think of it: although trusted-firmware-m is the upstream name of the 
repository, it is _really_ long... Perhaps we can abbreviate to tf-m for once? 
OTOH arm-trusted-firmware is even longer...


> +
> +endif
> diff --git a/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.hash b/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.hash
> new file mode 100644
> index 0000000000..4811118a79
> --- /dev/null
> +++ b/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.hash
> @@ -0,0 +1,3 @@
> +# sha256 locally computed
> +sha256  d846342840831f9124157b69b8edcdfcacc5427691f5b3341f714f0235c3cc49  tfm-cmsis-d0c460c1697d210b49a4b90998195831c0cd325c.tar.gz
> +sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
> diff --git a/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk b/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk
> new file mode 100644
> index 0000000000..eb106ce414
> --- /dev/null
> +++ b/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# cmcis
> +#
> +################################################################################
> +
> +ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY),y)
> +TFM_CMSIS_VERSION = custom
> +TFM_CMSIS_TARBALL = $(call qstrip,$(BR2_TARGET_TFM_CMSIS_CUSTOM_TARBALL_LOCATION))
> +TFM_CMSIS_SITE = $(patsubst %/,%,$(dir $(TFM_CMSIS_TARBALL)))
> +TFM_CMSIS_SOURCE = $(notdir $(TFM_CMSIS_TARBALL))

  We can use the above unconditionally if we just give the correct default in 
Config.in.

  Also, we don't need to do this in a separate package, it can be done in TF_M 
additional downloads (I'm going to use the TF_M abbreviation in my review 
because I'm too lazy to type long names :-)).

TF_M_CMSIS_TARBALL = $(call qstrip,$(BR2_TARGET_TF_M_CMSIS_TARBALL_LOCATION))
TF_M_ADDITIONAL_DOWNLOADS += $(TF_M_CMSIS_TARBALL)
define TF_M_CMSIS_EXTRACT
	... extract $(TF_M_DL_DIR)/$(notdir $(TF_M_CMSIS_TARBALL)) ...
endef

> +BR_NO_CHECK_HASH_FOR += $(TFM_CMSIS_SOURCE)

This still needs to be in the BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY 
condition, of course.

> +else
> +TFM_CMSIS_VERSION = d0c460c1697d210b49a4b90998195831c0cd325c
> +TFM_CMSIS_SITE = $(call github,arm-software,cmsis_6,$(TFM_CMSIS_VERSION))
> +TFM_CMSIS_LICENSE = Apache-2.0

  Why was this in the BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY condition? 
We can assume that the license is the same, no?

  Anyway, if it's not a sub-package, it will need to be added to TF_M_LICENSE 
instead.

> +TFM_CMSIS_LICENSE_FILES = LICENSE
> +endif
> +
> +# This components is not built and installed, because it is intended to
> +# be included as source in TrustedFirmware-M build.
> +
> +$(eval $(generic-package))

[snip]
> diff --git a/boot/trusted-firmware-m/tfm-tests/Config.in b/boot/trusted-firmware-m/tfm-tests/Config.in
> new file mode 100644
> index 0000000000..758e66b8c4
> --- /dev/null
> +++ b/boot/trusted-firmware-m/tfm-tests/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_TARGET_TFM_TESTS
> +	bool
> +
> +if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
> +
> +config BR2_TARGET_TFM_TESTS_CUSTOM_TARBALL_LOCATION
> +	string "URL of custom TF-M-tests tarball"
> +	default "https://git.trustedfirmware.org/TF-M/tf-m-tests.git/+archive/TF-Mv2.1.0.tar.gz"

  Since this is a non-reproducible tarball, I'd only offer the option of a 
custom git here. Then we can apply the same principle of having a 
conditionally-blind Config.in option and just one way of handling in the .mk file.

  Of course, you'll need two Config.in options then, separately for the git URL 
and the revision.

> +
> +endif

[snip]
> diff --git a/boot/trusted-firmware-m/trusted-firmware-m.mk b/boot/trusted-firmware-m/trusted-firmware-m.mk
> new file mode 100644
> index 0000000000..0ad8b6afb5
> --- /dev/null
> +++ b/boot/trusted-firmware-m/trusted-firmware-m.mk
> @@ -0,0 +1,120 @@
> +################################################################################
> +#
> +# TrustedFirmware-M
> +#
> +################################################################################
> +
> +TRUSTED_FIRMWARE_M_VERSION = $(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_VERSION))
> +
> +ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL),y)
> +# Handle custom FT-M tarballs as specified by the configuration
> +TRUSTED_FIRMWARE_M_TARBALL = $(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL_LOCATION))
> +TRUSTED_FIRMWARE_M_SITE = $(patsubst %/,%,$(dir $(TRUSTED_FIRMWARE_M_TARBALL)))
> +TRUSTED_FIRMWARE_M_SOURCE = $(notdir $(TRUSTED_FIRMWARE_M_TARBALL))
> +else ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT),y)
> +TRUSTED_FIRMWARE_M_SITE = $(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_URL))
> +TRUSTED_FIRMWARE_M_SITE_METHOD = git
> +else
> +# Handle stable official TF-M versions
> +TRUSTED_FIRMWARE_M_SITE = https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git
> +TRUSTED_FIRMWARE_M_SITE_METHOD = git
> +# The licensing of custom or from-git versions is unknown.
> +# This is valid only for the latest (i.e. known) version.
> +ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_LATEST_VERSION),y)
> +TRUSTED_FIRMWARE_M_LICENSE = BSD-3-Clause
> +TRUSTED_FIRMWARE_M_LICENSE_FILES = license.rst
> +endif
> +endif
> +
> +ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M):$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION)$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL)$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT),y:y)

  Maybe we should have a config.in condition for this one? Actually, can't we 
reuse BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY?

> +BR_NO_CHECK_HASH_FOR += $(TRUSTED_FIRMWARE_M_SOURCE)
> +endif
> +
> +TRUSTED_FIRMWARE_M_DEPENDENCIES += \
> +	$(BR2_CMAKE_HOST_DEPENDENCY) \
> +	host-arm-gnu-toolchain \
> +	host-python-cbor2 \
> +	host-python-click \
> +	host-python-cryptography \
> +	host-python-jinja2 \
> +	host-python-intelhex \
> +	host-python-pyyaml
> +
> +TRUSTED_FIRMWARE_M_PATCH_DEPENDENCIES += \
> +	tfm-mbedtls \
> +	tfm-mcuboot \
> +	tfm-qcbor \
> +	tfm-cmsis \
> +	tfm-tests
> +
> +define TRUSTED_FIRMWARE_M_PATCH_3RD_PARTIES
> +	if [ -d $(@D)/lib/ext/cmsis ]; then \

  Shouldn't all of these have such a condition? We can't be sure that they'll 
still exist in future versions, right?

> +		$(APPLY_PATCHES) $(TFM_CMSIS_SRCDIR) $(@D)/lib/ext/cmsis \*.patch; \
> +	fi
> +	$(APPLY_PATCHES) $(TFM_MBEDTLS_SRCDIR) $(@D)/lib/ext/mbedcrypto \*.patch; \
> +	$(APPLY_PATCHES) $(TFM_MCUBOOT_SRCDIR) $(@D)/lib/ext/mcuboot \*.patch; \
> +	$(APPLY_PATCHES) $(TFM_QCBOR_SRCDIR) $(@D)/lib/ext/qcbor \*.patch; \
> +	$(APPLY_PATCHES) $(TFM_TESTS_SRCDIR) $(@D)/lib/ext/tf-m-tests \*.patch;
> +endef
> +TRUSTED_FIRMWARE_M_POST_PATCH_HOOKS += TRUSTED_FIRMWARE_M_PATCH_3RD_PARTIES
> +
> +TRUSTED_FIRMWARE_M_CONF_OPTS += \
> +	-DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \

  That doesn't sound right... That toolchainfile is meant for cross-compilation 
to the Linux host, it's going to be completely wrong for the Cortex-M. I think 
we have to explicitly set all the options here with -D.

  In the future, we could consider adding a toolchainfile for the 
host-arm-gnu-toolchain as a whole. I think now is still a bit too soon for that.


> +	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
> +	-DMBEDCRYPTO_PATH=$(TFM_MBEDTLS_SRCDIR) \
> +	-DTFM_TEST_REPO_PATH=$(TFM_TESTS_SRCDIR) \

  Actually, CMakeLists.txt says the following:

if(IS_DIRECTORY ${CONFIG_TFM_TEST_DIR})
      add_subdirectory(${CONFIG_TFM_TEST_DIR} 
${CMAKE_CURRENT_BINARY_DIR}/tf-m-tests)
endif()

  So perhaps we can just point CONFIG_TFM_TEST_DIR to something invalid and drop 
the whole thing?


> +	-DMCUBOOT_PATH=$(TFM_MCUBOOT_SRCDIR) \
> +	-DQCBOR_PATH=$(TFM_QCBOR_SRCDIR) \
> +	-DCMSIS_PATH=$(TFM_CMSIS_SRCDIR) \
> +	-DTFM_PLATFORM=$(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_PLATFORM))
> +
> +ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_DEBUG),y)
> +TRUSTED_FIRMWARE_M_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
> +endif
> +
> +TRUSTED_FIRMWARE_M_CONF_ENV += \
> +	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi-
> +
> +define TRUSTED_FIRMWARE_M_CONFIGURE_CMDS
> +	rm -f $(@D)/CMakeCache.txt
> +	PATH=$(BR_PATH) \
> +	$(TRUSTED_FIRMWARE_M_CONF_ENV) $(BR2_CMAKE) -S $(@D) -B $(@D) \

  Can we use -GNinja?

> +		$(TRUSTED_FIRMWARE_M_CONF_OPTS) \
> +		$(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_ADDITIONAL_VARIABLES))
> +endef
> +
> +define TRUSTED_FIRMWARE_M_BUILD_CMDS
> +	PATH=$(BR_PATH) \
> +	$(TRUSTED_FIRMWARE_M_CONF_ENV) $(BR2_CMAKE) \
> +		--build $(@D) -- install
> +endef
> +
> +define TRUSTED_FIRMWARE_M_INSTALL_TARGET_CMDS
> +	# Install path for old version of TF-M

  Since this is a new package in Buildroot, is it really necessary to support 
versions < 2.1?

> +	if [ -d $(@D)/install/outputs ]; then \
> +		$(INSTALL) -D -m 0755 $(@D)/install/outputs/*.bin $(BINARIES_DIR); \
> +		$(INSTALL) -D -m 0755 $(@D)/install/outputs/*.elf $(BINARIES_DIR); \

  I don't know how many binaries there are, but perhaps it makes sense to put 
them in a subdirectory? Or is it just a single binary?

> +	else \
> +		$(INSTALL) -D -m 0755 $(@D)/api_ns/bin/*.bin $(BINARIES_DIR); \
> +		$(INSTALL) -D -m 0755 $(@D)/api_ns/bin/*.elf $(BINARIES_DIR); \
> +	fi
> +endef
> +
> +# Configuration check
> +ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M)$(BR_BUILDING),yy)
> +
> +ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL),y)
> +ifeq ($(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL_LOCATION)),)
> +$(error No tarball location specified. Please check BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL_LOCATION)
> +endif
> +endif
> +
> +ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT),y)
> +ifeq ($(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_URL)),)
> +$(error No repository specified. Please check BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_URL)
> +endif
> +endif
> +
> +endif
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/boot/test_tfm.py b/support/testing/tests/boot/test_tfm.py
> new file mode 100644
> index 0000000000..77650aaec1
> --- /dev/null
> +++ b/support/testing/tests/boot/test_tfm.py
> @@ -0,0 +1,12 @@
> +import infra.basetest
> +
> +
> +class TestTFMBuild(infra.basetest.BRTest):
> +    config = \
> +        """
> +	BR2_TARGET_TRUSTED_FIRMWARE_M=y
> +	BR2_TARGET_TRUSTED_FIRMWARE_M_PLATFORM="arm/mps2/an521"

  This is just a build test, it should be covered by the autobuilders.

  Instead, genrandconfig should be adapted to add this string.

  Regards,
  Arnout

> +        """
> +
> +    def test_run(self):
> +        pass
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
