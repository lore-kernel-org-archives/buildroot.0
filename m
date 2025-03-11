Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751C4C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 20:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DDFC60B7D;
	Tue, 11 Mar 2025 20:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbHt_43OeYSC; Tue, 11 Mar 2025 20:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C67560B2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C67560B2C;
	Tue, 11 Mar 2025 20:07:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B7331C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2989D40159
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xT5-M2uyVO_Q for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 20:07:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7FB040118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7FB040118
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7FB040118
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:07:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 477F7B0051E;
 Tue, 11 Mar 2025 21:07:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Mar 2025 21:07:47 +0100
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 21:07:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20250311120032.13973-1-alex.bennee@linaro.org>
References: <20250311120032.13973-1-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <91cf54ee43e5a34808fcec4525f57f69@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741723668;
 bh=BUk2pUM4+rSHdlgjwZGJmzyQ2vHhiRmFX9+RZjkbbaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iM4N58OiAZAuc+StpZECrbXQlbiu5d7HDQy8fdd3aMR4e4iPFCQek6+yoh4zEjDzm
 61NsXJHFAZbhIerEiyzYt2HQPPnWNbocyaKHhtZdhBk6ZfG4XBIYcPH4tAKgnE9CiV
 ye9L3yAHzhH4DShgBgErGteN88ImXwFGjK1Ucevp3Xto8YV0Y5lMT55uBnGtr9hlsU
 5kzT6/Ft/VigpHuKLIsZeNJ/lTcH4v6t3KGmWrLKn1fuX/hu9NPd7OWeY1HR9YqCtB
 VsEmHJGibaHSDwNAs9F0WgaCIxMCCi0c/fTEoKnqnnSp7IM9chYWu/Zq6XQdTG1U3N
 ZKsz1mp2ZJ9gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iM4N58Oi
Subject: Re: [Buildroot] [PATCH v4] package/elfutils: handle missing
 user_pac_mask on aarch64
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

T24gMTEvMDMvMjAyNSAxMzowMCwgQWxleCBCZW5uw6llIHdyb3RlOgo+IFNpbmNlIEJ1aWxkcm9v
dCBjb21taXQgWzFdICJwYWNrYWdlL2VsZnV0aWxzOiBidW1wIHRvIHZlcnNpb24gMC4xOTIiCj4g
ZWxmdXRpbHMgZmFpbHMgdG8gYnVpbGQgb24gQWFyY2g2NCB3aXRoIHRvb2xjaGFpbiBpbmNsdWRp
bmcgS2VybmVsIAo+IG9sZGVyCj4gdGhhbiB2ZXJzaW9uIDUuMC4gRXJyb3Igc2hvd3M6Cj4gCj4g
ICAgIGFhcmNoNjRfaW5pdHJlZy5jOiBJbiBmdW5jdGlvbiAnYWFyY2g2NF9zZXRfaW5pdGlhbF9y
ZWdpc3RlcnNfdGlkJzoKPiAgICAgYWFyY2g2NF9pbml0cmVnLmM6NjE6MjQ6IGVycm9yOiBzdG9y
YWdlIHNpemUgb2YgJ3BhY19tYXNrJyBpc24ndAo+ICAgICBrbm93bgo+ICAgICAgICA2MSB8ICAg
c3RydWN0IHVzZXJfcGFjX21hc2sgcGFjX21hc2s7Cj4gICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fgo+IAo+IGVsZnV0aWxzIDAuMTkyIGludHJvZHVjZWQgYSBBYXJj
aDY0IHBvaW50ZXIgYXV0aGVudGljYXRpb24gc3VwcG9ydCBpbgo+IHVwc3RyZWFtIGNvbW1pdCBb
Ml0uCj4gCj4gRm9yIHJlZmVyZW5jZSwgdGhlIHVzZXJfcGFjX21hc2sgc3RydWN0dXJlIHdhcyBp
bnRyb2R1Y2VkIGluIEtlcm5lbAo+IHVwc3RyZWFtIGNvbW1pdCBbM10sIGluY2x1ZGVkIGluIEtl
cm5lbCB2NS4wLgo+IAo+IFRoaXMgaXMgZml4ZWQgaW4gdGhlIHVwc3RyZWFtIFs0XSBzbyBicmlu
ZyB0aGF0IHBhdGNoIGluLgo+IAo+IEZpeGVzOgo+IC0gZS5nIAo+IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy81MTU2OTAxYTczYmU1MmNlOGZmYmYxMDcyOWU2ODUyNDk5
YTMwMGJlLwo+IC0gNC82IG9mIHRoZSBmYWlsdXJlcyBoZXJlOiAKPiBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnLz9yZWFzb249ZWxmdXRpbHMtMC4xOTImYXJjaD1hYXJjaDY0Cj4gCj4g
WzFdIAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1p
dC81ZWI3MzQ3NjZiMjRkZTVmY2U2ZTU4Njg5N2NkNDgyN2Y4ODU1NDQyCj4gWzJdIAo+IGh0dHBz
Oi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWVsZnV0aWxzLmdpdDthPWNvbW1pdGRpZmY7aD02NGUz
YjQ1MWFkMmNlYzhkNDU2NjFiMTgxNmUzZDJkYzQ0MzFmM2NhCj4gWzNdIAo+IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29t
bWl0Lz9pZD1lYzZlODIyZDFhMjJkMGVlZjFkMWZhMjYwZGZmNzUxZGJhOWE0MjU4Cj4gWzRdIAo+
IGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWVsZnV0aWxzLmdpdDthPWNvbW1pdDtoPTUy
YTc0N2EzMTYwNDJlNzBhMjJhY2I0ODlkZjllNTFiZmM2YmYyZDUKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgpBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
