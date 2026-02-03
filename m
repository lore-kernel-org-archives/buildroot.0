Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A751E8B365
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 20:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3911660A38;
	Tue,  3 Feb 2026 20:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi15f4MKmg68; Tue,  3 Feb 2026 20:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BDC6090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770152181;
	bh=XdSzkTroWavsH2IpwJhCLWKVTdLp7RfAeqBCHcHuwcc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PZdtJFmmhtoFz8SFFo/Pb1URIjBw2ntpuLHtctOlVQdVHQ9Lx0HDVtSiClKN3pwBw
	 8/J3uUQXRtmFS/yLSH6xlAY2W9Qoa81lAbm5yAAka1xrY1pwfA8sZAwaKge8Uo7Cga
	 K7W0UTHdQjmBdjX29fvnZKz1BshRsElSxxKmPgnXtz0ppHGazJCMKPWruTVMwjeFpq
	 UhwkGomIKM69uIJV7ZsmKncJ15ifmLbvNXdbWn8FG8nu5WZbO8W4Eg/trDGliDaWfc
	 8gzqQnLNI67Lp4tZgiDPrMWEQvHB7WJsARwKGb9u3YsCVMNmWtiIU1G71m5vsrg5o0
	 VWapUByIngq5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08BDC6090B;
	Tue,  3 Feb 2026 20:56:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30BD4F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 20:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 116E583C08
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 20:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H7TyOfacxyG for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 20:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05F2183C04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05F2183C04
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05F2183C04
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 20:56:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 336842003C6;
 Tue,  3 Feb 2026 21:56:13 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:62614])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 21:56:13 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 21:56:13 +0100
To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Cc: buildroot@buildroot.org, Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20260203184150.3631973-1-pyk@foss.peewhy.fr>
References: <20260203184150.3631973-1-pyk@foss.peewhy.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <920d2a70f69e4da354f524f9f8ae8753@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770152175;
 bh=16ADb0gKkVy+sgg2S7Fnj/IUd9pH0tDqufDaJdAZ4DQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B2ArxrXHGgr83+4DAyvrj4S+ovU7rGH/0vXY9incvdE8J3xaoOrvFfihZB8OQyRqS
 q8a3pxZuwxBokSydQFbQLGE0NY7i9SZeVN5YX/2euCKqmCLGrNnDZoJXOrW0HaypcW
 fY137xdR6e3NcjIFfC6az514gBK/nX4UUx+z7A15VOTog8qw8E44/DjKxsJ874q3In
 KqLasMb+hIxr6P0PAy9pPw+TvFNoLvcFiMe+1CznAIXnCzHBF/PDLZQ6IoGzSw1SJr
 rNc9Qg8eoVlFiTZ613A8VP4VpWWu2d305YuJsb/Qb27qmthNFvKDloHfel7DyciTb5
 DdT/8W3Hxf18A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B2ArxrXH
Subject: Re: [Buildroot] [PATCH] package/git: bump to 2.53.0
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

On 03/02/2026 19:41, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog
> https://gitlab.com/git-scm/git/-/blob/HEAD/Documentation/RelNotes/2.53.0.adoc
> 
> Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
