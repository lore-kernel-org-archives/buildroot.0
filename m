Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C653FCAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 21:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E20584740;
	Wed, 17 Sep 2025 21:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8aU66q4Jr1t; Wed, 17 Sep 2025 21:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8AA184745
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8AA184745;
	Wed, 17 Sep 2025 21:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 453BBAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A93841484
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epqvB086bvZm for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 21:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 563404142B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 563404142B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 563404142B
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5EDB35FFA3;
 Wed, 17 Sep 2025 23:07:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 23:07:20 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 23:07:20 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250830163944.1444066-1-ju.o@free.fr>
References: <20250830163944.1444066-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <fc5fd1fcded4925bda344d61d5faeed5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758143243;
 bh=hwEVYe1xwUxTD5ahJQCxd/Sj3modqBrCc/wyVx9Y0bs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g+o0uljKAUDo3OoVX+H20vge/2tRjyz0lIHrDP19VKaYptQn0geLlzdnYAITCoGup
 AjBjX0TySLHNpeALOPA1Yyt8e55HDsyc5/Nj9DnJ4fy1XxbSHQMXBbjV0YAYyk6B4/
 dh7msU2f2LEILQiT0c2CT5lfSFfyn0TnpxZb/6rNGRZ/tiO6Pcu802RiqKVKHAAb58
 AJTE7VUQ5bioY97+w/LZw+CslgQkDFtby8TkSNCeMjZwQ7xk6ibe4ET9pzGzMhHyIu
 +dnLysjTOxftI5cInfnama4mfVOV+FP6kZzbxClbKl9DJCezTBOMj5rhzIbjR747gn
 YCYBt3WEpWOew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g+o0uljK
Subject: Re: [Buildroot] [PATCH 1/1] configs/qemu_aarch64_sbsa: switch to
 neoverse-n2 (armv9.0a)
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/08/2025 18:39, Julien Olivain via buildroot wrote:
> The SBSA Reference Platform was updated to neoverse-n2 (armv9.0a)
> in Qemu v9.1 [1].
> 
> The Armv9-A and Neoverse N2 core support was added in Buildroot
> commit [2].
> 
> This commit switches qemu_aarch64_sbsa_defconfig from using
> Neoverse N1 (armv8.2a) to the Neoverse N2 CPU (armv9.0a).
> 
> For reference:
> 
> BR2_neoverse_n1:
>     # cat /proc/cpuinfo
>     processor       : 0
>     BogoMIPS        : 2000.00
>     Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 
> atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
>     CPU implementer : 0x41
>     CPU architecture: 8
>     CPU variant     : 0x4
>     CPU part        : 0xd0c
>     CPU revision    : 1
>     [...]
> 
> BR2_neoverse_n2:
>     # cat /proc/cpuinfo
>     processor       : 0
>     BogoMIPS        : 2000.00
>     Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 
> atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 
> asimddp sha512 sve asimdfhm dit uscat ilrcpc flagm sb paca pacg dcpodp 
> sve2 sveaes svepmull svebitperm svesha3 svesm4 flagm2 frint svei8mm 
> svebf16 i8mm bf16 dgh rng bti
>     CPU implementer : 0x41
>     CPU architecture: 8
>     CPU variant     : 0x0
>     CPU part        : 0xd49
>     CPU revision    : 3
>     [...]
> 
> [1] 
> https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a
> [2] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/9845bd4541cb03e97e577281f3c64f00c6ead881
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied on master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
