Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C2BC44507
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C76040785;
	Wed, 15 Jul 2026 19:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJKEK6x95c5f; Wed, 15 Jul 2026 19:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49294071C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784143088;
	bh=PGMo9h3efGwO9egDn42ivcnDdAcMbNq0kWw+0D+5LSc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hIz/i1ZE5+J6vxGR1vdHZBJiFOeaxvuUPuuA1KYlJ7cSgy2RfD7M/7cM1AylW7de1
	 RPm9uKIoiorCiIrgWIjrYFSeq5AU7lXHuP9B0LANSeNinyiDXXPPvjzAjkXY7FFiYr
	 AD8OrBLkafrtaDuu6+ETJTT5g2rJZNzUUKdybcojeEdrqFHfgwE1uvHv0XKJLWdTty
	 WG7A4B0h9nCJbU3Rbnih9MjYMjdqRxZOW1B+OKMID15JgrDIiL8T18exKmd/t8V5ok
	 HnKRZeCotUTkS+NrMgbnzb19qLuWOMCNf1l5aYtXDyXJZu/gXK07JHyRWylIz8MYRs
	 C65WgV5UJH9Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49294071C;
	Wed, 15 Jul 2026 19:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE52B320
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B3480DBC
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCsoOyjOpU75 for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 962E580DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962E580DBB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 962E580DBB
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:18:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4A4602003AE;
 Wed, 15 Jul 2026 21:18:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jul 2026 21:18:03 +0200
MIME-Version: 1.0
Date: Wed, 15 Jul 2026 21:18:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260715155932.9265-1-bernd@kuhls.net>
References: <20260715155932.9265-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <23d0fce7c844240f8f8135a16ee4237d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784143084;
 bh=DjMTSPIy1kRT9cu840P20QuM9KTcExPS4kqkfr2Nv18=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N8rpLuVAHeSFem1pUIvGYOekhNzJCNrwZOQt1UI8a2OyZzkshjT56b//rjiljnkCl
 1ohj//R3Mn4G+fbwoiT3w3HZZ50mF0HcrG2MnfK8QQZ1fMEvJP6w2DQy/Dp4VmI5Ic
 PKmIVEVZH0z58BShPZVAZ1UYYH2M4yDaa6xdM1hJFAtUDIWsbUMGwvX5iD92P25odz
 +8E65jPaapde9ZlsnD7F7xEhNM2B1zgtDthfc7KFS44RmzlCILr6Mwsb7RKZ/O0Bby
 27v+kq2heTP4G7B1QLJOD96jMdI5TCtPOrSN3MyYh3LVmDEp5J0f82wo4qPy9aI+ZT
 U3/6NPZszNQtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N8rpLuVA
Subject: Re: [Buildroot] [PATCH 1/1] docs/migrating.adoc: document the
 tarball suffix update for Cargo-fetch packages
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

On 15/07/2026 17:59, Bernd Kuhls wrote:
> We changed the suffix of tarballs for Cargo-fetched packages, which
> affects out-of-tree packages, so it makes sense to document that in
> the migration guide.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
