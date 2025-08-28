Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13B9CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A0083A50;
	Thu, 28 Aug 2025 13:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8YEcXudKqiT; Thu, 28 Aug 2025 13:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65D3582A6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65D3582A6C;
	Thu, 28 Aug 2025 13:25:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD79E1B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93B8360DEC
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7jnd6xIHKuR for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C014A60DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C014A60DF9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C014A60DF9
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:25:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B70CB978315; Thu, 28 Aug 2025 15:25:36 +0200 (CEST)
Message-ID: <d055f7d3-98ce-40f1-8934-d878779b97e8@rnout.be>
Date: Thu, 28 Aug 2025 15:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>
References: <20250819173106.3351049-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819173106.3351049-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=yv1TvszCIW5LH/G7P+ZS8EKY47RXbgv2C3+Xln87dJw=;
 b=kqlX2drMr/z5U57AweBt+RF8uezMIlcy9yHLHR9XWFZ1rcV3LmxdHS4outtekbOp+pLD5p
 KgbVBHRu8xTilUo2V1rG2/r0CMBZYdMFDZ/IBmqVYFHccYnR4lilvGj6Gpd7ydu2g+DDIX
 YhsQv4SFfpKX6hUSBzo3U8Es4ON5cCSkIXqB91gYKJ3V5BahC/k9ODgxJ3V9Fvvo7CD1cH
 +lMLNx5+xoin7S2RmISXmsAqyAUN6SmVULwB0U9FsSG7EQ1hGftRDEdCKjr+kp92VjzJin
 9VMxbf4TZHdeYkEb+Y8iIQ3SzsqPqe08Byu/fZ4RZNNsjOZyezfMr+z1AryhUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kqlX2drM
Subject: Re: [Buildroot] [PATCH] configs/socrates_cyclone5: remove defconfig, broken
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wOC8yMDI1IDE5OjMxLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gVGhpcyBkZWZjb25maWcgbm8gbG9uZ2VyIGJ1aWxkczoKPiAKPiAgICBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzExMDI2NzcyODg3Cj4gCj4g
SXQgaGFzIGJlZW4gYnJva2VuIGZvciBhdCBsZWFzdCAyIG1vbnRoczoKPiAKPiAgICBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzP25hbWU9VCUzRHNvY3Jh
dGVzX2N5Y2xvbmU1JmtpbmQ9QlVJTEQKPiAKPiBJdCB1c2VzIHRoZSBvdXRkYXRlZCBhbmQgbm90
IGV2ZW4gTFRTIDQuMTYuNyBMaW51eCBrZXJuZWwsIHdoaWNoIG5vCj4gbG9uZ2VyIGJ1aWxkcyB3
aXRoIG1vZGVybiB0b29sY2hhaW5zLgo+IAo+IFVubGVzcyBhIGZpeCBpcyBwcm92aWRlZCwgdGhp
cyBkZWZjb25maWcgd2lsbCBiZSByZW1vdmVkLgo+IAo+IEZpeGVzOgo+IAo+ICAgIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTEwMjY3NzI4ODcKPiAK
PiBDYzogTWljaGHFgiDFgXlzemN6ZWsgPG1pY2hhbC5seXN6Y3pla0Bib2ZjLnBsPgo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
CgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKCltz
bmlwXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
