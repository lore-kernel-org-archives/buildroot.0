Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542CDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBE1415A6;
	Sat, 30 Apr 2022 18:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qS8FkiUxqa4y; Sat, 30 Apr 2022 18:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 388AB41581;
	Sat, 30 Apr 2022 18:50:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99B951BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 964754032A
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBg4kX2lXnpC for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:50:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9703A400F1
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:50:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l7so21094434ejn.2
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8nUOuCgo96R9pVGTO3ozmLdOy35/2cpdSLCBl3C1duM=;
 b=JkLtIPRnMcBzsDxMIw4HFhAS/l+iZj4z92y39zaWZaFMJq2vatatqsnSGmtMj/GkDL
 WvD2mmTtECLda1VIboWvsxEwNX80hJuqrPBITgUFLubiv1O7hyBJJX7rBwUdoi8huIRl
 BhIvhsDqKMuuWqOGOB7SaklwE77ASgA9UcJoVMURtU05vHDQBjnMdX+geha74JvJh+ii
 YFSCbc2mUz0H1CJJaB7ggoTK9mT6RbHf6HhWSr8Ex5mLNfgvBQIBQCs8J6VXm61he+fo
 fWkkOiP2TCmpHXr1d7WOSADq1CLHcbBgtNkiCuVIiNxIHai4YoxaQXL8NucgTcehXuKi
 TCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8nUOuCgo96R9pVGTO3ozmLdOy35/2cpdSLCBl3C1duM=;
 b=t0bN5MRu47T2rrq6BZFZlYqo1LNLdHqnvnzQBx6RWpaJYBQdwfTDC91EU0YTSzw6s5
 WDPNSbte0LuakOMyZonSlXEvgW9tIiY4iw1wF6nsvlUD7E+w8Y5ITK4M+A0lEw0A9qwY
 7S9mFJGMqT6E6sxHwGWYqyA2tBYID+fIg1Og72iOCtk7p1hrlivAuxiezdXg4mfywOGN
 QxHvHznLZfpEA3qkZau7cngDelCEEV1HVZ9aJCyOeXOr/9o3JWhZCNyICkzF9Aianknl
 NOjUOE3JCBjGeUf+zjHbeih6ZidtppKtzWQlO9yyd1o8qt8b+GRvhKUp7bAekZ/zhw5S
 hZXA==
X-Gm-Message-State: AOAM533OzSnU1G6b7FuIcwWcuMhNRwmhzvOnV5/lBtcFXIRvJW2QLrH1
 bWRUSb09P88k92xC9F8qIF4wEA==
X-Google-Smtp-Source: ABdhPJzgsebvTIjvZ9MWQ72GjQeycs6Opf9PGn3GoQzrmRkw5JM7jxrfQ9MSSpeQu+fAbfkyeGO0pQ==
X-Received: by 2002:a17:907:1c0a:b0:6f3:e58e:1a7d with SMTP id
 nc10-20020a1709071c0a00b006f3e58e1a7dmr4920933ejc.288.1651344599738; 
 Sat, 30 Apr 2022 11:49:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o16-20020aa7d3d0000000b0042617ba63a4sm4426503edr.46.2022.04.30.11.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:49:59 -0700 (PDT)
Message-ID: <01e81165-8207-9041-61c6-f04b5db76266@mind.be>
Date: Sat, 30 Apr 2022 20:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Thomas Perrot <thomas.perrot@bootlin.com>, buildroot@buildroot.org
References: <20220428074018.3993608-1-thomas.perrot@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220428074018.3993608-1-thomas.perrot@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2] package/imx-mkimage: install
 print_fit_hab.sh
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/04/2022 09:40, Thomas Perrot via buildroot wrote:
> This script gives the address, the offset and the size of binaries have been
> stored into U-Boot FIT image that contains TF-A, U-Boot and OP-TEE.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> 
> Changes v2:
>   - Fix a typo, when the variable BL31 is empty, BL33 was initialized instead of
>     BL31.
> 
>   ...rt-for-overriding-BL31-BL32-and-BL33.patch | 61 +++++++++++++++++++
>   package/imx-mkimage/imx-mkimage.mk            |  1 +
>   2 files changed, 62 insertions(+)
>   create mode 100644 package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
> 
> diff --git a/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
> new file mode 100644
> index 000000000000..715b0f31d052
> --- /dev/null
> +++ b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
> @@ -0,0 +1,61 @@
> +From 8fc8fc3dfce7533b9c965185277d34e27055cc8f Mon Sep 17 00:00:00 2001
> +From: Thomas Perrot <thomas.perrot@bootlin.com>
> +Date: Tue, 26 Apr 2022 15:10:04 +0200
> +Subject: [PATCH] Add support for overriding BL31, BL32 and BL33
> +
> +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> +---
> + iMX8M/print_fit_hab.sh | 14 +++++++++-----
> + 1 file changed, 9 insertions(+), 5 deletions(-)
> +
> +diff --git a/iMX8M/print_fit_hab.sh b/iMX8M/print_fit_hab.sh
> +index b915115d1ecc..dbc28f2d9af5 100755
> +--- a/iMX8M/print_fit_hab.sh
> ++++ b/iMX8M/print_fit_hab.sh
> +@@ -1,12 +1,16 @@
> + #!/bin/bash
> +
> +-BL32="tee.bin"
> +-
> + let fit_off=$1
> +
> + # keep backward compatibility
> + [ -z "$TEE_LOAD_ADDR" ] && TEE_LOAD_ADDR="0xfe000000"
> +
> ++[ -z "$BL31" ] && BL31="bl31.bin"
> ++
> ++[ -z "$BL32" ] && BL32="tee.bin"
> ++
> ++[ -z "$BL33" ] && BL33="u-boot-nodtb.bin"
> ++
> + if [ -z "$ATF_LOAD_ADDR" ]; then
> + 	echo "ERROR: BL31 load address is not set" >&2
> + 	exit 0
> +@@ -26,7 +30,7 @@ else
> + 	let uboot_sign_off=$((fit_off - 0x8000 - ivt_off + 0x3000))
> + fi
> +
> +-let uboot_size=$(ls -lct u-boot-nodtb.bin | awk '{print $5}')
> ++let uboot_size=$(ls -lct $BL33 | awk '{print $5}')
> + let uboot_load_addr=0x40200000
> +
> + let last_sign_off=$(((uboot_sign_off + uboot_size + 3) & ~3))
> +@@ -64,13 +68,13 @@ done
> +
> + let atf_sign_off=$((last_sign_off))
> + let atf_load_addr=$ATF_LOAD_ADDR
> +-let atf_size=$(ls -lct bl31.bin | awk '{print $5}')
> ++let atf_size=$(ls -lct $BL31 | awk '{print $5}')
> +
> + if [ ! -f $BL32 ]; then
> + 	let tee_size=0x0
> + 	let tee_sign_off=$((atf_sign_off + atf_size))
> + else
> +-	let tee_size=$(ls -lct tee.bin | awk '{print $5}')
> ++	let tee_size=$(ls -lct $BL32 | awk '{print $5}')
> +
> + 	let tee_sign_off=$(((atf_sign_off + atf_size + 3) & ~3))
> + 	let tee_load_addr=$TEE_LOAD_ADDR
> +--
> +2.35.1
> +
> diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
> index 17ba3596f752..b88be0ca6441 100644
> --- a/package/imx-mkimage/imx-mkimage.mk
> +++ b/package/imx-mkimage/imx-mkimage.mk
> @@ -21,6 +21,7 @@ endef
>   define HOST_IMX_MKIMAGE_INSTALL_CMDS
>   	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
>   	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin/mkimage_fit_atf.sh
> +	$(INSTALL) -D -m 755 $(@D)/iMX8M/print_fit_hab.sh $(HOST_DIR)/bin/print_fit_hab.sh
>   endef
>   else
>   # i.MX8 and i.MX8X
> --
> 2.35.1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
