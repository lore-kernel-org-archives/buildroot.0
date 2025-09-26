Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22599CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 16:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C627A83F79;
	Fri, 26 Sep 2025 16:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A__CwuYsat8I; Fri, 26 Sep 2025 16:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDDC983F7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDDC983F7A;
	Fri, 26 Sep 2025 16:55:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8FC4177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE9F041F88
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2zW2B3NJQZK for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 16:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 943CA415FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 943CA415FD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 943CA415FD
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:55:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DBDD62003C6;
 Fri, 26 Sep 2025 18:55:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Sep 2025 18:55:00 +0200
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 18:55:00 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, "Ying-Chun Liu (Paul Liu)" <paul.liu@linaro.org>
In-Reply-To: <20250922155210.1062253-1-vincent.stehle@arm.com>
References: <20250922155210.1062253-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <47080bb9ba3c7454ad047a8470a7af4e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758905703;
 bh=mPmTqfHE6p7AwxeRBkDhS78GcmNhJJUVle9NHolsvQM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UgRgdj0b02hA3x6kSaUnTDAtveZ79/6yht3lX3YT/LFlPN3q0rIFclcRHcn6v4N2V
 B2C4T2eX+ofswCLLH+muU9yQHVAEz29yvq+7haTs4U59HN5uZo//6jlIsjYakNWsOl
 HmTnAH11bXlITFKO/1Sv9spAxATpxCR9TdrOXbqx4SNRWg6XJO5QxgG4AKgj1bU3nq
 Cva71wl+kX23rcz3tAzdAijnx7sjoYqcZFbkPDiiVolhkhLVTig4ByTLN2xAmjBb0T
 nJemnSHncpmcZxrbCq1LnYRaYsj4MIOl40b4GvoXj8ix1ru5Lbvk0gXw0HWBgzmE/I
 0Zci0JhFkeEyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UgRgdj0b
Subject: Re: [Buildroot] [PATCH] configs/iot-gate-imx8_ebbr: new defconfig
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

T24gMjIvMDkvMjAyNSAxNzo1MiwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IEFkZCBhIGRlZmNv
bmZpZyB0byBidWlsZCBhbiBBQXJjaDY0IGRpc2sgaW1hZ2Ugd2l0aCBhIFUtQm9vdCBiYXNlZAo+
IGZpcm13YXJlIGltcGxlbWVudGluZyB0aGUgc3Vic2V0IG9mIFVFRkkgZGVmaW5lZCBieSBFQkJS
WzFdLCBhcyB3ZWxsIGFzCj4gYSBMaW51eCBPUyBib290aW5nIHdpdGggVUVGSSwgdG8gcnVuIG9u
IHRoZSBJT1QtR0FURS1pTVg4IGZyb20gCj4gQ29tcHVsYWIuCj4gCj4gVGhlIGdlbmVyYXRlZCBm
aXJtd2FyZSBiaW5hcnkgY2FuIGFsc28gYmUgdXNlZCB0byBpbnN0YWxsIG9yIHJ1biAKPiBhbm90
aGVyCj4gT1Mgc3VwcG9ydGluZyB0aGUgRUJCUiBzcGVjaWZpY2F0aW9uLgo+IAo+IFRoaXMgY29u
ZmlndXJhdGlvbiBpcyBiYXNlZCBvbiB0aGUgd29yayBvZiBQYXVsIExpdVsyXSBhbmQgaXMgbm90
IAo+IHJlbGF0ZWQKPiB3aXRoIHRoZSBvZmZpY2lhbCBCU1AgZnJvbSBDb21wdWxhYi4KPiAKPiBU
aGlzIGhhcyBiZWVuIHRlc3RlZCBvbiBhY3R1YWwgaGFyZHdhcmUuCj4gCj4gV2hpbGUgYXQgaXQs
IGFkZCB0aGlzIGRlZmNvbmZpZyB0byBteXNlbGYgaW4gREVWRUxPUEVSUy4KPiAKPiBbMV0gaHR0
cHM6Ly9naXRodWIuY29tL0FSTS1zb2Z0d2FyZS9lYmJyCj4gWzJdIAo+IGh0dHBzOi8vZ2l0Lmxp
bmFyby5vcmcvcGx1Z2lucy9naXRpbGVzL3Blb3BsZS9wYXVsLmxpdS9zeXN0ZW1yZWFkeS9idWls
ZC1zY3JpcHRzCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0
ZWhsZUBhcm0uY29tPgo+IENjOiBZaW5nLUNodW4gTGl1IChQYXVsIExpdSkgPHBhdWwubGl1QGxp
bmFyby5vcmc+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
