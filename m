Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E5CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A88D400DC;
	Mon,  1 Apr 2024 13:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3Y9A2hZ0QZ4; Mon,  1 Apr 2024 13:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E23740181
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E23740181;
	Mon,  1 Apr 2024 13:30:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD7C61BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D756A6070E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfYwUgRorMWI for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07341605AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07341605AE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07341605AE
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 13:30:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 38B9213F861;
 Mon,  1 Apr 2024 15:30:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 15:30:01 +0200
Date: Mon, 1 Apr 2024 15:30:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Zgq22Vpl4wE52kt4@landeda>
References: <20240331203354.815139-1-yann.morin.1998@free.fr>
 <e00353d3-683e-472e-822c-b6b5d612e6a8@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e00353d3-683e-472e-822c-b6b5d612e6a8@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711978206;
 bh=4nMCDOaaimqTEgAvfvgYMdWIMHTuymqEKIpleAeIrho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NvgluYpyH7Xe+azy2fmljbaihYYVOtrMPYPylQA+riwUJMumdHYCv2puR9bHP+idD
 ki47QgDnSCsAuRzMWyevaj2brbgAE2Y7g8McY/oODSY5sX5rbm/lrgypQQIjkBCw3u
 jhez2y4GnhnxAkaZVbelFrzAkvikftusqirutTzzHXdAJPa3geBf4ZYewKnB7yP2e9
 YDIIAQv9nuCf5uMh9Vi50oe8lmXLS/Sxsf1hW3jCLkzdgSeBXt1SJEny571hLVIf7C
 88nd8shnIn+1lqtsyd4WYnTOSUU9cSapcsrOFcLmMpshU+yw0o8oma941bCwcnWgWB
 gXQ/YASqOr2Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NvgluYpy
Subject: Re: [Buildroot] [PATCH] utils/check-package: emit library name
 along with check function name
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2024-04-01 15:03 +0200, Arnout Vandecappelle via buildroot spake thusly:
> On 31/03/2024 22:33, Yann E. MORIN wrote:
[--SNIP--]
> > Fix that by storing both the library and function names together. The
> > leading "checkpackagelib." (with the trailing dot, 16 chars) is removed
> > for brevity, because it's present in all libs' names.
[--SNIP--]
> > -    objects = [[c[0], c[1](fname, flags.manual_url)] for c in internal_functions]
> > +    objects = [[f"{lib.__name__[16:]}::{c[0]}", c[1](fname, flags.manual_url)] for c in internal_functions]
>  Bikeshedding time! I think, since this is Python, we shouldn't use the C++
> convention of ::, but rather the Python convention of .

Ah, I don't do C++, so that was not my reference. ;-) I am not a fan of
using a dot, because it does not denote that one part is the filename,
and the other is a function (or any other type of object). But since
this is common pythonistic usage, I'll switch to a dot.

>  Otherwise, you can add my Reviewed-by: Arnout Vandecappelle <arnout@mind.be>

Thanks.

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
