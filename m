Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E392BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 17:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5793782CE5;
	Mon, 17 Oct 2022 17:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5793782CE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMdwduxCnyT6; Mon, 17 Oct 2022 17:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C20682A7F;
	Mon, 17 Oct 2022 17:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C20682A7F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFB011BF322
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 17:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D85024017A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 17:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D85024017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UbYN7pfGkIzi for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 17:55:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73EDD40125
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73EDD40125
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 17:55:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:388f:ffd7:682:9f45])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 362C8B00576;
 Mon, 17 Oct 2022 19:55:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Oct 2022 19:55:00 +0200
Date: Mon, 17 Oct 2022 19:55:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20221017175500.GB3666@scaer>
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-2-thomas.perale@mind.be>
 <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666029317;
 bh=updv0jiZRP4iFS2fkSztZVk/Lx3xanQSXCWaNZqD3UQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ljvphgGgocI0PaMZlmJEhlaDBQXuQLRt4YwuYngAguV2WjVeDovlY/PdgwsrjX1Dj
 KKtuYhaBGGEETu+8FyDvpos6VjXED4gM0TtVrTu6N/k59+xcJQ7cTp8v8kg5qP0uUA
 52feDUPLSEeO2jpxBS6oboU4dhkvn93gm058a9fn0gcnbkt5er9dNY4bVQNGpZba3m
 el34JM5Tikzy9IYPr9cYbv6Ual6egzGuYCNcze4Uj6D0Tie+hba9hfqlnJuNiNjUE9
 LcZIAMO7Ca2CZ2O+C5XOPoaadvomhCNYmFhpQ4aF0qVC91iXnB06zAjOfGwy6s8LC9
 Vem4TsW7x4obA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ljvphgGg
Subject: Re: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-10-17 09:06 -0700, Christian Stewart spake thusly:
> On Mon, Oct 17, 2022, 7:29 AM Thomas Perale < [1]thomas.perale@essensium.com> wrote:
>   This virtual package implement the already existing go compiler compiled
>   from source and shows it on the host package menu.
>   The usage of a virtual package on top of the go compiler enable the
>   supports of for multiple providers for the Go compiler.
> Is it not possible to continue using the existing host-go target and
> simply add a parameter which enables downloading the precompiled
> version instead?
> Rather than add a new package.

In fact, we want to have a similar implementation for rust, go, nodejs,
so (without looking at the details of this series), I guess Thomas
Perale took the same approach as the existing rust situation, like
Thomas Petazzoni did in the recent host-nodejs series:

    https://patchwork.ozlabs.org/project/buildroot/list/?series=319967

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
