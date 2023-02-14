Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24845C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F42B60F80;
	Tue, 14 Feb 2023 21:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F42B60F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uouC2dnDJMk3; Tue, 14 Feb 2023 21:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8118460FAD;
	Tue, 14 Feb 2023 21:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8118460FAD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46D081BF2B3
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 201AD408CC
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201AD408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnoF-r4aNBCc for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:16:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86623408B0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86623408B0
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:16:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s11so11597939edd.10
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pbzviloVXXDAqQyXXjnFrf6aBd9J275mm6jkx8Qdp0w=;
 b=3hNNpYK5/i1PkiUpGoupi+jztqjGpTWSmuCGKOnTFQsSpW1ClXS26fF5RGYl9masD+
 4dp64acPkFrQBJ/67ZdvsLk/TUWY89XZoPXSfsy5MykbG3nBNVBzxr9y9Qr1tR++wyRV
 SoGM1mEO8ahrBv7VuYP6xo9vJscd+5+RS5PrcYQ+B9xetm563qO01/fYAj2NEBt+0SHl
 7sUvHcOEqpmrxQjXMYk5b11hO1RSm2LieHTH7wJXr4DYacdTR4CbWrgZ5PVFxc8reaZK
 l05DHTBq8/AUTxh4osb4hW5lxN5FJSSQWCXKAML4zC1w2LM/maDk5QX8pFhNuVS0qaU6
 AeeA==
X-Gm-Message-State: AO0yUKWM0NohJnPNVvyCb0vxIiT7Yv6RedKNctMYaDHx1a+l4S+O5hi9
 c4z4WmQfVsYW9TkPm2zYnCOebw==
X-Google-Smtp-Source: AK7set82dR0+UYzZHCSleN07ZLQ1x1Vi+yXTOKxCCo3hlf5bx2q21+tOry+6fHcUDWlc41GSN59j2g==
X-Received: by 2002:a50:cd85:0:b0:4ab:7ee:5e22 with SMTP id
 p5-20020a50cd85000000b004ab07ee5e22mr3365504edi.27.1676409371600; 
 Tue, 14 Feb 2023 13:16:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c61-20020a509fc3000000b004acbe0b36d2sm4868835edf.6.2023.02.14.13.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:16:10 -0800 (PST)
Message-ID: <8010c40b-1f2b-1351-c59b-fd96b61e9861@mind.be>
Date: Tue, 14 Feb 2023 22:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB04936E3BDB708B8974C8287B9F139@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <12146851.O9o76ZdvQC@pwmachine>
 <17501a13-8018-656f-5f4d-b1cf6c1ecd5c@mind.be> <2667723.mvXUDI8C0e@pwmachine>
 <VI1P190MB0493D7E80E03DC76691F434A9FDD9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <VI1P190MB0493D7E80E03DC76691F434A9FDD9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pbzviloVXXDAqQyXXjnFrf6aBd9J275mm6jkx8Qdp0w=;
 b=Ssx+XQX5f0R9ZnbYvD4+PrTYN95h2uhsRoKen/dV6acR2lGO5HRgz2XJsENr52Mabc
 ZDo+P2gyU7ylazQJEQ6LwVcA1ha04gA0oDROVJcUOJCobBoODtr/Ks3+XAlcjA2VFAYd
 ugAc1H00/mbb95U3vqFzV/VTUKbT/1nVNEOvFjvQkzfrLP232ewI1j89um93mpWni+65
 JWc4LWL+2XQl9JD4ubCy+fuknp5K8Uc1BHkic93etwC0lHwwAyDcwKj/hObfXbltNhKe
 zX3+1BNYpOadcEAUDfBC3dPxmgLmSScrfEENXU55eiuWDCp0IawIxiTyS2OR1vDMiMtR
 28xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ssx+XQX5
Subject: Re: [Buildroot] [PATCH] package/libbpf: Don't remove bpf.h on host
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2023 13:24, Lang Daniel wrote:
> Hi Arnout, Francis,
[snip]
>> Therefore, we believe that the solution is to use -isystem instead of -I in the
>> HOSTCC setting of the kernel. This is indeed what is already done for uboot:
>>
>> 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem
>> /,$(HOST_CFLAGS)))" \
>>
>> Note that there is a risk that this by itself goes wrong as well. We tried at
>> some point to use -isystem instead of -I in HOST_CFLAGS:
>>
>> commit 6f8162cf8c1abef7e0a4771fe0d6b26a28f5c2b6
>> Author: David Raeman <draeman@bbn.com>
>> Date:   Mon Jul 25 21:52:26 2016
>>
>>       package/Makefile.in should grab HOST_DIR headers using -isystem instead of -I.
>>
>>
>> but this was reverted a copule of days later:
>>
>> commit 255b6f80d395ef048f46cfcf75dba690c56af657
>> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Date:   Sat Jul 30 18:10:18 2016
>>
>>       Revert "package/Makefile.in should grab HOST_DIR headers using -isystem
>> instead of -I."
>>
>> (Unfortunately, the commit has no further explanation of what went wrong).
>>
>>    So, could you (Daniel and Francis) try to apply this patch and replace -I with
>> -isystem like is done for U-Boot, and do a bunch of kernel builds to see if it
>> breaks anything?
> 
> I didn't apply the patch for package/Makefile.in as that would change the behavour
> for all packages.

  Yeah, that's the thing that turned out not to work before.

> I did however copy the logic used in the U-Boot.
> 
> -HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> +HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \

  That was indeed what I meant.

> 
> And applied this patch to keep bpf.h
> 
> I tested the following config:
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
> None-LTS versions after 5.10 and before 6.0 fail with:
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
> But that should be unrelated to the change in package/libbpf and HOSTCC.
> I will try to work out the reason behind that error.

  Since you said "non-LTS versions", I guess it's an upstream issue that got 
fixed in 6.1 and applied to 6.0.x and 5.15.x?


> Should I create a patch to change HOSTCC or is additional testing required?

  Yes please! And include your extensive test coverage in the commit message.

  Regards,
  Arnout

> 
>>
>>    For now, I've marked this patch as Changes Requested (it can only be applied
>> if the bpf.h problem is solved in some other way), and marked Francis's patch
>> [1] as Superseded.
>>
>>    Regards,
>>    Arnout
>>
>>
>> [1]
>> https://patchwork.ozlabs.org/project/buildroot/patch/20220610165441.84812-2-flaniel@linux.microsoft.com/
>>
>>
>>>
>>> Sadly, I tested your patch and I hit the problem described in the comment
>>> regarding redefinition of bpf_core_relo_kind.
>>>
>>> Did you also hit it or you were able to build the kernel with
>>> BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE?
> 
> It seems like I was tested with a too recent kernel and originally preparing
> this patch and therefore didn't hit this error.
> 
>>>
>>>
>>> Best regards and thank you in advance.
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
