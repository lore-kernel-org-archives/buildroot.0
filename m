Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D077E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA1C38329D;
	Fri,  3 Apr 2026 17:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXhnu9KJsLW4; Fri,  3 Apr 2026 17:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D809383163
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237831;
	bh=zePgUUs9f2+mgvoNGhrD68tZPuo/BDYHsWbUkJqC1Hk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L2ZDicw4BFvXJCyJzjE36uk7KC4DscIMc/Gypchv70DGR922CoLSa/5ntaVvYkviE
	 Aqeot2iAJwU33Y16Xyty/hXLfrX2qbAq6vO3zGTAXqm8JW2n5pNZMs/LBhZVRGjKd3
	 npZ87u4zTxbbBx24GxfObDT2Vyde2V0wd7Xzx4HsKTX8nTUMceWUm17R6ec9pGJYNG
	 5ACGM2DCav01l8wfx24rHO8gYyAl0Ph7JFPnz47DeIkx9QqmKB9+Fr16fw+thcLT6E
	 KTesXvJ9iKAu+lVomhj1GM2jQ4kZueMyOB89QVF9bpigKVCrR82eM9rpa/NsgTPbn9
	 2Fzz669rnbZEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D809383163;
	Fri,  3 Apr 2026 17:37:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BDFC1AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C4040226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnKbetLqshMb for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9EEC40202
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9EEC40202
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9EEC40202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:37:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EDEFA780514;
 Fri,  3 Apr 2026 19:37:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:37:05 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:37:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402180208.2779866-1-bernd@kuhls.net>
References: <20260402180208.2779866-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b01f192a406fad22c4946d9838efed28@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775237827;
 bh=BwTUruz0Bw7i+nwlJhm5ck0IOiZbBnvCspI4ACKJ6Ig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VjZPgQB3Oh82bY5Z89RQeYUm+Vzt8T/92bUR8HFnvfwrhBFVnuFC+hP3q1OK/GGtB
 LncEB7zKEWksss/7I491gnwsq11kf1w5LaVGTzQZT7nbpOkdhllYgp4N3S/H+HoJWA
 jshy3ZOLpS1hSSkFeh4k3HKJLh+djMk4m65AhV6y/0ioysGRVL1n3/5kR3ij1kyzpN
 2m3iS7bYiX3mL8I3Jg3sTUtSnPGJxgJze1xOKSPbPXG08zNC9zW97+pDBveucTaJ+p
 AGrMH7nW797LeQV5d5J4/Rc6bpYEgfFBNGL3QkSroOvtYaMQuN9mj6a+oWt3Za0q41
 kuDeaNShdQh1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VjZPgQB3
Subject: Re: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: bump version to
 2.4
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

On 02/04/2026 20:02, Bernd Kuhls wrote:
> https://lists.x.org/archives/xorg-announce/2026-March/003676.html
> 
> Upstream added a dependency to pciutils:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a97925a6d7cac457a5d46020f38fbef59e74abc5
> 
> Upstream replaced json-c with jansson library:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/b24cdab174240399a6ac377dbeb7923d4f429680
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
