Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD73FD88CB
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 23:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6598960EF6;
	Tue, 10 Mar 2026 23:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rz0OcSeNOR4Y; Tue, 10 Mar 2026 23:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 098DB60EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773184762;
	bh=ypiiVNrb65WO+KRcB2jIJSvTSqKZfr7GhODq4WWXmYo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oIlxqe3WCtshGDYUdsy/RNVL88zxO/Di0OLc89YxSll8eoN7jqXiHzdJzVelqVwqs
	 zA0yPdHcUEUeYhGk9IRemSWrICUlgaIMtOyib6fk1Hb2TeUd7kcsWVUcfhrWlDuWDb
	 K/OX1DBeKBNLrnB29M/trHiFUnF0KD/hR0dspyecSELT+i6cOgsTBqmw/pneLhPsUw
	 8GqgWHbUT996H9+PlJK8ccxs0KQLVcdM8fg0dUsXxL5c5X/SbtqqxZvyYRCafa5MTR
	 v4S8DouAZIlK04TSzbZHXgINqK/xdEpF0NKYyBkxC4ljJK48LjC097uBlUN9T3ESPf
	 wGxpbwQ161reg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098DB60EE7;
	Tue, 10 Mar 2026 23:19:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5517933A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B2340CE1
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q2yo4tHpXQn for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 23:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 910E640CBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910E640CBD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 910E640CBD
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:19:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6D8D75FFC0;
 Wed, 11 Mar 2026 00:19:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Mar 2026 00:19:16 +0100
MIME-Version: 1.0
Date: Wed, 11 Mar 2026 00:19:16 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260308213348.708846-2-romain.naour@smile.fr>
References: <20260308213348.708846-1-romain.naour@smile.fr>
 <20260308213348.708846-2-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <567943d223cdcff109845856f303a37f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773184757;
 bh=az7McfTySoOSGayJmLLLGYPYOHklZDUwuL0skRX5bjY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uF5dma3mgHi0D1zBR7ZixEyDk2Fh5FJ9d3TfGWgWUlCKOKdrtG0FM9PQNwCBTCthr
 h1d0BSD9VIx6B3Ywq87Bgg8YbZdHubHam+TSRXoN0BPFWCVNE085JCRxTdpdwMDsdY
 EdoYlwa+9mpD7Xu+I+zSyrnQee/YrkYSZKgwZ1I54br+zb2spmdmX7kBF0FL0IaLw1
 SKByi3NtSiYToQBHjMnke+W4BfJFKvzTrEkDqpyObfDwmd079NmvpNvYwgIsBCcN2f
 lUzMjBZFfXowd2AteUDiHshpeJZvYzMETnZSKNXAdQyTr0O9CQvmRXGGibnlyBmL68
 uAjpcWQ9x+Atg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uF5dma3m
Subject: Re: [Buildroot] [PATCH 1/4] configs/beagleboneai64_defconfig:
 remove unused file hash
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

On 08/03/2026 22:33, Romain Naour via buildroot wrote:
> The commit [1] update arm-trusted-firmware to v2.12 LTS without
> removing the custom file hash.
> 
> While at it, remove unused linux-headers.hash since we already use a
> prebuilt toolchain.
> 
> [1] 4abb8a98b26922796b41bc913e72be487337640e
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
