Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EE5CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E978480EDA;
	Sun, 11 Oct 2026 10:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jx_CHLzRP8nJ; Sun, 11 Oct 2026 10:10:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A54680ED5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791713439;
	b=kGDPuUtiYwehDem5tDHYys1vP1fiBpdS24Am27mgc8ccSw/fPxj6Rw6GJj2lMD46qvXW
	 PKNLXMGS1v8qK2qmZqdjQq5Fz/p7ZadLBVnNR85EDEHWx9FH0eeovTFTbYGWt8VKx37Pp
	 KAYpGPU8PxDREbqjKqvPNTgeJRve+pSA1U6Gn2mu1OIBc/2KAXPrOTU2oTiOmiV2fE6zP
	 e4lWuUGptvvA50hW0CO79wPvOSVTYFI8ExGg8V4phdNtvep6dYuNjSP4CP7e0DVpPfUeR
	 JZ5TI/nC2vOAI4RKUIOg4FXI2OTonE9UHRVbF4DeoRw79DZOSRJWPmF7r4XVoAeluhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791713439;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=q19r+mBHH5kTTn0BcLXg3DhEr84CIi9YDhI3cn7mlqo=;
	b=F+1zSYLE8qxv6U1DWl+YISEynzrsU2xpiFi90HancOLc2l/u8EVieHF+TUlOqV4Ss9A5
	 1Bxc9Nklb9tkHzDvrr6KHMK+H4VgAyASVHP1f3o1NeqKkZ47OD6yetN78dsFi/NZLu7ci
	 DbdxC8TjhF3UwmLSF+z8yjEn+o6jGzs4+ywP0hAgmig3MfHozjFC60nvJ65aFc2Okokky
	 FZ+9/CpOQivxnemvOa+SfbmlrySlxdNJyrMIU2kPXvMKj21pefD47M5AAm5RoOoyCPkLl
	 1bxWVvsSpfNfhMjPBNqHIc9ZWKhW9GALNIQ+cPks2KdUa/a9XO2YunqM+pwAavbkp2w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791713439;
	bh=q19r+mBHH5kTTn0BcLXg3DhEr84CIi9YDhI3cn7mlqo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b8eYHnOORa43mgaqQ2qx2yTNQ+9aI4K1sDKTNIEStsuALflF/7xEp9SNIwt9im/cG
	 Qi6PHDBq1EoEx4f/isgiCq9KL3CJFwe1593KeO3x1TkNA1LHl1YrViO8RIMS3cAUT/
	 LgaBZIEyY9esOe0X7ZXVuj08pI5/oZA0oqI9lXfwv1DMUBV+hqT+h7c31q99H+jZtV
	 lKwyMZakvptpW3UjugBLcsfxNgTiXsicvLNAhCX+jHdncHWK3LJ2Tl38anpAo6PTxj
	 +QeFaJ3waoupDybSeo1bb65gA8ZjkW7t6yEee1qISrLypbUS+wNoo+YKfC7BCFxx0s
	 nN+Vx3PrPVRvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A54680ED5;
	Sun, 11 Oct 2026 10:10:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3285317
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9949580ED5
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DOknpyPxpcU for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:10:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3C4A80ED3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791713436;
 b=iBoQi6bF5AscYwARgyL3Yxoe4XTkPlc6npzp2MH5IPZB/f3nR+neLPygTJBYHcOP2dBc
 Mdl/w+/R49nZHoAi5D8wmX3tYYk9b3hfL1cdiifPaeoXrBt4A0XZFW8OLtxD2ghbYlAov
 UB0EKHKCE2hPVqNS8TyRgg9XzXAbx+/0xX6BY2M5By5UMlvnAG8K4swFPmYmF8MnGHuxt
 JmjIlGK2sahyd+0PzfbGWjcBrGCI/y6pSIFK6RNHCI+p0+fZATLzQrtgY2KNvUI4sP0uJ
 LqFgCL3Wv/ZcZEfVA0s3o1Qj2DiGAxZTSTKpuk0eG8IqTom3o3YtUhMqwVYYRdfVMJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791713436;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=yfOk8fvtSXjODFcJplE03YnHGx5urHBCnZRixKksULM=;
 b=H7FOvjpN3NtUa9EBPYSvYp2cavuml80i/oN/DccXcHbFufXQt6SMPvt3wkibH0JXP96a
 3LMSYWs95HWRHvEWqowVm3d5dAp68iR4RoQw+AU1eZPse+DN+gQD+UVEwBhqsExKYy5l0
 EnGP23YnHTNZyWHPYoxUziI6uQyP5d3XgmO6M+OXlpzGW4IPwUoxMV8cWMV+DKKGZfl7j
 9+7yjoUxA0uA5yEJMVGmlOsDvG0A5MNm+VYBUO7GKSz8y6Zv0dgBeuPplEHFEIpIPwGFE
 4t2DYdMR4KwF+F7nATMMNuJavA36jiFetL1t4i5EMGg0Fd6M5p0cQOwEZPRyPXP3w+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=mqK5vs+W; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3C4A80ED3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 61E17B97A143; Sun, 11 Oct 2026 12:10:17 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Sun, 11 Oct 2026 12:10:00 +0200
Message-ID: <179171321663.162608.2214968851262028407.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260917091904.2560461-1-raphael.melotte@mind.be>
References: <20260917091904.2560461-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH 0/2] Make check-symbol check host symbols
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxNyBTZXAgMjAyNiAxMToxODo1MyArMDIwMCwgUmFwaGHDq2wgTcOpbG90dGUgdmlh
IGJ1aWxkcm9vdCB3cm90ZToKPiBJJ20gbm90IGVudGlyZWx5IHN1cmUgdGhlIGNoZWNrc3ltYm9s
c2xpYiBmaXggaXMgY29ycmVjdCBvciB3YW50ZWQsCj4gaGVuY2UgYW4gUkZDLiBUaGUgcmVzdWx0
IGl0IHByb2R1Y2VzIGF0IGxlYXN0IGRvZXNuJ3Qgc2hvdyBhbnkgZmFsc2UKPiBwb3NpdGl2ZSBv
biBjdXJyZW50IG1hc3Rlci4KPgo+IEl0IGFsbG93ZWQgYXQgbGVhc3QgdG8gdW5jb3ZlciB0aGUg
dHlwbyBpbiB0aGUgcWVtdSBDb25maWcuaW4gaW4gdGhlCj4gc2Vjb25kIHBhdGNoLgo+Cj4gSSBp
bmNsdWRlZCBhbiBBc3Npc3RlZC1ieSB0YWcgdG8gbWFrZSBpdCBjbGVhciBJIHVzZWQgdGhlIGhl
bHAgb2YgYW4KPiBMTE0gZm9yIHRoZXNlIHBhdGNoZXMsIGJ1dCBJIGNhbiByZXBsYWNlIGl0IGJ5
IHNvbWUgZnJlZS1mb3JtYXQgdGV4dAo+IGlmIHRoYXQncyBwcmVmZXJhYmxlLgo+Cj4gUmFwaGHD
q2wgTcOpbG90dGUgKDIpOgo+ICAgdXRpbHMvY2hlY2stc3ltYm9sczogY2hlY2sgZm9yIHVuZGVm
aW5lZCBob3N0IHN5bWJvbHMKPiAgIHBhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdDogZml4IHR5
cG8gaW4gY29tbWVudCBkZXBlbmRlbmN5CgogQXBwbGllZCBzZXJpZXMgdG8gbWFzdGVyLCB0aGFu
a3MhCgogSSBhZGRlZCBzb21lIGNvbW1lbnRzIHRvIHRoZSBjb2RlIHRoYXQgaG9wZWZ1bGx5IGNs
YXJpZnkgdGhpbmdzLgoKIEkgYWxzbyBwcmV0dHkgbXVjaCByZXdyb3RlIHRoZSBjb21taXQgbWVz
c2FnZSBvZiB0aGUgZmlyc3QgY29tbWl0LiBjaGVjay1zeW1ib2wKaXMgYSBiaXQgb2YgYmxhY2sg
bWFnaWMgYW5kIHRoZSBjb21taXQgbWVzc2FnZSBkaWRuJ3QgaGVscCBtZSBzdWZmaWNpZW50bHkg
dG8KdW5kZXJzdGFuZCBpdC4gVG9nZXRoZXIgd2l0aCBUaG9tYXMgUGVyYWxlIHdlIGRpZCBmaW5h
bGx5IHVuZGVyc3RhbmQgdGhlIGlzc3VlCmFuZCB0aGUgc29sdXRpb24gdGhvdWdoLgoKIEFuZCBm
aW5hbGx5LCB0aGUgdHdvIGNvbW1pdHMgc2hvdWxkIGhhdmUgYmVlbiBzd2FwcGVkLCBiZWNhdXNl
IGNoZWNrLXN5bWJvbHMKZmFpbHMgYWZ0ZXIgdGhlIGZpcnN0IG9uZS4gTmljZSB0byBwcm92ZSB0
aGF0IHRoZSBjaGFuZ2UgaXMgZWZmZWN0aXZlLCBidXQKbm90IGhvdyB3ZSB3YW50IGl0IGluIHRo
ZSBoaXN0b3J5LgoKIFJlZ2FyZHMsCiBBcm5vdXQKCj4KPiAgcGFja2FnZS9xZW11L0NvbmZpZy5p
bi5ob3N0ICAgICAgICAgICAgfCAgMiArLQo+ICB1dGlscy9jaGVja3N5bWJvbHNsaWIvYnIucHkg
ICAgICAgICAgICB8ICAxIC0KPiAgdXRpbHMvY2hlY2tzeW1ib2xzbGliL2RiLnB5ICAgICAgICAg
ICAgfCAgMiAtLQo+ICB1dGlscy9jaGVja3N5bWJvbHNsaWIvbWFrZWZpbGUucHkgICAgICB8ICAz
ICsrKwo+ICB1dGlscy9jaGVja3N5bWJvbHNsaWIvdGVzdF9kYi5weSAgICAgICB8ICA0IC0tLS0K
PiAgdXRpbHMvY2hlY2tzeW1ib2xzbGliL3Rlc3RfbWFrZWZpbGUucHkgfCAxMSArKysrKysrKy0t
LQo+ICA2IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+
Cj4gLS0gCj4gMi41NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
