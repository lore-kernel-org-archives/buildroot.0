Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5F8C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D230A412CB;
	Fri, 12 Jul 2024 07:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHmJK63Mvr5E; Fri, 12 Jul 2024 07:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9790D41433
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9790D41433;
	Fri, 12 Jul 2024 07:07:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEBCE1BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D696F412C1
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbWcl7lk-Iff for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D256F411F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D256F411F8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D256F411F8
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:06:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4279ca8af51so6480975e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720768016; x=1721372816;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VaGUbp868JiUsGbpgT/QXsKxVqOawstG2P9iIOYlV60=;
 b=N49KzDIQ+aUG5pO/aAbNIgiwBPTTRGTIhabMB932JEcCy6osTbGqhKFn0CD/Hbw9PY
 0Vxe8QCy1xhhEcR89Zb6duH19LmXhnMLTH4lcA5ahDub3o+Ufit75t1nCvVE4fjJBfI7
 s7z7L+YYjodIuxkymiuLG/7LjdI5AUn0N0rZXrVhpAyrsxlbiSjDCzvXv5eVmhFUgYyj
 kFUzFYuxy0woP7RGhakkXE85N5f2HjwH/5PcSX7REdQMHy1d9MyWKLFjgEcIq8gXUbyg
 IBeOjlIFJiuBf0VIx5gQi+ndzOueT3ntCwtKNZdap5bdw4TnRYbcIxVQaza5dCsIkPiy
 +8HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfhu9VZh3TkMtL00txnXAjsmcDKQil6ITGBDwC2P2Aa1byDaw2cYKufMYB6JLjNBTxQkcZ2aJALDyATouEdDrGYUdHlvdLQA==
X-Gm-Message-State: AOJu0YzceS5Mns3g6U9bPlFuqBNzsyfu6KdynCSQlJNfjqIs6uYRn6yg
 G5y/E8m0SusIu+yO2Hndz6L9z1yjPfJpsbMkTH65/2GP60Im5/oLDCfR3U7i5RY=
X-Google-Smtp-Source: AGHT+IHWX4KoGKl12mUHZJQ4xME2dVeeGkf1+q9JL8wjOqg9ZoRgY/gCKaPDar2o6CFV3NPGVnLGkA==
X-Received: by 2002:a05:600c:654b:b0:426:5d0d:a2c9 with SMTP id
 5b1f17b1804b1-426707d9aadmr74250985e9.10.1720768015782; 
 Fri, 12 Jul 2024 00:06:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23a000sm12491785e9.5.2024.07.12.00.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:06:55 -0700 (PDT)
Message-ID: <c57577d2-ea2d-4405-8989-8d5635ccdef7@mind.be>
Date: Fri, 12 Jul 2024 00:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chris Dimich <cdimich2188@gmail.com>, buildroot@buildroot.org
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
 <20240611180207.2138847-2-cdimich2188@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240611180207.2138847-2-cdimich2188@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720768016; x=1721372816; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VaGUbp868JiUsGbpgT/QXsKxVqOawstG2P9iIOYlV60=;
 b=ZcYNGyWW12P/qFPrFA+Y2aI9fwHt97IrXHqQzSxq6wkVL2ZbJTeUrG+T7120Msjehr
 x8H2TQ8HIHBACVN0jnrkBnWP9ij51Iq7LuhPSGNnGeB5MSushCdTrg2u/sJOebclsqow
 3IiwFucEEX3QDC0QRzskJVblIH8qNgQmA4trYSNLO8RjjJ0c3P9WNcpC3LT7fjN+TXvd
 u6bhqKrup93zNt1qlU23i48auixwF9PrgFpGheakjEgvNZTlioMQd0YIBDkfHxiqdHr4
 F/eDI4318Tlhq/6SUX38+o+PhrNS2Qmk6NHHH4qGEy3yjp1qZW8dy3vj39puFDOABVQ1
 Z13Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZcYNGyWW
Subject: Re: [Buildroot] [PATCH 1/8] board/boundarydevices: update boot
 scripts
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/06/2024 20:02, Chris Dimich wrote:
> - Add support for i.MX 8ULP and i.MX 93.
> 
> Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
> ---
>   board/boundarydevices/common/boot.cmd    | 111 +++++++++++++++--------
>   board/boundarydevices/common/upgrade.cmd |  11 +++
>   2 files changed, 85 insertions(+), 37 deletions(-)
> 
> diff --git a/board/boundarydevices/common/boot.cmd b/board/boundarydevices/common/boot.cmd
> index 2f2bd8d045..285cab7b20 100644
> --- a/board/boundarydevices/common/boot.cmd
> +++ b/board/boundarydevices/common/boot.cmd
> @@ -1,10 +1,13 @@
>   setenv bootargs ''
>   
> -m4=''
>   kernelimage=zImage
>   bootcommand=bootz
>   a_base=0x10000000
>   
> +if test -z "${imx_cpu}"; then
> +	setexpr imx_cpu sub ".*(..?..?)$" "\\1" "${soc_type}"
> +fi
> +
>   #grab 1st 2/3 characters of string
>   setexpr cpu2 sub "^(..?).*" "\\1" "${imx_cpu}"
>   setexpr cpu3 sub "^(..?.?).*" "\\1" "${imx_cpu}"
> @@ -18,10 +21,10 @@ elif itest.s x8M == "x${cpu2}"; then
>   	a_base=0x40000000
>   	kernelimage=Image
>   	bootcommand=booti
> -fi
> -if itest.s "x1" == "x${m4enabled}" ; then
> -	run m4boot;
> -	m4='-m4';
> +elif itest.s x8U == "x${cpu2}"  || itest.s x93 == "${cpu3}"; then
> +	a_base=0x80000000
> +	kernelimage=Image
> +	bootcommand=booti
>   fi
>   
>   setexpr a_script  ${a_base} + 0x00800000
> @@ -36,36 +39,72 @@ if itest.s "x" == "x${board}" ; then
>   	exit;
>   fi
>   
> -if itest.s "x" == "x${fdt_file}" ; then
> -	if itest.s x51 == "x${cpu2}" ; then
> -		fdt_file=imx51-${board}${m4}.dtb;
> -	elif itest.s x53 == "x${cpu2}" ; then
> -		fdt_file=imx53-${board}${m4}.dtb;
> -	elif itest.s x6DL == "x${cpu3}" || itest.s x6SO == "x${cpu3}" ; then
> -		fdt_file=imx6dl-${board}.dtb;
> -	elif itest.s x6QP == "x${cpu3}" ; then
> -		fdt_file=imx6qp-${board}.dtb;
> -	elif itest.s x6SX == "x${cpu3}" ; then
> -		fdt_file=imx6sx-${board}${m4}.dtb;
> -	elif itest.s x6UL == "x${cpu3}" ; then
> -		fdt_file=imx6ull-${board}.dtb;
> -	elif itest.s x7D == "x${cpu2}" ; then
> -		fdt_file=imx7d-${board}${m4}.dtb;
> -	elif itest.s x8MM == "x${cpu3}" ; then
> -		fdt_file=imx8mm-${board}${m4}.dtb;
> -	elif itest.s x8MN == "x${cpu3}" ; then
> -		fdt_file=imx8mn-${board}${m4}.dtb;
> -	elif itest.s x8MP == "x${cpu3}" ; then
> -		if itest *0x30360800 == 0x00824310 ; then
> -			fdt_file=imx8mp-a0-${board}${m4}.dtb;
> -		else
> -			fdt_file=imx8mp-${board}${m4}.dtb;
> -		fi
> -	elif itest.s x8MQ == "x${cpu3}" ; then
> -		fdt_file=imx8mq-${board}${m4}.dtb;
> +if itest.s x51 == "x${cpu2}" ; then
> +	dtb_prefix=imx51;

  This seems like pretty random refactoring. I guess there will be a good reason 
for it, but it's not adequately explained in the commit message.

  However, it makes me think that this U-Boot script actually comes from 
somewhere else (possibly modified). Is that so? Then can't we just download it 
instead? If not, please at least mention in the commit message where it comes from.

  Regards,
  Arnout

> +elif itest.s x53 == "x${cpu2}" ; then
> +	dtb_prefix=imx53;
> +elif itest.s x6DL == "x${cpu3}" || itest.s x6SO == "x${cpu3}" ; then
> +	dtb_prefix=imx6dl;
> +elif itest.s x6QP == "x${cpu3}" ; then
> +	dtb_prefix=imx6qp;
> +elif itest.s x6SX == "x${cpu3}" ; then
> +	dtb_prefix=imx6sx;
> +elif itest.s x6UL == "x${cpu3}" ; then
> +	dtb_prefix=imx6ull;
> +elif itest.s x7D == "x${cpu2}" ; then
> +	dtb_prefix=imx7d;
> +elif itest.s x8MM == "x${cpu3}" ; then
> +	dtb_prefix=imx8mm;
> +elif itest.s x8MN == "x${cpu3}" ; then
> +	dtb_prefix=imx8mn;
> +elif itest.s x8MP == "x${cpu3}" ; then
> +	if itest *0x30360800 == 0x00824310 ; then
> +		dtb_prefix=imx8mp-a0;
>   	else
> -		fdt_file=imx6q-${board}.dtb;
> +		dtb_prefix=imx8mp;
>   	fi
> +elif itest.s x8MQ == "x${cpu3}" ; then
> +	dtb_prefix=imx8mq;
> +elif itest.s x8ULP == "x${imx_cpu}" ; then
> +	dtb_prefix=imx8ulp;
> +elif itest.s x93 == "${cpu3}" ; then
> +	dtb_prefix=imx93;
> +else
> +	dtb_prefix=imx6q;
> +fi
> +
> +if test ! -z "${mcore_enabled}"; then
> +    if test ! -z "${mcoreboot}"; then
> +            run mcoreboot;
> +    fi
> +    mcore_dtb=1
> +fi
> +if test ! -z "${m4enabled}"; then
> +    if test ! -z "${m4boot}"; then
> +            run m4boot;
> +    fi
> +    mcore_dtb=1
> +fi
> +
> +if test -z "${fdtfile}" ; then
> +	if test -z "${fdt_file}" ; then
> +	    bn=${dtb_prefix}-${board}${board_rv}${board_carrier}${board_modifier};
> +	    if test ! -z "${mcore_dtb}" ; then
> +		    if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${bn}-rpmsg.dtb; then
> +		            fdt_file=${bn}-rpmsg.dtb
> +		    else
> +		            fdt_file=${bn}-m4.dtb
> +		    fi
> +	    else
> +		    fdt_file=${bn}.dtb
> +	    fi
> +	fi
> +else
> +	fdt_file=${fdtfile}
> +fi
> +
> +if test ! -z "${mcore_dtb}" ; then
> +    setenv bootargs ${bootargs} ${mcore_bootargs}
>   fi
>   
>   if itest.s x${distro_bootpart} == x ; then
> @@ -79,13 +118,11 @@ fi
>   if itest.s x${console} != x ; then
>   	setenv bootargs ${bootargs} console=${console},115200
>   fi
> -if itest.s "x" == "x$vmalloc" ; then
> -	vmalloc=400M
> -fi
> +
>   if itest.s x${consoleblank} == x ; then
>   	consoleblank=0
>   fi
> -setenv bootargs ${bootargs} vmalloc=${vmalloc} consoleblank=${consoleblank} rootwait fixrtc cpu=${imx_cpu} board=${board} uboot_release=${uboot_release}
> +setenv bootargs ${bootargs} consoleblank=${consoleblank} rootwait
>   
>   if load ${devtype} ${devnum}:${distro_bootpart} ${a_fdt} ${prefix}${fdt_file} ; then
>   	fdt addr ${a_fdt}
> diff --git a/board/boundarydevices/common/upgrade.cmd b/board/boundarydevices/common/upgrade.cmd
> index a26bacd9aa..ca23648cca 100644
> --- a/board/boundarydevices/common/upgrade.cmd
> +++ b/board/boundarydevices/common/upgrade.cmd
> @@ -9,6 +9,10 @@ qspi_offset=0x0
>   a_base=0x12000000
>   block_size=0x200
>   
> +if test -z "${imx_cpu}"; then
> +	setexpr imx_cpu sub ".*(..?..?)$" "\\1" "${soc_type}"
> +fi
> +
>   #grab 1st 2/3 characters of string
>   setexpr cpu2 sub "^(..?).*" "\\1" "${imx_cpu}"
>   setexpr cpu3 sub "^(..?.?).*" "\\1" "${imx_cpu}"
> @@ -27,6 +31,12 @@ elif itest.s x8M == "x${cpu2}"; then
>   			offset=0x0
>   		fi
>   	fi
> +elif itest.s x8U == "x${cpu2}"  || itest.s x93 == "${cpu3}"; then
> +	a_base=0x82000000
> +	offset=0x8000
> +	if itest ${env_part} != 0 ; then
> +		offset=0x0
> +	fi
>   fi
>   
>   qspi_match=1
> @@ -228,3 +238,4 @@ echo "---- U-Boot upgraded. The board will now reset."
>   sleep 1
>   reset
>   done
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
