Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AECCC5AD55
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 21:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 071FB80F3C;
	Mon, 10 Aug 2026 21:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPTWrwxurhsY; Mon, 10 Aug 2026 21:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4CF80F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786395901;
	bh=KBJk/vzjWSkeDwDnfmz795n0bThxt3NwaghCqrffR6c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AMtWqvb9tIlUQdf2ZQKa14JYmzqEfiHA+laJWzku3dTNWmdE42mwi6ybFhDQK5/Jp
	 E6G3rg3Li+vdeFMXTB1JMfUnPDz7ef7xMChUvljgd3baxWRq2TaXMjw1mBUEDjCIbS
	 qKJ+ErA7U8XpzMupHxJ0oZ62JflTCJxpkPPAG3JvHuBFYCcfgaXlrLVnZH2Q9aAHnE
	 Bdc5eEre3AS6luvXM4GyA+JJ16y0clAalGh5+lPRx/ekQxTxRiMBHlusni7Eaak5u7
	 yNyvN/2JUtq8yxU3o1WdYRHPRnXHKN14Kt6GONGQoEHZ7oP3OFmSDTpd/gulh+L6UV
	 0LsK+IgfI223w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4CF80F2F;
	Mon, 10 Aug 2026 21:05:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A6EC296
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50BB5406BF
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vav7voCfF6nO for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 21:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68250406BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68250406BC
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68250406BC
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:04:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so20638115e9.0
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 14:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786395895; x=1787000695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=koaFdL81qSbBj9+d21QQrNEY3wmyfAww4H9Gr+8EqZQ=;
 b=FaFaHmYnoOyzCIksgweHSFjqFaOuBPf9GjMYYRPX8ls8PSIrBIndInpl9/wMkhVDbS
 i9o559wQtJp218O2Aycf/oihxHKg/ioMVNVfg2ogR1JQjOjuT+5/vnIPaMARL/czn5JI
 J7CgIMUK8n1jjtLe+LptoaPsXdnBi2aPwBhLGpxBpJ4b4njFVTGEROaLrvWbGpcG6hXd
 bsKgA+7+hnWpLTCc3WrdQfBs2IJ8kFUR3SM4x9taCPCcBJ8IdUlVL9r5jZAIt+l014s1
 ryX2HdMy22YpOtcCnHiHT7CtwreSrc5iT0tFH+ks0K3EsniadO3ZaiOkwO9J+YB4l6sv
 hUwA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpiW6L2ssZvJu+YRKRH2Yn7y5xTVGvimfcGVcZEPSvCHVH/BdtbgAER/afSBeuEyu7o2LcB1HEpW78=@buildroot.org
X-Gm-Message-State: AOJu0YxnDCfXv/XHbrD1jC0HKprA2plonlwcoEr42N9LVQHPKl0xQqA8
 aUSBsqdjgxxmhgKmr3Izh0y+37DWzEGz7I3pIzaFnUFoopxvIib4bs/20hY6BSm8FbE=
X-Gm-Gg: AR+sD11bI/vUBzmKs7Y07RSytXxIb2VtuH/k0SEKSqSp4PhLuLDLS2ZfSrrx7BpAoMc
 OwACuH3VuR2Act8W5WVfEaFQij8fnGid7P0u92+WrUSn35JXIpZLiLcw0Gl7qBtKD/APqKDuHLF
 3JuQEmd6uUHpf1jWNo2uULdBIec/hjG1MQZsCSmf7iW4AhJ2sjzEStufgB6FroK4QDZ64lQ6KVC
 jb4KzlPPILcDHK0KPg6mITHUgtAAv/d9uR8IlBpxepT3s7vmn/GrgIpZ98DEmE1e4JCD2YLkjhf
 sYqKvMTJ4/ZuKve5KC84Gn5+ScwS8nKhyxpzecGSzSEHo9Kzc662120rNxnFQcxKyIM9+0SOgW3
 oEqXm/3ZtnQPUyoRLobSl37w1ns8xU3nZGLrPc920cU0prEiFxl0yEBkfonK5J1DXDN2DTVK7PP
 5jB9YswU4f96giJ8RH0uXC/tWSkqVrjcNdro0TNvh38vTFSgo+WAh+PQ==
X-Received: by 2002:a05:600c:4f45:b0:493:c47f:3c55 with SMTP id
 5b1f17b1804b1-49972764ed2mr62820185e9.5.1786395894464; 
 Mon, 10 Aug 2026 14:04:54 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740c46efsm17222205e9.4.2026.08.10.14.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 14:04:53 -0700 (PDT)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 "Nicolas Carrier" <nicolas.carrier@nav-timing.safrangroup.com>
Date: Mon, 10 Aug 2026 23:04:51 +0200
Message-ID: <20260810210451.30439-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <DKL9FUAMHEBJ.2DHVLMRHLWOGZ@bootlin.com>
References: <DKL9FUAMHEBJ.2DHVLMRHLWOGZ@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786395895; x=1787000695; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=koaFdL81qSbBj9+d21QQrNEY3wmyfAww4H9Gr+8EqZQ=;
 b=RqzFkX7OEB+AOe9oGNgdmY6gXie42OPVg+4FP9tRjjIxxl4cudd6XvABNgiIj1bEjo
 51ZppuyWj+kcr6pV7+6PAw2MCCq4+lpLOEiXkAFBYPpqSjYntCbSFNwPzIj7EXP9NLZb
 pun2OXl0r90NBIahcmiKLt5lgfn/DlgAUxMqpD8MV9TUiJCR1x1eBieosWZfR+tVj/Fi
 gha9g915NhT+gQF/3d0XRLaFJQU2aAQBwLkf+sRNpPJa6xLEXsfENkxGqrHgkPA2V9lx
 wJ3CYhzAvF26Bpew06Sh/tU2pFEXAUXhDMNHuNQOlPUHDaNiGPtFSx1vSFclxe+R88Gb
 GGXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RqzFkX7O
Subject: Re: [Buildroot] [PATCH 2/2] package/sass: new package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

In reply of:
> On Fri Aug 7, 2026 at 1:55 PM CEST, Thomas Perale wrote:
> > Hi Thomas, Alexis,
> >
> >> I am not super clear on what sass exactly does/is. But some time ago,
> >> we dropped all JS libraries from Buildroot:
> >> 
> >>   https://lore.kernel.org/buildroot/20250829103340.158873-1-thomas.perale@mind.be/
> >> 
> >> But sass doesn't seem to be one of those static JS libraries I guess
> >> because it installs some executable host tool?
> >
> > If I remember correctly node-sass is build using node-gyp so I can make sense
> > to have it in Buildroot because the node-sass version is closely related to the
> > node version present in Buildroot.
> 
> Just to make sure we are talking about the same thing, this package is
> not introducing node-sass ([1]), which is deprecated, but sass ([2])

Ha yes indeed I was still thinking about that old node-sass package, I didn't
know it was deprecated for good. Install should be easier with the new version.

> > The question is how do you plan to use 'node-sass' once you have the executable.
> > Correct me if I'm wrong but I guess the goal here is to use it in another
> > Buildroot package that represent a "webapp" and you run 'node-sass'
> > in the build step of that package and then place the generate css in the
> > correct location ?
> 
> Correct. To be exact, sass is not currently called directly by the
> custom buildroot package for "webapp". "webapp" is a php project, using
> composer to install and run "mini-asset" ([3]) which is a bundler
> depending on uglify and sass binaries being present on host.
> 
> > The correct way handle this (and minification) would probably be to use a
> > dedicated JavaScript bundler and configure it to use node-sass and setup
> > minification. This would probably yield smaller bundles and help handle
> > versioning correctly for your webapp.
> > This was also the thinking in dropping the JS libraries from Buildroot.
> >
> > If you have a `package.json` for the webapp with the node-sass dependency. Can
> > you `npm install` the webapp dependencies using the buildroot 'npm'
> > host-package without errors ? If that's the case I would say that it is
> > probably a better solution.
> 
> So in this case I've got no package.json, I only have a composer.json
> requiring mini_asset, and mini_asset does not automatically pull those
> dependencies. Mini-asset is configured through a .ini file, in which we
> can use different "filters" (eg: Sass), and each filter has different
> requirements, but it is up to the user to bring those dependencies on
> host. One thing that I can check however, close to your suggestion, is
> whether there is a different CSS "filter" that could be brought
> automatically by composer and that generates something close to what
> "webapp" is currently outputting.

I see, thanks for the clarification. I didn't know about 'mini-asset'.
I think your project can still define a package.json for the 'frontend' part
with uglify and sass dev dependencies and make 'mini-assets' point to the
'node_modules' directory local "bin".
But if you don't want to rely on 'package.json' or want vendoring then the best
choice is probably adding the package to Buildroot indeed.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
