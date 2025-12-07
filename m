Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6874D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 11:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 909AF40838;
	Sun,  7 Dec 2025 11:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYF9PyZlspal; Sun,  7 Dec 2025 11:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B2140825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765107603;
	bh=twK3HDAby8keejUJlxGKal3Ll0p9uG/iaBlDh9ys2Vs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bbjlch2WYER2okWiQHZf7/57sC/Hzw0jA9ghICyzhgLAKpPdUneyJk51BGFYhKtsh
	 8wNQTwtIOiIJfRh4wcBBCxxNdnrj0IuBqvJ5eaXuEhxELKipD6utwlFq60lkpMRchr
	 nroiLgs8SkviRdySkDuf0n9y4MWQrzuvBczPIhgbv1nGnhoF2tLFw7/kW3pgSnHDC3
	 eiTBPtF2PhFFL8IFzi9YH6PdfPLAVsP96T0yyQFQNe+Fvsb2lxraNCHGD0MRhdobD4
	 yDwCfjVsuDRdzvGTHATp3y5kSZpUjry+uWY504pqbH4RYIrgaHyDdzrh9yETbcysjp
	 gSfC7Yw/MPMVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B2140825;
	Sun,  7 Dec 2025 11:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23A50E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 11:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A73F60825
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 11:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ev__6f3yh-GY for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 11:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F29E607EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F29E607EE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F29E607EE
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 11:39:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5E4CE780383;
 Sun,  7 Dec 2025 12:39:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 12:39:53 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 12:39:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Stefan Ott <stefan@ott.net>
In-Reply-To: <20251206131044.689379-1-bernd@kuhls.net>
References: <20251206131044.689379-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8e6cc911172586b57d4f252446c62058@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765107595;
 bh=FlLZbb9Ropb6HjKbZqM1xcgaevXWh56dShiFY1sPGe0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NFy1LPk6FAcOq3u9fDJpM7orz+uPBiIpei8Tq79fW2JlBWdthXIe7aXr7VFNA3cnB
 /WCQxiBdzPesnHBfXu4BDva0+ySUmuW/CTMPjt5mGYhm6Eb2IIIaUxbWS++VBWuC31
 D92U0An/ZfxBF5C9iIotYM1Z8UMNlgvFlXk3b5Kb4P7R1M4KXIY5LVrTVJcdF8zbuz
 P8OnOLk43+Gc1fkdR/tGRTZ+zF7Qa4gMRNzElUpoMRsoMhoEYmFZGQV/YueTsu2M9a
 dgbz0XjyQfUCd+j+hCJ++wDnjXw8EF7ePIn1vFAQpApXcvj9KNZr6qnxlyAOIadeSU
 zRiaTGCtJzApA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NFy1LPk6
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: security bump version
 to 1.24.2
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

On 06/12/2025 14:10, Bernd Kuhls wrote:
> Changelog: https://nlnetlabs.nl/projects/unbound/download/
> 
> Fixes CVE-2025-11411:
> https://nlnetlabs.nl/downloads/unbound/CVE-2025-11411.txt
> 
> Removed UNBOUND_IGNORE_CVES, the fix is included in this release.
> 
> Fixes:
> https://autobuild.buildroot.net/results/d3d/d3d6b84ba667e3e2586b7cfdaddcd160232eddfd/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
