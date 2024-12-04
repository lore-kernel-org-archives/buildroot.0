Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06BDE7716F
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E05641385;
	Wed,  4 Dec 2024 21:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9dP6Hz8g_Le; Wed,  4 Dec 2024 21:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A3114138C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A3114138C;
	Wed,  4 Dec 2024 21:23:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09DD0AE8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE872607A0
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8SgFFHWq9RI for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:23:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE31D60658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE31D60658
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE31D60658
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:23:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a2f3bae4so2347275e9.3
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 13:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733347422; x=1733952222;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WHA5TuXe5P/sONG3I4w8DzrF5oUyDvBKNeCbgroAFSg=;
 b=fNgOB+4lL9vrzVLUfEKLqN9rLhkcI7+nvrbBn1waQyxEJYytRK93uZ7xcnA+rXlUNS
 a+qglnWZb3fB2XvwmRDja86wTeJh07pXUQqwEMvBzz/O61K6KFpcR/y8GIQKIg/x9uWN
 8B4aNnClqnCZmENkjw+no+JZpUupNgWhBbjhB3bEbzTLsTceAv9QWjEUzO+LFJs9Rt5a
 b06f9a86k+Xtl3wefCD6gYbnuUK5tryIeFUYiJRBXJcO2rURE8FQ35s5qsusKhBi+g9r
 bqaloc+VXRj6C27HWONEY1V/hPaxFWQEehdhrwmjVb0VfSap05cuvLm5cLDemOkh9UgU
 +OdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCQrPtCI+yxpNniAv1hlQUujpKlRk/7SmdvfL3ivKGNKNhkef0OPxr1LTinNFq53x6+REF0ONSoVY=@buildroot.org
X-Gm-Message-State: AOJu0Yxd39D3vh6DaGW0DOT5kSwsOuHlNRImkxE9aqqHMzCa0Iz9HmuQ
 sB40DnwK75Tefv7FIeK4DOcm1BNiaXSQ2k72K0rJXN3x7EWmtubtm8XV2Cqs5sm0K562qiAAgd0
 m
X-Gm-Gg: ASbGncvKOElsaIm7XmVdW1FjiZkmP7eTxK2fNufTFQhQ4bynJkOzgdSZWx/H8IlGeMh
 DZfg5qZ78/7el99Cyky603eKnaAOe2vK4hIbfa1I0b7lLA6FN+PzW2IlMdhH4xZvgJv2qYXhqCr
 QFCw8cQzWMoe/G9aVfTxYCQuflm11oL4FS/ZUSy87Tdgr4K4u7lAoHIhFS8tUzdnbzkTlXzhRB/
 SJMmU87zCfusQvHcBDCR6R2FEylgBMKjy1EO5AMilhVkL/siSvIBsJ5Ow4q9fbBajxVBIdXeazF
 HlQPjRd7967/zmUEAoqdoAtqW1k0BnEC5MJ7jU54aby2k6qYh93kzk89wmBDaaBbPS1codGSmzT
 9j8Q9
X-Google-Smtp-Source: AGHT+IGcG2WzvEs03Cd8wAIee84NpByqah+7ORSlYWW9dGCwTMldhvY5ACYijGyn7lB+Y0smyyA3jg==
X-Received: by 2002:a05:600c:5105:b0:434:a6af:79f6 with SMTP id
 5b1f17b1804b1-434d09c2594mr73607945e9.15.1733347421525; 
 Wed, 04 Dec 2024 13:23:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861f59cedfsm51791f8f.28.2024.12.04.13.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:23:41 -0800 (PST)
Message-ID: <ac561aa3-8c35-4561-83ae-f671334e8574@mind.be>
Date: Wed, 4 Dec 2024 22:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cherniaev Andrei <dungeonlords789@naver.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241112155359.2416899-1-dungeonlords789@naver.com>
Content-Language: en-GB
In-Reply-To: <20241112155359.2416899-1-dungeonlords789@naver.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733347422; x=1733952222; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WHA5TuXe5P/sONG3I4w8DzrF5oUyDvBKNeCbgroAFSg=;
 b=ZIKiwQiuFqB8o017r1zxVEQERuolUtIBzFX1mTqHQZOfukhUEo4yC3N15VfWN4r8dj
 Xrk9VA2J2et+rLUE7e+UUFkzEiM4ePMIBMZJ6hsZ0TCLHbg8PkGeiPVvmWQJofNKaTVx
 2VUomlVqXOZ3PtSzxcJzTQ09RVsFC1W+PXb57B8Hka6RrJFYqNWugdwmcwMwX5y+2U8O
 WXVt65OnUkoU1QXH4L7AW6oI8hMc7mYXHnpY9T5+FisxZrauwQRbf7+8CrEcQiHiOBp9
 Led8XVcf/PhgGrERkzBg0o6TZq7KxH3Jnr95y7BUj5XTWh9tu1uHNssty4OmEGq1gUeo
 oQbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZIKiwQiu
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: fix help
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/11/2024 16:53, Cherniaev Andrei wrote:
> losetup -f return next free loop device and usually it is not /dev/loop0 so if you use this help you can delete all important data from your existing device.
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>


  Applied to master, thanks.

  I didn't think the commit message was explicit enough, so I changed it to:

     boot/grub2/readme.txt: don't specify /dev/loop0

     losetup -f returns the next free loop device, which may not be
     /dev/loop0.  If you blindly follow the readmy you may end up destroying
     an existing device.

     Make it more robust with a variable to store the loop device.


> ---
>   boot/grub2/readme.txt | 32 +++++++++++++++++---------------
>   1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
> index 5d59fb4e22..2684805c97 100644
> --- a/boot/grub2/readme.txt
> +++ b/boot/grub2/readme.txt
> @@ -10,20 +10,21 @@ Notes on using Grub2 for BIOS-based platforms
>         is enough free space *before* the first partition to
>         store Grub2. Leaving 1 MB of free space is safe.
>   3. Setup loop device and loop partitions
> -   sudo losetup -f disk.img
> -   sudo partx -a /dev/loop0
> +   loop_dev=$(sudo losetup -f)
> +   sudo losetup "$loop_dev" disk.img

  This actually risks that loop_dev is already in use by something else by the 
time the actual losetup is done. The original `sudo losetup -f disk.img` 
atomically creates and prints the device, so I changed this into simply

     loop_dev=$(sudo losetup -f disk.img)


  Regards,
  Arnout

> +   sudo partx -a "$loop_dev"
>   4. Prepare the root partition
> -   sudo mkfs.ext3 -L root /dev/loop0p1
> -   sudo mount /dev/loop0p1 /mnt
> +   sudo mkfs.ext3 -L root "${loop_dev}p1"
> +   sudo mount "${loop_dev}p1" /mnt
>      sudo tar -C /mnt -xf output/images/rootfs.tar
>      sudo umount /mnt
>   5. Install Grub2
>      sudo ./output/host/sbin/grub-bios-setup \
>           -b ./output/host/lib/grub/i386-pc/boot.img \
> -        -c ./output/images/grub.img -d . /dev/loop0
> +        -c ./output/images/grub.img -d . "$loop_dev"
>   6. Cleanup loop device
> -   sudo partx -d /dev/loop0
> -   sudo losetup -d /dev/loop0
> +   sudo partx -d "$loop_dev"
> +   sudo losetup -d "$loop_dev"
>   7. Your disk.img is ready!
>   
>   Using genimage
> @@ -65,22 +66,23 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
>       - Create a second partition, type 8300, for the root
>         filesystem.
>   3. Setup loop device and loop partitions
> -   sudo losetup -f disk.img
> -   sudo partx -a /dev/loop0
> +   loop_dev=$(sudo losetup -f)
> +   sudo losetup "$loop_dev" disk.img
> +   sudo partx -a "$loop_dev"
>   4. Prepare the boot partition
> -   sudo mkfs.vfat -n boot /dev/loop0p1
> -   sudo mount /dev/loop0p1 /mnt
> +   sudo mkfs.vfat -n boot "${loop_dev}p1"
> +   sudo mount "${loop_dev}p1" /mnt
>      sudo cp -a output/images/efi-part/* /mnt/
>      sudo cp output/images/bzImage /mnt/
>      sudo umount /mnt
>   5. Prepare the root partition
> -   sudo mkfs.ext3 -L root /dev/loop0p2
> -   sudo mount /dev/loop0p2 /mnt
> +   sudo mkfs.ext3 -L root "${loop_dev}p2"
> +   sudo mount "${loop_dev}p2" /mnt
>      sudo tar -C /mnt -xf output/images/rootfs.tar
>      sudo umount /mnt
>   6  Cleanup loop device
> -   sudo partx -d /dev/loop0
> -   sudo losetup -d /dev/loop0
> +   sudo partx -d "$loop_dev"
> +   sudo losetup -d "$loop_dev"
>   7. Your disk.img is ready!
>   
>   To test your i386/x86-64 EFI image in Qemu

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
