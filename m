Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B9EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D2FE60E5C;
	Sun, 19 Jun 2022 16:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D2FE60E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOL41Fcmom4p; Sun, 19 Jun 2022 16:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A56B860B15;
	Sun, 19 Jun 2022 16:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A56B860B15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF2D81BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6F574010E
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F574010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MR2G0q3xtMBJ for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:48:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A40400CC
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7A40400CC
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:48:01 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id kq6so16955550ejb.11
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qquC5E/NpiLOrk+eeBLPvOaO/n11x/lKdrV2i2uZTo4=;
 b=mNPWw64ZOtID0syp1bG0t9k1gUeAWRDXpmI+hnzquoHKIAMVL/6wiMr2bxyRNcTmIs
 RYH+Bov843E8jqXD3yuz/S0ON7V9eW9tSIvpU8VPY8qx2e5fayxhqjKm7Ga3e7Pe5461
 nYK1UDkY9QnSq7dhnEatV0db5Dn95MxYs3RUmZ5P0b5mrRLPTcwXypboNtFutm0GiLiT
 22h14A8xKfjiBt9UkusFywQcVM5+KXNFEApOqOVYWTrkPLzBj2zglfvGu7kTHkea2wwq
 HHVAYTCE2fafUw3hCRU1aW9b3fiKFZ7vQNJl3EZA44TyXgQrKMvMf5paWCV77BLBuIyS
 E3ug==
X-Gm-Message-State: AJIora/3ti0rEax9HKiYmzxut5kIZzpF3MOktvru2LV2yiZhwp7miNSK
 hZPJUqQZaiDuX6wkNleK2X6uag==
X-Google-Smtp-Source: AGRyM1vb/3uY3Pd3uOiuLCNwl2dj7jIsbkurjtJ2GB3iTKjn9rH5lx17ds392LBQXalkpJ1tRwry0A==
X-Received: by 2002:a17:906:7395:b0:714:d36b:d7c with SMTP id
 f21-20020a170906739500b00714d36b0d7cmr17690063ejl.338.1655657280068; 
 Sun, 19 Jun 2022 09:48:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a056402158500b004356b8ad003sm4145098edv.60.2022.06.19.09.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 09:47:59 -0700 (PDT)
Message-ID: <2ac0e6db-22f3-9b53-4a5f-2bb8ff5e8e6d@mind.be>
Date: Sun, 19 Jun 2022 18:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220609140449.210030-1-neal.frager@xilinx.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220609140449.210030-1-neal.frager@xilinx.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qquC5E/NpiLOrk+eeBLPvOaO/n11x/lKdrV2i2uZTo4=;
 b=WW5hba5UA6g1zpZgybuP+aqmPdXChVK/oVMoZay4MakW2LGn09Cw+T0/UP62l4x2E6
 dKMbN+faLhkw34gGTa4UleDFLYDhayqj1xh9Y62o8NueWQxjIgQkWcU7lsoMKjSIJzOc
 daTLpbOM49fje3dho4LKYqayH1vfQKxdaCEVeOLE/v79OanE+bTWblI0D3+0xIeiqGCB
 dcg4yxpSXo98pXZBVmDczJhQxCIIRfIPoD5rgnJBDW1BfFCRvWqyA++TKgrvCfg4HkUn
 OV72/0/OjM3r5pRaaAhOlUEEJr9P/lDDlO+jia20G+VCh0Vmi0ULQgdx4E2KUllSRGyr
 r2EQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WW5hba5U
Subject: Re: [Buildroot] [PATCH v2 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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
Cc: Neal Frager <neal.frager@amd.com>, wesley@sonifex.co.uk,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/06/2022 16:04, Neal Frager wrote:
> From: Neal Frager <neal.frager@amd.com>
> 
> This patch uses the BR2_ROOTFS_POST_SCRIPT_ARGS to auto-generate the
> extlinux.conf file, so developers will only need to modify the
> board_defconfig file to change the console and boot file system locations.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  Series applied to master, thanks. Very nicely structured series!

  Regards,
  Arnout

> ---
> V1->V2:
>    - generates extlinux.conf directly in output/images directory
>    - uses "cat <<-" option to remove leading tabs
> ---
>   board/zynqmp/post-build.sh | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
> index 9fd8bbf2c8..7387576414 100755
> --- a/board/zynqmp/post-build.sh
> +++ b/board/zynqmp/post-build.sh
> @@ -4,5 +4,18 @@
>   # in the binaries directory
>   
>   BOARD_DIR="$(dirname $0)"
> +CONSOLE=$2
> +ROOT=$3
>   
> -install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
> +FILE=${BOARD_DIR}/extlinux.conf
> +if test -f "${FILE}"; then
> +  install -m 0644 -D "${FILE}" "${BINARIES_DIR}/extlinux.conf"
> +else
> +  mkdir -p "${BINARIES_DIR}"
> +  cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> +	label linux
> +	  kernel /Image
> +	  devicetree /system.dtb
> +	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
> +	__HEADER_EOF
> +fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
