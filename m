Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DE1FD8FFA
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 19:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5857E402AA;
	Thu, 26 Feb 2026 19:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyH3n4Fo04eJ; Thu, 26 Feb 2026 19:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E69340286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772133123;
	bh=sgkXB+ccfJXI2CvpHDhQjNjeLQnAl1JYUzZfab3xLFk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sgxf0g+/8gSpNX5luC9y/96JC1JYNCP/+jWazI11xQlYBLBlNOyoquRxB84pniwi3
	 N10gceeY9I/Mtgxh/evXpDWi5/dK5rGDC/AZ9ZF6HqtnFdjcT0vJDA1Te2w6JDPM1G
	 RpCUh1I6BsX8DY3NqGmMa8cvEdExH5nHmBariTGh6kqD42zwYDacH/iV6ifivGOnEL
	 q47Uk/cM6+gNxD5Q3Vq7w4faIEUuHZZB2AYep+OLhJ24TBDgQyKRXysWr9Od74ekz1
	 4LYizjfCREQ08hQv74oad95lxY+CBnt2T8tNC9VjWDeysuLMgxIeJiA4TSfEhsojbU
	 pg1ER8Z2Qx3Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E69340286;
	Thu, 26 Feb 2026 19:12:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C45E204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69348606BD
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCUAwA0_HHQZ for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 19:12:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E3D7606BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E3D7606BB
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E3D7606BB
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id E50705A0003;
 Thu, 26 Feb 2026 20:11:53 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq5C8iMsZ_Df; Thu, 26 Feb 2026 20:11:52 +0100 (CET)
Received: from zbook.home (198.210.60.188.dynamic.cust.swisscom.net
 [188.60.210.198])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 7C19D5A0002;
 Thu, 26 Feb 2026 20:11:52 +0100 (CET)
Message-ID: <74f10bbfc9b67fcd28b002964c050c784b8c3a1e.camel@strongswan.org>
From: Martin Willi <martin@strongswan.org>
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 20:11:52 +0100
In-Reply-To: <53b6b6d9-dad5-4591-b708-f86f5a55a940@gmx.de>
References: <20260226142023.1064241-1-martin@strongswan.org>
 <20260226142023.1064241-3-martin@strongswan.org>
 <53b6b6d9-dad5-4591-b708-f86f5a55a940@gmx.de>
Autocrypt: addr=martin@strongswan.org; prefer-encrypt=mutual;
 keydata=mQENBEhbeIwBCADbKW4rqhkBsvQumeWTAfy+Q+YciIbbqLvxwRZPKpxz19nxJQPbWF7pG
 oiPb3TWLK3TitWVKKZuNILStsKTGiR4RqLUs8n3sESPoz5HmRqsijm6yJDzzPAE3/B7IWHBeAOssV
 TWS7b9ROz4iFI+fNLnqMqE22zMEItC2r9zi6GpDmi/QP3CcxHFzPMF5iQkMPp6QJMwOdPvYR9kBb1
 x1ubDOjsfWqI41neJTGlv3EVFc5nkv0s7PfoYxMkf8/VStd29pMe4csKJUaPDkLqenLl8Omq8Z3F+
 sbjdo+hcim4i3EsROYh59kA4/UuMFfI0hxaIaoW6UAb6gyqOHkS6vC+VABEBAAG0Jk1hcnRpbiBXa
 WxsaSA8bWFydGluLndpbGxpQHJldm9zZWMuY2g+iQE4BBMBAgAiBQJRsHoSAhsvBgsJCAcDAgYVCA
 IJCgsEFgIDAQIeAQIXgAAKCRAQGu6ewTL0wxf8B/9EThZXuVqNTK2nH2QuRi2zQntFXkK2QbU11sv
 zkfZV8xDfWKHdq67LLako/FOE1dXN6iurWFChgMexs0bSMzaftCmHGSSgGaQhBhANSObKu8M+UyHd
 bes88zNpQKdwVd9guIo6oRrX33IYkb63ifZReChcBffu6cjXQky7/79kpnl6f3qlP5ZluyNGX9Iwe
 z1EpmG2zHkJlc+3oPQbsQbFKjUOdR1hfyKbcVVQHs1ddv830Z0cpM6QbcknR81VsCQ7FYBrH5Hw3N
 AKhrfbIaZMvwBgQfXIgc7mwPZFg2oONZMzauzX6EpZ29Z+kCsy3AArnZssVAwxk+ydRJhUWlZmtCR
 NYXJ0aW4gV2lsbGkgPG1hcnRpbkBzdHJvbmdzd2FuLm9yZz6JATYEEwECACAFAkhbeIwCGy8GCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRAQGu6ewTL0w9ruCADDGN0JgrImHOPGgsJwdP2nKwBytO8mM
 Z/Z/folgH20zqiMqyNR4lOZW9L3DF4rz83fKXQFbP7nCf6GZ/tmjmrImiTZBkKwr37ZsaBRaCz3i9
 rYITY94njenYp7jy6roMcvlBMhNjSI04AvLjaA/hcPuSexqqso+qoNTa7+VplF7OpikB8vKPt+fMp
 XuGP8TF/q8v9TrY+gcVv0c8ZOrGDnI5vJt1Fp0PvoH/vXFx3Jy90g+hRUYFbLW2S76geiGVML9AeK
 IQKjEpp2bxsd+JYGo91MeKBqjlllonxZ17eKNtlA+X+iluwcDJZzdabB19EQG7ZEf0jAy6Sy09au6
 MYFtCBNYXJ0aW4gV2lsbGkgPG1hcnRpbkByZXZvc2VjLmNoPokBNgQTAQIAIAUCSzjspgIbLwYLCQ
 gHAwIEFQIIAwQWAgMBAh4BAheAAAoJEBAa7p7BMvTDaP4IALJRUmUEagBRrdAi1SrxxcsgPDr5vo8
 1UrPADXKnMdf6KXPqfPMN4hIeS4zbFyC/FA9cg0T9680pVk8hLmcD3iCRMMnL9d38hOQmMxw2TYnd
 7rth1LuoDRhIwI1bfADw3EJGEMsTy49zVtVl1KwmqBZDDk3PGHvukHYawleOrTRVitOEvavg0vfgg
 CgqvSeSBy3tkX2EIlagC/5eXpYLguj1iI84xG01M4bZ9PU+PuzZADaHL+a9iPelBvk0uNjwKvKjPx
 OPDfaxsmEgjNG7M9gZjBkjSjvclRUlLMpe+3qHhGEYf2yKsv72hCLYy8my5jRnu59eZq72lX9YWVs
 jlXU=
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772133112;
 bh=w2JfF68ItkKjqZMp35ExysOVBc7ft9KMSkAmsQ+73vQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=gf+kOH1AvN09cYFGx6akvhTh3W74Wl5GmkFbp+QjSSd0TFWGyQvvZUjROEUW/eaFm
 OWILICiY83JAZ3xyHWWKOK8F0w6O76j5RER8dVmobPDGIFM+joGQY/7T8YdaRd3EpO
 GbyKzVFyFnwVXikpZY72qROOQr5l1Jd/XVomAOpx0VoAz0xUEPgqKac1qKAddAIiPM
 WeVEu6HBiZHH+RdffPyHAVQwhF0yzrddWPsTRDkefKJvzHnCGDtagsKGRfPi/8UoT+
 Bje0fXCfI0nu1SeRs9oF7Mk3HhczhOZHr6GR0XJSFnFckVUJuWN/CRATh23jX3KkgT
 LrktpHSm6asZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=gf+kOH1A
Subject: Re: [Buildroot] [PATCH 2/8] utils/generate-cyclonedx: allow
 referencing patches by upstream URL if available
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEKCj4gPiBBbHNvIHNldCB0aGUgdHlwZSB0byAiYmFja3BvcnQiIGluc3RlYWQgb2Yg
InVub2ZmaWNpYWwiIGZvciBzdWNoCj4gPiBwYXRjaGVzLgo+IAo+IFRoYXQgc2VlbXMgcHJvYmxl
bWF0aWMgdG8gbWUsIGJlY2F1c2UgaXQnbGwgYmUgaW5jb3JyZWN0IGluIHNvbWUKPiBjYXNlcyAo
cG9zc2libHkgbWFueSwgYnV0IEkgaGF2ZW4ndCBjaGVja2VkIHRoZSByYXRpbyk6IFRoZQo+ICJV
cHN0cmVhbSIgaGVhZGVyIG9mdGVuIHBvaW50cyBhdCBhIG1haWxpbmcgbGlzdCBhcmNoaXZlIG9y
IE1SL1BSCj4gcGFnZSB0aGF0IHNob3dzIHRoZSBwYXRjaCBiZWluZyBzZW50IHRvIHRoZSB1cHN0
cmVhbSBkZXZlbG9wZXJzLAo+IHdpdGhvdXQgaGF2aW5nIHlldCBiZWVuIGFjY2VwdGVkLsKgCgpU
aGUgQnVpbGRyb290IGRvY3VtZW50YXRpb24gWzFdIGRlZmluZXMgVXBzdHJlYW06IGFzCgo+IFdo
ZW4gYmFja3BvcnRpbmcgYW4gdXBzdHJlYW0gcGF0Y2ggdGhhdCBoYXMgYmVlbiBhY2NlcHRlZCBp
bnRvCj4gbWFpbmxpbmUsIGl0IGlzIHByZWZlcnJlZCB0aGF0IHRoZSBVUkwgdG8gdGhlIGNvbW1p
dCBpcyByZWZlcmVuY2VkOgoKQnV0IHRoZW4gYWxzbyBzYXlzOgoKPiBQYXRjaGVzIHRoYXQgaGF2
ZSBiZWVuIHN1Ym1pdHRlZCBidXQgd2VyZSBkZW5pZWQgdXBzdHJlYW0gc2hvdWxkIG5vdGUKPiB0
aGF0IGFuZCBpbmNsdWRlIGNvbW1lbnRzIGFib3V0IHdoeSB0aGUgcGF0Y2ggaXMgYmVpbmcgdXNl
ZCBkZXNwaXRlCj4gdGhlIHVwc3RyZWFtIHN0YXR1cy4KClNvIHllcywgd2hpbGUgImJhY2twb3J0
IiBzZWVtcyB0byBiZSBhIGdvb2QgY2xhc3NpZmljYXRpb24gZm9yIG1hbnkKcGF0Y2hlcywgaXQg
Y2VydGFpbmx5IGlzIG5vdCBmb3IgYWxsLCBhbmQgdGhlcmUgaXMgYSByaXNrIG9mCmNsYXNzaWZ5
aW5nIGl0IGluY29ycmVjdGx5LiBTbyBpZiB0aGlzIGRvZXMgcmVhbCBoYXJtLCB0aGVuIHdlIHNo
b3VsZAprZWVwIGl0IGFzICJ1bm9mZmljaWFsIiAoZXZlbiBpZiB0aGF0IGlzIG5vdCByZWFsbHkg
Y29ycmVjdCwgZWl0aGVyKS4KCj4gWy4uLl0gVGhlb3JldGljYWxseSB3ZSBjb3VsZCBhZGQgYW5v
dGhlciBoZWFkZXIgKGUuZy4gIlVwc3RyZWFtLQo+IFN0YXR1cyIpLCBidXQgdGhlbiB0aGF0J2Qg
bmVlZCB0byBiZSBrZXB0IAo+IGN1cnJlbnQsIHdoaWNoIGRvZXNuJ3Qgc2VlbSB2ZXJ5IHByYWN0
aWNhbAoKSSBhZ3JlZSwgdGhpcyBkb2VzIG5vdCBzZWVtIHZlcnkgcHJhY3RpY2FsIHdoZW4gYSBw
YXRjaCBpcyBub3QgeWV0CmFjY2VwdGVkIHVwc3RyZWFtLiBNYW55IHBhdGNoZXMgbWF5IGNvbWUg
dGhyb3VnaCB1cHN0cmVhbSwgdGhvdWdoLCBhbmQKYSBkaWZmZXJlbnQgdGFnIHRoZW4gY291bGQg
bWFrZSBzZW5zZT8KClRoYW5rcywKTWFydGluCgpbMV0gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rv
d25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjX2FkZGl0aW9uYWxfcGF0Y2hfZG9jdW1lbnRhdGlv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
