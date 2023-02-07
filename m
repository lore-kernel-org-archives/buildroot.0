Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D034C636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC03409EA;
	Tue,  7 Feb 2023 16:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC03409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewosEwa5iBay; Tue,  7 Feb 2023 16:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E218409EB;
	Tue,  7 Feb 2023 16:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E218409EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1894C1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E533360FFC
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E533360FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flfKWTXdgL9Q for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:41:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A371560FCD
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A371560FCD
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:41:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so11968962wms.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 08:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DYlSlZSDKsjJg1tllUKwDXJmQCzQcm8/rUf1gT1olc0=;
 b=29uYjQkZLq3Z5deFNEs15epZ7ZAN/+85qASJeUerVf2h7ChUbzhg40jHA7BrGm0Rg8
 wBOH6DY6d4U79K9U7XXLUej9LKUZQSnJLTtFJuv0Qq95Br8DqE4xzFvXKSKJ1wLPaU/o
 UFtCcDZrHLSEIdsE5LkKYBNJagk85FxoYTdyaf/SiJCUddUlY+gv6mtMCnQ8n4aOsX9F
 NII17YxUpvzFMbHJNk/kg9tABMJJTePNlF+G8lE5Fj48dIWFBQLExIdYkhWUkIMEgWgf
 myBEoQq/uvXxsOnOb7A2MA8EpeZtA4IVXBt5a3l3BlQ5mVxwelYRAzm+wiQnMB1IM/lp
 nS9A==
X-Gm-Message-State: AO0yUKXkQapGHLT1Dv1BQ7MQ0qDZ8UCpgMZIqNTWh5pHE4freMhEzIiw
 myDG7PmbUjDrxhDeP1zL+sB3xA==
X-Google-Smtp-Source: AK7set/8TYYUM0QyeyhsvbiTTwy0/5RMN8oDZ1uSI6x7/qisxjBLnrNGDovL33C+ragcQnTCpj5Xuw==
X-Received: by 2002:a05:600c:4d90:b0:3de:1d31:1042 with SMTP id
 v16-20020a05600c4d9000b003de1d311042mr4568714wmp.23.1675788107748; 
 Tue, 07 Feb 2023 08:41:47 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c451100b003e01493b136sm3234289wmo.43.2023.02.07.08.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 08:41:47 -0800 (PST)
Message-ID: <6490dfd6-5f3b-3801-6955-7fa655f2a82b@mind.be>
Date: Tue, 7 Feb 2023 17:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20230115114840.9027-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230115114840.9027-1-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DYlSlZSDKsjJg1tllUKwDXJmQCzQcm8/rUf1gT1olc0=;
 b=Af6XQYTLtujyyPNgfsl0drTnJWH2ECFR1h9/nVP1orWxNg5/Xbkl6gvTN8HE7Gl20q
 Sa5Gu4DgqKjmWj9d/y8oxXu9dQYT+UAnIvjWd8eU1aJBeiYTrXvmtF8FCTbWFBt7v2xr
 4rzC6v0EEOTPqHUzc20lYKj8H6WOQmVADQ61EgElRfBeMoXabloUhaHyP5kEjyzDxdF6
 Jm7xk7HCixhfvF3/FFXeT0iSwDHqaLulypliVffK1tmixez3wqGMUzlaWG5Hx6qxbsiE
 nk2UeX6r7qh2UzKDJzeU1uLcmO+ZJti89pR5zZG6V8QLAG7cgYgJhnqEsKLIruXTVKtA
 dxHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Af6XQYTL
Subject: Re: [Buildroot] [PATCH v8 1/4] package/systemd: bump to version
 252.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2023 12:48, Norbert Lange wrote:
> Following files changed *license* from CC0-1.0 to MIT-0:
> 
> -   src/systemctl/systemd-sysv-install.SKELETON
> -   config files
> -   examples under /network
> 
> The file LICENSES/MIT-0.txt has been added for this reason,
> hashes added, corrected for LICENSES/README.md.
> 
> Kernel version 3.15 is now the bare minimum, but only
> version 4.15 and higher are fully supported and tested:
> 
> -   bump kernel header dependencies
> -   correct kconfig description
> -   improvements to make the kconfig description better reflect
>      the information from the README
> 
> Remove upstreamed patch.

  This is not actually done in this v8, probably left over from some earlier 
version.

> 
> Set new options to their default, remove -Defi-cc option.
> 
> Set -Ddbus=false to ensure dbus dependency is runtime only.
> 
> Set -Ddbus-interfaces-dir=no as interface XML file generation is
> not supported when cross compiling.

  I guess we could set this to yes for host-systemd, then copy the XML files to 
target. But they probably depend to some extent on the configuration, and it 
adds a lot to build time, and I doubt it is very useful to begin with...

> 
> Set -Ddefault-user-shell=/bin/sh to the always available shell.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> Reviewed-by: James Hilliard <james.hilliard1@gmail.com>

[snip]
> ---
> 
> License diff for illustration
> 
> --- systemd-stable-250.4/LICENSES/README.md
> +++ systemd-stable-252.1/LICENSES/README.md
> @@ -45,9 +45,11 @@
>    * the following sources are licensed under the **CC0-1.0** license:
>      - src/basic/siphash24.c
>      - src/basic/siphash24.h
> -   - src/systemctl/systemd-sysv-install.SKELETON
>      - tools/check-includes.pl
> +  * the following sources are licensed under the **MIT-0** license:
>      - all examples under man/
> +   - src/systemctl/systemd-sysv-install.SKELETON
> +   - config files and examples under /network
>    * the following sources are under **Public Domain** (LicenseRef-murmurhash2-public-domain):
>      - src/basic/MurmurHash2.c
>      - src/basic/MurmurHash2.h

  Very nice that you include this! However, git-am (and patchwork) interpret 
this as a hunk of the overall patch, so it fails and I had to manually adapt. In 
the future, please prefix with a space or something to avoid that.

  Applied to master, thanks. (Not pushed yet, I may make more changes while 
reviewing the rest of the series.)

  Regards,
  Arnout

> 
> package/systemd: 252.4
> ---
>   package/systemd/Config.in    | 12 +++++++++---
>   package/systemd/systemd.hash |  5 +++--
>   package/systemd/systemd.mk   | 16 ++++++++++++++--
>   system/Config.in             |  6 +++---
>   4 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 45a9e2d644..f35305c0be 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>   	depends on !BR2_STATIC_LIBS # kmod
>   	depends on BR2_TOOLCHAIN_USES_GLIBC
>   	depends on BR2_TOOLCHAIN_HAS_SSP
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
>   	select BR2_PACKAGE_HAS_UDEV
> @@ -51,7 +51,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
>   	  an elaborate transactional dependency-based service control
>   	  logic.  It can work as a drop-in replacement for sysvinit.
>   
> -	  Systemd requires a Linux kernel >= 3.13 with the following
> +	  Kernel versions below 4.15 ("recommended baseline") have
> +	  significant gaps in functionality and are not recommended
> +	  for use with this version of systemd.
> +
> +	  Systemd requires a Linux kernel >= 3.15 with the following
>   	  options enabled:
>   
>   	  - CONFIG_DEVTMPFS
> @@ -66,9 +70,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
>   	  - CONFIG_PROC_FS
>   	  - CONFIG_FHANDLE (libudev, mount and bind mount handling)
>   
> -	  - CONFIG_NET_NS (needed by PrivateNetwork=, used in some
> +	  - CONFIG_NET_NS (Required for PrivateNetwork=, used in some
>   	    systemd units)
>   
> +	  - CONFIG_USER_NS (Required for PrivateUsers=)
> +
>   	  - CONFIG_AUTOFS_FS / CONFIG_AUTOFS4_FS
>   	  - CONFIG_TMPFS_POSIX_ACL
>   	  - CONFIG_TMPFS_XATTR
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 3b98566f32..00c08edcd9 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>   # sha256 locally computed
> -sha256  638a2fc78828765fc97bc73f428205b6dc1d359149b6c6bfe4d2a649cba2cca8  systemd-250.8.tar.gz
> +sha256  cf2d27e67663d599a045101c7178cf0ec63d9df2962a54adf7de0d0357724f00  systemd-252.4.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>   sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> @@ -8,7 +8,8 @@ sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENS
>   sha256  61778e80a2fd85955b626b29aa2bcf06144c714277bded65633e4a81479d9fb3  LICENSES/LGPL-2.0-or-later.txt
>   sha256  5bcef4fedbfc08776630e65d5d0d074dd31208037eddb167ca46a9ec4f737764  LICENSES/Linux-syscall-note.txt
>   sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENSES/lookup3-public-domain.txt
> +sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENSES/MIT-0.txt
>   sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
>   sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
>   sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
> -sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
> +sha256  da9b2c7b8cd10516fd2c4279b82496ea61787148f13e899c62fc8988c5fac34f  LICENSES/README.md
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b96873b73f..b0597f9bb4 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>   # - Diff sysusers.d with the previous version
>   # - Diff factory/etc/nsswitch.conf with the previous version
>   #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 250.8
> +SYSTEMD_VERSION = 252.4
>   SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>   SYSTEMD_LICENSE = \
>   	LGPL-2.1+, \
> @@ -29,6 +29,7 @@ SYSTEMD_LICENSE = \
>   	BSD-3-Clause (tools/chromiumos), \
>   	CC0-1.0 (few source files, see LICENSES/README.md), \
>   	GPL-2.0 with Linux-syscall-note (linux kernel headers), \
> +	MIT-0 (few source files, see LICENSES/README.md), \
>   	MIT (few source files, see LICENSES/README.md), \
>   	OFL-1.1 (Heebo fonts)
>   SYSTEMD_LICENSE_FILES = \
> @@ -40,6 +41,7 @@ SYSTEMD_LICENSE_FILES = \
>   	LICENSES/LGPL-2.0-or-later.txt \
>   	LICENSES/Linux-syscall-note.txt \
>   	LICENSES/lookup3-public-domain.txt \
> +	LICENSES/MIT-0.txt \
>   	LICENSES/MIT.txt \
>   	LICENSES/murmurhash2-public-domain.txt \
>   	LICENSES/OFL-1.1.txt \
> @@ -61,7 +63,13 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
>   SYSTEMD_PROVIDES = udev
>   
>   SYSTEMD_CONF_OPTS += \
> +	-Ddbus=false \
> +	-Ddbus-interfaces-dir=no \
> +	-Ddefault-compression='auto' \
>   	-Ddefault-hierarchy=unified \
> +	-Ddefault-locale='C.UTF-8' \
> +	-Ddefault-user-shell=/bin/sh \
> +	-Dfirst-boot-full-preset=false \
>   	-Didn=true \
>   	-Dima=false \
>   	-Dkexec-path=/usr/sbin/kexec \
> @@ -72,6 +80,7 @@ SYSTEMD_CONF_OPTS += \
>   	-Dman=false \
>   	-Dmount-path=/usr/bin/mount \
>   	-Dmode=release \
> +	-Dnspawn-locale='C.UTF-8' \
>   	-Dnss-systemd=true \
>   	-Dquotacheck-path=/usr/sbin/quotacheck \
>   	-Dquotaon-path=/usr/sbin/quotaon \
> @@ -82,6 +91,7 @@ SYSTEMD_CONF_OPTS += \
>   	-Dsulogin-path=/usr/sbin/sulogin \
>   	-Dsystem-gid-max=999 \
>   	-Dsystem-uid-max=999 \
> +	-Dsysupdate=false \
>   	-Dsysvinit-path= \
>   	-Dsysvrcnd-path= \
>   	-Dtelinit-path= \
> @@ -553,7 +563,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
>   SYSTEMD_CONF_OPTS += \
>   	-Defi=true \
>   	-Dgnu-efi=true \
> -	-Defi-cc=$(TARGET_CC) \
>   	-Defi-ld=bfd \
>   	-Defi-libdir=$(STAGING_DIR)/usr/lib \
>   	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
> @@ -793,6 +802,8 @@ HOST_SYSTEMD_CONF_OPTS = \
>   	-Dbinfmt=false \
>   	-Drepart=false \
>   	-Dcoredump=false \
> +	-Ddbus=false \
> +	-Ddbus-interfaces-dir=no \
>   	-Dpstore=false \
>   	-Doomd=false \
>   	-Dlogind=false \
> @@ -801,6 +812,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>   	-Dmachined=false \
>   	-Dportabled=false \
>   	-Dsysext=false \
> +	-Dsysupdate=false \
>   	-Duserdb=false \
>   	-Dhomed=false \
>   	-Dnetworkd=false \
> diff --git a/system/Config.in b/system/Config.in
> index 806a747315..232bdfe763 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -125,19 +125,19 @@ config BR2_INIT_SYSTEMD
>   	depends on BR2_TOOLCHAIN_USES_GLIBC
>   	depends on BR2_TOOLCHAIN_HAS_SSP
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	depends on BR2_HOST_GCC_AT_LEAST_5
>   	select BR2_ROOTFS_MERGED_USR
>   	select BR2_PACKAGE_SYSTEMD
>   	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
>   
> -comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and target gcc >= 5"
> +comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
>   	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
>   	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
>   		!BR2_TOOLCHAIN_HAS_SSP || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
>   		!BR2_HOST_GCC_AT_LEAST_5
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
