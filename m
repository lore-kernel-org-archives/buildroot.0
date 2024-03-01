Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0126EC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 21:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 919D741E7B;
	Fri,  1 Mar 2024 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjyaLynhLAJW; Fri,  1 Mar 2024 21:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F6D41E71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F6D41E71;
	Fri,  1 Mar 2024 21:45:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CAB31BF41A
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5556081E8E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84HWPNBbeW8Y for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 21:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C08C681E7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08C681E7D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C08C681E7D
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 21:45:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3207919F522;
 Fri,  1 Mar 2024 22:45:13 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40166])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Mar 2024 22:45:13 +0100
MIME-Version: 1.0
Date: Fri, 01 Mar 2024 22:45:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87y1b2bbqu.fsf@48ers.dk>
References: <20240226203532.12112-1-ju.o@free.fr> <87y1b2bbqu.fsf@48ers.dk>
User-Agent: Webmail Free/1.6.5
Message-ID: <6d71ebe7eaf04f68ec07509930728eeb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709329514;
 bh=D7My0sN1I7urk6eD7iopVEQmMq42EpFb7Jsga5uaVb4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NsCOXY+R0R8LzG/Uy3X1DaDnHIo/3dCQ7ctyfP+HAyyLOPKmh2rFmGilR8guK36dh
 OXKLNriqYvwVRR18Ttgx/i0MpXWXbN8L1bpuAM5ezoHCQUl8Lcw3/YdrlxyBR3ALZx
 RHaIACXWNnGnmQVr7ZdNH3XdYb3qGNdt8WhC4JJN7kLmLqqbZqtGT8cCFn7b17REWG
 WQl6kGSzDiNlIrr2rbbcu61F12/aaWTMHGVasjUfsLYrEh5JF8QPcrlmNWVPB5HPej
 KNFk/dHqejuoxIB7fpuA9PMATF5Uo3ZYGVuQXSJTyda0PeYglYCH8UofwSBBQteP88
 DkdBO/osr4wmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NsCOXY+R
Subject: Re: [Buildroot] [PATCH 1/1] package/mysql: change default
 implementation to mariadb
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, All,

On 01/03/2024 09:24, Peter Korsgaard wrote:
>>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
> 
>  > The mysql package is a virtual package with two implementations:
>  > oracle-mysql (the initial project), and mariadb (the fork of mysql).
>  > This virtual package was introduced in commit [1] (2016).
> 
>  > The last version bump of oracle-mysql was in commit [2] (2014). This
>  > mysql version 5.1.73 dates from 2013 [3].
> 
>  > Package statistics at [4] reports 177 CVEs on this oracle-mysql
>  > version (as of Buildroot tag 2024.02-rc1).
> 
>  > Finally, oracle-mysql has 12 package patches accumulated over the 
> time
>  > and there is nobody registered in the DEVELOPER file for it.
> 
>  > On the other hand, the Buildroot mariadb package seems to be in a
>  > better shape: the package version is more recent, and received
>  > frequent updates, since its introduction.
> 
>  > There is several packages selecting BR2_PACKAGE_MYSQL, which will 
> use
>  > the old oracle-mysql without the user knowing it (other than
>  > generating the CVE list with "make pkg-stats").
> 
>  > In the meantime oracle-mysql receive a major update, this commits
>  > changes the default implementation of the mysql virtual package from
>  > oracle-mysql to mariadb.
> 
>  > [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/3d707d2b4fa6362cb37754f6c5fbb06240f5faf5
>  > [2] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/42c56751fc554503a03d4a914ce2e814eeaf5a41
>  > [3] https://github.com/mysql/mysql-server/releases/tag/mysql-5.1.73
>  > [4] http://autobuild.buildroot.org/stats/master.html
> 
>  > Signed-off-by: Julien Olivain <ju.o@free.fr>
>  > ---
>  > Patch tested on branch master at commit 7a9ba7a with commands:
> 
> Thanks. Maybe we should instead get rid of the oracle-mysql package 
> (and
> the virtual package) if nobody cares about keeping it updated anyway?

I was initially thinking about proposing a big bump to mysql-8.0.x some
time later. Upstream has still specific features that could be 
interesting
to somebody...

I personally don't need those for the moment, so I am also OK to drop
it with the virtual package.

My initial intent was to raise the attention on this decade old package,
with quite a few CVEs associated to it ;)

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
