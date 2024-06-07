Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A90C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 18:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B32A3412F6;
	Fri,  7 Jun 2024 18:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8USrKV9UtFE; Fri,  7 Jun 2024 18:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29EE040BC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29EE040BC3;
	Fri,  7 Jun 2024 18:11:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BB451BF476
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 18:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3874184C72
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 18:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9erhdDHqWo4S for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 18:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E299084C0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E299084C0E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E299084C0E
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 18:10:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 56AA513F8A9;
 Fri,  7 Jun 2024 20:10:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 20:10:49 +0200
Date: Fri, 7 Jun 2024 20:10:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bryan Brattlof <bb@ti.com>
Message-ID: <ZmNNKV_vaTkG0JpW@landeda>
References: <20240607093712.2880785-1-yann.morin.1998@free.fr>
 <20240607172617.s42p343dw4ijgck4@bryanbrattlof.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607172617.s42p343dw4ijgck4@bryanbrattlof.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717783855;
 bh=YvSMrXkgwXURlxUl96KtJscGJQmVCsJRC4N66xSLGBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unf3fcyoUnwJ59TDD1RUG3gmlSmqpiRqElbongb1llsa9eEoBHWJWEMBVUsnEgiWR
 9Xc5h2xTGlW1mEa6iQ2IJ+zL+O8IOEu9O0T6pwZKb0SfNkVi9qIEIgSEv+7faX/eOu
 iN+Q+TSRDvE/2JSzwtTgUyVzYxn+La24wmNs7Ztf4TKaOPynqxlx8SB8p1ITihnNhp
 yvRslpCAXiT0uufxDjdKvQJ7DiM7OXvy4sZ0C7vnt21tjqDvHBIb/aSWdVUiPxLEy3
 GOsXBu6M94pymJvEeMZEL4TU9JO1U4MnKbkebzGwmX2jYXA3swFbnZfFez1ZObcCOK
 CQv2ZJvPFTs/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=unf3fcyo
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: share download files
 with uboot
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bryan, All,

On 2024-06-07 12:26 -0500, Bryan Brattlof via buildroot spake thusly:
> On June  7, 2024 thus sayeth Yann E. MORIN:
> > ti-k3-r5-loader is just a U-Boot SPL running on the R5 core on TI's K3
> > processors, so it makes sense to just share the downloads with U-Boot.
[--SNIP--]
> This should also free us from the ti-k3-r5-loader.hash files correct? I 
> can send the cleanup once this is merged unless you would like to.
>     $ find -iname ti-k3-r5-loader.hash
>     ./boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
>     ./board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
>     ./board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash

I also pondered that. However, it is going to be a little bit
complicated, INHO. Indeed, the two can use different versions, so it
would be difficult to maintain the uboot.hash file: it would be easy to
drop a hash in uboot.hash while it is still used by ti-k3-r5-loader;
similarly for defconfigs: since they can be different versions, we can't
even share the hashes for the two, so they will have different hashes.

So that's why I did not merge the hash files.

Of course, now I notice that the two defconfigs use the same versions
for uboot and ti-k3-r5-loader. Which got me thinking that maybe we
should make that explicit (and easier!) in the menuconfig:


    diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
    index c276528fad..303f448f8b 100644
    --- a/boot/ti-k3-r5-loader/Config.in
    +++ b/boot/ti-k3-r5-loader/Config.in
    @@ -16,6 +16,10 @@ choice
          use cases you will want to use the exact same version/source
          here as it is used to build the main U-Boot package.

    +config BR2_TARGET_TI_K3_R5_LOADER_SAME_AS_UBOOT
    +   bool "same as uboot"
    +   depends on BR2_TARGET_UBOOT
    +
     config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
        bool "2024.04"

And then with a bit of sorcey/trickery in ti-k3-r5-loader (like we have
in package/linux-headers for example) to handle the same-as case.

Then that would make sense to merge the hash files, maybe.

Thoughts?

> > ---
> > PS. Not sure if we should do that in the package infra, though, or even
> > if we can even do it. It's a special case for packages that are both
> > sharing their downloads, *and* being downloaded from a VCS, which is
> > not a situation common enough to warrant a generic implementation in the
> > infras... Thoughts?
> My thinking is these are unique enough cases and I'm not too sure how 
> common the need will be to do this kind of thing. So it should be fine 
> to keep it out of the core package system.

Exactly my thinking too.

Thanks for the review! :-)

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
