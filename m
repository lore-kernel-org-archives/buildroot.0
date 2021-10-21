Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B975C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:56:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E789611CE
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E789611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 242F640221;
	Thu, 21 Oct 2021 19:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csozCinxkLu8; Thu, 21 Oct 2021 19:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C913F402B7;
	Thu, 21 Oct 2021 19:56:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB1271BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1EE160F14
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1F7iVQ2JzQbO for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 19:56:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22C4E60731
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 19:56:37 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w14so5406528edv.11
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 12:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dc8T9h6pJp1U++fDsJrAmut24R0Z0F7J2r2G6VB+5j4=;
 b=R8U89q4MBM9JFB+sh94Yk7L1HZPsNfpW1gC67pz4pJ4iu71SC9gslS5d2tkyGvSZMc
 MeJmLANPDT8sOPkF72CD/x2HZZlf+P47wd94ctieOdipkS3ryaNedJB8jUX8Kv7DTzpr
 /d8/eaf87BlXt5g+GD5xWsACVXWcg7ilCtfmUSKqV7xNIZ3mUsOwsFnuIhX7aRNRjcAH
 or0BzHRRJMz504jT8UhByLlS7ffglmPz2yvugilPgPKcNTsP2ALcTdgmXr4WzIsyXVSi
 ngdqAS1vVfD71nDDO/Mm9H+gS3mKEcfIeX5Z/zT2cXoZjtjhgOIAdqCll8QH7QbG2oN1
 ekcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dc8T9h6pJp1U++fDsJrAmut24R0Z0F7J2r2G6VB+5j4=;
 b=fQjgDeBKU0S1B8Q6y9pd6ROqfZAgeisUmGROaknj5PhX1xq6Krmd0e11K0F7cB6xda
 09hF7siwRPQdRLBy1HWAcVJbgsRIHWG0Qd1mvsWixVJDKFvKa0GVGEi4PGwN/Rs92yje
 h5SGHLhIKwmhCtoLN8V1z2KG3yqA0stJADUMdIhyYifBUY7xjzV+v1RzI2xlVafzSbPW
 Y9R3yd/7yxEj53nAU4yoQu58OYkuZP2OA9ohInVcuQIkwDwlsgn4n/Dt9D4ZVkumlQUZ
 rk78nYrDW1W92T9XhtUkjyjKdBAb2ScAKfiwwuwLfUJyhVF4po2YlDiOvdsQ9Hmncvek
 bj7Q==
X-Gm-Message-State: AOAM532P/g5y4YTNCJRYr6dNbsNCmc2fPdqZtF3EOGQWMDnq6Q8uH4yw
 +vZjMlAGesBcW26NFynfWVfTSw==
X-Google-Smtp-Source: ABdhPJy1YwN+TVs78gjpCPYp5s3KSTAkaQ19UUZN5pGFrc5gg+KwbkobFcGxve6fl6KCHBOS7FqTDw==
X-Received: by 2002:a17:906:4ed9:: with SMTP id
 i25mr9803212ejv.228.1634846196185; 
 Thu, 21 Oct 2021 12:56:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f3sm3000648ejl.77.2021.10.21.12.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 12:56:35 -0700 (PDT)
Message-ID: <ebf59bbc-4735-13f4-60be-b2c410798711@mind.be>
Date: Thu, 21 Oct 2021 21:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211009002727.972605-1-aduskett@gmail.com>
 <20211009002727.972605-3-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211009002727.972605-3-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v4 2/2] package/nodejs: bump version to
 14.17.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam,

On 09/10/2021 02:27, Adam Duskett wrote:
> Changes include:
>    - Remove the dependency on Python2, as nodejs 14 supports Python 3.
>    - Remove --without-snapshot as it's no longer a supported config option.
>    - Remove /openssl to the shared-openssl-includes config option, as the build
>      system automatically appends /openssl to the includes path.
> 
>    - Add a qemu wrapper. V8's JIT infrastructure requires binaries such as
>      mksnapshot and mkpeephole to be run in the host during the build.
>      However, these binaries must have the same bit-width as the target
>      (e.g. a x86_64 host targeting ARMv6 needs to produce a 32-bit binary).
>      To work around this issue, cross-compile the binaries for the target and
>      run them on the host with QEMU, much like gobject-introspection.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>


  Applied to master, thanks.

  However, I have to do a few fixes, and have some ideas for further 
improvements, see below.

> ---
> Changes v3 -> v4:
>    - Fill out package/nodejs/0001-add-qemu-wrapper-support.patch (Thomas)
> 
>   .../0001-add-qemu-wrapper-support.patch       | 88 +++++++++++++++++++
>   package/nodejs/Config.in                      | 15 +++-
>   package/nodejs/nodejs.hash                    |  6 +-
>   package/nodejs/nodejs.mk                      | 78 +++++++++-------
>   package/nodejs/v8-qemu-wrapper.in             | 12 +++
>   5 files changed, 158 insertions(+), 41 deletions(-)
>   create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
>   create mode 100644 package/nodejs/v8-qemu-wrapper.in
> 
> diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/0001-add-qemu-wrapper-support.patch
> new file mode 100644
> index 0000000000..1368ca5a38
> --- /dev/null
> +++ b/package/nodejs/0001-add-qemu-wrapper-support.patch
> @@ -0,0 +1,88 @@
> +From fa09fa3ad6a21ae0b35fb860f76d1762e5f29972 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 27 Sep 2021 12:55:09 -0700
> +Subject: [PATCH] add qemu-wrapper support
> +
> +V8's JIT infrastructure requires binaries such as mksnapshot and mkpeephole to
> +be run in the host during the build. However, these binaries must have the
> +same bit-width as the target (e.g. a x86_64 host targeting ARMv6 needs to
> +produce a 32-bit binary). To work around this issue, cross-compile the
> +binaries for the target and run them on the host with QEMU, much like
> +gobject-introspection.
> +
> +However, for the host-variant we do not want to use a
> +qemu-wrapper, so add @MAYBE_WRAPPER@ to the needed files and sed the path to
> +the qemu-wrapper on target builds, and remove @MAYBE_WRAPPER@ entirely on
> +host-builds.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Meh meh meh, a non-upstreamable patch, I hate it...

  Ideally it should be possible to make this a configure-time variable. That 
said, I completely understand that you're a bit hesitant to dive into the 
frankenbuildsystem that is used here.

[snip]
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index ba3fde887d..7c48f4b6fe 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -4,28 +4,35 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
>   	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
>   	default y if BR2_mipsel && !BR2_MIPS_SOFT_FLOAT
>   	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
> +	default y if BR2_s390x

  This wasn't mentioned in the commit message.

  More importantly, though: qemu doesn't allow s390x, so this can't work. 
Therefore, I removed it.


>   	# libuv
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>   
> -comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.9, wchar"
> +comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar"
>   	depends on BR2_USE_MMU
>   	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
>   	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR
> +		!BR2_HOST_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
>   
>   config BR2_PACKAGE_NODEJS
>   	bool "nodejs"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_HOST_GCC_AT_LEAST_7

  We normally put something like

	depends on BR2_HOST_GCC_AT_LEAST_7 # C++20

to explain where this dependency comes from. Since I have no idea where it 
actually comes from, I haven't added anything.


> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
>   	depends on BR2_USE_WCHAR
>   	# uses fork()
>   	depends on BR2_USE_MMU
>   	# uses dlopen(). On ARMv5, we could technically support static
>   	# linking, but that's too much of a corner case to support it.
>   	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_HOST_PYTHON3
> +	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
> +	select BR2_PACKAGE_HOST_PYTHON3_SSL
> +	select BR2_PACKAGE_HOST_QEMU
> +	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
>   	select BR2_PACKAGE_C_ARES
>   	select BR2_PACKAGE_LIBUV
>   	select BR2_PACKAGE_ZLIB
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 8d39ef489d..098049c021 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v12.22.6/SHASUMS256.txt
> -sha256  c2022f16b8f689620c3472c2b5261fdabbd0ab976bf9ac3b7db6747a2e9b0f7a  node-v12.22.6.tar.xz
> +# From https://nodejs.org/dist/v14.17.6/SHASUMS256.txt
> +sha256  f458cd0b1cb1540611cb08709d833c0c59c74da79310ae1984cc8bad1404ad5e  node-v14.17.6.tar.xz
>   
>   # Hash for license file
> -sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
> +sha256  4c3016fb267bc473af18b305068f7f2d206ccd5ab98297ec593e1c32d73ad4fc  LICENSE

  You forgot to explain why the hash changes.

       - License file changes:
         - Removed deps/http_parser (MIT)
         - Removed deps/node-inspect (MIT)
         - Updated some URLs and license years
         Since the removed parts are MIT like NodeJS itself, the license info
         doesn't change.

[snip]
> -	$(foreach f,$(NODEJS_HOST_TOOLS_V8), \
> -		$(SED) "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)$(f)<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/$(f)#" \
> -			$(@D)/tools/v8_gypfiles/v8.gyp
> -	)
> -	$(foreach f,$(NODEJS_HOST_TOOLS_NODE), \
> -		$(SED) "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)$(f)<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/$(f)#" \
> -			-i $(@D)/node.gyp
> -	)

  I think the only reason that those tools were installed in HOST_DIR was 
because they were called like this.

  Since they now use qemu, I don't think they need to be installed any more. 
Thus, the NODEJS_HOST_TOOLS* variables are no longer needed.

  And with that, I think the entire dependency of nodejs on host-nodejs can be 
removed. We only need host-nodejs if npm is needed at build time, i.e. if 
NODEJS_MODULES_LIST is non-empty.

  Of course, I couldn't be bother to test all of the above, so I left it as is.


>   endef
>   
>   define NODEJS_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
> +	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
>   		$(MAKE) -C $(@D) \
>   		$(TARGET_CONFIGURE_OPTS) \
>   		NO_LOAD=cctest.target.mk \
> @@ -223,7 +233,7 @@ endef
>   endif
>   
>   define NODEJS_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
> +	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
>   		$(MAKE) -C $(@D) install \
>   		DESTDIR=$(STAGING_DIR) \
>   		$(TARGET_CONFIGURE_OPTS) \
> @@ -234,7 +244,7 @@ define NODEJS_INSTALL_STAGING_CMDS
>   endef
>   
>   define NODEJS_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
> +	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
>   		$(MAKE) -C $(@D) install \
>   		DESTDIR=$(TARGET_DIR) \
>   		$(TARGET_CONFIGURE_OPTS) \
> diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
> new file mode 100644
> index 0000000000..6ba6639d78
> --- /dev/null
> +++ b/package/nodejs/v8-qemu-wrapper.in
> @@ -0,0 +1,12 @@
> +#!/usr/bin/env sh
> +
> +# Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
> +# is older than the target kernel.
> +@QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
> +    @QEMU_USERMODE_ARGS@ \
> +   -L "${STAGING_DIR}/" \
> +    "$@"
> +
> +if [ $? -ne 0 ]; then
> +    exit 1
> +fi

  This is completely redundant - the exit code of the script is the last 
command's exit code. So just leave the qemu call at the end.

  I removed the condition, and also put an exec in front of the qemu call so the 
shell goes away completely.

  I'm thinking, though: we're probably going to have more of these things that 
require qemu during the build. At least qt5webengine is going to need it as 
well. Also, the wrapper script is completely independent of nodejs. So perhaps 
it would be possible to move this wrapper script to package/qemu? There is 
probably some implication of PPD that I don't see now though.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
