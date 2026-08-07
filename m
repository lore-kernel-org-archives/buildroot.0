Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E465C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7A6A606E3;
	Fri,  7 Aug 2026 11:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG2ehS2D7Q5x; Fri,  7 Aug 2026 11:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D47BF606EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786101845;
	bh=KQUg17MQPM4U8Uw7u0yHO5BfTU4xTkkzCHlmxuzvigU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jr/fN30P637dm+4z7M+NfyIprAwV6pMwIt1P6VFhn5n2goWXIjXNYXBwWYRjEMYFr
	 3xaNKI54DowOAU8957kYgAZKH8ZKukzkqTveypIcWwT+rejo2R/E0DVvucfhK35n/S
	 NjwuZ5Sm8KQpN+vqgrYd9SbiodwSqreS1yeqy9HSAbu5IajeuAuRz9QzYzvgAxkIWQ
	 +frB+671AeR/aTzv5J6yDy9rXxHHLswKwz8y0tkP9uQZRBuq7Q/bz/RUG6LGp1h1+g
	 wiSxT44Qdw3r08mriMysv+AlCSY5Mr1Q658VMnuzdJ6ZsDihVtw1uUj04eIyY+8Zoc
	 RmOtSSfZjNw8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D47BF606EA;
	Fri,  7 Aug 2026 11:24:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F892282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 653C7811FE
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1DyKqUCgWDa for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 596E581239
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 596E581239
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 596E581239
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:24:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-472326ca506so2154096f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786101841; x=1786706641;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=quU+EAPUaJ05/A+krgn9pEnsVFUqMV/ma6U/Qx6+xrg=;
 b=K929N72e9WrQFW0MR4KWzAKx9A7PCmgUIVf9DINkWqFxdnWd0Hj9bzUKvWifyaZV6B
 4oYzRWMTINeNRt4KzHhPxOo5Mn4MBUzSz1i6mLPGNbOaPElJ34+Ris5Y1eDK3PdHAzN+
 iDFNURFHiXV5tRJZCsbaMBLqL126jQqLVZMkh5RUk1+rMXNutcH7unDs634sFIhmIGK+
 DCjmVXLLn+fkunCNnsZ/n9lQfKMtHGV2HkVrpcrB5VnJgvpP2Y4gMmdEJqe5G6wJeIxO
 +wY2F1qiWW2r23Xp8Ak2OHNum3SXPFRTpcpPk+K26BfDLaxqZG9aSLfn08fJnJ4JhqAG
 k10A==
X-Forwarded-Encrypted: i=1;
 AHgh+RoGgxiKQW90TWaClx2c9xvtZzlPTKT6QLwB92yP2/JKTa6WWBeXRhufH7iwRBNKJFr09Y8INN+jSgM=@buildroot.org
X-Gm-Message-State: AOJu0YywTLQS3OEQZNhydqAn47Yqwh01SSwsuQU8npmHwkj4kBf2ROcQ
 93HrhFRhgbkjpH/MpKP2McMNV5GVEDUhQtyMAuXT9tK0KkTTliAF7+aWhS8oNVjdt1+c1bwQsmI
 IWpf1
X-Gm-Gg: AR+sD12QR35/jh0IKhxiBC5r2fCzcyanApZb74gVSIRNDj50orRURUr45iKIEWE+CJm
 fnCuGoXTVUnO8c2ghgWe+k+hIZsAgrigkaX4+nkmDwFI8dIdLOTci5uEFA7Kc8zlsHuQQQ2DV11
 dGQ0I5oUhro/Mfv3I9Tw0pdIWo66qQT9BcTKOwrhuEtPbpm3B92CUd/54Vj+MTmQ2W4ZnLG8N43
 AFkPwNx4STM/uMbSeHVNFahaMUbq4P2LAQcB4VDb9iQPnhKYs8uiMxABOlZ6dqAVW/+0Ua4YPzl
 BRE/c8pb2ULtI8F1fViWVmw66Yts7ClAu7oTlTNcbqo89CK2FquDiliQ1VXD36xPTlublCYZCzQ
 vE2S2rgT5+44MuxZnZ4pU81yx9YfkaHycC8zYfVvXo7fHrQCrUxV6F63Mc3QLf6keXRj79u7wx5
 u2ImMKtGje4b4fqvojwu4TogiDnsUEkYtBDoC6D4AvfYRxT83YByhX6FOoAWiRbYrA7BFg7g6U8
 9FvY8RMoSbNovqEx7tzGBFBV3JGgCIKItzUIwLsmx6nhPfJ
X-Received: by 2002:a05:6000:290d:b0:47f:f42e:9715 with SMTP id
 ffacd0b85a97d-47ff42e974fmr23013416f8f.12.1786101841000; 
 Fri, 07 Aug 2026 04:24:01 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021457ebsm4867977f8f.6.2026.08.07.04.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:24:00 -0700 (PDT)
Message-ID: <7c5eb78c-a329-4bfc-b79f-b9c8630ab70b@mind.be>
Date: Fri, 7 Aug 2026 13:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20260726204437.3148734-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260726204437.3148734-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786101841; x=1786706641; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=quU+EAPUaJ05/A+krgn9pEnsVFUqMV/ma6U/Qx6+xrg=;
 b=Zn3uuUBkyy5cWUzY4+LfN4KuU8STeDiocshDUgUNEzG8gDBuPl3NI5c/HpNPjaeb6W
 L1nPE6OTphwrCNdQAM+cJ35midFJccEHimhljbzcf0MkZOuwOmeIe09IxF5yH67ZPg5t
 B6kaGaLdAGqmZgGYaY5UTy9VtMuq0fH1VSl1SjnCosRorY8w1Kjsk2MmtxBowEniVoa4
 0ImTejg2kWk/einkaGl71xI/bAs+bfIIuDzSnhvIw1dbiRjHeYj/rIm08fCOwKKhKl49
 dh6PJIiosJcSPSV044gXGjcwjVuAahsCN6nidd9DXOPlREDCEuTRL/UtT9XhwyaSaQWJ
 oiiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Zn3uuUBk
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx93frdm: bump
 U-Boot, TF-A and Linux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/07/26 22:44, Julien Olivain via buildroot wrote:
> Since Buildroot commit [1] "package/gcc: switch to GCC 15.x as the
> default", compiling freescale_imx93frdm_defconfig fails in TF-A with
> error:
>
>      include/drivers/nxp/trdc/imx_trdc.h:7: error: header guard 'IMX_TRDC_H' followed by '#define' of a different macro [-Werror=header-guard]
>          7 | #ifndef IMX_TRDC_H
>      include/drivers/nxp/trdc/imx_trdc.h:8: note: 'IMX_XRDC_H' is defined here; did you mean 'IMX_TRDC_H'?
>          8 | #define IMX_XRDC_H
>
> The issue happen because this defconfig is using a Buildroot
> (internal) toolchain which uses gcc version 15 by default.
>
> This issue was fixed upstream in [2], first included in TF-A v2.13.
>
> This commit updates U-Boot, TF-A and Linux to use the NXP
> tag lf-6.18.20-2.0.0, which include this fixes.
>
> Note that, as described in the commit log of [3] which introduced
> this defconfig, U-Boot and Linux were forks. Now the necessary
> patches are included in the vendor BSP, this commit switches those
> repos to use the vendor ones.
>
> While at it, this commit also switches the defconfig to use an
> external glibc stable Bootlin toolchain, to follow recommendations
> from [4]. Since an external toolchain is used, the linux-headers.hash
> custom hash file is no longer needed and is also removed. At the
> time of this commit, the Bootlin stable toolchain is a gcc 14.
>
> Also, due to the upstream uboot commit [5], this commit adds a uboot
> config fragment to disable CONFIG_EFI_CAPSULE_AUTHENTICATE, to
> remove the dependency on the command "cert-to-efi-sig-list", provided
> the host efitools package, which is not yet in Buildroot.
>
> This commit was run tested on board 700-94611 Rev B1.
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/a75b8623f5515d99bec48f96586115953150558e
> [2] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2e9198d0e0cbe9546348dd0a71ff6c3d2061d4eb%5E%21/
> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
> [4] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> [5] https://git.u-boot-project.org/u-boot/u-boot/-/commit/fd58c275f6ba524101ba0990e53f5a11ac390bd0
>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
