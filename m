Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B446FFF8860
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 16:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F08880F79;
	Mon, 27 Apr 2026 16:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1ilqCQWLNMb; Mon, 27 Apr 2026 16:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A28C80E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777308904;
	bh=ZFN1AF0e+8vlQeE+bqvM+5k+O8lzYX+xN1nbhrOvk6U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GIjpWqYIdryoRMqCyk/dHxacnAIwmQzU0uHC4aVaVYCMIIm0Jx3m7lLallaDlgAxJ
	 TlI1OzUDY+BFOXjE48Uh7k9xQWDXZ1z7w+CjYGasPvDKHACMq8pii4UqN8onM4ft4H
	 Y7pIjCszOQF3194swETDwtU4S+Hgiuql3xykOHxcIEWLTL2u/+QIKMp0sXqsbzJrJm
	 C5w8Brenbyd/mGpODzKninGgQNcAkIdq7uFazFxvo7HU3+PMxsTJciSH/S+EJ2zrqa
	 2mBEcuC7DyVyacj1Zl2yjTdkIiENaMXD/u4LD3tl+/WQcEWLIqdbAW1ixFaKove4ZF
	 w44kqQVj1hlDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A28C80E27;
	Mon, 27 Apr 2026 16:55:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75F4B2DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 16:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67D9060642
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 16:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuOt68M3hup9 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 16:55:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D34766063E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D34766063E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D34766063E
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 16:55:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1vu7Bh1Bgb-00JLYU; Mon, 27
 Apr 2026 18:54:44 +0200
Message-ID: <1e38b2e2-7d54-4c80-9339-c0650e7b0ec3@gmx.de>
Date: Mon, 27 Apr 2026 18:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrei Cherniaev <dungeonlords789@naver.com>, buildroot@buildroot.org
Cc: hi@senzilla.io, romain.naour@gmail.com, kory.maincent@bootlin.com,
 vincent.stehle@arm.com, ju.o@free.fr, jiaxun.yang@flygoat.com,
 fancp2007@gmail.com
References: <20260427112820.3753844-1-dungeonlords789@naver.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260427112820.3753844-1-dungeonlords789@naver.com>
X-Provags-ID: V03:K1:LmU5APN3Q781qGJtzSr8ymZPk4DfxjC3dnOKJiBfeVToGllu+xR
 HXS+kNlbQFuKZtHoVTSlT0d0jo8tcX/1/XbF+eBYJSWn3UaRxMmhM1RnbPDmGHCl5AWcuqJ
 pzJPjxE3JeMDO9XXEnl84oFbbQn3v2nJ2i/Jw7K3iurevhoy4cUwVaqbRiydSkx0NE+bkWh
 Laa9MqOsmCs9PopWdTt9w==
UI-OutboundReport: notjunk:1;M01:P0:IpR/Fmqw8+c=;vgHksrN2nzn4wDNc1IcTfv5LTbL
 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
 eazRCw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777308884; x=1777913684; i=fiona.klute@gmx.de;
 bh=8X4Xw8TmdTEvnGQYuDosTHsW+L5s6jX5Ue3z3iHEOZk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=l/gUx/u3lEAXJ9SO1JERbxiSP4VGXTzK38H6d4Hgc0MlAVS5tioTrEAL043U6D63
 Nab67Gq5fGZJvFcEIf606MJZUi7Kninj1Lpoc+RuQp1SBfHEgH3ZFgWNLFlRFfbgq
 PnkSxOjZkKZZSahfHaUx6Q6AvyNgQbHKyZPBfzjn0h+0twPL3HovsDbmR+RS3MEkx
 Tg0T+yLryrWo2rmg/m8U3uRiPxT/do0IIl0m52mhkgR/CviNCDPcp211KQYbAs2aK
 /tI8mN7N/aBctwXYORFeE3CAkBfcL1fDC6DqeFrKMwvGnSLr8bHP1A5WhvF2obGMa
 13ij+shfG9+scl7NzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=l/gUx/u3
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: fix description
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 27.04.26 um 13:28 schrieb Andrei Cherniaev:
> 1) usually user should not try to find OVMF.fd somewhere manually
> 2) board/qemu/x86_64-efi/readme.txt is trying to be duplicate of board/pc/readme.txt. We should not duplicate info
> 
> Signed-off-by: Andrei Cherniaev <dungeonlords789@naver.com>
> ---
>   board/pc/readme.txt              | 10 +++++-----
>   board/qemu/x86_64-efi/readme.txt | 17 +++--------------
>   boot/edk2/Config.in              |  6 ++----
>   3 files changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/board/pc/readme.txt b/board/pc/readme.txt
> index 18b1e3dcf0..31ca5357e9 100644
> --- a/board/pc/readme.txt
> +++ b/board/pc/readme.txt
> @@ -63,12 +63,12 @@ Run the emulation with:
>   
>   qemu-system-x86_64 \
>   	-M pc \
> -	-bios </path/to/OVMF_CODE.fd> \
> +	-bios output/images/OVMF.fd \
>   	-drive file=output/images/disk.img,if=virtio,format=raw \
>   	-net nic,model=virtio \
>   	-net user
>   
> -Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
> -firmware image for qemu. It may be provided by your distribution as a
> -edk2 or OVMF package, in path such as
> -/usr/share/edk2/ovmf/OVMF_CODE.fd .
> +Note that OVMF.fd needs to be a valid x86_64 UEFI firmware image for qemu. The
> +easiest way is to generate it during the Buildroot build by set
> +BR2_TARGET_EDK2. Alternatively it may be provided by your distribution as a
> +edk2 or OVMF package, in path such as /usr/share/edk2/ovmf/OVMF_CODE.fd .
> diff --git a/board/qemu/x86_64-efi/readme.txt b/board/qemu/x86_64-efi/readme.txt
> index 7f69be065f..036239819a 100644
> --- a/board/qemu/x86_64-efi/readme.txt
> +++ b/board/qemu/x86_64-efi/readme.txt
> @@ -12,17 +12,6 @@ Build
>   Emulation
>   =========
>   
> -Run the emulation with:
> -
> -    qemu-system-x86_64 \
> -        -M pc \
> -        -m 1024 \
> -        -serial stdio \
> -        -bios output/images/OVMF.fd \
> -        -drive file=output/images/disk.img,format=raw \
> -        -netdev user,id=net0 \
> -        -device virtio-net-pci,netdev=net0 # qemu_x86_64_efi_defconfig
> -
> -Optionally add -smp N to emulate a SMP system with N CPUs.
> -
> -The login prompt will appear in the graphical window.
> +    output/images/start-qemu.sh
> +or
> +    output/images/start-qemu.sh --serial-only --use-system-qemu
> diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
> index 2620c79076..a2ea1180f0 100644
> --- a/boot/edk2/Config.in
> +++ b/boot/edk2/Config.in
> @@ -12,10 +12,8 @@ config BR2_TARGET_EDK2
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	select BR2_PACKAGE_EDK2_PLATFORMS
>   	help
> -	  EDK II is a modern, feature-rich, cross-platform firmware
> -	  development environment for the UEFI and PI specifications.
> -
> -	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
> +	  build EDK II (and OVMF) to have capability to boot Buildroot
> +	  in QEMU (UEFI mode)
>   
>   if BR2_TARGET_EDK2
Please don't remove the upstream URL. If it's incorrect/outdated update 
it and note the change (ideally with reference) in the commit message, 
otherwise keep it as-is.

Also, I don't think it's good to remove the general package description, 
better add a sentence about it providing OVMF for booting in Qemu.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
