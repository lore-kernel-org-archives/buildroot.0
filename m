Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51492E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 19:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F108C80E4E;
	Tue, 14 Jan 2025 19:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dgNKwWTdwJz; Tue, 14 Jan 2025 19:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1455E80E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1455E80E4F;
	Tue, 14 Jan 2025 19:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B50AA94B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91C774021A
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbJBIpL4NmgO for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 19:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7832C40102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7832C40102
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7832C40102
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:53:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C9128B005BF;
 Tue, 14 Jan 2025 20:53:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34388])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 20:53:32 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 20:53:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>
In-Reply-To: <20250112-fix_zxing-v1-1-ffd083221fb6@bootlin.com>
References: <20250112-fix_zxing-v1-1-ffd083221fb6@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5cf79dd1ed70a9e2a7d63848f0a80ff4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736884416;
 bh=BFdQ7TIWw3dMx74s3305s5oKE8dtFEzlIhKFonaWzNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VThjupJ2x3sOQ5ruOiA2J+8xXYg2qeaWSdOJTmfME5HAs37QhCjCkOIWM1Y9m8ubm
 r+7L98MGdPO4LuWEKrozoAZw/wz4IusD74Kex9mMd5ocvOr8rml64RmZRBHtOtnbxY
 dw5Jxlq4QP8obZG15G0stuSPsuNRZpzLCKozJZIgwmBZ8G1UwdIUrO8lKI1OTFcBXt
 2VFx8jzAbX9WkPK2i7vW+8O+y6aRdnKCGB5xox9tvwrnEjFEJMfs3K6x6Cxga5Xlh8
 VAzehvDVvlbLqMBIAtS9UdvdoQmCiT+b7fC0BaskEJwDijw1qtFe2GbVOu06wHqifs
 x1AWmwLn9LBPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VThjupJ2
Subject: Re: [Buildroot] [PATCH] package/zxing-cpp: bump to version 2.3.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/01/2025 21:29, Thomas Bonnefille via buildroot wrote:
> This commit bumps the zxing-cpp version to 2.3.0.
> 
> The compilation of this package has been broken since the bump to 
> v2.2.1
> when it is compiled with reader support, due to the added patch.
> 
> This patch was not added upstream, but another set of more generic
> patches [1] that do not change the API were added instead. The error
> that the Buildroot patch was fixing no longer exists in 2.3.0.
> 
> [1]:
>     - 
> https://github.com/zxing-cpp/zxing-cpp/commit/d0c8f226e22cd978fd42a25a6cff6d65b47ab6e9
>     - 
> https://github.com/zxing-cpp/zxing-cpp/commit/d979b765a14423f6d7747827b72193a0da9f3030
> 
> Fixes:
>     
> https://autobuild.buildroot.org/results/ba4573a1bcc0110d4d0b45642e07009ec949d66a/build-end.log
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
