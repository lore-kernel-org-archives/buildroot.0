Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB6DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 07:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E427D401E1;
	Fri, 26 Nov 2021 07:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_EEMtusXf0S; Fri, 26 Nov 2021 07:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCFDA4033C;
	Fri, 26 Nov 2021 07:42:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7E801BF395
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 07:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A920140344
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 07:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmx1oavuODrw for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 07:42:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BCEF401E1
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 07:42:29 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id r25so35102373edq.7
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 23:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sqQGBNw0PTX7JpfaWk10K2mHQIJvPowNfybv0hMq1NA=;
 b=SViMMCRn8uZR8qbjGPTxbJwv2gqzNNaBdQy0dxl7uzBDC0OQkdcdqCg9H4xt35l638
 AuA0q0YoV35hpUvssGww29GQrbfLSQKEaQMF4RKRoNoppQGkNhQ+iO2QZDg14Gj6CJ6u
 Y1gOPVptW9MgJYZWZqW6wGqB5FHIGZTaHqPao7oVTphlGo/oH7TQ+m4YxSmZCjVzzT4u
 K+e4A41DPM5oGwwS8+GS7mwWGYFqm63DMQ9HRYhTVRwhzG3CbDVBPhPEPQpnB6X3yXza
 SH7a+42iWjr+w2ChQQ6shqpc0l0hNYD2Dw+okRpa9unZKe9cZb+xY/B0rI/pV27Mqske
 y48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sqQGBNw0PTX7JpfaWk10K2mHQIJvPowNfybv0hMq1NA=;
 b=mBUOgiAC/RU3jrBHYscuSGnuEO/ZQ34Au9w4cvOFXXh3JNcM6L8L2bJXO5r4p6MtwJ
 ZS5JlvEnFlCQRf/U/7nOTUZGdlS0m5NGseqYrv+q+LROCmAHgE8IDXC1/oj/ulVkO6zg
 TvuaEoaO5la4EzTDd400g+UA6MmEUMHhtx5GaRwn5f597NUE2GjTr7SG0HNzVLumZ/ke
 8SIF7wSSEDJDKUA3vnPpyqot+Cccnx+OaFW1QWiVVEUle9VEPAVcUon4zgO8eV3uylMh
 LIyaycwILrQiY2xQHthUaIGJ/VFWhqoohTQdTqfnEdW1oO3xkgvAXvebpr9tT3kZpcMI
 CsCA==
X-Gm-Message-State: AOAM531CaYF/pfZqaJmPH6LM3n4RW4i0sDxJ51M5u2Vf1JyGLm6mHghr
 xNwZ/RzaujS5IHUZ2BM9uIlgvg==
X-Google-Smtp-Source: ABdhPJyKx0jyVvvPkWWP894gthdWIzSf0RIzXu05I2d4FeIK2+SKeIPmrWmoSF2fWm7v9MLh20eTvw==
X-Received: by 2002:a05:6402:289e:: with SMTP id
 eg30mr45438627edb.253.1637912548220; 
 Thu, 25 Nov 2021 23:42:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sh33sm2954857ejc.56.2021.11.25.23.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 23:42:27 -0800 (PST)
Message-ID: <fc493f23-3579-93d7-92d9-9caa80c0041f@mind.be>
Date: Fri, 26 Nov 2021 08:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211125215654.4189447-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211125215654.4189447-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] utils/checkpackagelib/lib_mk.py:
 check typo in define
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/11/2021 22:56, Fabrice Fontaine wrote:
> Check typo in define to detect SMAKE_LINUX_CONFIG_FIXUPS in smack
> (fixed by 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6)
> 
> Add GCC_TARGET in ALLOWED variable to avoid the following warnings:
> 
> arch/arch.mk:12: possible typo: GCC_TARGET_ARCH -> *ARCH*
> arch/arch.mk:13: possible typo: GCC_TARGET_ABI -> *ARCH*
> arch/arch.mk:14: possible typo: GCC_TARGET_NAN -> *ARCH*
> arch/arch.mk:15: possible typo: GCC_TARGET_FP32_MODE -> *ARCH*
> arch/arch.mk:16: possible typo: GCC_TARGET_CPU -> *ARCH*
> arch/arch.mk:17: possible typo: GCC_TARGET_FPU -> *ARCH*
> arch/arch.mk:18: possible typo: GCC_TARGET_FLOAT_ABI -> *ARCH*
> arch/arch.mk:19: possible typo: GCC_TARGET_MODE -> *ARCH*
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   utils/checkpackagelib/lib_mk.py | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index d09922f724..9178931276 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -236,6 +236,7 @@ class TypoInPackageVariable(_CheckFunction):
>           "BR_CCACHE_INITIAL_SETUP",
>           "BR_LIBC",
>           "BR_NO_CHECK_HASH_FOR",
> +        "GCC_TARGET",
>           "LINUX_EXTENSIONS",
>           "LINUX_POST_PATCH_HOOKS",
>           "LINUX_TOOLS",
> @@ -248,7 +249,7 @@ class TypoInPackageVariable(_CheckFunction):
>           "TARGET_FINALIZE_HOOKS",
>           "TARGETS_ROOTFS",
>           "XTENSA_CORE_NAME"]))
> -    VARIABLE = re.compile(r"^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
> +    VARIABLE = re.compile(r"^(define )?([A-Z0-9_]+_[A-Z0-9_]+)")

  This no longer matches inline assignments... So I think this should be 
something like
^(define )?([A-Z0-9_]+_[A-Z0-9_]+)|^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=

  Ideally, we should have a runtime test that validates that check-package 
catches the errors we want it to catch...

>   
>       def before(self):
>           package, _ = os.path.splitext(os.path.basename(self.filename))
> @@ -258,7 +259,7 @@ class TypoInPackageVariable(_CheckFunction):
>           # linux extensions do not use LINUX_EXT_ prefix for variables
>           package = package.replace("LINUX_EXT_", "")
>           self.package = package
> -        self.REGEX = re.compile(r"^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
> +        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
>           self.FIND_VIRTUAL = re.compile(
>               r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
>           self.virtual = []
> @@ -268,7 +269,7 @@ class TypoInPackageVariable(_CheckFunction):
>           if m is None:
>               return
>   
> -        variable = m.group(1)
> +        variable = m.group(2)

  Ah, with the regex that matches both, this will be tricky... Perhaps we should 
use named groups then.


  Regards,
  Arnout


>   
>           # allow to set variables for virtual package this package provides
>           v = self.FIND_VIRTUAL.search(text)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
