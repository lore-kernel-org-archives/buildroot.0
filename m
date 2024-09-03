Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E92CD37AE
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4819402A2;
	Tue,  3 Sep 2024 20:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRmPr7swny8U; Tue,  3 Sep 2024 20:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83FE8402EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83FE8402EE;
	Tue,  3 Sep 2024 20:41:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5D71BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C756402F6
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vkp-4rjiwKf for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EF0540198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EF0540198
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EF0540198
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:41:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9E34313F8B5;
 Tue,  3 Sep 2024 22:41:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 22:41:19 +0200
Date: Tue, 3 Sep 2024 22:41:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Ztd0b2Vu3Pq66n8Y@landeda>
References: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725396081;
 bh=bMgwCUahaGxaWrvLiYkdbLxvUKkFzIpARyidQTtj4nA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SC8BrhDQHBZl7CDl8iCIErtCSsTqoCW9MJlWlCsy4+7xrDlMMU/tEELVvFa8Usn61
 a4B4tKidcRxtoknq27vhf7RA4l9lyhFIJ7Z0kHUBq2xKcNsgglYcN1fHFnXwF0Udic
 bfdBalQzM/yn3E6G+1JQylj/yXsbrX6gbQhXu/liR2anlkkDxjI+Zp0jQNu+IMFQ1x
 8IdQ/0tD3Aq3BAaZw9obGt89UVvRWSx9N7gWuIooNVgLGWoCeGXWpqibmsicXM2fTP
 SG5xAnIl/F8LYsDaqbsyJxna3WBsCUrKnkJ+w/p9lE7T3pIa7o5lVvC2N2eM7dmZ5C
 SFiVShfZklEYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SC8BrhDQ
Subject: Re: [Buildroot] [PATCH next 0/2] Update to Bootlin toolchains
 2024.05
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-18 23:43 +0200, Thomas Petazzoni via buildroot spake thusly:
> This short series updates toolchain-external-bootlin to the 2024.05
> toolchains.
> 
> NOTE: this series depends on
> https://patchwork.ozlabs.org/project/buildroot/patch/20240810215624.482529-2-thomas.petazzoni@bootlin.com/,
> which introduces the BR2_ARCH_NEEDS_GCC_AT_LEAST_15 symbol also used
> in this series.
> 
> Thanks,
> 
> Thomas
> 
> Thomas Petazzoni (2):
>   support/scripts/gen-bootlin-toolchains: tarballs are now xz-compressed
>   toolchain/toolchain-external/toolchain-external-bootlin: bump to
>     2024.05

Applied to next, thanks.

Regards,
Yann E. MORIN.

>  support/scripts/gen-bootlin-toolchains        |    4 +-
>  .../tests/toolchain/test_external_bootlin.py  |   81 +
>  .../Config.in.options                         | 1519 +++++++++--------
>  .../toolchain-external-bootlin.hash           |  870 +++++-----
>  .../toolchain-external-bootlin.mk             |  890 +++++-----
>  5 files changed, 1758 insertions(+), 1606 deletions(-)
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
