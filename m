Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83C9E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF8081756;
	Mon, 29 Dec 2025 10:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWtzY0f9NWY0; Mon, 29 Dec 2025 10:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF3B2816E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767004829;
	bh=xTpZezYnuDcKdeTzXD7S0730v+I5eY3Q8U7m7/OehOc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s6OL9anCrDdXhwjNaLvgOAvx1Rh77dw58SyHVySO1ezkV/ef1nopKrZA6C8fzjU5X
	 FpdUwNvZZc0m/6QDLXZhPGDmyCQGdXnrMc1W+xuCoH7yOrAKGfCuwKstpRaLG2244F
	 Rd65ajMMXF695Tn2j4PFu83t/VOJB71XkC+91X21lzptvxPYloD/0tOymGp4fqBKfN
	 uSBUPYTyF2YrxoaIY7q/s6GWpUCN6+7AXL6b4AOgNM74mvb33h//YpGu+Cq0WOSu+v
	 uPMnNhxJqODvd/i3RfudAlLdjvp4p373d0YQG2PU/OlLLDm1x/v7vk01x/KdTlTUBR
	 PUqISluOoRwfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3B2816E7;
	Mon, 29 Dec 2025 10:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE367177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A067740246
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWoD9uQi0sZB for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEA38400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEA38400CE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEA38400CE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:40:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8886A13F8CE;
 Mon, 29 Dec 2025 11:40:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 11:40:22 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 11:40:22 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20251204205412.2158168-2-bernd@kuhls.net>
References: <20251204205412.2158168-1-bernd@kuhls.net>
 <20251204205412.2158168-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <8bf1281d2426abe276226eca003b9eef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767004825;
 bh=mZI37UrHyP64DBjMjv7mMnBv+j43ke6eXZLo1hZth+w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IuKOedmO6r1RlkhslBj08NsEF7TRG/wTtGBC1ZCRHGnlCTy/Urn63nr7w4mWvVb2u
 0co2YEHG/M0SvfKweoez0A7hbvbhFr1XuI+vG9Dmj4NoPPF1+YL2Ip+tKIFUg66bcY
 qBh3QGWGnRyc6YLCoPuCax3OPn3LO+yUAT/d8ePbVJQEVXBOIy5EQtpUOphUaQzRzc
 GcjZ+b7yVa0c3hMSz0Sem8s/vJNQu7CZfJTRMcjF0o17mWTzgzYEscvtMU2wc70Rcq
 sthnw2feQ5qys9FIOFYHGFettjf57N9+aiLU99ujOasHimLDD1tcfg348BpTh4XuXj
 PUYPeXqNbH1Qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IuKOedmO
Subject: Re: [Buildroot] [PATCH/next 2/2] package/wtfutil: bump version to
 0.47.1
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

On 04/12/2025 21:54, Bernd Kuhls wrote:
> Release notes: https://github.com/wtfutil/wtf/releases
> 
> Needs bump of go to >= 1.25.4.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
