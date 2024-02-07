Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18611C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE901829A9;
	Wed,  7 Feb 2024 11:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jxv61K7pI97a; Wed,  7 Feb 2024 11:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C537182ACA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C537182ACA;
	Wed,  7 Feb 2024 11:10:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 656221BF599
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ED89404CE
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pm7yeoT29oSe for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:10:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FED340318
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FED340318
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FED340318
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:10:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 07DDC13F8A2;
 Wed,  7 Feb 2024 12:10:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 12:10:25 +0100
Date: Wed, 7 Feb 2024 12:10:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <ZcNlIaMSPs2_IVpV@landeda>
References: <20240206090048.2214719-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206090048.2214719-1-marcus.folkesson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707304228;
 bh=Qeqv/XXq2lQg/KShSvksLe+cYa3RrNYOXkkw9tfVHMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KKFAGQ+8YWiq3fnB1KXSXZdvZz48X4usD6XFgIJ9wR1JvsNzh1cYA4pT/+1/3jQgv
 f5m8GFkmsQWtyAxdwYhWgWe4IE8K81/XI0w5wFa3Nv9ILE5a9a+IYCwMoDplzD3oKE
 jleoW+NODri5HQ5rk827BxXI3GdPWLmSuHCmm3zU1uqMbNyN14UvaYmy8Sdw8DMFtr
 qv0IZge+8av4CAVCOwxWZEMIpj2HzraDi/R+4Ll5PGpOoLsUeNSfxVWVO3+H6rPkJe
 FjUN4lXNy04LIqK2kh+DWT8mPO7y6dqmPZj+PStas2NfjFVFNz5LRai/wVAb1Xdd5q
 rU++PTByzbEFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KKFAGQ+8
Subject: Re: [Buildroot] [PATCH] package/makedevs: describe the recursive
 type in the README
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

Marcus, All,

On 2024-02-06 10:00 +0100, Marcus Folkesson spake thusly:
> The recursive type is described everywhere else, so add it to
> the README as well.

Instead of updating the README file, I removed it and repalced it with
a symlink to the corresponding section in the manujal, to avoid
duplicating the documentation.

Indeed, the manual section for makedevs was already recently updated,
but the README was missed. Having the symlink will prevvent the two from
diverging in the future.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/makedevs/README | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/makedevs/README b/package/makedevs/README
> index 70844bf802..6c583609a5 100644
> --- a/package/makedevs/README
> +++ b/package/makedevs/README
> @@ -26,6 +26,7 @@ where name is the file name,  type can be one of:
>  
>        f: A regular file
>        d: Directory
> +      r: Directory recursively
>        c: Character special device file
>        b: Block special device file
>        p: Fifo (named pipe)
> -- 
> 2.43.0
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
