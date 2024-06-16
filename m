Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995CCC27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 20:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DC7240105;
	Sun, 16 Jun 2024 20:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EC9jOSIr6uVZ; Sun, 16 Jun 2024 20:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 211CA404B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 211CA404B6;
	Sun, 16 Jun 2024 20:43:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5231BF2BB
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 20:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7823E81F75
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 20:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RoecCJKUnkq for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 20:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DAF481DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DAF481DF9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DAF481DF9
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 20:43:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8DBAE13F8C2;
 Sun, 16 Jun 2024 22:43:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 22:43:18 +0200
Date: Sun, 16 Jun 2024 22:43:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zm9OZq0a8stlLLKh@landeda>
References: <20240616142048.1001850-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616142048.1001850-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718570602;
 bh=Zgk6fE5tcgX593noSa/qKwrRx12xnEBCtqCpcb73sXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t7pm5BFnBm0CftXyNc2agy5/luQBEzlIPctAosfKJojI1fjrlB9+0SBDab3r58yD2
 9dGd8r6W2UHTp6UPUadA3DVv2SbQXMELfDcLTy9ltvg4RzTrAPjVPh9WA9/8TeGjsT
 /70/IRkfwsws2RW7UNSmmgEavXcWC9pPjm1WNlr3o5foqJgMOyMrIrSId/qa0vfk8/
 9vWwER/QDTqLYRxSbyhlYWI4y22XSbuR8c6ay+jkINwn0FiCEc1crqghjk/XIJ+FWQ
 8qjmTfR9lACu0h3rFrMt0hmYdqaVqkhrYFDa4jhGaQd2N1lsC7JWmpNN0mDu2NdvO+
 pNwhxvX/GXUeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t7pm5BFn
Subject: Re: [Buildroot] [PATCH-2024.02.x] package/glibc: security bump to
 2.38-81 for post-2.38 security fixes
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-16 16:20 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> GLIBC-SA-2024-0004:
>   ISO-2022-CN-EXT: fix out-of-bound writes when writing escape
>   sequence (CVE-2024-2961)
> 
> GLIBC-SA-2024-0005:
>   nscd: Stack-based buffer overflow in netgroup cache (CVE-2024-33599)
> 
> GLIBC-SA-2024-0006:
>   nscd: Null pointer crash after notfound response (CVE-2024-33600)
> 
> GLIBC-SA-2024-0007:
>   nscd: netgroup cache may terminate daemon on memory allocation
>   failure (CVE-2024-33601)
> 
> GLIBC-SA-2024-0008:
>   nscd: netgroup cache assumes NSS callback uses in-buffer strings
>   (CVE-2024-33602)
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

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
