Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A22110FC441
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 21:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A969261015;
	Wed,  8 Apr 2026 21:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SH_Y8VNs6Sk; Wed,  8 Apr 2026 21:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3275960F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775682790;
	bh=DVnYex5o1XpZG0sSIx8VpL3Hzoqo2JaLsTgtv3tycjg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rLArQqbwCy6M6QrRdO0oJZmYCiqtipLczcFACHHHenTNJAh8UfDaPZk+wLtMUsLBC
	 80Xw6OHbNefyrWGZsMY7ZWuoHOAejLq4YQ3eVJ8lOoGM/Oh00V5QW/Dez7Ji3gPUSM
	 eQaVKmJGeoaJEk9RDJWLqKoZhKSxnKW82Rphs6+Bu2/iARb5WwP50RB3yULvaro1bp
	 ITlhm//r7z2GEpKQ5QNAGGQQEWud+qgQtvapsDtBLzBGlxOOad76o92ZDM26kndO0i
	 X2xi/MmY8kdtGFllkhcQj2XIyz34ojLXgGJOgIisHDt9tEDMYvA6xNW0wJFKbitrg/
	 BaXSXXOEC26jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3275960F89;
	Wed,  8 Apr 2026 21:13:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B3F6237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6144A401A2
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfOpM2ONiMWF for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 21:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81782400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81782400D7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81782400D7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:13:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 42FA278035E;
 Wed,  8 Apr 2026 23:13:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Apr 2026 23:13:04 +0200
MIME-Version: 1.0
Date: Wed, 08 Apr 2026 23:13:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260408085557.1641890-1-bernd@kuhls.net>
References: <20260408085557.1641890-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <884746c0ef8d14a8d3545804ded3bdca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775682785;
 bh=AkZsLJSIhnbSYxq3gH4RPJSJm/do0pC1Bcb4FksMYIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NfncUPMYHLS2BcVN3TG2oNlidpSr0CVK0haDUGB4aA3orUJjYBBqdW8iaI4l46Zzi
 zRt7eNGfO9dneqg4kLSAYhcLbjWez+LHpZnrMeUpNBIgYjFvU+D1fkgDT+qIs8pLem
 MCwbsXuqW63u90UvyK7y09R1R+lUbmIj99x6gPrDkU+L57Yvh51Z65ykCKgGEaNGyh
 J1oEiH+bNy7WUGsC/i2dOKcFzfY8SiaIpMJ723ux8T0K4qcU7oeaXqcExzHUmvY/Nt
 +RKCnyTZ6v1L0ApI88YdcuZwUH9qHmCJcbbpKh94GkTHT9GHOJPYvI+i7nznGe1G6Q
 KP9SOn58XfegQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NfncUPMY
Subject: Re: [Buildroot] [PATCH 1/1] package/pciutils: bump version to 3.15.0
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

On 08/04/2026 10:55, Bernd Kuhls wrote:
> https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/ChangeLog?h=v3.15.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
