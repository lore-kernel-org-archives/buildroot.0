Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CED9C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D225F4072E;
	Sat, 12 Sep 2026 14:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlLsojBupUFp; Sat, 12 Sep 2026 14:09:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE9B34071D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789222171;
	b=LUcqjWXTndO/Gk9gU6V4cm8FxNPwp7ZeqktPwvTv9mnNUbrWnYyeIS1Qdo5f595m/R7R
	 f0cKESgyKMlVQWKCjE1/M4cwvHS85L+eN/2TvlHAUY3TlI4uopBBuQhVSX9f9j51esN8j
	 6f7U8vNOtSQe9OWd/rQZQfEC5GB5tJ3dQgcbFK7kSQYam1FuZwJvL5SUX/2mOuy5Og+S/
	 G3R2RdqOEeMdnkFdrhCr3Npob8PhHkTk7vZO7tt/jRiJYQrKKb0kHD8E3AoYOq2ebqVML
	 J6LPL/eBykusYAms6d5+4hidYqAPMww39xkMHX8GRGYGIK4I0ayV3rVo9iP9NJs39KQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789222171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xr/dtQ8N8BdeMmKAdd3/VaMaJXusZMcL0kOiLaUs4e8=;
	b=V+MvjcTZG5jvaL8JuAO1I6Z0UA9sdDV8hT2Di/mraPK4IX3VS0V1Faaa/YxeqeUtV9It
	 2FVTT2zq+0qseHJozHE1A8hOqSREQVCMu9fxHT3VovrqqfsoWj1uoWQRMxJuc8yCeJqM2
	 NJw+SWio2myJSYGa1V4vspPrG9JI/cJj1KzycnihmVjc3+uICDoG1eE2Vq8Om3u4XDeCc
	 oDIkUGZ8xnhFL2V88xURHOHqvPjKXqZG1IPLX1KfUrdSzVcM/k34JBW+8RwsE3eMDGaeQ
	 zRYvimCNA8reuJUKHJ2i38SCbAa7sCyQs6B4gkqwNWq3jW4mVW9/2qwoo74DUgyKWTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789222171;
	bh=xr/dtQ8N8BdeMmKAdd3/VaMaJXusZMcL0kOiLaUs4e8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cqntWQCT0jPdhAhLNP4PIqDVlOB8VI8+JELscn/HP2yV4zvORB94Rz80ZShDKsbqV
	 M3ahjp0s4lrgSeVwtlQeurR1Dyjs9A081Rhm776fwN8BaxiRj/jp7hv/HnHj24Z0F6
	 95n2M5dJA8JOkE/C6tW48px14Iuy/WAVCLOI//zJnLeiWhwnVL2E1QJ8qPEeCiqPTh
	 C2cq5pIm3lRcOoQYHIclK24cnSdWBSRwRzTbDuF73dqMD7h8g+kcfSru5wNOXLSNtj
	 s46MafQ7p5JR509GJSAY1V7WOy8BhK8c2Y4Hu3XrYuqUT8JtB7ED06yQjNrsFq0zGH
	 LYhfKdxo2OHig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9B34071D;
	Sat, 12 Sep 2026 14:09:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1520701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E358E400BA
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyfTvsGSepCI for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:09:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D660640068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789222168;
 b=aD2bl0ZNXUXHvEj4yFUz4O3LoeCa5MajjwA5UGW98mB0KMcF2zm/epfvU2KrNacS+t5Z
 kgZ61JkBcoYOioKQgVbuhGq4RcTcxP0fmNfwjn9qKll3Kop9ONA4zdF6PKxERx6qslOml
 gVeVlArOB7LiSf0T2HNtEu9Ot3CypGQtkkRbU7AfMK+eKdiCllmEyvG7GNpDzeeiEjI8n
 uANLwNjCUHy+Re1o2M5KosaJeNm3MzFQa1miq5LbGkAOriIc1itmM9fv2zT5OlDtyPLNf
 o0PN46thO/p+mPrdAvoxnz4jNPc0sDa1XGEPrysCfp/HAdmnEoTiL9T3fUlEbawbaNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789222168;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=YnVLWjwVcjPULwTg1qJxwjPX+Daqfgu8G/OkyHV8vA8=;
 b=LN0AtUiKNWyprY+dCoL4Gtv4T5ZFnZtyNNQEbGGBUyX1XhdK56KX+vY9F93/rnBDmvQg
 p9Rkz9YekPGDL+CRFKEaUooZDkUqGr+jxXTIZmnXcY2apgm6+4DhfN696jQUGk+2qCVf/
 okDlUxTbNno6H8wCyp48TOMI/j4miI5M2gDep1Xs1myYqqqrPJse574THSVpEDqkn780h
 22AucFjNAOR4vN6fP35IPyxKRFtvcfSHmNhDelo9bfrexLYrVRWBNzBektBQAZMVOd51I
 KZgDzXcmGF5eqe7PBZomGvcKjglQdtUzH1QlBv2Vro7jFjQkuKVk3rR0SelINKMEzkA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WH4AwKFf; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D660640068
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:09:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D4D59B0053D;
 Sat, 12 Sep 2026 16:09:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 16:09:23 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 16:09:23 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20260903095415.3657050-1-yegorslists@googlemail.com>
References: <20260903095415.3657050-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <dbfbad3eaa00cc20757e6f26e249e181@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/imlib2: add zlib dependency
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

On 03/09/2026 11:54, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The demo programs, which have always been built and are still enabled 
> by
> default, gained a zlib dependency in imlib2 1.12.3: upstream commit
> f8a451043871 ("imlib2_load: Add crc32 printout") started using zlib's
> crc32() in imlib2_load, and 31006b425e11 ("imlib2_view: Optionally show
> crc32 of image data") did the same for imlib2_view. Both hardcoded -lz.
> 
> Upstream commit b9555030dace ("autofoo: don't hardcode zlib flags"),
> first released in 1.12.4, replaced -lz with $(ZLIB_LIBS) and added an
> unconditional PKG_CHECK_MODULES(ZLIB, zlib) to the demo programs branch
> of configure, turning the previously silent link-time requirement into 
> a
> configure failure:
> 
>   checking for zlib... no
>   configure: error: Package requirements (zlib) were not met:
> 
>   Package 'zlib' not found
> 
> As Buildroot went straight from 1.7.3 to 1.12.5 the intermediate state
> was never packaged, but the dependency has in fact been missing since 
> the
> crc32 support landed.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/4e05404c353ef985d74757d0b1ec3eda2cdff523/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
