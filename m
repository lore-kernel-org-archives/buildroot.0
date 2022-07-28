Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C778C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B3260EFF;
	Thu, 28 Jul 2022 07:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4B3260EFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDxII0KQd3Fd; Thu, 28 Jul 2022 07:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 928A560AFB;
	Thu, 28 Jul 2022 07:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 928A560AFB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDF4E1BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C55054174E
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C55054174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6OqWtxBLAhr for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:44:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DC034174B
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DC034174B
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:44:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bn9so1082932wrb.9
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 00:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6epNgKit2rbZglU53RPvmUOzqqKwRYr2QAFg+zhlRv0=;
 b=LV4zsQdA7WH38dtDFw0xwj2VZftbOXYEFYWaIwCvrYPDyB8nrRA+1kOirrD974k6PX
 bjkApmquPJiO259TT8f2Hc4FSZiR26GgSzi170DyRjnwzA8cJd0+PLiMKPiGdj5gDJWn
 iK6w7wGuL+2bzICAwE2pE+pNYYMYG0Sl/Zr8/u98mtDQJ/p9HWrqKv9TpKFAcnXeoSY6
 n3FUTf3PPdlJoVD4akzFYZBr5EAbb5GSY2MkZd5lspMK8R4Ws3S0YxCkr7uzmCSHuyac
 oTlTmV8ZawUMg44kJpXTzJQjV0UeVACp7fZ71JJLI8S1kdzgwiwfEKkFCCga3eM3k9DR
 6zvw==
X-Gm-Message-State: AJIora9PKGYvy5ed2TOShJ23j3rHd9cjckS4ueKg6Z9JbR0Y4q0DjXvx
 fhJcDIFDUG3L8wGBh+v0xELnkasykoQUOA==
X-Google-Smtp-Source: AGRyM1vUrCFmF7AHU7fR7XrZyXaFGNaqTGXRkXlGKCeoPxoHkAP7Hj4c/SQEF0ZK07dONqXP1WE92Q==
X-Received: by 2002:adf:a1d2:0:b0:21e:bc22:f550 with SMTP id
 v18-20020adfa1d2000000b0021ebc22f550mr6182270wrv.399.1658994284040; 
 Thu, 28 Jul 2022 00:44:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d67d2000000b0020fff0ea0a3sm109762wrw.116.2022.07.28.00.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 00:44:43 -0700 (PDT)
Message-ID: <7f657fd4-1a9e-d58b-a496-72b1bfaf780d@mind.be>
Date: Thu, 28 Jul 2022 09:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Tom Marcuzzi <tom.marcuzzi@orolia.com>, buildroot@buildroot.org
References: <20220119140703.12978-1-tom.marcuzzi@orolia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220119140703.12978-1-tom.marcuzzi@orolia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6epNgKit2rbZglU53RPvmUOzqqKwRYr2QAFg+zhlRv0=;
 b=Bx16vhvCQFx6I0c6PQUbaOO48EKRGlHLk+wwosAPthJ/JFbTG/xEsQQ5pPihaBUfN+
 MdSZG4cUiOJ1qee0NXpMjqjpYe8EQmEog3idvbAYBiLI0EF2mlNRugxae4LZJs3rApAA
 8ASux2Ew7n3JIRyaJr06TwLKyxfz3i4NRaSjdFW3+oTIvR1JqtSUTmzmk+bIO47U3ywk
 QidKZ96bbeYeriAuEUIwr7R97+cCpSdkIMFjEC3jQni9gdVFoPx4DiXAb/DARqu5FdKA
 ENEm4MylmoSImXfDUDGS38v+P53+gnB6Dc7s7a8LT+rpdyLNY7vKxZA1nZPqyN2qLZbd
 YHJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bx16vhvC
Subject: Re: [Buildroot] [PATCH 1/1] packages/nodejs: install npm packages
 on host
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Tom,

On 19/01/2022 15:07, Tom Marcuzzi wrote:
> Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
> ---
>   package/nodejs/Config.in.host | 32 ++++++++++++++++++++++++++++++++
>   package/nodejs/nodejs.mk      | 31 +++++++++++++++++++++++++++++++
>   2 files changed, 63 insertions(+)
> 
> diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
> index 4ceaf0c73e..601eb6e052 100644
> --- a/package/nodejs/Config.in.host
> +++ b/package/nodejs/Config.in.host
> @@ -16,3 +16,35 @@ config BR2_PACKAGE_HOST_NODEJS
>   comment "host nodejs needs a host gcc >= 8"
>   	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>   	depends on !BR2_HOST_GCC_AT_LEAST_8
> +
> +if BR2_PACKAGE_HOST_NODEJS
> +
> +	config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL
> +		string "Additional modules"
> +		help
> +		  List of space-separated nodejs modules to install via npm.
> +		  See https://npmjs.org/ to find modules and 'npm help install'
> +		  for available installation methods. For repeatable builds,
> +		  download and save tgz files or clone git repos for the
> +		  components you care about.
> +
> +		  Example:
> +		  serialport uglify-js@1.3.4 /my/module/mymodule.tgz \
> +		  	git://github.com/someuser/somemodule.git#v1.2
> +
> +		  This would install the serialport module (at the newest
> +		  version), the uglify-js module at 1.3.4, a module from a
> +		  filesystem path, and a module from a git repository.
> +
> +	config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS
> +		string "Additional module dependencies"
> +		help
> +		  List of space-separated buildroot recipes which must be
> +		  built before your npms can be installed. For example, if in
> +		  'Additional modules' you specified 'node-curl' (see:
> +		  https://github.com/jiangmiao/node-curl), you could then
> +		  specify 'libcurl' here, to ensure that buildroot builds the
> +		  libcurl package, and does so before building your node
> +		  modules.
> +
> +endif

  After a bit of deliberation, we decided that the existing 
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL is in fact a bit of a mistake. It is was 
introduced back then because we thought that you would typically want to install 
hundreds of npm packages on your system, and we wouldn't want to have buildroot 
packages for all of them.

  However, in reality, this is not the case. What happens in reality is that you 
have just one, maximum a few nodejs applications, and their packages.json pulls 
in the 100s of dependencies.

  Also, what we've learned from cargo and go, is that we can apply the vendoring 
to the package itself (or rather, the language infrastructure already does that) 
and we don't need to create all those packages as buildroot packages.

  In conclusion, the proper way going forward is to create a host-webpack 
package using the generic-package infrastructure. It should be implemented as 
follows:

- use the existing download infrastructure to download the source (from github, 
not from npm);

- in the build step, call "npm build" to download all the dependencies and 
create the bundle;

- in the install step, either call "npm install" or (probably easier) manually 
install things to $(HOST_DIR).


  Of course, it is wrong to download things in the build step, but that's anyway 
what happens with BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL, and it's also what used 
to happen with cargo and go before we implemented the vendoring. Once we have a 
(or a few) example npm packages, we can look into implementing vendoring for npm 
as well.


  Also, once we have a few npm packages, we could consider adding npm-package 
infra to make this easier. I'm not sure if we're going to get there, however, 
because usually I think people will use their own npm applications which are 
kept in an external, and there aren't that many applications that would ever be 
packaged in buildroot itself. NodeRED is one, I guess.


  Anyway, I realize that we're asking you to do more work. Do you think you 
could make a package for host-webpack?


  Regards,
  Arnout



> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 727af6dc50..a342d1c90f 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -96,6 +96,35 @@ NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
>   
>   HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
>   
> +#
> +# Build the list of modules to install on host.
> +#
> +HOST_NODEJS_MODULES_LIST= $(call qstrip,\
> +	$(BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL))
> +
> +# Define NPM for other packages to use
> +HOST_NPM = $(HOST_CONFIGURE_OPTS) \
> +	LDFLAGS="$(HOST_LDFLAGS)" \
> +	LD="$(HOST_CXX)" \
> +	npm_config_arch=$(NODEJS_CPU) \
> +	npm_config_target_arch=$(NODEJS_CPU) \
> +	npm_config_build_from_source=true \
> +	npm_config_nodedir=$(HOST_DIR)/nodejs-$(NODEJS_VERSION) \
> +	npm_config_prefix=$(HOST_DIR)/usr \
> +	npm_config_cache=$(HOST_DIR)/.npm-cache \
> +	$(HOST_DIR)/bin/npm
> +#
> +# We can only call NPM if there's something to install.
> +#
> +ifneq ($(HOST_NODEJS_MODULES_LIST),)
> +define HOST_NODEJS_INSTALL_MODULES
> +	# If you're having trouble with module installation, adding -d to the
> +	# npm install call below and setting npm_config_rollback=false can both
> +	# help in diagnosing the problem.
> +	$(HOST_NPM) install -g $(HOST_NODEJS_MODULES_LIST)
> +endef
> +endif
> +
>   define HOST_NODEJS_BUILD_CMDS
>   	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
>   		$(MAKE) -C $(@D) \
> @@ -110,6 +139,8 @@ define HOST_NODEJS_INSTALL_CMDS
>   	$(foreach f,$(NODEJS_HOST_TOOLS), \
>   		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
>   	)
> +
> +	$(HOST_NODEJS_INSTALL_MODULES)
>   endef
>   
>   ifeq ($(BR2_i386),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
