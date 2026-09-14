Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956C4C88E50
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 08:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B44D402A3;
	Mon, 14 Sep 2026 08:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaLvpjbl2X02; Mon, 14 Sep 2026 08:34:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7C3A840426
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789374888;
	b=gye5XHv4ZpXAAtPTMq8INyq7RxC+wl54VCuGfhxa7JbALcEIEMrmUmxdD3gKMMyCaZEX
	 Rkw1CNJPDmP17TbWzy66SSECpXbetkdLimAzl7W8ueXsGSzBMVr8r8BjVCSLk+MusQSQ+
	 2/BCxLDic/cViODzpnhBiTxg4+eYMk1h8jmwb2eVJtBLupBAj6XYz7ljVx6dCIPvbMiha
	 xLF2vRxrWSSKU2GGtOi3ozy1VvQndznGRbeK/yUCK3Y0Ytxj8Kcjkn6q5/bEp+Zl7XCtq
	 BTv8i8PT4hpW+MslLqlnUAIMgGLl8ot3OhZKj6k1sfMtfzsC4WEJjc3VCRSYXoB0PEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789374888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:Date:
	 To:Cc:Message-ID:References:MIME-Version:Content-Disposition:
	 In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tRLSwudbRsC5jZhLoXJVz+RAxq+Ei8OvS7k0CD9gnMU=;
	b=fgLVK1bEkVOb+pkObtX6+IHpUtaQI04qSJhCHA1LG08dlmIanecrhlYvdFbngj0GcGvM
	 Wsc75Hfm2lJT9AeH+/eT0BOyLJPdVp6b9JN/DLmDFyWrpg0z8z81SBRu4BYy/DyHrlQYr
	 FHzcQCL949Jxe8uEWmPtnly6aRp5a5sXVQoXkx2HkJT4HWv6lvreipoeOcmCfMbdOYQaz
	 9J6L2QXQXed7coLV4MecDifU8BrH6WUUyTYUhqZAat6pWpSmxsGyxu53gVvZgWca1giTs
	 UA5Du68YbZ/2qK0OmadOFb4DDQqmxLNA0VQVp3mH/cCiM917LSNSSrmd60rMpXrRIeA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789374888;
	bh=tRLSwudbRsC5jZhLoXJVz+RAxq+Ei8OvS7k0CD9gnMU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p2mp2p5gujYOW6pyE1lTu9qTCxR9BHAqcoJ14/chC031Cxdha7XVZsp/y7rFSMpLJ
	 9dG+1RGidjpXW9IoG1yyyOeHHbqjVN0ObdqBlKtOFite6QU+ix0UtBFseykQS8+qbU
	 5kBGbx0Jo3ZZUzu4ZwpJZcgnxGhqq3TlyJM4sGKBwdSGuzXNg4/ot/FJf+xlmdnpRO
	 Df7vEsCRsn17DhCjUsG9tlIqb0Z0i8saswh3UmsFFa52g1CJ9Ir/P6ztHg8dAPDmps
	 6CyLk3Y2a1+jRTTpszvYcZHGht7+q6nKN+pki3WERqzpTVnswTiPoL4+UieEhniPIN
	 iLaHb+HnDyUZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C3A840426;
	Mon, 14 Sep 2026 08:34:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 580462D0
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A07140426
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0a1YpqB_K7JA for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 08:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 289E4402A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789374885;
 b=cPkI6cV0TgRikjeiSF1YGBdQv+z46hkFq6n4wYjsI3H1QyOOIaJU7yubOjixRe65PtSR
 tMdCex7ueurhUzPPyLHuLb3nif0Xd8RCxouAd6lGIVLXh5ovfLlt8VwzOxiHqCVlnQygJ
 lV46py2wi38grWYS137FgqweUR7rToDsosswi6Cctcn058+D+vD0aOk5KM/t5OUbF5RYF
 GC5xHvK4qtEq7xxUhwyzlfzN11Z8ZEIHxPqh8ez8mPPt7nXNzsKR75vcTAgkbrtHR6y+1
 FHKvCLPzyXJXP4ir894gVDfJM0eZf1EkTJWMQABdVjZygRvzj8xvUVFVpBLkgFjpIXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789374885;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To;
 bh=iOGJgI1UjCTwJKrefN+Me2csVu3O2BystWITRGFm8YE=;
 b=CB4UWEoHMSTC1pD/SbXqf1mOD6USA7xCJRQZTc3oS6v9hpi5/amOdErT51xNGzUVokk0
 G+1v2p39GlhmmCugf9KnhXZbJrg0HmBJzGupYEsg+lkVdXsivFdRqCP5ODUMYb38h9gvJ
 ax3kO8HQSvGBn0Xa9B/WEwOlmoXIwmlQkfJqDBfhejdiuX+VhsIkjcxVuy880X1KRHHbo
 GU44tikBm45+2IwYI1F6IjPH+8FggChNYjc1swx/sV8mPGdS6pYlK/8VMSxRPVePpS4rF
 HYc2okwTyzXSDJm1UUnknNOm7hNQm+Fbknu2ZuBRqAUhdOxjvgeIAlF6nz8VA8tLHsA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PY6kz7yX; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 289E4402A3
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:34:44 +0000 (UTC)
Received: from l301776.home (unknown
 [IPv6:2a01:e0a:ac2:22b0:d01c:b4ea:491e:352c])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5A88660141;
 Mon, 14 Sep 2026 10:34:40 +0200 (CEST)
Date: Mon, 14 Sep 2026 10:34:39 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>
Message-ID: <aqexn8dKpwyI-ISu@l301776.home>
References: <20260913133520.3423773-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260913133520.3423773-1-alexander.sverdlin@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexander,

I am interested by your updates. See below

Le 13/09/26 15:35, Alexander Sverdlin a =E9crit :
> Since U-Boot 2024.07, boards with CONFIG_OF_UPSTREAM build their device
> trees from dts/upstream/src/<arch>/<vendor>/ instead of arch/<arch>/dts/,
> so the files copied by BR2_TARGET_UBOOT_CUSTOM_DTS_PATH were ignored and
> the build failed with "No rule to make target".
> =

> Derive the destination from the U-Boot configuration, including the vendor
> sub-directory taken from CONFIG_DEFAULT_DEVICE_TREE. That tree keeps the
> Linux architecture naming, so aarch64 has to be mapped back from
> UBOOT_ARCH ("arm") to "arm64".
> =


  ...

>  	  Space-separated list of paths to device tree source files
> -	  that will be copied to arch/ARCH/dts/ before starting the
> -	  build.
> +	  that will be copied before starting the build.
> +
> +	  They are copied to arch/ARCH/dts/, except that a configuration
> +	  with CONFIG_OF_UPSTREAM (U-Boot 2024.07 and later) builds its
> +	  device trees from the vendor directory below dts/upstream/src/
> +	  that CONFIG_DEFAULT_DEVICE_TREE names, so they are copied
> +	  there instead.
> +
> +	  The *u-boot.dtsi fragments U-Boot includes on its own are
> +	  copied to arch/ARCH/dts/ in either case, as that is the only
> +	  place it looks for them.

...

> +# With CONFIG_OF_UPSTREAM the device trees are built from dts/upstream/s=
rc/
> +# instead of arch/<arch>/dts/, in the vendor sub-directory encoded in the
> +# device tree name. That tree keeps the Linux architecture naming, so aa=
rch64
> +# has to be mapped back from UBOOT_ARCH ("arm") to "arm64". The fragments
> +# U-Boot includes on its own are searched for in arch/<arch>/dts/ only, =
so
> +# they stay there whatever the device trees do.

Those comments are similar 3 times: into config.in, into uboot.mk
and into the commit log.

I would prefer to avoid reading them 3 times and having them only into
the commit log.

Why is it specific to arm64 ? Why isn't this feature generic ?

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
