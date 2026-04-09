Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D9AF364AF
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FF3040976;
	Thu,  9 Apr 2026 20:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e55SAIS2B3ZE; Thu,  9 Apr 2026 20:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E2240759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775765111;
	bh=boNFvg0hNbwkwN6eXtulQm9QFFJf/beIwfxvmNuYKoI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SrnHwFUXWEZh+oQjuptTkuZd1BX8GB91tUVUeNFSRJxl1AhDLqMagQBGiluSde+16
	 QClstiboGHrnU8Mfzzy+X5etxNJSXJNqYwsgUJkcys/V5Th4PR7aNtcRSHFej/QeHU
	 VHqcJ9JYZFwGcYJx7MvJ9pXqhGqaMOVFqVzevLJXn4Rfl2jiqfbaJXHG/b8pvXhlBV
	 eanakalwfZLppIukGCk+5aBiF6u5dHVJ76M9Rku7DGGt3EFH/vobuLYPgT+VLYixZ0
	 WvIvA/ymrLQ3i0GRaC6YkpAVQmXXlZJ7+utNUilzDStZ8Qf81kWdS9CjfK0bVcuK0q
	 VKztIU/gdNxHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E2240759;
	Thu,  9 Apr 2026 20:05:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BDD2237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825FA404AC
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcMTIaJXChy8 for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:05:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C38CB404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C38CB404A8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C38CB404A8
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 53C725FF95;
 Thu,  9 Apr 2026 22:05:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 22:05:04 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 22:05:04 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260409173835.3947256-1-dario.binacchi@amarulasolutions.com>
References: <20260409173835.3947256-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <833c6fbb7526221110731b9ae89cf9e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775765107;
 bh=4K+mfjK3BpWndWPbIYkEifxXx2b9seqZSSLr905vJuQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eUz6HBzgi659sK4PtZSy+fk4Sz/rPjegCaMXjfc4OxrU8NZYmuEzfEdYD2PEnFxkb
 CXoKFVP7Ft6gEr80kjk9n0jhIGyylJOk4aaXt2jZoagTXNu3XYPibKduMvgzblTtel
 TBLtjXyEJovDbRyGs3TsayZu07UUjzFiSUAxEBtQorPhHDjKdGNgSg0eQZ84qihFEk
 cQgVUeVLWk5cHvvQVVvUu0hy0VvndGD94nYBAHWo1eFAwUSBngYbTR1y5/UNHrjmb2
 lYLywOQhGNDA1R2T3viCyNJtbuV9dlpu4oDjSecwwa1NkHfjRh4iT1qAYOtJmQm9Bc
 RLwzA97fHTrcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eUz6HBzg
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux
 to 6.1.167
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

On 09/04/2026 19:38, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.1.167. The size of
> xipImage has increased by only 10 bytes (1673635 bytes compared to
> 1673625 in version 6.1.159).
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
