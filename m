Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B22C5B567
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 19:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F77E6076D;
	Mon, 10 Aug 2026 19:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCRnmaUVjd5X; Mon, 10 Aug 2026 19:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D40DC60760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786390858;
	bh=Iyy+kGzJmVT21unIv6KshNJnkZtgssr8u+7NaiR8YmU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sYtI3L03hyVbw0k6Whhm9Ko6LliTp6n0pHCIN5w/YFhoZp3sc4k0quI+sAmHXDRe4
	 UzJwnH9gWJClmCHInwucyzFuT3XuVECAXX9hQLo3xdRd6AlRcvgESbey2AzSmhXFEG
	 C6iXwXmyYPHcPflbMi4EGidgeXpTAOyzlc+stWzkdeTBaWYvgS0ziqm22aDH+hVWk2
	 C7EDZ5Dl47x586fJtLsti97OYovqfVjqO61+lHXF9Olw7qMBY1aONtyOMfC/2YsgYG
	 uKQIGDsjBkKWe0DQ04zKZEHChu0l1s3ZPKc458NlxsECwXe6e+t0Z25Hu9da2uQbNz
	 9fbsuJiONoAiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D40DC60760;
	Mon, 10 Aug 2026 19:40:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB6C810E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C14E26075F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDfq6l3ITXZy for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 19:40:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C098F60760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C098F60760
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C098F60760
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:40:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9BF3E2003AE;
 Mon, 10 Aug 2026 21:40:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Aug 2026 21:40:51 +0200
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 21:40:51 +0200
To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: buildroot@buildroot.org
In-Reply-To: <20260810103921.814290-1-jonhenrik@qbee.io>
References: <20260810103921.814290-1-jonhenrik@qbee.io>
User-Agent: Webmail Free/1.6.17
Message-ID: <0cc99dc6b0692b565af7da99c054b86a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786390852;
 bh=v5My9AnwGwya0q+sIJ5ULqBKio64T/pSzFL+/3B/EWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sv+znoqC4RO3HFPyoc5a6xZrip78iLSkgNz+p1JnPL/LQQ55DRtgKv9czvB3f16Sk
 DLosJqbSGZ38lUFAJECA1K1sPKrlkLUCxpKQeMHqoNPPydTUxLo/9vxID1wnKrA0eq
 nuY5HFQtH7NJutKUvycrsJKDOrgIETh669SaPca7DZYw4KB1BcMyPEN8K4NChkvwc+
 sqYvRcLyDB172XpR+TCl02Vnj3StUli9KQutz5eG6APWeJcPQkvvEuRtgQap2A8XUe
 bs+HDDJIvWbCGXUPKawSJCNdNWxtd+9KrTbTun1CmKMcCtoXl8je5fwajXY4EyT+1e
 q7hxyepLP7tvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sv+znoqC
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to
 2026.27
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvMDgvMjAyNiAxMjozOSwgSm9uIEhlbnJpayBCasO4cm5zdGFkIHZpYSBidWlsZHJvb3Qg
d3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtA
cWJlZS5pbz4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
