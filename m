Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC377D637DC
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 22:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A19D82C3E;
	Tue, 16 Dec 2025 22:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vn73ib2TjZ88; Tue, 16 Dec 2025 22:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29F0F81E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765922591;
	bh=C6e5HIP/1kGFzH8Fue9BqSn7Sm3c6k7NQUpInfL5p6M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JHMR63lx1G9eQTMLYSEFeul76xt5hoC5rMUfr4MQCedFW+p1E0z5v+vOiRwgqjkTf
	 SMGyiKnSUM6xUlmRGhbK9yRGImZtspXRN89CcdOPeXT1pbjrg83D72edOArVBqtjEC
	 tegMWze/WV0SHiaSq1+K5F4cBUI6mry3TWKzsH1A4Ma+ccaF7EAIDeLP/ljQA9jwEi
	 RcRxwNivy7ptn62zHpN4fzIaHKbaylGwUca2zAeDyk0KDdt0icC0zQyebRtwq64KsR
	 BCJCSjj2CZtCBrT49lelN90qf8RFZDYzJjcXfytebhW3QuTt8ZchSU1fiXPL8WLnA0
	 x1hiNdk0VkXEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F0F81E7D;
	Tue, 16 Dec 2025 22:03:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AC43364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 22:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E604581E7D
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 22:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JdU04UDFPYk for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 22:03:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD57981DE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD57981DE7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD57981DE7
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 22:03:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D804320039E;
 Tue, 16 Dec 2025 23:03:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Dec 2025 23:03:02 +0100
MIME-Version: 1.0
Date: Tue, 16 Dec 2025 23:03:02 +0100
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <20250911212752.266940-9-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
 <20250911212752.266940-9-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.12
Message-ID: <36c7d766dc88044da552aa9d3f041d03@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765922585;
 bh=4ODo+qbKiuSa5n+ON3zYL2XSiCivhwJB0T9BEx5NQfU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NMhSq4pCARIwjGPUK70uzS+ZR7DauM5Zqw/SerD6wfW7zfBlC7sUzc7WAyheHDoYo
 xKZjX4K8f6w6XOIWcZnuE4pLBlQ+hPVZRhqXrWaUTlQ6DK1QAhWoU59NsUTQAmetMe
 nYXpLx1zJkBy66LEUmPIKc5B4DgEWMgDT8/jEjCok86jm9Dj30R0PvKggsHid2UjN6
 rZWznrk7OttuqMncxMCVRzS7L/WE8JxY1QuL3QWEbwPY+s85CsAppbGfiIkblg6N/B
 qu0egkjAxWSjKAQFe+Te7+dZKFhq+oXvUBeoipDP000TeqHA9Xh8ZIt4Dk//6uuNCI
 tet1CJgPCSAOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NMhSq4pC
Subject: Re: [Buildroot] [PATCH v5 8/9] package/kvmtool: bump to current HEAD
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

T24gMTEvMDkvMjAyNSAyMzoyNywgQWxleCBCZW5uw6llIHdyb3RlOgo+IEJ5IGRvaW5nIHNvIHdl
IGNhbiBhbHNvIGRyb3AgdGhlIHBhdGNoZXMgZm9yIG11c2wgd2hpY2ggaGF2ZSBub3cgYmVlbgo+
IG1lcmdlZCB1cHN0cmVhbS4KPiAKPiBSZXZpZXdlZC1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJp
dm9zaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxp
bmFyby5vcmc+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
