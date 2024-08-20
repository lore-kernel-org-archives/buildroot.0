Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2122FC531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D928840474;
	Tue, 20 Aug 2024 21:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFB5hvcX90-B; Tue, 20 Aug 2024 21:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1F840B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A1F840B38;
	Tue, 20 Aug 2024 21:39:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1671BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6665640679
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-BTIWIk93F0 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:39:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35BA540259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35BA540259
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35BA540259
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:39:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 63B6113F8AE;
 Tue, 20 Aug 2024 23:39:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Aug 2024 23:39:21 +0200
Date: Tue, 20 Aug 2024 23:39:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsUNCUaThoqbqi0x@landeda>
References: <ZsOw2IzdkaSTp+Ot@waldemar-brodkorb.de> <ZsO1UYTTOIY7UuJn@landeda>
 <20240820105834.01fe6286@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820105834.01fe6286@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724189964;
 bh=1K7X+DCcPsOtCPQKe0g/NEX8nq+To9xvysIxU8ejQXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PkXfv5IP6DNd78NlnjeHxNDx1xqooPuKX0vf/fP4P5QVLLz+RS3TPgDtE81C/3jbZ
 kZ2o0/z0HgV9JGVAyoetbCN/maaRm+oUADVXZ/MCSK/wnnBTBQRih2X1s+EdL4z0qn
 zBblK7PwEu5Vgb7f2JbVqC/4ZaXsnjJmnaxIr4Y+6Vpf4KODCKJLmfn2o5jZL/6PCr
 UQndP2GwQL3hceJL1cveo5eciJ7BP+b5Jv3rdHvvkbHeZiktbQDzamhQ/yx4AtJyhG
 ohGjWccsYRw42KbfgYaaoB3e3YFDcpr1XytdRVDEn6ygQ3pwQMVvi0Bpgc2Dqci+5j
 MPM3dWz5UlSBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PkXfv5IP
Subject: Re: [Buildroot] [PATCH] package/botan: avoid compile error with gcc
 10.x
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

Thomas, All,

On 2024-08-20 10:58 +0200, Thomas Petazzoni spake thusly:
> On Mon, 19 Aug 2024 23:12:49 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > Compile successfully tested with internal Buildroot toolchain for
> > > sparc with gcc 12.x as gcc 11.x is not available anymore.
[--SNIP--]
> > Applied to master, thanks.
> If I may chime in, one critical thing that is missing from this commit
> message is since when this problem is occurring. Is it since the update
> of the package in 3ba9ac62052c99d7557adf2bbad1bab0c5577a81 ? Or since
> 2fcc74594c457bed7f0f2a4826ada265861be6bf ?
> 
> Indeed 11a577c19e23d0b774f357b2d62ac3c41b7f201f already added a
> dependency on gcc 10, so I guess it's something after that?
> 
> Again, this is important to understand if the patch needs to be
> backported to LTS or not, as usual.

Indeed, I forgot to do so, my bad...

Regards,
Yann E. MORIN.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

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
