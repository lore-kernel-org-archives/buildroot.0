Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07C5C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 20:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C89D813D9;
	Mon, 25 Mar 2024 20:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6i-4UJpRHeID; Mon, 25 Mar 2024 20:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 074AD812A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 074AD812A4;
	Mon, 25 Mar 2024 20:24:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD2A1BF3E3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18F6B40709
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yD4IUpxjNQ9z for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 20:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F09240706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F09240706
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F09240706
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 20:24:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4148c5de23fso3339625e9.1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 13:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711398251; x=1712003051;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+CDLYMB7kko7h4nn3ByEyeiuKONvn4o9QcYWpiXvGSc=;
 b=iyIonfaADwgNVDn99aiq5Vbml9CpXIEevPoR5nO78SUzBeXrIKXYVkshTo6lAn0RF2
 CLMnAOBlLGAwSW7d/YyuIRxEpPVyyRi0cek/ZTA0SzpWfQOu9MxRnxebqY6PX+39cl3Y
 K4TSWjB+BTQr2HwZTeqTwLnczp00zM5/LeSyAnXHxfDDXuqOEm5s1PPrgzQtA03g/xvT
 KuPNnaovuXfjMiud31GNsJKdfxJyrO/Z9T5LLAhn18cpJd054TV4AHMgrBGGBNH0ZLYN
 elIAT+otmV2N2bFX3wS48QCaWZ5KEUc28X83I8S0iV2zFGMzEvC+B/6NnzI7jqRl/xWb
 nQrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVETRNNUcnfu2DmTLCcaPFJbshGhWnb487H3eW0MddLPjVESYSxem0ogVAN2HpF9Jelajo5YfxR68Nr/tKV3XZPN6KnY+Kr1g==
X-Gm-Message-State: AOJu0YxYeQni/ZbHsIKtS2FALMvuNYVwF0ezD6TwCVB19yrwjaioa0mp
 gZn1jdydaZkLjJ5LEkVcrdBx33x+zJwvajTo329PZnwdJj69WFuf6JjkgVOA9WhWiPsPqlNPwaf
 V
X-Google-Smtp-Source: AGHT+IGcp0BqNF3SvxjMSEqhgj8nECyRUN1SJr/VAFP6DGdCz29x/caj62qgutZtUGCXIdbpqdNWBw==
X-Received: by 2002:a05:600c:4594:b0:412:c1d4:da7d with SMTP id
 r20-20020a05600c459400b00412c1d4da7dmr6154702wmo.33.1711398250676; 
 Mon, 25 Mar 2024 13:24:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o32-20020a05600c512000b004148a5e3188sm3298558wms.25.2024.03.25.13.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 13:24:10 -0700 (PDT)
Message-ID: <664b2e26-0c2a-4479-b883-65dde4f2dc73@mind.be>
Date: Mon, 25 Mar 2024 21:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711398251; x=1712003051; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+CDLYMB7kko7h4nn3ByEyeiuKONvn4o9QcYWpiXvGSc=;
 b=MyOzMcOC9bDn82A1reh1wb+BYZ53jMH5Aa/zlGqhqsE/FMyuxBE02jV3UVqK403wTp
 8TUDMl4atc8KwjR0uXAVRfdUff2MpnV94pwruUtEp2ZoH86Ml4PTSexA0xc1YnbO4Dfx
 s5OO2rmhaRrIq0c/Xjdbr37fW88SIYlzxHl6BgoUXr3vY57BcwYXqkv3V82jKjdGtu6a
 WPTBGjOOSzTENTV680x/m9EDtiRy8DhBA0sPf02Ph2fjEuqeuTr4hqZAEdSTWPLvMpUa
 OcYyVvZBQ5khybih9PpibmdnucserG9Udn7Mi1bHPkXGVj/ghp+7XKtH9bE9Q1rhBZFL
 Rscw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MyOzMcOC
Subject: Re: [Buildroot] [PATCH 01/13]
 package/flutter-packages/flutter-markdown-example: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam,

  I have some remarks/questions, but I haven't marked the series as Changes 
Requested because the answers could be "it's OK as it is".


On 24/03/2024 23:50, Adam Duskett wrote:
> The maintainers of the flutter-gallery package archived the project as of
> February 16, 2024, necessitating a new reference package for users to port
> their Flutter applications to Buildroot. The flutter-packages repository is
> the perfect candidate for a reference package for several reasons:
>    - It contains the source code for Flutter's first-party packages.
>    - Many of the packages contain examples.
>    - Many of the examples include Linux-specific examples.
>    - The repository is updated regularly and often automatically, ensuring
>      compatibility with the latest versions of Flutter.
> 
> However, the layout of the flutter-packages repository stores all of the
> examples in sub-directories, which creates an organizational problem; either
> every example application is stored in packages/flutter-example-${name}, with
> the version, site, site_method, license, license_files, and dependencies of
> each package independent from each other, or, each example application is in a
> sub-directory of the flutter-packages directory, and flutter-packages acts as
> the primary source of the above variables.

  A third option is to have a single Buildroot package, flutter-packages, with 
Config.in options to select which example(s) to build. A bit like util-linux. 
There's a good chance that you thought of that already but there's a reason not 
to go that way. But in case you haven't, I'll put a bit more ideas below about 
how it could be done.


> As option one is a nightmare to maintain, this patch provides option two,
> which only necessitates the use of two features rarely used together in
> Buildroot: $(PKG_NAME)_DL_SUBDIR and $(PKG_NAME)_SOURCE. With these two options
> appropriately set, each sub-package uses the flutter-packages source tarball,
> which downloads once, saving time, disk space, bandwidth, and future
> maintenance headaches.
> 
> Three variables in the .mk file help with subsequent patches that add more
> example applications:
>    - FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME:
>      - Set to the name of the application.
> 
>    - FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR:
>      - It uses the PKG_NAME variable to set the installation directory.
> 
>    - FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR:
>      - Provides the directory in which to build the package.
> 
> With the above variables, adding subsequent packages involves minimal effort:
>    - Copy, paste, and rename a sub-directory to a new package name.
>    - Set the above variables to new names and directories.
>    - Check to see if there are any new build commands, such as specifying a
>      dart_plugin_registrant.dart file.

  You could also avoid a lot of copy-pasting by putting some common things in 
flutter-package.mk, similar to how it's done in gcc.mk. The parts which need to 
be package-specific can be done by using $($(PKG)_PKG_NAME) etc.

  That said, I am not sure if it's worth spending time on building this common 
infrastructure, unless we expect a lot of changes that are common for all 
flutter-package examples.


> The first package in this series is a Markdown example application that
> displays several Markdown formatting demos. However, it does not support inline
> HTML. This package also lacks a dart_plugin_registrant file, and unlike the
> flutter-gallery package, the lines referencing such a file are not included in
> the build commands.

  I'm not sure what to make of these last two sentences... Is this good, is this 
bad?

  Otherwise though: excellent commit message with a great explanation of all the 
reasons why things are done in this particular way.


> Note: The version of the flutter-packages git hash is set to
> 947e34ce9fedcdd6750b54eb1cc74b854b49ab48, the last commit that supported
> Flutter 3.16.x. Newer versions require Flutter 3.19.x
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   DEVELOPERS                                    |  2 +
>   package/Config.in                             |  1 +
>   package/flutter-packages/Config.in            | 15 ++++++
>   .../flutter-markdown-example/Config.in        |  7 +++
>   .../flutter-markdown-example.hash             |  1 +
>   .../flutter-markdown-example.mk               | 54 +++++++++++++++++++
>   .../flutter-packages/flutter-packages.hash    |  3 ++
>   package/flutter-packages/flutter-packages.mk  | 18 +++++++

  I think it would have been good to split this into two commits, the first one 
with the common infra (and the excellent commit message), the second one for 
flutter-markdown-example. But this is really a minor point, it's not worth 
reworking the series just for that.

>   8 files changed, 101 insertions(+)
>   create mode 100644 package/flutter-packages/Config.in
>   create mode 100644 package/flutter-packages/flutter-markdown-example/Config.in
>   create mode 120000 package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
>   create mode 100644 package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
>   create mode 100644 package/flutter-packages/flutter-packages.hash
>   create mode 100644 package/flutter-packages/flutter-packages.mk

[snip]
> diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
> new file mode 100644
> index 0000000000..7cedf7c473
> --- /dev/null
> +++ b/package/flutter-packages/Config.in
> @@ -0,0 +1,15 @@
> +menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
> +	bool "flutter packages"
> +	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_FLUTTER_ENGINE

  I wonder if this shouldn't have been a select instead of a depends... It's 
like that already for flutter-gallery however so I guess there's a reason for it.

> +	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
> +	help
> +	  First-party Flutter package examples.
> +
> +if BR2_PACKAGE_FLUTTER_PACKAGES
> +source "package/flutter-packages/flutter-markdown-example/Config.in"
> +endif
> +
> +comment "flutter packages need flutter-engine"
> +	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +	depends on !BR2_PACKAGE_FLUTTER_ENGINE
> diff --git a/package/flutter-packages/flutter-markdown-example/Config.in b/package/flutter-packages/flutter-markdown-example/Config.in
> new file mode 100644
> index 0000000000..939b21053c
> --- /dev/null
> +++ b/package/flutter-packages/flutter-markdown-example/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_FLUTTER_MARKDOWN_EXAMPLE
> +	bool "flutter markdown example"
> +	help
> +	  A markdown renderer for Flutter. It supports the original
> +	  format, but no inline HTML.
> +
> +	  https://github.com/flutter/packages/tree/main/packages/flutter_markdown
> diff --git a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
> new file mode 120000
> index 0000000000..879f2adb39
> --- /dev/null
> +++ b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
> @@ -0,0 +1 @@
> +../flutter-packages.hash
> \ No newline at end of file
> diff --git a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
> new file mode 100644
> index 0000000000..d6ae87d8ef
> --- /dev/null
> +++ b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# flutter-markdown-example
> +#
> +################################################################################
> +
> +FLUTTER_MARKDOWN_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
> +FLUTTER_MARKDOWN_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
> +FLUTTER_MARKDOWN_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
> +FLUTTER_MARKDOWN_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
> +FLUTTER_MARKDOWN_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
> +FLUTTER_MARKDOWN_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
> +FLUTTER_MARKDOWN_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
> +FLUTTER_MARKDOWN_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
> +FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME = flutter_markdown_example
> +FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
> +FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR = $(@D)/packages/flutter_markdown/example

  If all the examples have the same pattern, we only really need the 
"flutter_markdown" part as distinguishing string. Perhaps we don't really need 
to _example suffix anway? So we could put:

FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME = flutter_markdown
FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR = 
$(TARGET_DIR)/usr/share/flutter/$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR = 
$(@D)/packages/$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/example

  Also, if we set FLUTTER_MARKDOWN_EXAMPLE_SUBDIR = flutter_markdown/example, we 
don't need to set FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR at all and instead we can 
use the standard FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR.


> +
> +define FLUTTER_MARKDOWN_EXAMPLE_CONFIGURE_CMDS
> +	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR) && \
> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \

  flutter-gallery has FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) here. 
That's no longer needed? (TBH I find it weird to see something like that for 
_clean_, but not for pub get and build bundle...)

> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle

  To put everything in a single flutter-packages package, you can do something 
like this:

ifeq ($(FLUTTER_PACKAGES_FLUTTER_MARKDOWN_EXAMPLE),y)
FLUTTER_PACKAGES_EXAMPLES += flutter_markdown
endif

...

define FLUTTER_MARKDOWN_EXAMPLE_CONFIGURE_CMDS
	set -e; for example in $FLUTTER_PACKAGES_EXAMPLES; do \
		(cd $(@D)/packages/$${example}/example; \
			$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean; \
			$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get; \
			$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle); \
	done
endef


And so on for the other CMDS.

> +endef
> +
> +define FLUTTER_MARKDOWN_EXAMPLE_BUILD_CMDS
> +	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR) && \
> +		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \

  Again, no FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) here?

> +			--native-assets $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/*/native_assets.yaml \
> +			package:$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/main.dart && \
> +		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
> +			--deterministic \
> +			--obfuscate \
> +			--snapshot_kind=app-aot-elf \
> +			--elf=libapp.so \
> +			.dart_tool/flutter_build/*/app.dill
> +endef
> +
> +define FLUTTER_MARKDOWN_EXAMPLE_INSTALL_TARGET_CMDS
> +	mkdir -p $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/{data,lib}
> +	cp -dprf $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR)/build/flutter_assets $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/
> +
> +	$(INSTALL) -D -m 0755 $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR)/libapp.so \
> +		$(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/lib/libapp.so
> +
> +	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
> +	$(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/

  Wouldn't it be better to use a relative symlink for this?

> +
> +	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/lib/
> +	$(RM) $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
> +	touch $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
> new file mode 100644
> index 0000000000..994434e25c
> --- /dev/null
> +++ b/package/flutter-packages/flutter-packages.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48-br1.tar.gz
> +sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
> diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
> new file mode 100644
> index 0000000000..426d49290b
> --- /dev/null
> +++ b/package/flutter-packages/flutter-packages.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# flutter-packages
> +#
> +################################################################################
> +
> +FLUTTER_PACKAGES_VERSION = 947e34ce9fedcdd6750b54eb1cc74b854b49ab48
> +FLUTTER_PACKAGES_SITE = https://github.com/flutter/packages.git
> +FLUTTER_PACKAGES_SITE_METHOD = git

  Why git download rather than $(call github,...)?


  Regards,
  Arnout


> +FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
> +FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
> +FLUTTER_PACKAGES_DL_SUBDIR = flutter-packages
> +FLUTTER_PACKAGES_SOURCE = flutter-packages-$(FLUTTER_PACKAGES_VERSION)-br1.tar.gz
> +FLUTTER_PACKAGES_DEPENDENCIES = \
> +	host-flutter-sdk-bin \
> +	flutter-engine
> +
> +include $(sort $(wildcard package/flutter-packages/*/*.mk))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
