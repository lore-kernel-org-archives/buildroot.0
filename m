Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E192FC6FD1E
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF5641715;
	Fri, 10 Mar 2023 20:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EF5641715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7ZCWztn_6X4; Fri, 10 Mar 2023 20:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B06724170C;
	Fri, 10 Mar 2023 20:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B06724170C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87D121BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FA9F82323
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA9F82323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_cCjcaTtPQC for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 20:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0083A82324
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0083A82324
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 20:55:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e13so6197751wro.10
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 12:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678481717;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IsP4vHxqqApcHNAdyWd1j/91ENtcxqaoG3scrPDX5SE=;
 b=UuXSLCjbXtCoeMlqEVJ+6cyOCEYHPjOpB6d/SDGqcsGPLb06+E/APjmSSyxSKAgZ7w
 1bF7W27CtEE17PPkfwbCz1cqWufGOC/7E5rhpKyo5svyLgespDd8OTslZjyvuGCMM+8u
 KAiPaUrqZ6HOY7NQLgy79pkWlQQ8HuuTtkPDb+EQlyepS8VuyP93+VMLo9a+Jj8In64U
 h07wxPlu5aTpyW5FwULHrCvsXF5+Hdez4JpoV2pxNOoMzXSqpH60Wpgj7kPhkklsUBV7
 mj0unKGMVwa2HgH6lDDWjDBjWMqUa0f4uI8f1bGMv0b1f+HQivcnDmqZ0rY6P+qid/Sr
 ZR5w==
X-Gm-Message-State: AO0yUKV5HkA5ikXmjQInFDGdoBKSNGK8otTqBjKRAweNiD+Re++vT4Mj
 sTJMYCb2gEZgCw4FXqprsArDUkBPGQ6r7ZK750E=
X-Google-Smtp-Source: AK7set8BShpY3aJ3ZPT9dZ+sWvlWj6392iiO0cjVayuI83pmzPJkaBh3TWjbmNSiyFthUbSahQMNcA==
X-Received: by 2002:a5d:6a48:0:b0:2c7:dec:77a7 with SMTP id
 t8-20020a5d6a48000000b002c70dec77a7mr15733037wrw.71.1678481717031; 
 Fri, 10 Mar 2023 12:55:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d50c7000000b002c70a0e2cd0sm648041wrt.101.2023.03.10.12.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 12:55:16 -0800 (PST)
Message-ID: <ca647ccc-ab2f-5916-779d-b954c74b56a5@mind.be>
Date: Fri, 10 Mar 2023 21:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <VI1P190MB04930BE811E350544617950D9FA39@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <VI1P190MB04930BE811E350544617950D9FA39@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678481717;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IsP4vHxqqApcHNAdyWd1j/91ENtcxqaoG3scrPDX5SE=;
 b=Q+B/m+SVfd5jhLg5wlgIGm+QjpfGD+KWmHwpuB8iCYjaWsGvslcOwI0JFeMXixlHGL
 DMf0QhCI1pE8RTMbvpgnIIMeBXIYaTpdJdq8gJjZ3jJs0qbUEzL6/QHlgqdPUYN4qiqI
 /EuKayl+vLXswKVkfXNj2oFuY3Rziqk3dnAcUljX9qam+FyrYUyaRcxJHlxuYTpf2Wqf
 6XL+XLHA9n8cKQ9D/KnZqnvrikaeMjVjD39nqsqWVLNhZ8iQQkO4v/Gg1yMTc1NFOCNr
 HmIWIZZby0D+haCy++sAceG484TXP0v7CepHIE+gbEV5Gf2PMGiFwrQPvNS1oWqDLDxV
 Qqbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q+B/m+SV
Subject: Re: [Buildroot] [PATCH v2 2/2] linux: use -isystem instead of -I in
 HOSTCC
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/02/2023 10:58, Lang Daniel wrote:
> A package might install headers that are incompatible with the kernel's
> header. One example is the most recent version of pahole (1.24).
> HOST_CC includes -I$(HOST_DIR)/include which comes before any include
> logic the kernel might have thus forcing the kernel to prefer headers in
> HOST_DIR.
> 
> The logic to substituting -I with -isystem is taken from
> boot/uboot/uboot.mk.

  Thomas, Yann, I think we discussed at the developer meeting to do this 
-isystem in HOST_CFLAGS directly in package/Makefile.in. What was the conclusion 
then?


> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>

  Both applied to master, thanks.

  I applied this one first, the other one second. Indeed, otherwise the linux 
build is broken between the two commits, which makes bisecting more difficult. 
By switching the order, nothing is broken that wasn't already broken before.


  Regards,
  Arnout

> ---
> v1 -> v2:
>   - Patch was added to the series
> 
> Tested with:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="{VERSION}"
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="pahole-kernel.config"
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE=y
> 
> and with a fragment for linux:
> 
> CONFIG_BPF_SYSCALL=y
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=n
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> CONFIG_DEBUG_INFO_REDUCED=n
> CONFIG_DEBUG_INFO_COMPRESSED=n
> CONFIG_DEBUG_INFO_BTF=y
> CONFIG_SYSTEM_TRUSTED_KEYRING=y
> 
> where VERSION is one of:
> 5.2.21 5.3.18 5.4.231 5.5.19 5.6.19 5.7.19 5.8.18 5.9.16 5.10.167 5.11.22
> 5.12.19 5.13.19 5.14.21 5.15.93 5.16.20 5.17.15 5.18.19 5.19.17 6.0.19 6.1.11
> 
> Version 5.2, as far as I could work it out, is the version that introduced
> the pahole dependency when CONFIG_DEBUG_INFO_BTF is set.
> 
> None-LTS versions after 5.10 and before 5.19 fail with:
> 
>    LD      vmlinux.o
>    MODPOST vmlinux.symvers
>    MODINFO modules.builtin.modinfo
>    GEN     modules.builtin
>    LD      .tmp_vmlinux.btf
>    BTF     .btf.vmlinux.bin.o
>    LD      .tmp_vmlinux.kallsyms1
>    KSYMS   .tmp_vmlinux.kallsyms1.S
>    AS      .tmp_vmlinux.kallsyms1.S
>    LD      .tmp_vmlinux.kallsyms2
>    KSYMS   .tmp_vmlinux.kallsyms2.S
>    AS      .tmp_vmlinux.kallsyms2.S
>    LD      vmlinux
>    BTFIDS  vmlinux
> FAILED: load BTF from vmlinux: Invalid argument
> make[2]: *** [Makefile:1177: vmlinux] Error 255
> make[1]: *** [package/pkg-generic.mk:293: /home/d.lang/ws/other/buildroot/output/build/linux-5.11.22/.stamp_built] Error 2
> make: *** [Makefile:82: _all] Error 2
> 
> These version miss BTF_KIND_ENUM64 support and require a patch [0] that has
> been added to LTS versions.
> 
> [0]: https://lore.kernel.org/bpf/20221019085604.1017583-6-jolsa@kernel.org/
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>   linux/linux.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7645b5f507..03d89cd204 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -150,7 +150,7 @@ endif
>   # Disable building host tools with -Werror: newer gcc versions can be
>   # extra picky about some code (https://bugs.busybox.net/show_bug.cgi?id=14826)
>   LINUX_MAKE_FLAGS = \
> -	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> +	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
>   	ARCH=$(KERNEL_ARCH) \
>   	INSTALL_MOD_PATH=$(TARGET_DIR) \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
