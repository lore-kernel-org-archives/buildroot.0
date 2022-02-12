Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32528C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27AC606BF;
	Sat, 12 Feb 2022 13:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhMYtZvIDaRI; Sat, 12 Feb 2022 13:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2B4607B4;
	Sat, 12 Feb 2022 13:25:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA3A1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2725E414C6
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eEVXUwt2aJP for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:25:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3F4641484
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:25:27 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id cf2so20270850edb.9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EU2TE4/IDuv49iHSWeC5qCWBnv1D3wyseYctTdRsfPg=;
 b=h+eJgVcCuDV6j4ClaS7lqpKkncRUmPHJ8/yRxN4gJJOvysheftJpF9odOaRSsRloJn
 X7Vi6V1WJdYJY8/ZEdZTfH/5HIOC6a4MVj2coqgFnJYw5gb+9ccHYX/mUQLNz6ihQuSK
 mw/IRObYQz1HeD1+46FrF4WQB2VNoMZabdhiiKhOHk6x3ftSgKfz9mX7or6FHjz7tn0y
 lAQ8DI9VuoS2WnmHyM6LeHuvXPCAi6E2uwtqrejiwlzay9+ULNE7wWnSgEs8luiWhU3U
 ZAw5SF0TOkmZ1jJF1Avhex/0PfsoJQYTzglh+56DLLbNgeLFKq2CWPd/OArMT8e0ss0d
 8D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EU2TE4/IDuv49iHSWeC5qCWBnv1D3wyseYctTdRsfPg=;
 b=auCfBm180WvVEgNdZXkLtqbf6F6rOxV07d+Mb1fXs1AN1OXa2BEgtfdWRrIk/Cp1Hx
 QzQQnn2IwlJCPIRsEdsP1VJjHx/LouEASE8pOlp6/t1mwHGjdsXKwzxZHTDiMwQrxMk0
 Phye4ErnjY0oOs51jSGGXViuNMzw7gWVU0dRhAjRNUH0yNGBu4/9M+D0Cq8umIIj3Po2
 I5PbhFOkHNpfIOdCju/8OJiQ5Z9tH5q1bzZ2KthWVJkq4QH6q26PDCO5JD69b4WKrvJc
 1Zi+Too3wwOBF5Cmjw21hljqpCM8C6/iaoeCgG5oy/tOxrFWRaMxPjgmU9443qCO8A2M
 EfMQ==
X-Gm-Message-State: AOAM532xTaGaS3MyU4iSzZsq8Btk++IDxOE0+9UQuBLpSfX0bnWPYPYV
 RMAholPVqhBKTJlWbXrKKRPPLw==
X-Google-Smtp-Source: ABdhPJxPXgRly+3KTCmm8Oc+H6Ba0Vf9gObP73S9w2Py+erTl66ZkoKfrMVpWRkvFTLav+dfF/jLpw==
X-Received: by 2002:a05:6402:7ce:: with SMTP id
 u14mr1414027edy.176.1644672325985; 
 Sat, 12 Feb 2022 05:25:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v20sm1055674edc.78.2022.02.12.05.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:25:25 -0800 (PST)
Message-ID: <08b9ef7c-8ce6-3216-3f56-5c64af2f4a66@mind.be>
Date: Sat, 12 Feb 2022 14:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220131185154.26343-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131185154.26343-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 19:51, James Hilliard wrote:
> Move the target bpftool build out of linux-tools so that it is
> up to date.
> 
> This also fixes build issues due to differences between kernel
> versions. The latest version should be fully backwards compatible.

  I don't understand this: linux-tools is part of the kernel build itself, so 
there shouldn't be any differences between kernel versions... Anyway, you 
probably experienced it so I kept the comment.

> 
> The host bpftool is needed for enabling features such as the systemd
> bpf-framework(to be added in a future patch).

  Normally we only accept host packages if there's a (target) package that 
actually depends on it. Knowing you however we're not going to have to wait long 
for this systemd bpf framework, so I kept the host package.


> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v3 -> v4:
>    - remove linux-tools bpftool kconfig entry

  Ideally this should have been done in a separate patch, but OK.

> Changes v2 -> v3:
>    - fix target install
> Changes v1 -> v2:
>    - move target bpftool out of linux-tools into stand-alone build
> ---
>   Config.in.legacy                             |  8 ++++
>   DEVELOPERS                                   |  1 +
>   package/Config.in                            |  1 +
>   package/bpftool/Config.in                    | 18 ++++++++
>   package/bpftool/bpftool.hash                 |  5 +++
>   package/bpftool/bpftool.mk                   | 45 ++++++++++++++++++++
>   package/linux-tools/Config.in                | 22 ----------
>   package/linux-tools/linux-tool-bpftool.mk.in | 37 ----------------
>   8 files changed, 78 insertions(+), 59 deletions(-)
>   create mode 100644 package/bpftool/Config.in
>   create mode 100644 package/bpftool/bpftool.hash
>   create mode 100644 package/bpftool/bpftool.mk
>   delete mode 100644 package/linux-tools/linux-tool-bpftool.mk.in
> 

[snip]
> diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
> new file mode 100644
> index 0000000000..4276f91958
> --- /dev/null
> +++ b/package/bpftool/bpftool.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# bpftool
> +#
> +################################################################################
> +
> +BPFTOOL_VERSION = a7f0e7f057283ae8af3de4578bcb8b7ee80b7144
> +BPFTOOL_SITE = https://github.com/libbpf/bpftool
> +BPFTOOL_SITE_METHOD = git
> +BPFTOOL_GIT_SUBMODULES = YES

  This is purely for the libbpf submodule. We normally prefer to unbundle such 
dependencies, since we have libbpf as a package. I've kept it for now, but if 
you could unbundle it, that would be great.

  I've added a line to the commit message to explain why the git download method 
is used.


  Applied to master, thanks.

  Regards,
  Arnout


> +BPFTOOL_LICENSE = GPL-2.0, BSD-2-Clause
> +BPFTOOL_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.GPL-2.0
> +BPFTOOL_DEPENDENCIES = binutils elfutils
> +HOST_BPFTOOL_DEPENDENCIES = host-elfutils host-pkgconf host-zlib
> +
> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +BPFTOOL_DEPENDENCIES += libcap
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +BPFTOOL_DEPENDENCIES += zlib
> +endif
> +
> +define BPFTOOL_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> +		-C $(@D)/src
> +endef
> +
> +define HOST_BPFTOOL_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> +		-C $(@D)/src
> +endef
> +
> +define BPFTOOL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> +		-C $(@D)/src install DESTDIR="$(TARGET_DIR)" prefix=/usr
> +endef
> +
> +define HOST_BPFTOOL_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> +		-C $(@D)/src install DESTDIR="$(HOST_DIR)" prefix=/usr
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 28641dccdd..f459b41762 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -5,28 +5,6 @@ menu "Linux Kernel Tools"
>   config BR2_PACKAGE_LINUX_TOOLS
>   	bool
>   
> -config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
> -	bool "bpftool"
> -	depends on !BR2_nios2 # binutils
> -	depends on BR2_USE_WCHAR # binutils, elfutils
> -	depends on !BR2_STATIC_LIBS # elfutils
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
> -	select BR2_PACKAGE_LINUX_TOOLS
> -	select BR2_PACKAGE_BINUTILS
> -	select BR2_PACKAGE_ELFUTILS
> -	help
> -	  bpftool is a tool for for inspection and simple manipulation
> -	  of eBPF programs and maps.
> -
> -	  These tools are available only from kernel version 4.15.
> -
> -comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
> -	depends on !BR2_nios2
> -	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> -		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> -
>   config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
>   	bool "cpupower"
>   	select BR2_PACKAGE_LINUX_TOOLS
> diff --git a/package/linux-tools/linux-tool-bpftool.mk.in b/package/linux-tools/linux-tool-bpftool.mk.in
> deleted file mode 100644
> index 0c4d3693a3..0000000000
> --- a/package/linux-tools/linux-tool-bpftool.mk.in
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -################################################################################
> -#
> -# bpftool
> -#
> -################################################################################
> -
> -LINUX_TOOLS += bpftool
> -
> -BPFTOOL_DEPENDENCIES = binutils elfutils
> -
> -ifeq ($(BR2_PACKAGE_LIBCAP),y)
> -BPFTOOL_DEPENDENCIES += libcap
> -endif
> -
> -ifeq ($(BR2_PACKAGE_ZLIB),y)
> -BPFTOOL_DEPENDENCIES += zlib
> -endif
> -
> -BPFTOOL_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
> -
> -define BPFTOOL_BUILD_CMDS
> -	$(Q)if ! grep install $(LINUX_DIR)/tools/bpf/bpftool/Makefile >/dev/null 2>&1 ; then \
> -		echo "Your kernel version is too old and does not have install section in the bpf tools." ; \
> -		echo "At least kernel 4.15 must be used." ; \
> -		exit 1 ; \
> -	fi
> -
> -	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
> -		$(BPFTOOL_MAKE_OPTS)
> -endef
> -
> -define BPFTOOL_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
> -		$(BPFTOOL_MAKE_OPTS) \
> -		DESTDIR=$(TARGET_DIR) \
> -		install
> -endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
