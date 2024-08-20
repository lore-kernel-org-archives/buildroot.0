Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB071C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 22:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FDAB40B5E;
	Tue, 20 Aug 2024 22:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28JhWPqSNS08; Tue, 20 Aug 2024 22:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34AA940B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34AA940B7F;
	Tue, 20 Aug 2024 22:00:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0116F1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 22:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02086071E
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 22:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNfa2-lsrjpR for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 22:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F175E606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F175E606FD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F175E606FD
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 22:00:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AD88213F88F;
 Wed, 21 Aug 2024 00:00:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Aug 2024 00:00:49 +0200
Date: Wed, 21 Aug 2024 00:00:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsUSEXO-x4RnuiZG@landeda>
References: <ZsS52zTjT0Ca9twG@waldemar-brodkorb.de> <ZsUKCVcZheIlzo00@landeda>
 <20240820233250.3293444a@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820233250.3293444a@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724191252;
 bh=RUCyjPlRhq7ODOcSRz7PmZEkpAQCH/XtokmjYzVdUok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Te8mvAgeV0xIaM/NctmqrPDDK89RJp0NbUgUGM+N01hzmkEBOWrhhq09aXi7/4qbR
 8nWQzt4b2clYb0ZaMdAGJ2MljCW3lFLeE7AxVqaK+CTAKC8Kf4RLEW+TE/MdV4xskK
 59SDJo55AF2KbbZVf1psZUEnesyEGjlxTOYXyZ4mjQAagoT3Kiqc9ipjUGXzBaAf8s
 PWRREcFJeYjsfIId9W4bibCLgIJtfHyXy4vda7VngmnRM/79glDSii8xBYCU8ORxtj
 uql16aTl51sJKeEHcklVujFam95hwDLhG3KWkusaos1Ky3QrPAEvzubJslMt6wJzAS
 72VGmM0sVs82g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Te8mvAge
Subject: Re: [Buildroot] [PATCH] package/docker-engine: fix runtime problem
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-20 23:32 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Tue, 20 Aug 2024 23:26:33 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2024-08-20 17:44 +0200, Waldemar Brodkorb spake thusly:
[--SNIP--]
> > > Add the missing kernel module to allow starting containers.
[--SNIP--]
> > > +	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)  
> > As far as I can see, this is an optional feature, and is not strictly
> > required:
> >     https://github.com/moby/moby/blob/master/contrib/check-config.sh#L235
> > So I don't think we should forecfully enable it.
> On the other hand, Waldemar is encountering the issue while doing a
> simple "docker run <container>", which seems to be like the most basic
> thing you would want to do with docker. So if CONFIG_USER_NS is needed
> for something as basic as starting up a container, I believe it's not
> really an optional feature?

In that case, we are missig way more options, like CGROUP_PIDS, SECCOMP,
MEMCG_SWAP_ENABLED, and a good bunch of others...

The way the moby (alias docker-engine) config-check script make that
flag optional is very peculiar: they run the check in a {} list, which
means any failure is ignored, so their check_flags() failure is ignored
for those options, meaning they really are optional from the point of
view of moby, and they do not require it.

And indeed it is optional, as our runtime test for docker-compose (test
which uses docker-engine) with a custom kernel configuratio nthat does
not have USER_NS, does not fail although it does run multiple
containers...

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
