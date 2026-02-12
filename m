Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A493FEEA845
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 20:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A33260BD0;
	Thu, 12 Feb 2026 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BL2HNlw40ll1; Thu, 12 Feb 2026 20:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C1860B99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770926736;
	bh=peER1Ogj8K0lyG8MnIWpeklNCyGQVmSSXMKkV5P7THg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LrF9vDiguuIyrWTo6xuM0sdPr1TDIHRYcxIEXYfjFwiPjHKxK3Y+zFEu1lpC2g3o3
	 Gl61d9SP39IHA4qM3Kt3DKt1TIZ5N4MmsMBA28CxYWm4/LffV/GtsF2na2t/neL3jJ
	 zj9e5atkBEkDLYsVKrZrW0SiXirCDFwTQFn+xOC7HqftGNUdjzp6hnyZQmCS+zJHRx
	 oqoJIorTKFh6+8iGR4mapgIxGBBeYlnuXZ92OCQm/nRKS3tJk/yhk3i0OgxnKPmy7F
	 uq30aN8WvSezFIB3JxpeAHki68S4X48x9j66FvPpZNVCCSQKzXOTnN1u2eQtz2mKpQ
	 RonQ+Bwyty3Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5C1860B99;
	Thu, 12 Feb 2026 20:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B651CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3304184066
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w25qJse7c1hP for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 20:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A594818AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A594818AC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A594818AC
 for <buildroot@busybox.net>; Thu, 12 Feb 2026 20:05:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AA8D413F861;
 Thu, 12 Feb 2026 21:05:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Feb 2026 21:05:30 +0100
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 21:05:30 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260209092704.13687-1-francois.perrad@gadz.org>
References: <20260209092704.13687-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <549d6f71dc66f4d55b96570ec63df402@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770926731;
 bh=h6QNomo7LCUQctP8Bt9Eucx3hOi8vNmzBVTkPyBzx6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qsK3tvtL3xuNAbG9ovocKpVUYOeIataXxznvcJQN7pYX2u6uieAm0FwOiTw0FGXer
 j2sDlxPCmhaNgXzsd3He98NbAbFozGSLgHF7bfe+ZIZigqUph7TvXoP87F3bBw3nTW
 GAJ/3Cf3jOuKhgzspPdM9aopDu3baFlEYmBDUsjZM8FLW6XteLCV2kppKmUXhU0dfn
 8DeBA/WW4kFg86A4ZmW3IYE0cseqAK3OYFrlgKdtpky7+ae71iLyFXKpNygiZDMFSH
 Va3Xr+VthqSLoONp42XAqQzf2b3ex/tRctZrimaJNBrAKJRlxlieEr3vLZVVEpuFfI
 ry/+9Fp3YX7TQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qsK3tvtL
Subject: Re: [Buildroot] [PATCH] package/lua-cffi: bump to version 0.2.4
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

On 09/02/2026 10:27, Francois Perrad via buildroot wrote:
> remove upstreamed patch
> 
> diff COPYING:
>     -Copyright (c) 2020 Daniel "q66" Kolesa
>     +Copyright (c) 2020-2025 q66 <q66@octaforge.org>
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
