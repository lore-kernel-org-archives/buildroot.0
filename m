Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B90C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 293DE40129;
	Sun, 18 Aug 2024 07:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1XYMaBy2K0i; Sun, 18 Aug 2024 07:20:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB5ED4025D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB5ED4025D;
	Sun, 18 Aug 2024 07:20:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C2B51BF41A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 684BE4025D
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id An4a3r8H6RBX for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7DA3F40129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA3F40129
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DA3F40129
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:20:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EE2F713F8A2;
 Sun, 18 Aug 2024 09:20:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Aug 2024 09:20:49 +0200
Date: Sun, 18 Aug 2024 09:20:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsGg0R9GcsvIhA6y@landeda>
References: <20240817220208.929073-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240817220208.929073-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723965652;
 bh=HY5Rba32njNlx7i69Ek+QGPs2H9y8xbn9bZWqGqgfD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pcUZCfqbsX7SdwmDuEcMibhcdTrtxO/iBLGKDSKzIVoQsLd4vQN7VYSb+MPNqSNc+
 uPBdgWVs3oKp62KZD0oliRJcb1iGak9OuiptTQ7BpV4bQpo6Go4Pnuq2jif4+a/l0D
 FvDO03rXWccEKtL8fiMGXZVjRn1c7LHFH+1+9eDugDE0JcRGIoxUuVkWGLDGSC9pAw
 vWzl71DXtKI175E9MEkU0G4L34bqg1+IePa/iQlHmb2Fq/VVgTYoF9GF7d8OGM3pfS
 MZ4FlxSgf8FuLXwGz0sRIAfhzlVNx/9AXLL4A3v1X15Hw2vAjAWSuZXv45rw2pS3Ew
 N2U6DyOnCk2+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pcUZCfqb
Subject: Re: [Buildroot] [PATCH 1/3] package/gnu-efi: disable on ARM and
 AArch64 big-endian
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-18 00:02 +0200, Thomas Petazzoni via buildroot spake thusly:
> Since the bump of gnu-efi to version 3.0.17 in Buildroot commit
> fa9893ad8fb94278d7e8b80cd3e795469223faf0, the build of gnu-efi fails
> on ARM big endian and AArch64 big endian.
> 
> Indeed, since that bump, gnu-efi builds some "apps", using a special
> linker file part of gnu-efi that explicitly sets the architecture:
> 
> OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
> 
> OUTPUT_FORMAT("elf64-littleaarch64", "elf64-littleaarch64", "elf64-littleaarch64")
> 
> Due to this, big endian builds are now failing:
> 
> armeb-buildroot-linux-gnueabi-ld: ../gnuefi/crt0-efi-arm.o: compiled for a big endian system and target is little endian
> armeb-buildroot-linux-gnueabi-ld: failed to merge target specific data of file ../gnuefi/crt0-efi-arm.o
> 
> Since we are not really interested in supporting gnu-efi on ARM big
> endian and AArch64 big endian and it is not supported upstream, let's
> disabled on those architectures.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/4d385d6759346e19664d0bded1e419f004f82b47/ (ARM big endian)
>   http://autobuild.buildroot.net/results/b6df43408ca4cd469962c96d49d9ac7935b6dbe9/ (AArch64 big endian)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Whole series of three patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gnu-efi/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
> index 4f44cf9f64..012324712c 100644
> --- a/package/gnu-efi/Config.in
> +++ b/package/gnu-efi/Config.in
> @@ -1,9 +1,8 @@
>  config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_ARM_CPU_HAS_ARM
> +	default y if BR2_arm && BR2_ARM_CPU_HAS_ARM
>  	default y if BR2_RISCV_64
>  	default y if BR2_aarch64
> -	default y if BR2_aarch64_be
>  	default y if BR2_i386
>  	default y if BR2_x86_64
>  
> -- 
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
