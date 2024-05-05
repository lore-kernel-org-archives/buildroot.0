Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7BEC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 20:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD9A2403AC;
	Sun,  5 May 2024 20:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rts_pDkrj5b; Sun,  5 May 2024 20:14:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70DEE40361
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70DEE40361;
	Sun,  5 May 2024 20:14:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10EAE1BF38A
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 20:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F202F80C98
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 20:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1L3D07hlNnd for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 20:13:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A83CB80C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A83CB80C19
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A83CB80C19
 for <buildroot@buildroot.org>; Sun,  5 May 2024 20:13:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 14DB713F81D;
 Sun,  5 May 2024 22:13:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 22:13:52 +0200
Date: Sun, 5 May 2024 22:13:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZjfogMZgEtaE-G_B@landeda>
References: <20240505195943.176708-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240505195943.176708-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714940035;
 bh=pFo+WWHkEzMDGptVhgtO7lViJEeSSSp5mUyjGCEQZk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egMSt3/woaOPGX6iDXKFllERdPAjBPpuX+vZZ8zhwaKraKtNekrWJqHBVuXKXSwrN
 ShCsHDXkk5znJ7Mb6aNA06Gen7PEergTsffcXFW0gks3O8PRWmg2b6Ed6/ein8sbqs
 5pTEzNr6lJwvK5w0zB1rcsrTqyoEWMx+0yEnsMF1BI6ll7/DCdcMfHctkKn7l/cf/O
 8CGv5NpBQ+Ho8y8CE00LHJy8i7xASEswcmGH1thN8fN95HIuPH8XUmQ3bpXm/XkqDi
 gmdzwuVvChRx6JF832nsAqxH+zLSCsgogLOBF15SFSQqVc3P7L4/BQP/nKiCZGG+sB
 aUrQ32ZeZN7GQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=egMSt3/w
Subject: Re: [Buildroot] [PATCH] configs/sheevaplug_defconfig: bump Linux to
 fix binutils 2.41 build
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

Peter, All,

On 2024-05-05 21:59 +0200, Peter Korsgaard spake thusly:
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770801
> 
> The Linux kernel fails to build since commit e88225ed882 (package/binutils:
> make 2.41 the default version):
> 
> arch/arm/mm/proc-feroceon.S: Assembler messages:
> arch/arm/mm/proc-feroceon.S:587: Error: junk at end of line, first unrecognized character is `#'
> make[3]: *** [scripts/Makefile.build:430: arch/arm/mm/proc-feroceon.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> 
> Fix the build by bumping the kernel to 4.14.336, which includes commit
> 3ab03df64f77 (ARM: 8933/1: replace Sun/Solaris style flag on section
> directive):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.14.y&id=3ab03df64f7754728a2257c47775a70a88428331
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

As I recently explained to other such patches [0] [1], please enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y. Also, you're no stranger to this
topic, are you? ;-)

[0] https://lore.kernel.org/buildroot/ZjepViPtMWJL05DF@landeda/
[1] https://lore.kernel.org/buildroot/ZjeDWeQ-Jnutgk0G@landeda/

Regards,
Yann E. MORIN.

> ---
>  configs/sheevaplug_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
> index 7f186df22c..0879f17071 100644
> --- a/configs/sheevaplug_defconfig
> +++ b/configs/sheevaplug_defconfig
> @@ -27,7 +27,7 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.253"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.336"
>  BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
>  BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> -- 
> 2.39.2
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
