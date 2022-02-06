Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE28C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 19:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8918401D8;
	Sun,  6 Feb 2022 19:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjRBDOMW0wRg; Sun,  6 Feb 2022 19:17:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DE5F40201;
	Sun,  6 Feb 2022 19:17:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2B81BF384
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A268402AC
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yp3OVfEyBE7N for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 19:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B97E4401EF
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 19:17:40 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id h7so36032231ejf.1
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 11:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pBWuq2GIGSWxsTpmbqb2XL48EL4PMdsxv1xQf3ProL8=;
 b=Ecbi7lv0cfbMlPgUVsBKyd63SyRhDUq7Ybg5Xf8c/sBR3tmXGlC3dZo77owetmxKdt
 OkRnxS5JJvztDdQg9GTpya4URS0hJ+Krn8k0VjPxcD4soULN/LjXSK9w3cZLNLNouEUX
 d6+sXAjbWAyy+XPPr40okRo9kwNXETQbOOvBF+9s+FJvQXlV28Aq+oKF8Bl21gSp7egZ
 py+yI2mxzwdaNiXwgcKzFHi8Oqbro5uvRD9lavgSI5awf2FIKG/h04kIJauYArZHoHPh
 whh1XXuvHg5c/BIovWc6E3vbOt3OcBo0IDGFovGGS8En2TTE4M1WP/gddQnLWlWYMlOz
 aGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pBWuq2GIGSWxsTpmbqb2XL48EL4PMdsxv1xQf3ProL8=;
 b=xzwvNKLvhmge6Syb2KG4nxnGcSxYyQL3IYFtw0w5HxR62OQ6BuXwhPG18QSPp7WDhJ
 fF62Nbtj7V7PTHFZT9boNpy6JRQ77zx8nIsOBKYqmoJtUfwwCj5f/OzU6s+nLuWqAhSt
 NXyVUQ7GEem+IkrAT2YaFWQ0/DkpMtOpTkUv17GaYxK636sbsMsGG+MxIUfflxNY44KO
 jaW1ntxRFi1+WoTAhjKUJybfr2IHOKAE8mFCbDynZT9fYmoshXNeGsjMlJqpuzyrZ58U
 UiMU9J9cACV53SOeyWvN6JqSIrvSSme58l3GvMhKNmCNu8J/Di+mguCErT78TbAXsnK2
 O9ow==
X-Gm-Message-State: AOAM533bj/SBfmKfOaMyz+B1O5lMj1fD2KA7Qm4w8Cm4LK9+pRPyoabW
 Az7ya/Blyk049L8bxxMfDSkewWSbpMUR1Q==
X-Google-Smtp-Source: ABdhPJwsFDhOU5nyjQtK80eVfYPmd2F6d5zPQ9ZGl8irFnPGvYg/Ww6ykgfpQtsI+5uXpmGr/kqZEw==
X-Received: by 2002:a17:907:8a01:: with SMTP id
 sc1mr7171594ejc.739.1644175058954; 
 Sun, 06 Feb 2022 11:17:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cb18sm993713edb.25.2022.02.06.11.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 11:17:38 -0800 (PST)
Message-ID: <fb183026-865f-a560-45a9-43ab987067fb@mind.be>
Date: Sun, 6 Feb 2022 20:17:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Matt Weber <matthew.weber@rockwellcollins.com>, buildroot@buildroot.org
References: <20210413134139.13281-1-matthew.weber@rockwellcollins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210413134139.13281-1-matthew.weber@rockwellcollins.com>
Subject: Re: [Buildroot] [PATCH v2] package/ace: new package
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
Cc: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/04/2021 15:41, Matt Weber wrote:
> ACE is an open-source framework that provides many components and
> patterns for developing high-performance, distributed real-time
> and embedded systems. It provides powerful, yet efficient abstractions
> for sockets, demultiplexing loops, threads, synchronization primitives.
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>

  I made a few more small modification/simplifications, and applied ot master, 
thanks.

  Regards,
  Arnout

> ---
> Changes
> v1 -> v2:
> [Thomas P
>   - Added platform specific Makefile config file
>   - Made Config.in dependency style updates
>   - Made OpenSSL optional
>   - Used foreach loop in makefile
>   - Used common install command for target and staging
> ---
>   DEVELOPERS                      |  1 +
>   package/Config.in               |  1 +
>   package/ace/Config.in           | 12 +++++++
>   package/ace/ace.hash            |  3 ++
>   package/ace/ace.mk              | 63 +++++++++++++++++++++++++++++++++
>   package/ace/platform_macros.GNU | 14 ++++++++
>   6 files changed, 94 insertions(+)
>   create mode 100644 package/ace/Config.in
>   create mode 100644 package/ace/ace.hash
>   create mode 100644 package/ace/ace.mk
>   create mode 100644 package/ace/platform_macros.GNU
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 626bb393dd..6dac446c68 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1699,6 +1699,7 @@ F:	board/qemu/ppc64-e5500/
>   F:	configs/freescale_p*
>   F:	configs/freescale_t*
>   F:	configs/qemu_ppc64_e5500_defconfig
> +F:	package/ace/
>   F:	package/argp-standalone/
>   F:	package/aufs/
>   F:	package/aufs-util/
> diff --git a/package/Config.in b/package/Config.in
> index 01e6bc0bfa..9f9b22d6d4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1844,6 +1844,7 @@ menu "Networking"
>   endmenu
>   
>   menu "Other"
> +	source "package/ace/Config.in"
>   	source "package/appstream-glib/Config.in"
>   	source "package/apr/Config.in"
>   	source "package/apr-util/Config.in"
> diff --git a/package/ace/Config.in b/package/ace/Config.in
> new file mode 100644
> index 0000000000..226e34df32
> --- /dev/null
> +++ b/package/ace/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_ACE
> +	bool "ace"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  The ADAPTIVE Communication Environment (ACE(TM))
> +	  An OO Network Programming Toolkit in C++.
> +
> +	  http://www.dre.vanderbilt.edu/~schmidt/ACE.html
> +
> +comment "ACE needs a glibc toolchain, dynamic library"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
> diff --git a/package/ace/ace.hash b/package/ace/ace.hash
> new file mode 100644
> index 0000000000..92fd42e131
> --- /dev/null
> +++ b/package/ace/ace.hash
> @@ -0,0 +1,3 @@
> +# Locally Computed:
> +sha256  a28339750620c70cd29a8a7088a4bc6ebaf1ff7ba667498a0279ac97f0e32e01  ACE-7.0.1.tar.gz
> +sha256  687bf9d16119e0caf6fb5c18214928fd6ea0da10df91e906255b7613af8061d8  COPYING
> diff --git a/package/ace/ace.mk b/package/ace/ace.mk
> new file mode 100644
> index 0000000000..539e0cc6c4
> --- /dev/null
> +++ b/package/ace/ace.mk
> @@ -0,0 +1,63 @@
> +################################################################################
> +#
> +# ace
> +#
> +################################################################################
> +
> +ACE_VERSION = 7.0.1
> +ACE_SOURCE = ACE-$(ACE_VERSION).tar.gz
> +ACE_SITE = http://download.dre.vanderbilt.edu/previous_versions
> +ACE_LICENSE = DOC
> +ACE_LICENSE_FILES = COPYING
> +ACE_INSTALL_STAGING = YES
> +ACE_CPE_ID_VENDOR = vanderbilt
> +ACE_CPE_ID_PRODUCT = adaptive_communication_environment
> +
> +# Note: We are excluding examples, apps and tests
> +# Only compiling ACE libraries (no TAO)
> +ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +ACE_LIBARIES += ace/SSL
> +ACE_DEPENDENCIES = openssl
> +ACE_SSL = "ssl = 1"
> +endif
> +
> +# configure the target build
> +# refer: http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#unix
> +define ACE_CONFIGURE_CMDS
> +	# create a config file
> +	echo ' #include "ace/config-linux.h" ' >> $(@D)/ace/config.h
> +
> +	# Create platform/compiler-specific Makefile configurations
> +	$(INSTALL) -m 0644 package/ace/platform_macros.GNU $(@D)/include/makeinclude/
> +	# Enable ssl if OpenSSL is configured
> +	[ ! -z $(ACE_SSL) ] && \
> +	echo $(ACE_SSL) >> $(@D)/include/makeinclude/platform_macros.GNU || \
> +	echo 'ace/SSL skipped'
> +endef
> +
> +# compile ace,ACEXML, Kokyu, netsvcs & protocols/ace
> +define ACE_BUILD_CMDS
> +	$(foreach lib,$(ACE_LIBARIES), \
> +		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" all
> +	)
> +endef
> +
> +define  ACE_LIBARIES_INSTALL
> +	# create below folder required by ACE makefiles during install
> +	mkdir -p $(1)/usr/share/ace
> +	$(foreach lib,$(ACE_LIBARIES), \
> +		$(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" DESTDIR=$(1) install
> +	)
> +endef
> +
> +define  ACE_INSTALL_TARGET_CMDS
> +	$(call ACE_LIBARIES_INSTALL,$(TARGET_DIR))
> +endef
> +
> +define  ACE_INSTALL_STAGING_CMDS
> +	$(call ACE_LIBARIES_INSTALL,$(STAGING_DIR))
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/ace/platform_macros.GNU b/package/ace/platform_macros.GNU
> new file mode 100644
> index 0000000000..ab5ec25a1b
> --- /dev/null
> +++ b/package/ace/platform_macros.GNU
> @@ -0,0 +1,14 @@
> +# help: http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#unix
> +
> +# create a platform macros file
> +include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU
> +
> +# disable RPATH
> +install_rpath = 0
> +
> +# set the installation prefix
> +INSTALL_PREFIX = /usr
> +
> +# fix link error with ARM EABI tools
> +# http://list.isis.vanderbilt.edu/pipermail/ace-users/2008-January/002742.html
> +no_hidden_visibility = 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
