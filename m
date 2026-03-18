Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7991E10775EA
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31D9C60B9F;
	Wed, 18 Mar 2026 17:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZ9A0Ovv82Ra; Wed, 18 Mar 2026 17:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E48360B99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773854330;
	bh=e7rfmeVKRYk1qSvxZ2FbyUc9f0aNfKLnGGFdWmVJbTk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3JtqkmUsejwBqKEzyuSHTyQVm6rCr/t+KI37nDhf1/D2kPRXTBEuBT4ub5CKJydX
	 M9U1U6nIRgOnH23kHtKOaRo6WJmwzG5Dbr3m8nlFGTB/SqcxGpbxBYJ2m3HXPJ9p1j
	 YsdljYcqEnMxR1EQbEC4LRAq45kGx528QjEXBHGDdSX1JJC7p1ye5BKyer+ZlubuLN
	 xq/th/GXGGRwBc+W9CutCM/jMuzK4zGtiTAMhsIZQ8wOCoprBwXvZRagPYmTGb9luw
	 uz66D5nTr93tItKErfNMPvhzCwbaS3I0yFWaxVEF2dbvX/uZl0VBVVD8/3QO9fUuwj
	 4ze5u6RsAPQJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E48360B99;
	Wed, 18 Mar 2026 17:18:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 9A2211BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 17:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 7FD5F60B99
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 17:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id cepibljGhUw6 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 17:18:47 +0000 (UTC)
X-Greylist: delayed 89869 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Mar 2026 17:18:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E736F60A57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E736F60A57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.62.58.211;
 helo=out162-62-58-211.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com
 [162.62.58.211])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id E736F60A57
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 17:18:43 +0000 (UTC)
Received: from [IPv6:240e:305:188b:e000:5514:8cc:d096:60f1]
 ([240e:305:188b:e000:5514:8cc:d096:60f1])
 by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
 id 496B7C14; Thu, 19 Mar 2026 01:18:22 +0800
X-QQ-mid: xmsmtpt1773854302t5zks7qrj
Message-ID: <tencent_0A8A800AA74C8ED726C0C63D03BF2A889006@qq.com>
X-QQ-XMAILINFO: NR0nbiez9+mayKZXCdWquysFHlSV/bQtVz7oMmzS9JEm9PpMzgaUnZ8VqwZuda
 LAzBQlgLODinosSLVOKbBwOW0BMyEigTCK8vzbjaP1ZhccDuJis9jw4A/EVHrnZAv4KIo5p9UdSU
 sfrG93xJZw1j1E+ogBxgA8DjfaRe/g6t+hMFqXDT8M92Y7lCOZWRKNpcjo7dhItzIKss61ncM1f1
 GhI9gRH0hv1E/0/byczdau9Uyv1HuwgQZBru0bmiysgdTrOBRrsvjF7cruNg17d/KZ9XG5Ufcvzj
 AeHDCC2j9cXG/88KaLD9SGIaQ90wTLpGhXJs9OE9hPymmVQ70N8YIEogKyPthIYyQEeh9puRJeL/
 8fz416ebqvTOhL00FX3rJ+BIsETvrmcbfnlFNiUtI9I3Ifx+jQ+t/s/LLZWuk2cOR5OHcjNrr2b6
 9S+LY84F98HyDl4wZVkJboBGVsQe444yUiQszoPEeuLGoKytIxAjCuR/UQJ6kmCpec3pXQE8obNl
 OUIZSyp7od56Wdg6oT2XSvUIOGYUGGaCLYZx7hoaZR8yq7IquzRv0yaLg/6kL4DzNn0abYS/lEQ3
 2nDC/o7/O/g2205EAZL+sSOBhGXl6dHe9FEolX5hNULrYtiE4MWk35a4XFiFY5lnNYRaw2jpA56/
 ZHKwcpaEs1rf2Z31tvvMhECYuo6mvk20dX45piAjiDHH8V+gRxUz5d8vbq2M5+7ebRf9qhnGLz0p
 nSDoimn8u69qy9IeCSZlHcs1UhVx6E305yNePqrMKdV8dVxeHM+pMj8GtoltvKhhE+ryk6P11mFL
 og51ya04f1w4kIZbDZwvVVK4mU+OGZfIM2pNTEFmE8CouPOgwiukMPXDbNF7ULp/z4lDypGIKBTo
 zVEal9jc8afs4Xt8Jyy9S9IDjJborMM4HGVvjpyXSW3juxVXF0imQeJFLlhsvDPmoNquE7GNwI62
 IZm4GgyXkSTQmT/xo6qTb4jfGp/8dBcdYkIOWfyhOtnCHOIbWcM6S4waLaHlgYKqn+Mb7yhbkdSn
 I1edcOXThnmO/OXuZdpbG2PKiimhe0og8WPjefjkZ92vDUBir7mMbOUeIS8kXymZXAmid+gQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-OQ-MSGID: <9b2b83cf6180f85f039e2ed68d5ef5cd85d8f8d5.camel@foxmail.com>
From: Dong Wang <wangdong115@foxmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Mar 2026 01:18:22 +0800
In-Reply-To: <b61cf12529bb7e8a109089686adbbb74@free.fr>
References: <20260317161759.36050-1-wangdong115@foxmail.com>
 <tencent_050C53AA1542B502959C63391A9BC01BC208@qq.com>
 <b61cf12529bb7e8a109089686adbbb74@free.fr>
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1773854317;
 bh=JxreA6qYzWWR9bqSO9vnC4IYxxI/MW3Refs/GjGcjtQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=fT2Dv3JS/g6LTiBfzpF4jCv9a3ufS9N8QIiPp7zG7/45B4PfA6pIpYsOOmRA45jAv
 vfifgqzQhR2F1OW9f1HRdKUYnKYLM8Z3wBH4FIlXfOlpsntMJYfPxTIKZ7Yj37GiUS
 VoR01Ixv1EiSknQfmWCezYlztIwOpT+vvEacU2oU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=fT2Dv3JS
Subject: Re: [Buildroot] [PATCH 1/2] configs/friendlyarm_nanopi_neo: bump to
 kernel 6.18.18 and U-Boot 2026.01
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

Thank you very much for reviewing and applying the series!

On Wed, 2026-03-18 at 13:21 +0100, Julien Olivain wrote:
> On 17/03/2026 17:17, Dong Wang wrote:
> > This commit:
> > - bumps the Linux kernel to 6.18.18
> > - bumps the U-Boot to 2026.01
> > - switches to a stable glibc Bootlin external toolchain
> > 
> > The updated U-Boot should also fix the CI build of the board.
> > 
> > Fixes:
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392712
> > 
> > Run-tested on the board.
> > 
> > Signed-off-by: Dong Wang <wangdong115@foxmail.com>
> 
> Applied to master, thanks. For info, I made few minor corrections.
> See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/916331b9172a9aca28edf8492f323bbcf1996c30
> https://gitlab.com/buildroot.org/buildroot/-/commit/367e9bb04bc301fced2846f0f81b0440cc10b317

I should really have read the documentation more carefully and run the
check-package and try building with docker...

Thanks for the corrections!

> 
> Best regards,
> 
> Julien.

Best regards,
Dong Wang


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
