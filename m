Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECD7C4450E
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ABEC60A7F;
	Tue, 14 Jul 2026 12:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIJ-KuSLyviK; Tue, 14 Jul 2026 12:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E014060A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784033936;
	bh=CirzSWamjRua6abALk34axJFnYIzP2PSQFpeSwPxiCE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PcRWg4GUzuc+uD0J2yXSH4sVWmpRTHBRe0rg5EeslbDm+fLwaCVqirGAK4jlDeXK0
	 E1Eb/KuZuV+hdD4UU0cX4Ha0mb7TZi9cGyrtLqM4yxC7aywYDUU/ZysUBcZlg5SvPh
	 LbFq7MKy81/nbftNu5UsNM/zYvx7WLTrSnzWocERhlDvaoxESF8pWik89lRu1zuiTP
	 +iLqXRzHUA8qfdOxE9LJgRedgjmrkhCcTp9wtD2nbc+xARGG6tqPnIFgADrt1Xm4Uy
	 79FIPaLYNqvSqGba5zhDS1eK+aYhkt/34H4uxpmt+uuoQtHZpOORLD9IyMAMJ6sT+S
	 ecFrLbHcTY5dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E014060A61;
	Tue, 14 Jul 2026 12:58:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82A5596C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 741C2401B1
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKSC-YYTp5CP for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 12:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6732740081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6732740081
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6732740081
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:58:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A512D5FFBA;
 Tue, 14 Jul 2026 14:58:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 14:58:49 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 14:58:49 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260714124429.559986-1-shirokovalexs@gmail.com>
References: <20260714124429.559986-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <6b3c73da647396a5a03aaf43546ffc6e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784033930;
 bh=ww2GqRa5hmKZ2esoSSTZArhMMeUY8GzUMsge8yH16wM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FJAFcohzS10P/0gEw3BX0PTZxUxMaPGy9iWpKtLzTTZYtIRmDJJ3jC2RE9ZPBErgo
 J/0i+WBsCwNy2i93PA5ABY1RE6Xttk/YsGPBU9H2CqIB5r0SuN1lX7n7AWlNMFZe82
 0akW4y2fW0iXYmtxlWwLOfbPcQIUCIIj+fezaos4PqCVE37E3osp1ajq/3Ra+ZLTlf
 yrxaCQskbGV7bOdUm7jtg6ffpxD+YLJ84HCl7RgIj9Buo6WqTBSDEPMtsFOOxY2c+y
 EO/NftWvD2PVr9ubR98XWb+HV0j50g0vj7v0DZPVkgXD4n9avNyUC9QT2d/GDpRpqT
 OQissR0TGmvQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FJAFcohz
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.58.0
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

On 14/07/2026 14:44, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.58.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
