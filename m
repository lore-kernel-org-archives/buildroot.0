Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1035E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 18:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F088113B;
	Mon, 30 Dec 2024 18:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YO62fptmcftQ; Mon, 30 Dec 2024 18:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 787B18114A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787B18114A;
	Mon, 30 Dec 2024 18:32:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D055BCA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A9F58113B
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1S5HfBHj_6UP for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 18:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EE1681126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE1681126
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EE1681126
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:32:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B34E160139;
 Mon, 30 Dec 2024 19:32:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42818])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Dec 2024 19:32:50 +0100
MIME-Version: 1.0
Date: Mon, 30 Dec 2024 19:32:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
In-Reply-To: <20241229123751.639378-2-thomas.petazzoni@bootlin.com>
References: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
 <20241229123751.639378-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2fa5ea72633f26f7fa5a01a31bb7c4ba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735583571;
 bh=03lcBXk14qDSHwvtZPKb8AxhOL5x30HfC/Vn9V21WoI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=od/ge5Wbu+/x6mtluJ+g/PpU5D6zelwmVP7HVmI/R1unNhtTcxTTT52pbDnOj/rFC
 MfKLYf6Jh9gxo4ipexNUO7vO95weW7KpHcd/FpJqrtIw9PqrPOc7DIhQaOOg1HB29U
 xJlh5q0kZQ05EDAOLwhqz0+WFJy4/G49b0Nu+Y+1SgVydCj4UYTRAQnt6ZPehV2xCI
 ng/zm2UiXEOea2g4B/HlRTot6IfaNXQw+Ut7eRr2tU7TeXVfc5B6dHSdhxUtKC62XB
 pHEfQe2oPAHZ6y8BJcnnG+AsmOcZWYC3+TrmsxuoTh3QrsMje7nC/jWRmbh1LJTHD+
 7e3iDOArA/yKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=od/ge5Wb
Subject: Re: [Buildroot] [PATCH 1/4] linux: select host-uboot-tools with FIT
 on mips
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

On 29/12/2024 13:37, Thomas Petazzoni via buildroot wrote:
> In the latest kernel, FIT images are always generated when building a
> kernel for MIPS. Note that we build the kernel with:
> 
>   make all
>   make <selected-image>
> 
> so the selected image through Buildroot options doesn't matter: a FIT
> image is always generated.
> 
> Therefore, in order to fix autobuilder issues, make sure
> host-uboot-tools with FIT image are always selected when building the
> latest kernel version. We do not select it in general as custom
> versions may be different.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/24bd5ae44f4097c374fe43b263254a985e2989d2 
> (mips)
>   
> http://autobuild.buildroot.net/results/d18b458a600f1f4bd7008d13ad2a56cb22ce8a73 
> (mips64el)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
