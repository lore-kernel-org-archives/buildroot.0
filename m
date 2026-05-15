Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9C4CD4F3D
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 10:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7583180F34;
	Fri, 15 May 2026 10:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZ_3N0HX4zsR; Fri, 15 May 2026 10:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81F8180F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778842080;
	bh=INl1oOGjRQVTiTjxHAz04B5v16bcLMjc19jq6VTUnOA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=poOCdNacDuyCO9/ZVgpwjkIThqQtC4sue62E7ykZsIVZCKV8ISo6RWqeWwXPb1Bxm
	 i1l16DOPLfA+t3k5b6E5jHcGfMAuy+HJKG/n7PbLWNrTGi7AaXFzC/ftDFZCyfkgIm
	 JxpyNs1ocIQLeY9sEUosxn5orOLu7zFvw51ivDZjz5eJcS46Kw2xvsqeTR9aGyeUrP
	 9YxXTsD6h67Mboq7dS7Fsdl8jjv2+Rs66G+xha4tlsZ6AwRd0Xs1cf5m2JAEwVfzHD
	 EIiNGyJ5Kro9ULhe122VIVjMmAoMA09E0+KvYcDCAeMUUrjXCarPwEadI6wGk/bFgE
	 g+yzHJRtbSH2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F8180F15;
	Fri, 15 May 2026 10:48:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0B936E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A20194178A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npqRharuxwBx for <buildroot@buildroot.org>;
 Fri, 15 May 2026 10:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBE8D41786
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE8D41786
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBE8D41786
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:47:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6265760132;
 Fri, 15 May 2026 12:47:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 12:47:54 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 12:47:54 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260510072509.280756-1-br025@umbiko.net>
References: <20260510072509.280756-1-br025@umbiko.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9589d8cb00f4d28a6c7becc2d84dae46@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778842075;
 bh=A29d7ZSFBEkENk1hd+1LvctS2KyAD3DOLGao8suvdm8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jkVjLjwvQTlPhB+Xm7ZH9Z5FMZnm/fB/2f+Y9x24lH7DO6nwcendnBqLZUN/xOfD7
 pBnnd0SQ4j1eB4eAVR/cn9VHyL7RSByITNLoAy8x4PnWGWRh4NGLj5SIynN+Y/Kco6
 jrFMjfJDmyclzCTFff8xsUkbS1GOAE8JZbfKom0OvHakpapz3rwNd/w5p3sd+i9N73
 y2kRYiPpNu5btjgpvdahHxfaFPhQhBc/UyNk2+MdaN3XP4osEHSEqjOpRvltryM6Ev
 9Jdd6ilwzqs8btbCGxlK9Kw2rgF434C69QY7GQwJKsbOK+GKPtJxbKh55otyd/sUPt
 SbNKUyAONfmxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jkVjLjwv
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.10
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

On 10/05/2026 09:25, Andreas Ziegler wrote:
> Version 0.24.10 change log:
> 
> * input
>   - cache: fix deadlock bug
> * decoder
>   - sidplay: support millisecond-precision time stamps
>   - sidplay: support libsidplayfp version 3
> * database
>   - upnp: allow building with libupnp 1.14.30 which has fixed the API 
> breakage
> * Windows
>   - work around build failure due to zlib bug
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Since it's a minor bugfix release, I applied to master. Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
