Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE93BD3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 20:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E79F828DE;
	Mon,  8 Dec 2025 20:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ursta1Dyd4c; Mon,  8 Dec 2025 20:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5719E82786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765225230;
	bh=WypuE9Q2sIlQUVJl8/MT9/guQ2juJsNV5sR97vc/Hfg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NvRDab01UlfLV4FsoQRl9P2epBRcPVhN4HoozdKyD7j/MViwIp++F23Pi9UpTtKuF
	 IXiPICk2P2JCigKXpq2Kpgi3UCETTsCYZcGZw40aYlGAkDpTdMV9oba1g1ywiBqYeH
	 zvhae0hvFgYFaIXsf7l24vnaDL3TNBnxy4Sf375v0+GVKy2Ru0qsObF2p4dFQB9zW4
	 OnDrdA/TLfdxMVTXYMz9ZHSy/TXWkmogKWvDHSdOBJiGhXLFi5f0wcJg8jdbqz8dWf
	 P0Dtj2LAz567TRIf/mORbhnIFzONVp/TqfLFzvbKTrHI1S37cf61MQ3cnGW8aKaqzQ
	 t0Awh7LRJk8hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5719E82786;
	Mon,  8 Dec 2025 20:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE65CE7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4191402B0
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20G-A2X2ziMv for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 20:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 604AA40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 604AA40130
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 604AA40130
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:20:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 530B513F86A;
 Mon,  8 Dec 2025 21:20:24 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Dec 2025 21:20:24 +0100
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 21:20:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251207172230.3760260-1-bernd@kuhls.net>
References: <20251207172230.3760260-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <ef80a605e1aca0b8deae589e77122c4e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765225225;
 bh=nYy9whLUcZl0tbpoF/dYWbgRx3L1XjRuFk2KcpfbJ7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PwOQNnC6chM1jqn3X9uQD3WU6lYELYGAXvNZcgVIdLmQ5315ZRCcbDidZrWWqr8Z3
 qecrOnQCGgAP9TG2NVsk5lsIUOf4FF2usEt8k771acOr7xOESAH4aMHRphgv0+5k49
 wf4PuFMkOmkX7XIwikV14dglFkMlHrP0W5E7DtJQR2VOXg2w+a6vvtgWxifZyl+4aw
 Nu5yJ+IaOhC8Y8ZadxrOFHV52Vo/YiJsmkLiBYseQZbr7/+aRb1JrHfOhfTvvxCIhX
 OX9aHP3lyBPtgkVqM4HEWv7AqovNKZPO6agL/QpqSrLhNOdrMottO0q8pmHKjKolmC
 075sXkq0k7IEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PwOQNnC6
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/read-edid: fix cmake 4
 compatibility
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

On 07/12/2025 18:22, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
