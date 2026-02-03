Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118EAE8B362
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDB5460A41;
	Tue,  3 Feb 2026 21:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GnWWT1n_l7u; Tue,  3 Feb 2026 21:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE9AE60A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770153999;
	bh=WjzfQ/OYoq8cacqU/F0hlNgO+paErT4BLvMzc0r46oQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HHEyshhKSTvuPlKhV7ySaA0Y0cNCQ6NLeahDCSzn2CCPD6DMOzaktiv59oGfvkIrQ
	 Zlh8ggIskwystvmplkhrY66AZfr2SqBrQ0xPzXKYDeEbuKffCHaEc4kQZfT5qVu2i2
	 1y5C2RZqMAexW7TeeUIyrf2e1YHtjeTjjI2m0/ftWh9ZW5GS5MBszAtwOvWnP6k4Un
	 LaW64HtRmsA+1YIF/Lu9V3FQTPRKMTlD3k9vagATDV/tVSGJY5RmwbQUXA/RHT8TE3
	 3UTSDcNaApuo+5V2YTZ+2XgnQmCzHUpekyWirZmzG+rkd9UEuSxEbHqXE2Aef8Yn+j
	 ON7jnWD3okxig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE9AE60A42;
	Tue,  3 Feb 2026 21:26:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEC71F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B969440232
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVnnu4e4D6ga for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F278F401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F278F401CE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F278F401CE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:26:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8E11A780395;
 Tue,  3 Feb 2026 22:26:32 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:65185])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 22:26:32 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 22:26:32 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, vjardin@free.fr
In-Reply-To: <20251222215636.975668-2-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
 <20251222215636.975668-2-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <e600d6619411ebf0ef05acc88967ca14@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770153994;
 bh=BG1ADax3mX8UpcISZWo0mVp3t11iktQ1RlSNbjNYaXA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o+HS0XDazvShzTT1LFDpSqYQMaxLZ37P5C6MSNGiYHjcP4C4cTIpSM6rvoX0vA8xe
 rT1u9pMvT5Y/ME7DvaR3KiSSeUvAXQlweRQ5L1rGTpL3LGY/hik2frI1AdNBRBEOpZ
 MsH98MX+1En+KpBKwqPLSTYiaVEldhI5V7xqAPVhPUX769YIPDxjEV7sOFvlcO/Khv
 qWjrkzkZCgnO/qZPGgTanmAIVh0lJJK9KiZrXKCj+yTMwP5bhPZtrwKZs28IFmvU+r
 6Z3CqVly0f+nSXbMFGjkyxWPQ7Y9q2BlYKWoo2rOsHR9X0WumA+7U/jg2TEqe7Yq4O
 ncL2ZxxrggMJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o+HS0XDa
Subject: Re: [Buildroot] [PATCH 1/7] package/dpdk: make drivers selectable
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

On 22/12/2025 22:56, Maxime Leroy wrote:
> Add BR2_PACKAGE_DPDK_DRIVERS_LIST to control which DPDK applications 
> are
> built:
>   - empty : use DPDK defaults
>   - none  : disable all drivers (-Ddisable_drivers='*/*')
>   - list  : pass to -Denable_drivers= (comma-separated)
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
