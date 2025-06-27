Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E8C7EE31
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 08:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985ED4196E;
	Fri, 27 Jun 2025 08:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mvYt0RzKP56; Fri, 27 Jun 2025 08:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14BA41960
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C14BA41960;
	Fri, 27 Jun 2025 08:59:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA04E154
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D014041960
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVr2TE8MWMQZ for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 08:59:01 +0000 (UTC)
X-Greylist: delayed 3599 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Jun 2025 08:59:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE2AC4193E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2AC4193E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE2AC4193E
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:59:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4FB943AEE;
 Fri, 27 Jun 2025 08:58:56 +0000 (UTC)
Date: Fri, 27 Jun 2025 10:58:54 +0200
To: yann.morin@orange.com
Cc: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>
Message-ID: <20250627105854.7ef43644@fedora.home>
In-Reply-To: <aF5ZF7d+WwGN5dSX@yd-6wlzhs3>
References: <20250627075855.199254-1-maxime.chevallier@bootlin.com>
 <aF5ZF7d+WwGN5dSX@yd-6wlzhs3>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdefhfeujeefuddtvdegteetgeelffffgfevfedvgeejtdfhgeefgfeukedtffeinecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedvrgdtvdemkeeggedtmeguuddtfeemieejudehmegvfheikeemvdgrvdgvmegsleegjeemkeekkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeegtdemugdutdefmeeijeduheemvghfieekmedvrgdvvgemsgelgeejmeekkeekhedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeihrghnnhdrmhhorhhinhesohhrrghnghgvrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751014737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+BD44YLdCa6+FUK7MKg8dC+mkrWq2bbzRQuNH2y1ys=;
 b=OqPip8KZnYvWD3gtAI6pcvldEVS2ySUIrqf3r0iOH1HE6+kUF02VC3tEfiqG9ng38+pgql
 flt4c+lp2WUe+602d/I8Wbs5Lmi6e/YL5UFJSXqX7/K9MCmErVLpfyf4UvWIv85rmuF/Mx
 TZqZJDT6otpj7bm4d9Cshw8Tit1WnmaeHHSboP5UOmyi7Jj904n+bAsUb1BY534uClzHPf
 BOOVAr+mb8/cdKoMpih6/1Y0GFoVcDFSK6WFcxiRQWWGtIdZKA4GPfcnZA8mNCG8gCnmZ8
 1Ma0Iy85KtwhtIaWPpmNRbCGAU0Yu6BuDJcvBDlrqoY5Lv2hknJfaoVIQTuc1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OqPip8KZ
Subject: Re: [Buildroot] [PATCH] package/elfutils: elfutils programs now
 require a c++ toolchain
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Fri, 27 Jun 2025 10:40:55 +0200
yann.morin@orange.com wrote:

> Maxime, All,
> 
> On 2025-06-27 09:58 +0200, Maxime Chevallier via buildroot spake thusly:
> > The 0.192 release of elfutils introduced the src/srcfiles.cxx program,
> > that lists all source files of a given ELF binary. As this is a C++
> > program, we need a toolchain that supports it.
> > 
> > Without it, the build system tries to use "no" as the CXX compiler,
> > resulting in the following errors :
> > 
> >   /bin/sh: line 1: no: command not found
> > 
> > as can be seen here for example :
> > 
> > https://autobuild.buildroot.net/results/849/849221c794a469a423857a290db775d150b84900
> > 
> > Add a dependency to a CPP toolchain for the elfutils programs.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  package/elfutils/Config.in | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
> > index c355048c6d..f6f5438fb0 100644
> > --- a/package/elfutils/Config.in
> > +++ b/package/elfutils/Config.in
> > @@ -24,8 +24,12 @@ if BR2_PACKAGE_ELFUTILS
> >  config BR2_PACKAGE_ELFUTILS_PROGS
> >  	bool "Install programs"
> >  	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +	depends on BR2_INSTALL_LIBSTDCPP
> >  	help
> >  	  This option tells elfutils to not only install the libelf
> >  	  libraries, but also the elfutils programs.
> >  
> > +comment "elfutils programs needs a toolchain w/ C++"
> > +	depends on !BR2_INSTALL_LIBSTDCPP  
> 
> Two things:
> 
> 1. the dependency  on glibc already required a comment, which is
>     currently missing: maybe add it as a separate patch?
> 
> 2. the new comment should mention both issues:
> 
>     comment "elfutils programs needs a glibc toolchain w/ C++"
>             depends on !BR2_TOOLCHAIN_USES_GLIBC \
>                     || !BR2_INSTALL_LIBSTDCPP

Sure thing, I'll resping with these changes then :)

Thanks,

Maxime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
