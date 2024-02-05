Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1828C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95EE240576;
	Mon,  5 Feb 2024 17:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95EE240576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6JbXiiYc9UU; Mon,  5 Feb 2024 17:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA6A54023F;
	Mon,  5 Feb 2024 17:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA6A54023F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FF941BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4307B81092
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4307B81092
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOFT7mCUPXrZ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:48:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB71780B1A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB71780B1A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 351BAFF805;
 Mon,  5 Feb 2024 17:48:40 +0000 (UTC)
Date: Mon, 5 Feb 2024 18:48:39 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205184839.3f230f02@windsurf>
In-Reply-To: <20240109211801.565524-1-fontaine.fabrice@gmail.com>
References: <20240109211801.565524-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707155320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZM+q9SKMtLT0sX0nDTOWiaHzNGPHIOXet5VpgeyYME8=;
 b=Aq4FpJHqBBQP1FBDSMrQ9ffP+zipMy8+QhvaJBnfcZIC4/A99/hyFO6VjvO2ocT7hAiq0F
 eihujKASLrxMWpbC/PcfjeM8phr9Lo9Tae7I+RIwz8bEQuEe9geT9lWcNMaLW7580q8qln
 u+nuVeKqlaO5G5oC+0TnYStzFLhRB/sgoloHee0/PC/i8BJJbsn4cMdoHUbe2G1wC3FCly
 IkbHT1W2CI6fyVXQaG0IGTFf/cXjx2hGh/5lUNnZwyS/SF4Z1KuiHCpI4TccT17mva5v3K
 q9UT4/v29M2S0GVlUmKkCyphwleI1VbnGKaXUEeCAyO7HSmoP8p04RHFcQnpDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Aq4FpJHq
Subject: Re: [Buildroot] [PATCH 1/1] package/ngrep: fix build with libnet
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Wade Berrier <wberrier@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 22:18:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use pkg-config to find libnet and avoid the following build failure
> raised since commit 100ba8351c088fd764effdcaba848cfd92de79dd if
> libnet-config is found on the host:
> 
> /home/autobuild/autobuild/instance-4/output-1/host/bin/mips64el-buildroot-linux-gnu-gcc -s -o ngrep ngrep.o  tcpkill.o   -lpcap -lnet   -lpcre -L/usr/lib -lnet
> mips64el-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'
> 
> While at it, format Upstream tag of other patches
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/05c916162b9c1027cf53f1699a1f5653151098ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  3 --
>  ...nfigure-in-when-testing-for-use_pcre.patch |  3 +-
>  ...heck-for-libnet_init-in-configure-in.patch |  3 +-
>  package/ngrep/0003-fix-disable-tcpkill.patch  |  2 +-
>  ...ure.in-use-pkg-config-to-find-libnet.patch | 38 +++++++++++++++++++
>  package/ngrep/ngrep.mk                        |  2 +-
>  6 files changed, 42 insertions(+), 9 deletions(-)
>  create mode 100644 package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
