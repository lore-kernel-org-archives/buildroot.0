Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BF4CCA472
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 21:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900F481C6E;
	Sun,  5 Oct 2025 21:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFJ-VBkZjzcZ; Sun,  5 Oct 2025 21:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C11981EAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C11981EAE;
	Sun,  5 Oct 2025 21:16:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD4D272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 21:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA7840CC8
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 21:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQmcBY_toxKx for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 21:16:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BB8240C8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BB8240C8C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BB8240C8C
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 21:16:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 777D85FFB4;
 Sun,  5 Oct 2025 23:16:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Oct 2025 23:16:31 +0200
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 23:16:31 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251005113846.3940440-1-peter@korsgaard.com>
References: <20251005113846.3940440-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a0837005bddaaece56d78bce2c55d6d7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759698992;
 bh=2CeripdaZ4hpIAt5IbcXbo2ZohmoVI2mAKlkSeI/8HU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zf+cwlNn+2qcmYHo8qIW74MCtvrD4GEoLKmHBEWd6LHIaHK/6wFF7ZI3jgFzGIbTi
 JkYM6SDOfNcjU6JfNGOfUvgazx+0/Bf1ZYTVICT5rPfDxm8l1fCS+wo+05co0LfdZi
 iIF/iSXJgbvizq1xi6wquLiuBU6urnWNOgjK6zT7tKx2NQGBS2YiRSaTn4lt3rPSXc
 JfKE+nvErBWUDz11vLeagv7AcMqIoH1gHyBkjA9aCmRR4ySRh0Wu06T5Tn44dlHaSV
 C/DloxUk1TLrT2M/cgGhvNowhU5yBbY9cB/q3v3m9vG5Rp9HVvtPvoA3JMdMbZ8bES
 t4SFYIXUIZovg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Zf+cwlNn
Subject: Re: [Buildroot] [PATCH 1/2] configs/beagleboneai: move to u-boot
 2025.04 to unbreak build with gcc 14
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

On 05/10/2025 13:38, Peter Korsgaard wrote:
> With the change to default to gcc 14.x with commit 1e1fafa1f0f5
> ("package/gcc: switch to GCC 14.x as the default"), the old u-boot 
> version
> no longer builds:
> 
> board/ti/am57xx/board.c:948:17: error: implicit declaration of function 
> 'do_cape_detect'; did you mean 'do_board_detect'? 
> [-Wimplicit-function-declaration]
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11570241744
> 
> So move to u-boot 2025.04 to fix that.  We still need a small patch as
> (early) beagleboneai boards do not have the EEPROM (or eMMC partition)
> populated, so include the bb.org patch from
> 
> https://github.com/beagleboard/u-boot/commit/0b161f8e89a411fe54059cf1d0ba61354ee1e8a2
> 
> The new u-boot version needs both openssl and gnutls on the host, so 
> enable
> them.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.

For info, I fixed a check-package error by removing the stale
entry in .checkpackageingore file. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7ec419fb9c07292dc28b87ccb0ed35b00437dd16

Also, if you still have your board available for testing, I suggest
the following maintenance followup patches:

Could you fix the shellcheck warnings in:
board/beagleboard/beagleboneai/post-build.sh
and remove the .checkpackageignore entry

Could you also switch this beagleboneai_defconfig to use a bootlin
external glibc stable toolchain please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
