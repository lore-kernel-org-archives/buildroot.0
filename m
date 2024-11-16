Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06B4D68BF0
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 21:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6256D84A10;
	Sat, 16 Nov 2024 21:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoBRwRVhButQ; Sat, 16 Nov 2024 21:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8102084A09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8102084A09;
	Sat, 16 Nov 2024 21:12:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FFB51EB8
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 21:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DB8384A09
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 21:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNQdCS-JP2qa for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 21:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 023358474F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 023358474F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 023358474F
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 21:12:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8CBD42003B4;
 Sat, 16 Nov 2024 22:12:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51554])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 22:12:25 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 22:12:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20241116182919.4169370-1-dario.binacchi@amarulasolutions.com>
References: <20241116182919.4169370-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3dc371dc34f06ee3f5b20da8c32c14b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731791547;
 bh=8ZE47wFAjjKoAE0zunOsJD2yiAbmKi5uVQhiwgEk/TI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=meBIn2FreTejRQiTId42ORrkKExL40P6gUl1f3+g0fstgSznYxwK5SiZ2TKVSA+h7
 TgieyuaykqdBFSgJdB6qBp28BWjZ04rBYnwkT+6F4t4t/GHK4fVFKh/64tkOVKOQeq
 u/NUD5fm9d3pGYXTdRY/vSQvNTveePrySNiTJr6kTaG7iLEInzLjpmBou0bR7fisvx
 MIYM6FUUarjctFDQ7AbUed7bQyxCklxYc5EGyRVa7Yj4GQBUtjUHHW59toyTcytOAW
 R6WqAH/fQ2g/lBAYP/g7gre0pVRrg9xGqewu5a8UVgoAw8qrOQawAK4BaFSfoYrL/Z
 9Csh1oOZGjQpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=meBIn2Fr
Subject: Re: [Buildroot] [PATCH 0/2] package/armadillo: multiple bumps -
 14.0.{2, 3}
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 16/11/2024 19:29, Dario Binacchi wrote:
> I submitted the patch for bumping armadillo package to version 14.0.2
> some time ago; in the meantime, version 14.0.3 has been released.
> I'll send both, let me know if they should be kept separate or if I
> should squash them.

I applied on next your original submission for 14.0.2 at the same
time you were sending this series. I also applied this 14.0.3 bump
on next. Thanks!

> Dario Binacchi (2):
>   package/armadillo: bump to version 14.0.2
>   package/armadillo: bump to version 14.0.3
> 
>  package/armadillo/Config.in      |  4 +++-
>  package/armadillo/armadillo.hash |  2 +-
>  package/armadillo/armadillo.mk   | 12 ++++--------
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
