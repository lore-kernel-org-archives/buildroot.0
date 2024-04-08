Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F637CD128A
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 13:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE6B60B20;
	Mon,  8 Apr 2024 13:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3h_zYfh_XNT; Mon,  8 Apr 2024 13:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B9C460B00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B9C460B00;
	Mon,  8 Apr 2024 13:26:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D33F1BF344
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49E7581A33
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_Gg8YWsEutT for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 13:26:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AA498193E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA498193E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AA498193E
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 13:25:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-343d2b20c4bso2791565f8f.2
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 06:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712582758; x=1713187558;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7qCG+YGsICuvm5cr+/vNzuMndOuVoKSYxQ88rmvXjF4=;
 b=Ta15ES07xfKRJQsv9cTy6ksW2jeDqUXhVlovyP1s4s/qHW4TsXn4womaivQTM90ffY
 BRxmwEyk5HfmlCS6TxUmvrSsAqTRaKsypJVXvi+TbsdaPNvCpPh7g8B8rS6Fs1g6yLnz
 h0CBzjmqgbVFqhOExkahv34ujidlKLymYWl1dNWvCskt0dwjChF+OGkmUAYRB84bqaQF
 Lgxkg882F0fpETydUy1HaAYOoJ+wQWQGKf772kiBA3mJ177NGbrdqgzf6ox10jQi6HzR
 J8Y1qsAA1Eq2ywc231uJpMzIEW/XFLtd/UEuuCk/FiU5Sy15ZYI8wa6Rx09p8v+FhTKB
 t43A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeGMYd3bZKboSzrukBThr/XipFl2vEPkp0gkwc2Q2IR0SxVJ/VQOFapTwIclzzFfFvtlxSSpcLxwzJdfid9UzxzSY5jcDzxQ==
X-Gm-Message-State: AOJu0YzfAQN7yZ1lnlccR8SLVYsOlGfwYCXPq0a3SeVE9/bL2QJkWRZa
 JyOLVVMruQ120aUOrtA0gFESpCsgt+8axKjv6bU+ZQr6dbL0tVW18OxfWzPcWVg=
X-Google-Smtp-Source: AGHT+IFrkEmz4QHLf+qb+5D6jnOGljkIa58O7vGXH/yqeCS4FCrwVzdxWdUGf6yjob6Ew4ABT3kmTQ==
X-Received: by 2002:a05:6000:400b:b0:345:6c19:d06e with SMTP id
 cp11-20020a056000400b00b003456c19d06emr5615746wrb.31.1712582757799; 
 Mon, 08 Apr 2024 06:25:57 -0700 (PDT)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b00341ba91c1f5sm8991618wrt.102.2024.04.08.06.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:25:55 -0700 (PDT)
Message-ID: <61d88146-6450-4d59-9865-9f38babb2a27@mind.be>
Date: Mon, 8 Apr 2024 15:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-10-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-10-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712582758; x=1713187558; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7qCG+YGsICuvm5cr+/vNzuMndOuVoKSYxQ88rmvXjF4=;
 b=gwZ/363rb1U44KHpw6C92C/rMkmxfK85KbsavgXpPOg3B12naJZE8xnRU9SMthgWsc
 6ST7ubjgeE8D63OFIGsRny+fhMsomRdz8XBkZCtmJ+vwC3sK7ekv3XzKSLz+BRcRhSLb
 tF17CUB6iK8HHAz18W6ohIKPS7fqifsXNMtiyEhGLafb6r4BfTPG56lfebLhwIUmA5+e
 PMjrmC7r9vXnFmlSg9BSUVFcGpQ5YWk0HMuGacsOXCIpaVcOm3cgaSGoUcUOhQyIXD1g
 JfstCSOgw4PmStV07xJ9yq6UC3pZpxcaEEgLteoyghkk1rthySbGXES1SGu0tAik93Ry
 CY9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gwZ/363r
Subject: Re: [Buildroot] [PATCH v12 09/16] board/ti/am62x-sk: generalize
 post-build.sh
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 12:35, Romain Naour wrote:
> From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> Removing any explicit reference to the ti_am62x_sk_defconfig
> configuration, the script can also be used by other configurations or at
> least by ti_am64x_sk_defconfig.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> 
> Added in v8
> ---
>   board/ti/am62x-sk/post-build.sh | 10 +++++++---

  Keeping in mind the above remark that it can be reused for ti_am64x, perhaps 
move it to board/ti/common or board/ti/common-am6x or something like that?

  Same for the hash files BTW.

  For me it's fine to apply as is and clean this up afterwards.

>   configs/ti_am62x_sk_defconfig   |  2 +-
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/am62x-sk/post-build.sh
> index 4f19f4d6cf..d066e28fd0 100755
> --- a/board/ti/am62x-sk/post-build.sh
> +++ b/board/ti/am62x-sk/post-build.sh
> @@ -12,8 +12,8 @@ EOF
>     exit 1
>   }
>   
> -o='c:d:r:x:'
> -O='console:,devicetree:,root:,extra-args:'
> +o='c:d:l:r:x:'
> +O='console:,devicetree:,label:,root:,extra-args:'
>   opts="$(getopt -n "${0##*/}" -o "${o}" -l "${O}" -- "${@}")"
>   eval set -- "${opts}"
>   while [ ${#} -gt 0 ]; do
> @@ -24,6 +24,9 @@ while [ ${#} -gt 0 ]; do
>       (-d|--devicetree)
>           DEVICETREE="${2}"; shift 2
>           ;;
> +    (-l|--label)
> +        LABEL="${2}"; shift 2
> +        ;;
>       (-r|--root)
>           ROOT="${2}"; shift 2
>           ;;
> @@ -38,6 +41,7 @@ done
>   
>   [ -n "${CONSOLE}" ] || die "Missing \`console' argument"
>   [ -n "${DEVICETREE}" ] || die "Missing \`devicetree' argument"
> +[ -n "${LABEL}" ] || die "Missing \`label' argument"
>   [ -n "${ROOT}" ] || die "Missing \`root' argument"
>   append="console=${CONSOLE} root=${ROOT} rw rootfstype=ext4 rootwait"
>   if [ -n "${EXTRA_ARGS}" ]; then
> @@ -46,7 +50,7 @@ fi
>   
>   mkdir -p "${BINARIES_DIR}"
>   cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> -	label am62x-sk-buildroot
> +	label ${LABEL}

  AFAIK the label is completely meaningless when you use extlinux.conf from 
U-Boot. It's used as the menu entry in the extlinux bootloader, but in U-Boot I 
think it's just the first one which gets chosen, without menu. And regardless, 
we have one entry anyway. So can't we just set the label to "buildroot"?

  If we do set a label, I would use BR2_TARGET_GENERIC_HOSTNAME instead of 
adding yet another option in the post-build script.

  Regards,
  Arnout

>   	  kernel /Image
>   	  fdtdir /
>   	  devicetree /${DEVICETREE}
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index d4b19e5039..1c7085d04d 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -3,7 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
>   BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
> -BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
> +BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
>   BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
