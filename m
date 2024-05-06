Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D289AC25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 18:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D22B405D3;
	Mon,  6 May 2024 18:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyGFAW1v53Xq; Mon,  6 May 2024 18:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B37340A84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B37340A84;
	Mon,  6 May 2024 18:32:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C82E1BF308
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86B888200E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUxrFG9k5Zt7 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 18:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D58882008
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D58882008
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D58882008
 for <buildroot@buildroot.org>; Mon,  6 May 2024 18:32:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5F7FB13F86E;
 Mon,  6 May 2024 20:32:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 May 2024 20:32:01 +0200
Date: Mon, 6 May 2024 20:32:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ben Hutchings <ben.hutchings@mind.be>
Message-ID: <ZjkiIepSLogcd1zY@landeda>
References: <20240411152016.1185109-1-ben.hutchings@mind.be>
 <ZhgCNMQXfxPXuqvs@cephalopod> <Zjiv9wzmqtfy8DYr@cephalopod>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zjiv9wzmqtfy8DYr@cephalopod>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715020324;
 bh=bHgo/S16nvhhvyCvAYdSmIRCLQDSXVfYkIwt7Nw5iUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EIgeNJORBRVN/F+H6t8GDFyAPQyEUxXLcnmfBKVh+bHKaTryRy/UN/rGO4l/8YeKN
 AePwPtu7WBgE1yk17FNQJTUwO4DrTzOh9irSCZ/yiks7sj2nVQ92cmbe2m1alWE1tB
 yYhgle5PibXOjyZUTR8eJ9GS1aMz9hS2bSOrPmP7jfVwBgB8Ebylqq18kcZd9wUZVB
 Ei1VIJHGo1SAzIISRK+KdrOJJ26HyVIGZ/IlB8XMa31UB+sGHVOGsVGNYdYGBW2fqk
 P9HBEl48ClP4takHiGimnQ9FuUT0oW6LeMccRl/uVts4HKPL0Pu3TxXNnFeo+Se5rY
 TFzH0OxfLDNkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EIgeNJOR
Subject: Re: [Buildroot] Buildroot: incorrect permissons on /dev/shm
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
Cc: oss-security@lists.openwall.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ben, All,

On 2024-05-06 12:24 +0200, Ben Hutchings via buildroot spake thusly:
> On Thu, Apr 11, 2024 at 05:31:02PM +0200, Ben Hutchings wrote:
> > Buildroot is a Linux distribution and system builder for embedded
> > systems.  Starting in Buildroot 2011.08, its default /etc/fstab
> > included an entry for /dev/shm with incorrect permissons (sticky bit
> > not set). (CWE-276)
> > 
> > Buildroot 2017.08 removed this entry for systems using systemd, and it
> > has never been included for systems using OpenRC.  So this only
> > affects Buildroot-built systems that use sysvinit, and some older
> > systems that use systemd.
> [...]
> 
> This has been assigned CVE-2024-34455.

Thanks for th efeedback. The fix has already been committed, with commit
0b2967e158 (package/skeleton-init-sysv: Set sticky bit on /dev/shm) that
I applied on 2024-04-11.

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
