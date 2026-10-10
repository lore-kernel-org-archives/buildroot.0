Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC74CA9ECA
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A54E6068C;
	Sat, 10 Oct 2026 16:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-9iHqLSWDuQ; Sat, 10 Oct 2026 16:01:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 606FC60632
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791648091;
	b=mhZ5FxVea+S5tek8GIg0Xar40587bsLHAKyRGT4cdi3cVeWcOItrUPawLg5YNGmMajNF
	 vGB+ri/3ar8w5Ro+GoIYdWbKAAq1ZnuUdatRoQRVEJdZHeM8Mxkb+u9bOLKbofXt60uVO
	 aQumn2ALEejpxsJGHxNd5Ycb8+MfO7h1TyhAMyvmoglRMjU2EGzBpk7sH+apPFbCkCx25
	 E/xSSuwDa+jPZnn9pYpqzSazy8mp80C511l1F8u36qC+F6KXFPg4OvA+Gg5N7m24lCtp6
	 GtQvB1J1RK00Xp+XFuKJcB7lLDwK3IUwhuZDJ8D6/OIJ6OuzmR4hMjoLEGhD32O8k0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791648091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=PiGB9zUUsPqQtqL+H9c+XT22cwCAHfiea4SBp+TIcJI=;
	b=EsEDvex+mje8xbT0tVVFOSu9/U/sSdog4gSjN8RYth8Zf3wwo+w0b5l5YejFFVAMgK0i
	 r7M9DzxSwWqGEMppdS/npPw6UPYexgcnqPaZVsj/KSg2+/AfW1Hv9LG46fwFonDvVhKH1
	 +sOYIw34n05s1YzOXQPgIfl1cfYSNJEMEiE7j+R8n405WL40SRjqwzYmDPDAL0j7KWkf7
	 rV+OmcT1J5mxGMKFvs/GpfDZHH+Xr6O0k9PHzqtaq64cZHnKPKpkb5ia4RR6IIMTaC+Ol
	 NU1U5cG1oVpCK388Mz+dyJn9gGo8RsayewK4EWVnt1/mZ79SmusvfikB2eHxWJ052pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791648091;
	bh=PiGB9zUUsPqQtqL+H9c+XT22cwCAHfiea4SBp+TIcJI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=km5g7f+k2WRhOxxBnjyXXACNNP4UZW7YXASDJe2OdpG2J4QRDUpH3GJZpLb7GtI4w
	 LYS4sjZ1gpMwuSoE7c7G2SICyTMSmctxeQ+kpSETI55k3tGyKAJqGZYb9hHnouH4cg
	 iDRoh5lkzSt1icGqtcf5mj84hqZzetlR+UKewUHhnASmaUju/EEzNZNWVlR1wcp/Ot
	 blZJ77ZaoplH/hwcBbEfdpgHPlMPWxJ6gtdoUN+FEFs8k3xTT3hrgeBaAF9953T0gv
	 op/JYBlHIVTCowoSGZIa24p4sv7PPrgjDR0EF4ErovJzO2KwVAKVTmnn3u8wCcDx4N
	 r2A9lWA+kI7fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 606FC60632;
	Sat, 10 Oct 2026 16:01:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E890317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F98E60632
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpTqhglsc0dU for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:01:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B60116062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791648088;
 b=FteiNYnTCOiYM52ptMaHGaxVe8Dy75a16rtQ77XHSSlyXuD15ulMXhqvf8NU9s4fw4Dy
 r+oI6nCHnIc3os8RcXNawGEeLE6KUNp2gTF1qCA2NbnYBCzDdjJyu9EW/sm/H+ibUeV6D
 XefOE7WgYNtDRH6P3sfAsjWmj9iqYQyqp72OQ0q0AtN/1sU4z9tS/e44gSSatJFS0k0JJ
 yJk7DsoruMWyoN0a7DEYQDE+n/145Bl1JMGUjnTl1kCdK9CQ6+Dnk6C7yC3QBNEswXBP8
 ZoFaQDmkKSfO/XwURiuXjtdMxGYtSs9J8HqCXxzmp92tkvMLj7VhPhBfOemlbR2nNEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791648088;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=jbtVeM2irz4d8rG4PTJI2xWFBobE5UsnloV+pg1BqRw=;
 b=efV8oG1UnwStfAAzdXVVdu0fUQA3KW2XZr1A3i6yjLIncwvlNUIS/OwXrypnZqPEOy6P
 yIrm3QBc1kR75EDvi8w0sdpnmkb32ugpS3udjfJTgETuPT7514LhaZrv1haHY4VczV+uQ
 lbaTxs0mQocj29QJjSh+TMsUxeJzSgKdbrmnmO+2+dmXDsW9qXuDeAoxCLXlYNmhEnJ4r
 NSWpdr/p7WfGGbxhYopBTMNmZduv84IoeUvJAqjh7MkhjtaWTmkykF43i6FGa5qerR6nm
 rzixo9BGbIQ8n0Wd4Ii5m1WfsatAd/10ujxbb/IvO1qMmWKryMcwO/VcYPn4BcCXT+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MStUtRJ4; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B60116062D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:01:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD5C0B979F97; Sat, 10 Oct 2026 18:01:19 +0200 (CEST)
Message-ID: <0f7abd2e-c14e-45c1-9189-f872d2f46da3@rnout.be>
Date: Sat, 10 Oct 2026 18:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrei Cherniaev <dungeonlords789@naver.com>, buildroot@buildroot.org
Cc: hi@senzilla.io, romain.naour@gmail.com, kory.maincent@bootlin.com,
 vincent.stehle@arm.com, ju.o@free.fr, jiaxun.yang@flygoat.com,
 fancp2007@gmail.com, fiona.klute@gmx.de
References: <20260518015612.2280292-1-dungeonlords789@naver.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260518015612.2280292-1-dungeonlords789@naver.com>
X-Last-TLS-Session-Version: TLSv1.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Andrei,

On 18/05/2026 03:56, Andrei Cherniaev wrote:
> 1) usually user should not try to find OVMF.fd somewhere manually
> 2) board/qemu/x86_64-efi/readme.txt is trying to be duplicate of board/pc/readme.txt. We should not duplicate info
> 
> Signed-off-by: Andrei Cherniaev <dungeonlords789@naver.com>
> ---
>   board/pc/readme.txt              | 10 +++++-----
>   board/qemu/x86_64-efi/readme.txt | 17 +++--------------
>   boot/edk2/Config.in              |  4 +++-

  I applied only the help text change to master.

  For the readme's, I think it should be resolved in the other direction, see below.

>   3 files changed, 11 insertions(+), 20 deletions(-)
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

  I think it's better to remove this option entirely and instead point to the 
qemu readme, with the additional note that the OVMF.fd may be found on your host 
already so you don't need to build EDK2.

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

  This is actually used by the a CI script to boot the defconfig. That's why the 
comment is there at the end. See support/scripts/boot-qemu-image.py for details.
So this _definitely_ can't be removed.

> -
> -Optionally add -smp N to emulate a SMP system with N CPUs.
> -
> -The login prompt will appear in the graphical window.
> +    output/images/start-qemu.sh
> +or
> +    output/images/start-qemu.sh --serial-only --use-system-qemu
> diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
> index 2620c79076..7d170fde3b 100644
> --- a/boot/edk2/Config.in
> +++ b/boot/edk2/Config.in
> @@ -14,7 +14,9 @@ config BR2_TARGET_EDK2
>   	help
>   	  EDK II is a modern, feature-rich, cross-platform firmware
>   	  development environment for the UEFI and PI specifications.
> -
> +	  Select this to build EDK II (and OVMF) to be able to boot
> +	  Buildroot in QEMU (UEFI mode).

  This is the part that was applied so no need to resend it.

  Anyway the two changes are pretty much independent so should have been 
separate patches.

  Thanks again!


  Regards,
  Arnout

> +	
>   	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
>   
>   if BR2_TARGET_EDK2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
