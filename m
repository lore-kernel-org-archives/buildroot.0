Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C3BC47DD9
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 20:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E7A61027;
	Fri, 22 Mar 2024 20:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xQQWbObtkon; Fri, 22 Mar 2024 20:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E1A36101E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1A36101E;
	Fri, 22 Mar 2024 20:47:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9742F1BF20F
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8412E831A0
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1un9RR2NT4ew for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 20:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E7E38215C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E7E38215C
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E7E38215C
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 20:47:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33e162b1b71so1894721f8f.1
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 13:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711140435; x=1711745235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F7W7H3G/3eJIxeknXge9Om1XrAET5eTHaea1zO5qle8=;
 b=OQaBVmu9tMaNLtMrCU2a5quRbj3NScAYPQR52fRwLJgRgMrkVuaRKXE3Oa+8j8EbEo
 ywclO0PS5gm9Wcare3sD/YZVmfoSHBNqgu/jQxyMWayj1KZho63Xh+zt0OJZVp/Zzb9J
 s5wkPqSl3Ueek+2AMVhl8HjfSBwcT4p9jLFhJFwwqmUGSXG9hNU/2aroTj6T1yOsfdUY
 TxdkPWRJ0Ceyc5x8b6aJT1nlsBF33IHLKJDAfic1Aqwbs2HBvxpt0TtwAnNqoH9Pg1xQ
 7V/SM24UXrdR6Ysa2JxRFi/KahoLkB2UwlcCZLH1cFCYJ6X43pi2iLx5Wq8eatZ6J+EY
 Gx6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQPdlaDtoRZ2DU58q+OgaZP0+r29ivrEo2rQ1syzv4MwIcLBlhe6wiqTk0ly+KdcJLNqrDv2o+47teU3NPe7JfVPlkrGqBnw==
X-Gm-Message-State: AOJu0Yz991TAbWJ5WjWWgMaqRWG1d9fyMpHvIX6e0MwwxrNpMcaSv1uT
 96n0VaLB1KkSGlSPYoIqzAG4rwCmddGPatiH5VDegWqCHAHTlr14Cz1NLbfA14o=
X-Google-Smtp-Source: AGHT+IEfDkIhD5a96LWW0CL8IHzfhmCl42Xks7nDN32oyUBmEU2yJxAeGw80VmZ77nS4JsLUP5mqcA==
X-Received: by 2002:adf:ef81:0:b0:33e:7750:781d with SMTP id
 d1-20020adfef81000000b0033e7750781dmr375811wro.56.1711140434710; 
 Fri, 22 Mar 2024 13:47:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b004130378fb77sm537568wmb.6.2024.03.22.13.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 13:47:13 -0700 (PDT)
Message-ID: <a5a18fd5-6c05-4231-a7b1-a6c1965919c8@mind.be>
Date: Fri, 22 Mar 2024 21:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Jarkko Sakkinen <jarkko@kernel.org>, buildroot@buildroot.org
References: <20240321182126.24115-1-jarkko@kernel.org>
 <20240321182126.24115-3-jarkko@kernel.org>
In-Reply-To: <20240321182126.24115-3-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711140435; x=1711745235; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F7W7H3G/3eJIxeknXge9Om1XrAET5eTHaea1zO5qle8=;
 b=Ly+a3wqx/N4Kxko+mnbD5AzAKOpUjx5ReWZqxOwyIVUkzB473SDO11b8vQzXAGoKF5
 rdRZxrS6kae2xa6crxxChD18y5S0JrxXu64PVuizlkW5bvwgT0ahEXFMZtVVXT64jZNi
 abN9d5IcArQVJVRvrl4gbr3rv4HtyXjzArk0nguUTTyML0Y6KArsCnRy8tkdcZ3Sicco
 4P5x0bZhPuqOiV2ZaLV4JkDVsSb44aDmVnUi6VZYr/ia7hFoEfDh+gzhNLJjV5wMk1yl
 vRsXTdyNHeHXRRkc8f4Ajl7MQLuCE6k6XYNZAw1nxc5fTvvrvUIqseTrrhfTWiRtJnLI
 N4ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ly+a3wqx
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
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
Cc: Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Jarkko.

On 21/03/2024 19:21, Jarkko Sakkinen wrote:
> Add swtpm and its dependency libtpms to host packages. These are useful
> for emulating TPM in QEMU environment.

  I don't understand... Does it mean that you run host-swtpm next to host-qemu 
and you somehow connect them so it gets exposed as a TPM2 device inside the qemu VM?

> 
> Link: https://gitlab.com/jarkkojs/linux-tpmdd-test
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
>   package/libtpms/Config.in                     |  9 ++++
>   package/libtpms/libtpms.hash                  |  1 +
>   package/libtpms/libtpms.mk                    | 15 ++++++

  Please split this in a separate patch for libtpms (so 3 patches in the series).

  You also need package/Config.in to source package/libtpms/Config.in

  Also, please run `make check-package`. There will undoubtedly be some coding 
style issues.

  Finally, please add yourself to the DEVELOPERS file for this package. This 
way, you'll get an e-mail if the package fails in the autobuilders, or when a 
new version is released if the package is registered on release-monitoring.org. 
See https://nightly.buildroot.org/#DEVELOPERS

>   .../0001-comment-out-expect-and-socat.patch   | 46 +++++++++++++++++++
>   package/swtpm/Config.host.in                  |  8 ++++

  You also need to add this to package/Config.in.host

>   package/swtpm/swtpm.hash                      |  1 +
>   package/swtpm/swtpm.mk                        | 17 +++++++
>   7 files changed, 97 insertions(+)
>   create mode 100644 package/libtpms/Config.in
>   create mode 100644 package/libtpms/libtpms.hash
>   create mode 100644 package/libtpms/libtpms.mk
>   create mode 100644 package/swtpm/0001-comment-out-expect-and-socat.patch
>   create mode 100644 package/swtpm/Config.host.in
>   create mode 100644 package/swtpm/swtpm.hash
>   create mode 100644 package/swtpm/swtpm.mk
> 
> diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
> new file mode 100644
> index 0000000000..7ef61cf53c
> --- /dev/null
> +++ b/package/libtpms/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBTPMS
> +	bool "libtpms"
> +        depends on BR2_USE_WCHAR # glib2
> +        depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +        depends on BR2_USE_MMU # glib2

  If you have those dependencies, I'd expect a corresponding `select 
BR2_PACKAGE_GLIB2`. However, there isn't any dependency at all in the .mk file, 
so I guess this is in fact not needed.

> +	help
> +	  TPM emulation library
> +
> +	  https://github.com/stefanberger/libtpms
> diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
> new file mode 100644
> index 0000000000..c31d824af6
> --- /dev/null
> +++ b/package/libtpms/libtpms.hash
> @@ -0,0 +1 @@
> +sha256  2807466f1563ebe45fdd12dd26e501e8a0c4fbb99c7c428fbb508789efd221c0  v0.9.6.tar.gz

  Please make sure that the license file is also in the .hash file. You can 
check this with `make legal-info`.

> diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> new file mode 100644
> index 0000000000..5b1151baff
> --- /dev/null
> +++ b/package/libtpms/libtpms.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libtpms
> +#
> +################################################################################
> +
> +LIBTPMS_VERSION = v0.9.6

  Drop the v from the version, otherwise release-monitoring and CPE/CVE checks 
don't work. You can add the v below.

> +LIBTPMS_SOURCE = $(LIBTPMS_VERSION).tar.gz

  Don't override LIBTPMS_SOURCE, there's no need for that, the default 
(libtpms-0.9.6.tar.gz) is better. The github URL will still work. Note that the 
hash will change if you change the filename.

> +LIBTPMS_SITE = $(call github,stefanberger,libtpms,$(LIBTPMS_VERSION))

  This is where the v should be added:

LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))

> +LIBTPMS_LICENSE = BSD-3-Clause

  It's actually BSD-4-Clause. And unfortunately, it also contains file which 
seem to be covered with a modified BSD-2-Clause instead, but let's ignore that :-)

  Please add the license file as well:

LIBTPMS_LICENSE_FILES = LICENSE

> +LIBTPMS_INSTALL_STAGING = YES
> +LIBTPMS_AUTORECONF = YES

  You should add a comment explaining why autoreconf is needed - in this case, 
because we get the source from git. It's also good to mention in the commit 
message that upstream doesn't create release tarballs that include the configure 
script.

> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> diff --git a/package/swtpm/0001-comment-out-expect-and-socat.patch b/package/swtpm/0001-comment-out-expect-and-socat.patch
> new file mode 100644
> index 0000000000..09dcc49a7b
> --- /dev/null
> +++ b/package/swtpm/0001-comment-out-expect-and-socat.patch
> @@ -0,0 +1,46 @@
> +From 067c32ba93774b273de9af872b5587798dcabb15 Mon Sep 17 00:00:00 2001
> +From: Jarkko Sakkinen <jarkko@kernel.org>
> +Date: Tue, 19 Dec 2023 05:21:20 +0200
> +Subject: [PATCH] configure.ac: comment out "expect" and "socat"

  Please replace this with the patch from PR 844 (and add --disable-tests). Or 
wait until Stefan releases v0.8.2 (probably very soon).

> +
> +Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> +---
> + configure.ac | 16 ++++++++--------
> + 1 file changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 49caf96..4acc763 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -394,20 +394,20 @@ AS_IF([test "x$enable_default_pcr_banks" != "x"],[
> + pcr_bank_checks
> + AC_SUBST([DEFAULT_PCR_BANKS])
> +
> +-AC_PATH_PROG([EXPECT], expect)
> +-if test "x$EXPECT" = "x"; then
> +-	AC_MSG_ERROR([expect is required: expect package])
> +-fi
> ++# AC_PATH_PROG([EXPECT], expect)
> ++# if test "x$EXPECT" = "x"; then
> ++# 	AC_MSG_ERROR([expect is required: expect package])
> ++# fi
> +
> + AC_PATH_PROG([GAWK], gawk)
> + if test "x$GAWK" = "x"; then
> + 	AC_MSG_ERROR([gawk is required: gawk package])
> + fi
> +
> +-AC_PATH_PROG([SOCAT], socat)
> +-if test "x$SOCAT" = "x"; then
> +-	AC_MSG_ERROR([socat is required: socat package])
> +-fi
> ++# AC_PATH_PROG([SOCAT], socat)
> ++# if test "x$SOCAT" = "x"; then
> ++# 	AC_MSG_ERROR([socat is required: socat package])
> ++# fi
> +
> + AC_PATH_PROG([BASE64], base64)
> + if test "x$BASE64" = "x"; then
> +--
> +2.40.1
> +
> diff --git a/package/swtpm/Config.host.in b/package/swtpm/Config.host.in
> new file mode 100644
> index 0000000000..e77eea2aa5
> --- /dev/null
> +++ b/package/swtpm/Config.host.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_SWTPM
> +	bool "swtpm-host"

  Should be "host swtpm"

> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION

  This is selecting the _target_ gobject-introspection, which makes no sense for 
a host package.

> +	help
> +	  Compiles SWTPM software TPM emulator for the host.
> +
> +	  https://github.com/stefanberger/swtpm

  We want to point to something like documentation, which in this case is the 
wiki: https://github.com/stefanberger/swtpm/wiki

> diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
> new file mode 100644
> index 0000000000..882f06d7a5
> --- /dev/null
> +++ b/package/swtpm/swtpm.hash
> @@ -0,0 +1 @@
> +sha256 7bba52aa41090f75087034fac5fe8daed10c3e7e7234df7c9558849318927f41  v0.8.1.tar.gz
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> new file mode 100644
> index 0000000000..79fbf1f420
> --- /dev/null
> +++ b/package/swtpm/swtpm.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# swtpm
> +#
> +################################################################################
> +
> +SWTPM_VERSION = v0.8.1
> +SWTPM_SOURCE = $(SWTPM_VERSION).tar.gz
> +SWTPM_SITE = $(call github,stefanberger,swtpm,$(SWTPM_VERSION))
> +SWTPM_LICENSE = BSD-3-Clause
> +SWTPM_AUTORECONF = YES

  Same comments as for libtpms for the above 5 lines.

> +
> +HOST_SWTPM_DEPENDENCIES = host-libtasn1 host-openssl host-pkgconf host-json-glib host-libtpms

  Can you try inside a container (e.g. using utils/docker-run) if this is really 
sufficient?

> +HOST_SWTPM_CONF_ENV = PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"

  This should already be part of the default configure environment, are you sure 
it is needed?

  Regards,
  Arnout

> +HOST_SWTPM_CONF_OPTS = --without-seccomp
> +
> +$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
