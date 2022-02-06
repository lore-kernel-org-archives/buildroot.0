Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D94C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A38E813C8;
	Sun,  6 Feb 2022 10:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TexvDUneAR98; Sun,  6 Feb 2022 10:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9FE88175B;
	Sun,  6 Feb 2022 10:55:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89BF91BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B1360B6A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7YCvrdhVkEE for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:55:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50759600C5
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:55:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m11so23728624edi.13
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 02:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sQpZX3bhU6HytW1TgeR17Ezxl2GasZJ/HbqCGOcl9Jk=;
 b=CYqe5xqXDOusNnpgv5DbUy7+G1BMRoI/JjC9rhMceD88NFY17mmGhKrPIIlZK8wa8l
 Lbtyfp1TlMJPFVaEO6x3DXIlno6dkOca2Qj6oOCprRcn1yiLGLujmxkGf+0cGleQeGhm
 8cZ9mTPCTsECwlYoNU9rznhySRfUUblMuwF9DpA8cBFfF/uX7tLDDrCc2eyClp9wr5SH
 2LE66wYIDGvNhysoplLdM1TpM4QiVrUb6A9bSq0ZePmEWke8mEzmHlHinCSTw+uQqsCG
 iJNZFF7NILtSVYU+Y0yHeRV84l8mv8iG5iBLeNmuzBYJOlz++wYtmq9kYw/pAPZTx3Iz
 lwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sQpZX3bhU6HytW1TgeR17Ezxl2GasZJ/HbqCGOcl9Jk=;
 b=k+ciMRgUGFQOsJk7Ej29yvueKOI5VRPegDW/O9jDV6v4yZq0M//Oe2Ba8ccLpfk8Wl
 2f/8FoCiv75lBXGp64BOZC/+PqzctGy3h+SjjYs6NuJcEWOTx7BgomTW5Cak1HrB0vgU
 ucW0lRw3UFiwGqyA4LrFakZuN04AbWoiLz61cRC/fiPwmNA17SIZ089mD7uzT0qg/RTy
 blt2zUNi3uzNNUwwnzIkZsk4nR2z+GxmJmD3V5eHiUSZKCLVGBbsQJ1dZGOtdJofMDgV
 Gt6FK+nldSLKJ54ypcole8hrR9CxtjWrYpJyUT/xKpfPmTjYtvritginbqSH+l9vWkLY
 kUkw==
X-Gm-Message-State: AOAM531cy5ET71zcWsi5KD8OlSHvK0KxuoQqeJloLp9kiH6FiuKXeOrr
 NOtvqQcuX5sBjZEealxLZSJf4A==
X-Google-Smtp-Source: ABdhPJxHu3xDCdyeb739IiJRihzMmJ1eX4Er7094PeZso8j66aH84t4XmtJ1VPhKe374jmHZrjfwSw==
X-Received: by 2002:aa7:d9d1:: with SMTP id v17mr8552243eds.105.1644144918347; 
 Sun, 06 Feb 2022 02:55:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bh3sm1957298ejb.102.2022.02.06.02.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 02:55:17 -0800 (PST)
Message-ID: <5f1e37b9-7346-2031-60bf-fa96d9a6e72d@mind.be>
Date: Sun, 6 Feb 2022 11:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: yann.morin@orange.com, buildroot@buildroot.org
References: <19291_1643809720_61FA8BB8_19291_487_24_41ca9ce22939ce2ed0c41973db7d612542850824.1643809712.git.yann.morin@orange.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <19291_1643809720_61FA8BB8_19291_487_24_41ca9ce22939ce2ed0c41973db7d612542850824.1643809712.git.yann.morin@orange.com>
Subject: Re: [Buildroot] [PATCHv2] package/glibc: allow runing on kernels
 older than used for the headers
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 14:48, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Currently, we configure glibc to not add compatibility support for
> kernels older than the one used for the headers. This is on the
> expectation that the system will never run on a kernel that is older
> than the one used for the headers or, when Buildroot builds the kernel,
> on another, older kernel.
> 
> However, in some situations, it is possible to build for a generic
> system, where the kernel may be a different version. This can be the
> case, for example, when Building an image that is to be used in a
> container that can run on a range of machines each with different kernel
> versions. In such a case, it is interesting to build glibc in a way as
> to take better advantage of the newer kernels, and thus using newer
> kernel headers, while still allowing running on older kernels, and thus
> carrying more compatibility code.
> 
> We add an option to glibc to allow the user to enable compatibility
> shims. To simplify the case, when that option is enabled, we just let
> glibc enable as old compatibility shims as supported by the current
> architecture.
> 
> The code size increase is very small. For an ARM Cortex-A7, with
> gcc-10.3.0, the delta is as follows (other files installed by glibc had
> no size delta; sizes in bytes):
>      file                  | no compat | compat    | delta
>      ----------------------+-----------+-----------+-------
>      ld-linux-armhf.so.3   | 200216    | 200284    | +  68
>      libc.so.6             | 1814496   | 1823120   | +8624
>                                              ------+-------
>                                              Total | +8692
> 
> No runtime overhead has been measured; the overhead is most probably
> in the measurement noise. Indeed, the compatibility shims are very
> lightweight. For example, there are 9 arch-generic shims:
>      renameat2(), execveat(), mlock2(), statx(), faccessat2(),
>      close_range(), time64-related syscall shenanigans, a waitid()
>      feature, and a futex operation (LOCK_PI2)
> and then each arch may define a few others. i386 has less than 20
> (mostly related to socket options, and one for the ordering of the
> clone() arguments), while ARM seems to have only two (mlock2() and a
> configurable futex feature).
> 
> Note: however, as Arnout pointed out, some programs may still actually
> fail to run even with such compatibility shim, if they really expect the
> shimed syscalls to really exist and have no fallback (and/or no proper
> error-handling). Still, in the vast majority of cases, those
> compatibility shims are enough to have a system running.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>


  Applied to master, thanks.

  Regards,
  Arnout

> 
> ---
> Changes v1 -> v2:
>    - don't let user provide a version, enable all compat shims  (Arnout,
>      Alexey)
>    - add size measurements and explanations about no runtime overhead
>      measurements  (Arnout)
> ---
>   package/glibc/Config.in | 12 ++++++++++++
>   package/glibc/glibc.mk  |  8 ++++++--
>   2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 5ecd058145..8e9ddac7d9 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -10,6 +10,18 @@ config BR2_PACKAGE_GLIBC
>   	help
>   	  https://www.gnu.org/software/libc/
>   
> +config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
> +	bool "Enable compatibiltiy shims to run on older kernels"
> +	help
> +	  Say 'y' here if you plan on running your system on a kernel
> +	  older than the version used for the toolchain headers.
> +
> +	  Enabling those compatibility shims may generate a slightly
> +	  bigger and slightly slower glibc library.
> +
> +	  The oldest supported kernel version depends on the
> +	  architecture.
> +
>   config BR2_PACKAGE_GLIBC_UTILS
>   	bool "Install glibc utilities"
>   	help
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 5c26b0e6df..9ea9f27a2f 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -98,6 +98,10 @@ endif
>   GLIBC_MAKE = $(BR2_MAKE)
>   GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
>   
> +ifeq ($(BR2_PACKAGE_GLIBC_KERNEL_COMPAT),)
> +GLIBC_CONF_OPTS += --enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))
> +endif
> +
>   # Even though we use the autotools-package infrastructure, we have to
>   # override the default configure commands for several reasons:
>   #
> @@ -128,8 +132,8 @@ define GLIBC_CONFIGURE_CMDS
>   		--disable-profile \
>   		--disable-werror \
>   		--without-gd \
> -		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
> -		--with-headers=$(STAGING_DIR)/usr/include)
> +		--with-headers=$(STAGING_DIR)/usr/include \
> +		$(GLIBC_CONF_OPTS))
>   	$(GLIBC_ADD_MISSING_STUB_H)
>   endef
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
