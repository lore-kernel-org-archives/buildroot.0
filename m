Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DBDE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F37160E48;
	Sun, 21 Dec 2025 13:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHIWc223ajLL; Sun, 21 Dec 2025 13:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC0A608E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766322286;
	bh=ibbX77x8BqRyqhd6GJHo1pDtoLiGXqWl4wkUB/ibbBQ=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=O8JT0WYd3nDzGBM08TyI5KDvYCQXyfLyfmoa0XuQnMh0awHMJi2NpqPL7RrnG3EtP
	 sjDzhoVKsOuYaA9z7zgyfHtTLqrspVZLp7dNQYFAK0EVa9mVNhyTZJ9kuGWO0PlC+M
	 7KRNSXsm6bQJVbkJKdfdvqw1nZp1uw+bLWnHQSAf5KZmuVy7Nog7FJkzVrSeA4O4OH
	 O/VRwxlOCEobo7CKQPBIie6lsTwpLrx6rMk5Oh6xil9ryzS2FwmNgtHucDwWeU8JeK
	 OiRQIDyeXrskxIeq8snLQvySzvoNAW4kLW/i41Y5Kx5L399WLNWzAHdunfHJumzybK
	 q+E4sLEr0sypQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC0A608E0;
	Sun, 21 Dec 2025 13:04:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECDA8195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEB1E81B9A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgELHbwLzkbP for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35CD981B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35CD981B3E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35CD981B3E
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:04:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 45CE15FFB1;
 Sun, 21 Dec 2025 14:04:40 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 14:04:40 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 14:04:40 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251215181828.3206337-1-giulio.benetti@benettiengineering.com>
References: <20251215181828.3206337-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <fb31a8a4584c37426507e6649a08c1dd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766322282;
 bh=aF7vYU0co3wfrttDNPRdb0UUSbv4aSUTVVxHq8zWY+M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ffGV4B7vwIYCIhl83wgSaPshH5Hb2RM3M3/lplx2xLyk2+ggjve23MaW5PgAmkBRF
 nD58RhXFN2CjJGxZkGEPi85ZuW6/r6+aycjOjQEk36+blQRB3aAuxT+OUsmf6IpGVf
 PCb0ger/cKh6lCx+LsmuiKDfzvMTvY5K3AcztUHVFTghI9Wcb8980Zp5nt+K4LVAv4
 1KJPrhdDgbm77df27pWd7Hx9tVuEpDmMaUZRVGWwlFuY3Ed60fK6YZagKmbRuLndsx
 r6U1jB0F+cvJN0zGtNiV8mgmIvf8BkYN3uk9L3tWdI1/C+aCepcp77ZvEoboQUlI0u
 Pi6ud5hiW8Fnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ffGV4B7v
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2025-12-14
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/12/2025 19:18, Giulio Benetti wrote:
> With this commit it builds with Linux 6.18
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
