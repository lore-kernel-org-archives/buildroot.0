Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866A8C52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F87840112;
	Tue, 13 Aug 2024 20:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIFQgPaXnrub; Tue, 13 Aug 2024 20:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9488401CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9488401CE;
	Tue, 13 Aug 2024 20:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4F61BF84C
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 20:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB57640352
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdtaFUp52YfE for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 20:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2A4640247
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A4640247
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2A4640247
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 20:13:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0506113F88D;
 Tue, 13 Aug 2024 22:13:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 13 Aug 2024 22:13:36 +0200
Date: Tue, 13 Aug 2024 22:13:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <Zru-cKO4R3cz1NRF@landeda>
References: <CAGt4E5tNuugDABr-goDwU2csVNOAaKp=GqS9B-3KZcMjmaxKYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGt4E5tNuugDABr-goDwU2csVNOAaKp=GqS9B-3KZcMjmaxKYA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723580020;
 bh=INi288FGAqLFrC0ImvDpE950KeYHkARgeVLVpiu3nZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jMR1JwFd/dO/mkXlYupoI39yWh+uWdNqtgji2xA1L32iOPXNhPfQsWDlRqfdyTYrP
 7NfBT30TlHhL4cd7pLt2WYtxiSLC/UdeT1wcvwg30pht4YtklXNBpQyUQGmcyovDlE
 5eqYq7MIoMJdJI9SA2qt0+2Roa+MHJE6v5y3DWLc/kOoOgzxK0OXm6jtx0y2uz43jv
 WV6GC5K/n6CHwwt5+bOndgncZtr/CS7oqxZdl1laaTBHHJnXy13Fxpg79ThL72LZ3Y
 /2pKxljdKdg3REyhiIGKGUVLvyjW2tZPZBNbe8XjHwAPfCg7oMXKcdXP9+RXu5VKDC
 9P16MWyxpNsCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jMR1JwFd
Subject: Re: [Buildroot] LLVM builds broken by "-z text" (3a39e706a91a)
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Markus, All,

On 2024-08-13 13:02 -0700, Markus Mayer via buildroot spake thusly:
> It looks like I am always the one finding corner case build problems.

Oh no, you're not alone! ;-)

> Here is another one.
> This commit
> 3a39e706a91a package/Makefile.in: work around buggy buildsystems wrt LDFLAGS

-ztext, the gift that keeps on giving...

[--SNIP--]
> The problem stems from an incompatibility between clang and GCC in how
> they treat "-ztext" vs. "-z text". GCC doesn't care, but clang only
> works if there is a space.

Damned, it was not fine afterall...

[--SNIP--]
> What is the best way to address this without breaking other things as
> this seems to be quite finicky?

My @work alter-ego just sent a series that would hopefully help in this
case:

    https://patchwork.ozlabs.org/project/buildroot/list/?series=419144

It would be nice if you could have a look and test it, if possible.
Otherwise, please send him a defconfig, he might be able to spin a build
tomorrow...

Regards,
Yann E. MORIN.

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
