Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAC7C369AE
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82974406ED;
	Sun, 13 Apr 2025 09:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjD3BjtbIJlF; Sun, 13 Apr 2025 09:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1D91407DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D91407DC;
	Sun, 13 Apr 2025 09:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64A22DE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5643660809
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCcFYjItgf4O for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFE536100D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE536100D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFE536100D
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:48:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7DD7CB00539;
 Sun, 13 Apr 2025 11:48:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Apr 2025 11:48:05 +0200
MIME-Version: 1.0
Date: Sun, 13 Apr 2025 11:48:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-11-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-11-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <676856ba2b7d9fdb09ecd3b63217bb8e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744537692;
 bh=okssFop4rg1U7L2ZPILuN6EMqsk6fbYSSYawdJxB/sU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CuVQFC7sRQLgITT32HWrC+uNGeFrLc+gOyQ+zHhdDiEY92xh6Kou6YfUk0j0IpqWs
 AZXUtcklPrri1OnDCAZuo7DV2ndw8+L5Zi2s1/VL7cjsah6EqWXVmk8tdx8ZGgksJc
 nZ/WIef2jXyUERiC5qJVdxkm+V6nBpW210UTqFJNZEQebVTDiV9meBlt0D4GTkvpmH
 rK3g272ILqy3yLzUNCg/oEFbegc5yp/CuT+mGY8iQn8YtGO81xsOkkevf24qmSXyxX
 5SNca2IAZMpkiw4+l2qeIlFaneKH5uFFpv5tzbvQBgpTpLoWeIIri6h8yNpUJxClKI
 wzzRRJ3lBv9Cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CuVQFC7s
Subject: Re: [Buildroot] [PATCH v2 10/18] package/fmlib: uprev to
 lf-6.12.3-1.0.0
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

On 28/03/2025 19:04, Vladimir Oltean wrote:
> This is technically the master branch, a few commits post release tag.
> Change log:
> 
> 7a58ecaf0d90 fm_lib: explicit conversion to ioc_fm_pcd_exceptions in 
> FM_PCD_SetException()
> 22a0d3f1867e fm_lib: make REPORT_ERROR() definition more function-like
> 08ac8b3112a8 fm_lib: fix conversion warnings between e_FmPcdEngine and 
> enum ioc_fm_pcd_engine
> 168eae74fd8a fm_lib: fix integer-to-pointer conversion build warning in 
> GetDeviceId()
> 
> The build fix patch from Buildroot is no longer necessary, remove it.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
