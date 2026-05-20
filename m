Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA65CD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7760A83EFC;
	Wed, 20 May 2026 19:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyVgdwhfWhZm; Wed, 20 May 2026 19:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9915A83EFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306069;
	bh=YP9L+zSMS0SU9qnxH1qcfmWrm/W8p6gAUFb+rDvKuiM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=noU9xwjpGlrXX9RG5+3JRt71dOdminpV8hM/QMefUbI6cYdtRs+uHwPIXyS+KxT3s
	 5KkI9EsFcFHW5gJfJCKfm5gr/HQxTTyvul6/TgYLbn14gRuHq84gD5Vawjal+GkmuJ
	 BHM6YjgmcVoNmM3jL/HrsKavTi1Bnsr1/hoKR9BXlwfRTgnBSvBHcpS4bB72mlcQxM
	 3Y17/Fb7wFzUUShehsNoZ9SfMddsEgrpVyuha0rAbU21Jg4HKHGHs4xk2A9J3Nu0lA
	 MVlbOPWnrRIHhObou2OxTTugJDV8BJKIXoY+bsuJxN+E+nobhqJuENw4571Fm5SMsL
	 lAnq0VRc3Wtbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9915A83EFE;
	Wed, 20 May 2026 19:41:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC03E1B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A244483EFE
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QtdY0jaVWCd for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:41:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92E1B83EFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92E1B83EFC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92E1B83EFC
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F6E2B97C37D; Wed, 20 May 2026 21:41:04 +0200 (CEST)
Message-ID: <720e081c-6aa8-4f59-a541-487076dc0368@rnout.be>
Date: Wed, 20 May 2026 21:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20260519233121.1497219-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260519233121.1497219-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779306064; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=pvWA04+pgGFOx/p/u5exc/3VLasb9HmQg6HS2r9ShVc=;
 b=Tjf4rsVRiRGtg4LNfK2yhL8WkGKtre/FBYcM8bv2k9tTbUWeXaGtdWIBymbwzrxnUfwur1
 Ze7AgGzj43W0gpxEVUeb0NnWg4BGsrti90EoUczS+bIbEpJS0wCoaKvq+DglErz4HVbwQu
 qCgYlcylZSBWzUlr3i21nQddczf+5ke9fnBoUqCXeCxfQIKgz6yoGsExcUZsBHMi9hPwVm
 UbHNutAXY1THpSCc3fpggB4TeXHuNvKEQuwenctZqI3Twy/j8dq2Fc8Ke+3WjvoZzlk5mV
 L0e8ZqPIw3kN/0/4gi4PnrzDiIBTTn+X4ekg6h813gXPwJCGIHoOTQRHrPd23g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Tjf4rsVR
Subject: Re: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: fix missing
 const
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

CgpPbiAyMC8wNS8yMDI2IDAxOjMxLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBGaXhlczoKCiAg
UGxlYXNlIHVzZQoKRml4ZXM6IDxsaW5rIHRvIGF1dG9idWlsZGVyIGZhaWx1cmU+CgogIEkndmUg
YWRkZWQgdGhhdCBhbmQgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBB
cm5vdXQKCj4gb3V0cHV0L2J1aWxkL3NoYWRvd3NvY2tzLWxpYmV2LXYzLjMuNi9zcmMvbmV0dXRp
bHMuYzoyNzg6Mjg6IGVycm9yOiBpbml0aWFsaXphdGlvbiBkaXNjYXJkcyDigJhjb25zdOKAmSBx
dWFsaWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlIFstV2Vycm9yPWRpc2NhcmRlZC1xdWFs
aWZpZXJzXQo+ICAgIDI3OCB8ICAgICAgICAgY2hhciAqbmV4dF9kb3QgICA9IHN0cmNocihsYWJl
bCwgJy4nKTsKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAgIC4uLi8wMDAxLUZpeC1idWlsZC13aXRoLWdjYzEzLnBh
dGNoICAgICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA0MSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zaGFkb3dz
b2Nrcy1saWJldi8wMDAxLUZpeC1idWlsZC13aXRoLWdjYzEzLnBhdGNoCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvc2hhZG93c29ja3MtbGliZXYvMDAwMS1GaXgtYnVpbGQtd2l0aC1nY2MxMy5w
YXRjaCBiL3BhY2thZ2Uvc2hhZG93c29ja3MtbGliZXYvMDAwMS1GaXgtYnVpbGQtd2l0aC1nY2Mx
My5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNmJhZTgx
NDM0YQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3NoYWRvd3NvY2tzLWxpYmV2LzAw
MDEtRml4LWJ1aWxkLXdpdGgtZ2NjMTMucGF0Y2gKPiBAQCAtMCwwICsxLDQxIEBACj4gK0Zyb20g
NTlhNmFjYTc1OTdjNDZjZDFkMDc5NjMxZDMwNjFkOTUyZmJkMGQ2ZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiArRnJvbTogSGlsbHdvb2QgWWFuZyA8aGlsbHdvb2RAb3BlbnN1c2Uub3JnPgo+
ICtEYXRlOiBUdWUsIDUgTWF5IDIwMjYgMTQ6Mzk6MTAgKzA4MDAKPiArU3ViamVjdDogW1BBVENI
XSBGaXggYnVpbGQgd2l0aCBnY2MxMwo+ICsKPiArU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1
Yi5jb20vc2hhZG93c29ja3Mvc2hhZG93c29ja3MtbGliZXYvcHVsbC8zMDM4Cj4gKy0tLQo+ICsg
c3JjL2FjbC5jICAgICAgfCAyICstCj4gKyBzcmMvbmV0dXRpbHMuYyB8IDIgKy0KPiArIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAt
LWdpdCBhL3NyYy9hY2wuYyBiL3NyYy9hY2wuYwo+ICtpbmRleCAxZWZjMWFhLi5jNzdiYmQ3IDEw
MDY0NAo+ICstLS0gYS9zcmMvYWNsLmMKPiArKysrIGIvc3JjL2FjbC5jCj4gK0BAIC01Nyw3ICs1
Nyw3IEBAIHN0YXRpYyB2b2lkCj4gKyBwYXJzZV9hZGRyX2NpZHIoY29uc3QgY2hhciAqc3RyLCBj
aGFyICpob3N0LCBpbnQgKmNpZHIpCj4gKyB7Cj4gKyAgICAgaW50IHJldCA9IC0xOwo+ICstICAg
IGNoYXIgKnBjaDsKPiArKyAgICBjb25zdCBjaGFyICpwY2g7Cj4gKwo+ICsgICAgIHBjaCA9IHN0
cmNocihzdHIsICcvJyk7Cj4gKyAgICAgd2hpbGUgKHBjaCAhPSBOVUxMKSB7Cj4gK2RpZmYgLS1n
aXQgYS9zcmMvbmV0dXRpbHMuYyBiL3NyYy9uZXR1dGlscy5jCj4gK2luZGV4IDhjNzMyOWEuLjM1
YjJkYzEgMTAwNjQ0Cj4gKy0tLSBhL3NyYy9uZXR1dGlscy5jCj4gKysrKyBiL3NyYy9uZXR1dGls
cy5jCj4gK0BAIC0yNzUsNyArMjc1LDcgQEAgdmFsaWRhdGVfaG9zdG5hbWUoY29uc3QgY2hhciAq
aG9zdG5hbWUsIGNvbnN0IGludCBob3N0bmFtZV9sZW4pCj4gKyAgICAgY29uc3QgY2hhciAqbGFi
ZWwgPSBob3N0bmFtZTsKPiArICAgICB3aGlsZSAobGFiZWwgPCBob3N0bmFtZSArIGhvc3RuYW1l
X2xlbikgewo+ICsgICAgICAgICBzaXplX3QgbGFiZWxfbGVuID0gaG9zdG5hbWVfbGVuIC0gKGxh
YmVsIC0gaG9zdG5hbWUpOwo+ICstICAgICAgICBjaGFyICpuZXh0X2RvdCAgID0gc3RyY2hyKGxh
YmVsLCAnLicpOwo+ICsrICAgICAgICBjb25zdCBjaGFyICpuZXh0X2RvdCA9IHN0cmNocihsYWJl
bCwgJy4nKTsKPiArICAgICAgICAgaWYgKG5leHRfZG90ICE9IE5VTEwpCj4gKyAgICAgICAgICAg
ICBsYWJlbF9sZW4gPSBuZXh0X2RvdCAtIGxhYmVsOwo+ICsKPiArLS0KPiArMi41My4wCj4gKwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
