Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700F9C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172C7613B7;
	Mon, 10 Apr 2023 19:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 172C7613B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QvOGSXi8-HU; Mon, 10 Apr 2023 19:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD9161366;
	Mon, 10 Apr 2023 19:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD9161366
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D3751BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10EB7409B2
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10EB7409B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dGJV7YrOZOq for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:25:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C852D40995
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C852D40995
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:25:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CCFDD5FF88;
 Mon, 10 Apr 2023 21:25:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 21:25:27 +0200
Date: Mon, 10 Apr 2023 21:25:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230410192527.GJ2819@scaer>
References: <20230409210814.496117-1-arnout@mind.be>
 <20230410165157.GD2819@scaer>
 <c1eef250-6df4-7d6c-3963-bd5ad8c6a48d@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1eef250-6df4-7d6c-3963-bd5ad8c6a48d@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681154730;
 bh=t12kvkXCF+GIuBuuVEV3gz1AyH1xBF8RjLqYHDO6DrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WobCRUmE4AvR0o+XHqzn/azjhiaUj8ncUzy/d0JimLnxKJiUjovP+8iBjBt4j8G8d
 rem8hyyerwfFkcrdqNra3H0FPutUf9IfVDr847S2voDifLnhWnFviTyWQIh1e9JM8/
 eqFeQaB80wrUWlntuupABsfHN9ZndUzvbrzQj9tjM9ZIoXd0k46sHr/I2HDkKM0WA1
 +ioZ5QwLPSCSv+ZwBnl3HEUyR1Kq9lQ19S+/GaMM37K2jN9dim3BPt2O3TORgI3ZLT
 LUwoUavl2no6LuFAtSMIveRVfczfnwgzw0SJCs9fhYEZvuMQFLi7VkO1wQY50rmBrR
 ObgMPW7Vllh6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WobCRUmE
Subject: Re: [Buildroot] [PATCH] package/skeleton: drop $(HOST_DIR)/usr
 compatibility symlink
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

Arnout, All,

On 2023-04-10 21:05 +0200, Arnout Vandecappelle spake thusly:
> On 10/04/2023 18:51, Yann E. MORIN wrote:
> >Arnout, All,
> >
> >On 2023-04-09 23:08 +0200, Arnout Vandecappelle spake thusly:
> >>It has been years that we removed $(HOST_DIR)/usr. Because of this
> >>symlink, however, there are still packages that install things in
> >>$(HOST_DIR)/usr. Remove the symlink so those packages will start to
> >>fail.
> >>
> >>Note that there's now a check-package check to detect such incorrectly
> >>instaled things, so this should only affect external packages.
> >>
> >>Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> >>---
> >>  package/skeleton/skeleton.mk | 4 ----
> >>  1 file changed, 4 deletions(-)
> >>
> >>diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> >>index 634c76e437..186cb60189 100644
> >>--- a/package/skeleton/skeleton.mk
> >>+++ b/package/skeleton/skeleton.mk
> >>@@ -11,11 +11,7 @@
> >>  SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
> >>  SKELETON_ADD_SKELETON_DEPENDENCY = NO
> >>-# We create a compatibility symlink in case a post-build script still
> >>-# uses $(HOST_DIR)/usr
> >>  define HOST_SKELETON_INSTALL_CMDS
> >>-# check-package DoNotInstallToHostdirUsr
> >>-	$(Q)ln -snf . $(HOST_DIR)/usr
> >
> >Should we have a kind of post-isntall test that checks that a package
> >did not create that (e.g. because their makefile hard-codes something
> >like DESTDIR/usr)?
> 
>  If we are going to keep dragging along stuff to support legacy forever,
> then it's probably simpler to just keep this symlink. If something installs
> in HOST_DIR/usr it's probably going to break somewhere down the line, right?
> So I don't think we need to bother.

I am also all for dropping legacy stuf after a while.

Applied to master, thanks.

>  BTW, DESTDIR is empty for host builds. And PREFIX/usr would be completely crazy.

Damn, of course. But if packages' buildsystems would never do such silly
things at all, life would be so much easier for us... ;-]

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >
> >This is probably a good candidate for GLOBAL_INSTRUMENTATION_HOOKS, no?
> >
> >Regards,
> >Yann E. MORIN.
> >
> >>  	$(Q)mkdir -p $(HOST_DIR)/lib
> >>  	$(Q)mkdir -p $(HOST_DIR)/include
> >>  	$(Q)case $(HOSTARCH) in \
> >>-- 
> >>2.39.2
> >>
> >>_______________________________________________
> >>buildroot mailing list
> >>buildroot@buildroot.org
> >>https://lists.buildroot.org/mailman/listinfo/buildroot
> >
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
