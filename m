Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF87CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE6F760669;
	Mon, 11 May 2026 19:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYCvAM3hQ_Ww; Mon, 11 May 2026 19:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD6A560675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778526746;
	bh=6KpQSksxQhFaXkdRr9PDjyCLeINGKsWyk6ItSKDKKgo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z46OxO60Yr2WWg71GHayoSmMqjOUa32gwwXf4TwMQG0K7TGn0ayF1OxkVNey36gKq
	 HPnAgMtHDtOLBZYocy1BOHdChV9aTej5bnMmx1DM6cu9dMj+BqHqK2zoCrUemrPwFg
	 dwW9DMuRmlbeIBv1wtMYSZJbXyPf14qXGYrH5otgUCXQ+RSEzV7EIreYRSGQClFek3
	 RpMWIq/C8rlofiWLDmtemn2vqHJfpgWZ95/9p8yaw+uzb08okXeY2dxffqskCeiaiN
	 5B6X6EkIECNJlL7xXy0N+S8QkltQctfKCLILXoLqt7BRueevIHX+S7cJeD+R7Fdup+
	 gD9M91RFFNi3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD6A560675;
	Mon, 11 May 2026 19:12:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2091173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B38DC40070
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKv7oVd3rKEu for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C07694005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C07694005E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C07694005E
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:12:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8AD212003C3;
 Mon, 11 May 2026 21:12:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 May 2026 21:12:21 +0200
MIME-Version: 1.0
Date: Mon, 11 May 2026 21:12:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260511185447.3298731-1-bernd@kuhls.net>
References: <20260511185447.3298731-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <cd876efc40191c18bb9e1948364e3a97@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778526742;
 bh=hEb4gciKWHw0GbACohIdss9fG+3971ENOGHi2SPLmGI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fiAMe3DcopK2aRnfVEGccPKI/YvVs2sxCVoccHx2WqA41ayVvokX6UB1zFTf8XfsT
 brPSfmV6JFSHkuDzm7S1iptbMSxUao5luSib9jU+9zhikrhPY9KthlJ6e0RQDzEWXm
 kVDJecX+e/plXgfL4jOOgX9rEZw/OxzKim3wH8ooDMa62K1faSk54l1F57N506qfsB
 K+LmXUf92etjV98N8azjAs4EhHayZfZjzBsqdli0fdm+TjL05rW+FHDeiLvm7tyjkC
 5W/uLHjQbnWTOn8hQ/jicCIPH/9llV3GQ0tOz/JaX06jqmP41U3yhYeTnngeRtC0TX
 BPv6cBcJRVXxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fiAMe3Dc
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: security bump version
 to 2.92rel2
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

On 11/05/2026 20:54, Bernd Kuhls wrote:
> https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q2/018471.html
> https://thekelleys.org.uk/dnsmasq/CVE/
> 
> Fixes CVE-2026-2291, CVE-2026-4890, CVE-2026-4891, CVE-2026-4892,
> CVE-2026-4893 & CVE-2026-5172.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
