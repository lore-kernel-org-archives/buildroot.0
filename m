Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27B1C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D8B60828;
	Thu, 27 Aug 2026 20:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4yiSiyy73iB; Thu, 27 Aug 2026 20:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787862403;
	bh=Rt2i6OBN2P/5WtP84SNJwM2riUesTjroH/0jayUJ/Ys=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RfvUtuDUNpxCSy+gB6bgOperY+wEKyLrCzuUe6DtaAUPCl1KzdE/UMXuqlfONAx8n
	 1bcazZLmuTkHjedVdy70dxREd7dIMJqkmJpImSM7TiYznGXwkej8l1MSj5jdLkM1P1
	 btuWW6YJ9vgi0809HSJ6jaL4wurSYNYvY2LEQ+cpg4ImP87k7t+ScYkN/YSQGZh7jw
	 Y3cOpBwJD4BOTQZ/pjeZoUKppoU4dCSaENxP1lR4tmHNAPaXzdRuvNT7J7CNeQo0OE
	 Lzdj2cn0t3pt9IWMU4HcUcKaQb/0I6iNV+tyC7dXwUFtiaZnB+CG4OeS+/mTeyvfd2
	 J9gpeopqvsIlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E466079B;
	Thu, 27 Aug 2026 20:26:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA3AA334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C7F5406E3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ieW1009eMEq for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B36E740550
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:26:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 696ED13F8CF;
 Thu, 27 Aug 2026 22:26:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 22:26:35 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:26:35 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260826214030.630675-1-thomas.petazzoni@bootlin.com>
References: <20260826214030.630675-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <475b5097ea97972ffbb472d33b6eb434@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/bind: fix build with old host GCC
 since autoconf bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/08/2026 23:40, Thomas Petazzoni via buildroot wrote:
> Since the bump of autoconf to version 2.73 in Buildroot commit, the
> build of target bind fails if the host compiler is too old, because
> the bind build system tries to use -std=gnu23 when building host tools
> which isn't supported by older GCC releases, causing:
> 
> checking whether the C compiler works... no
> configure: error: in 
> '/home/thomas/autobuild/instance-2/output-1/build/bind-9.20.26':
> configure: error: C compiler cannot create executables
> See 'config.log' for more details
> make: *** [package/pkg-generic.mk:263: 
> /home/thomas/autobuild/instance-2/output-1/build/bind-9.20.26/.stamp_configured] 
> Error 77
> 
> To fix this, we backport a number of patches from autoconf-archive, to
> fix the m4/ax_prog_cc_for_build.m4 macro file, so that it works with
> autoconf 2.73.
> 
> OpenEmbedded has a similar fix:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
> but did not backport as carefully the autoconf-archive commits (and
> their commit message reverts to sudo).
> 
> The patches can be dropped when we update to a newer version of bind
> that itself has an updated copy of the m4/ax_prog_cc_for_build.m4
> file.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/13e07755101b7cae2f84eef173ef752f92842e71/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
