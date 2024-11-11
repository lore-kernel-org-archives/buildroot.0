Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19877D12D7B
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 07:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A079F4031D;
	Mon, 11 Nov 2024 07:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fm3oCTl6mg0; Mon, 11 Nov 2024 07:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 524144030A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524144030A;
	Mon, 11 Nov 2024 07:03:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 729FCDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 07:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F92B6064A
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 07:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7_tH0dryMXL for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 07:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E6D4600B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6D4600B3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E6D4600B3
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 07:03:19 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:812c:23ef:fa95:555a])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A0C475FFC0;
 Mon, 11 Nov 2024 08:03:16 +0100 (CET)
Date: Mon, 11 Nov 2024 08:03:16 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <lhmysqzxufovo4zbrqlh4zmpaq5wfh6qze7vqysccuchm4tv5p@v6k6abia4bsi>
References: <20241110182451.49722-1-vjardin@free.fr>
 <20241110182451.49722-2-vjardin@free.fr>
 <327efbe09f993c827276a3e68923b604@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <327efbe09f993c827276a3e68923b604@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731308597;
 bh=AbB4sRPKe/qb4pvQl9jE1QrsNF2phzSE6vITAy7bhKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZkyzmRulWV/n7wBhOikbVbxOl7/5GJkLysVQNlc4mUy+YBYsJpexB4DvsXtLpafmT
 N27l/uvsvR9xdvr0TkqoEAfklpTj3rQ8/4/qUoF63vAZljW+Aou3CDICntGhpwPGKA
 tSDxr2Bf5aATOmyGT6lIFeA3M7DKbjMQKg2U1xnFrwxvcsieVXvyEcS7J25Cg9B8aN
 rmQtSd9hNFQnaZFLotGAi+yLwsqMyIDuB1vaThLP2xdgBsPVk08RaVptEzVGrVCVgK
 R5d1RZxKIoOjY03cXR8RFUQfud5v00BAoX0AyDuwac1jT3NvcQ4W+RCND71L6tHrmz
 +wM0OUME0ctTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZkyzmRul
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mlx5ctl: new package
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

On Sun, Nov 10, 2024 at 09:47:30PM UTC, Julien Olivain wrote:
> Hi Vincent,
> 
> Thanks for this patch!
> 
> On 10/11/2024 19:24, Vincent Jardin wrote:
> > Add a new package that can be used to manage the Mellanox/NVIDIA
> > Connect-X boards.
> > 
> > Signed-off-by: Vincent Jardin <vjardin@free.fr>
> > ---
> >  DEVELOPERS                   |  1 +
> >  package/Config.in            |  1 +
> >  package/mlx5ctl/Config.in    |  9 +++++++++
> >  package/mlx5ctl/mlx5ctl.hash |  3 +++
> >  package/mlx5ctl/mlx5ctl.mk   | 12 ++++++++++++
> >  5 files changed, 26 insertions(+)
> >  create mode 100644 package/mlx5ctl/Config.in
> >  create mode 100644 package/mlx5ctl/mlx5ctl.hash
> >  create mode 100644 package/mlx5ctl/mlx5ctl.mk
> > 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index edf823b34b..384e185944 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -3274,6 +3274,7 @@ N:	Vincent Jardin <vjardin@free.fr>
> >  F:	board/nvidia/bf3/
> >  F:	configs/nvidia_bf3_defconfig
> >  F:	package/dpdk/
> > +F:	package/mlx5ctl/
> > 
> >  N:	Vincent Prince <vincent.prince.fr@gmail.com>
> >  F:	package/nss-myhostname/
> > diff --git a/package/Config.in b/package/Config.in
> > index 876b340a8a..d60835a2be 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -567,6 +567,7 @@ endmenu
> >  	source "package/memtool/Config.in"
> >  	source "package/mhz/Config.in"
> >  	source "package/minicom/Config.in"
> > +	source "package/mlx5ctl/Config.in"
> >  	source "package/msr-tools/Config.in"
> >  	source "package/mxt-app/Config.in"
> >  	source "package/nanocom/Config.in"
> > diff --git a/package/mlx5ctl/Config.in b/package/mlx5ctl/Config.in
> > new file mode 100644
> > index 0000000000..0eaaf29653
> > --- /dev/null
> > +++ b/package/mlx5ctl/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_MLX5CTL
> > +	bool "mlx5ctl"
> > +	help
> > +	  Provides a unified toolset for accessing, debugging, and
> > +	  monitoring ConnectX MLX5 devices, utilizing secure interface
> > +	  to simplify diagnostics in production systems with a secure
> > +	  kernel lockdown enabled.
> > +
> > +	  https://github.com/saeedtx/mlx5ctl
> 
> Looking at the mlx5ctl README.md file:
> https://github.com/saeedtx/mlx5ctl/blob/main/README.md#drivers-needed
> 
> mlx5ctl (user space) needs Kernel the drivers:
> mlx5_core.ko (ConnectX device core driver)
> mlx5ctl.ko (ConnectX debug uAPI driver)
> 
> I can find mlx5_core in the upstream Kernel (the one you
> included in your nvidia_bf3_defconfig) in here:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/mellanox/mlx5/core/Kconfig?h=v6.11.6#n6
> 
> I am not able to find the "mlx5ctl". Is there an out of source tree
> driver somewhere? Quickly searching, I'm only able to find this proposal:
> https://lore.kernel.org/all/ZcRgp76yWcDfEbMy@x130/T/
> And a LWN article:
> https://lwn.net/Articles/969383/
> 
> When proposing this user-space package, from which source are you
> planning to use this Kernel mlx5ctl?

Currently, it is the one that is used ; but the proper solution is
still WIP for the mainline Linux kernel.

> Before adding such a package, we should make sure there will
> be an easy way in Buildroot to have all its dependencies.

So, the best option is to delay the integration of mlx5ctl until the
kernel's solution will be become mainstream.

Thanks for your comments. I'll resend it once the kernel module mlx5ctl/fwctl
will become available.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
