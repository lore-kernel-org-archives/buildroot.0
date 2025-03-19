Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C202C35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 23:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0419F6109B;
	Wed, 19 Mar 2025 23:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpRkFjuByeH4; Wed, 19 Mar 2025 23:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 113C8610A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 113C8610A2;
	Wed, 19 Mar 2025 23:16:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18A541A7
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 23:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0AB241442
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 23:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTfdfVFzTgpd for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 23:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96EE44143C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96EE44143C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96EE44143C
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 23:16:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F293D13F861;
 Thu, 20 Mar 2025 00:16:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 00:16:21 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 00:16:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Suniel Mahesh <sunil@amarulasolutions.com>
In-Reply-To: <20250319095321.922545-1-vincent.stehle@arm.com>
References: <20250319095321.922545-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ad6c0110c0edfc6ccd69efbd0507cb66@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742426186;
 bh=ieZvpSqd8GQrK0ua0oh3QWjpEOXr0t4FUR4EAYGC8qw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EYjszGE+rLrFysmRHM9OKQ3CNcyg6NJ0FXAHjyWYzBcdX4MfDvddtr+O8eXmfLCec
 wjqPkfPaljhjkTiESOKDG1aD/pJ9ty9RnIs6zsjHQ0ba40sA4vZVBn5NyEtrtqKi05
 okOIVTr3n9vb22YiKNMhe0mBr2MUAvgx8Og3Kacpo5tOqmbE2nxDnT7IW/LjtIZsV7
 fWJrmgYC9Qme8qfJ/q+6i8gtfsvmqkmkd7ZU3jQJrS83J6LA/TMh8zp204yFUQQ4GV
 zjN+88YmlsQMxAtt/i0bwa1yyG+OyYgaLih6JUeLWeebyfY2QfCp11ZY97Yz6WftM4
 3UJfA2sYRw3BA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EYjszGE+
Subject: Re: [Buildroot] [PATCH] configs/rockpro64_ebbr: new defconfig
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTkvMDMvMjAyNSAxMDo1MywgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IEFkZCBhIGRlZmNv
bmZpZyB0byBidWlsZCBhbiBBQXJjaDY0IGRpc2sgaW1hZ2Ugd2l0aCBhIFUtQm9vdCBiYXNlZAo+
IGZpcm13YXJlIGltcGxlbWVudGluZyB0aGUgc3Vic2V0IG9mIFVFRkkgZGVmaW5lZCBieSBFQkJS
WzFdLCBhcyB3ZWxsIGFzCj4gYSBMaW51eCBPUyBib290aW5nIHdpdGggVUVGSSwgdG8gcnVuIG9u
IHRoZSBST0NLUHJvNjQgZnJvbSBQaW5lNjQuCj4gCj4gVGhlIGdlbmVyYXRlZCBmaXJtd2FyZSBi
aW5hcnkgY2FuIGFsc28gYmUgdXNlZCB0byBpbnN0YWxsIG9yIHJ1biAKPiBhbm90aGVyCj4gT1Mg
c3VwcG9ydGluZyB0aGUgRUJCUiBzcGVjaWZpY2F0aW9uLgo+IAo+IFsxXSBodHRwczovL2dpdGh1
Yi5jb20vQVJNLXNvZnR3YXJlL2ViYnIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhs
w6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IENjOiBKYWdhbiBUZWtpIDxqYWdhbkBh
bWFydWxhc29sdXRpb25zLmNvbT4KPiBDYzogU3VuaWVsIE1haGVzaCA8c3VuaWxAYW1hcnVsYXNv
bHV0aW9ucy5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
