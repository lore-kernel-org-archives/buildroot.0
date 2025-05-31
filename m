Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7FAC5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B98E1614F7;
	Tue,  3 Jun 2025 06:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v605ka7YarhX; Tue,  3 Jun 2025 06:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE1C6103F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECE1C6103F;
	Tue,  3 Jun 2025 06:22:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C57EDA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 378306103F
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkpCgJsEiYfC for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8894260FF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8894260FF7
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8894260FF7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D0ABF1C140E; Tue,  3 Jun 2025 08:21:55 +0200 (CEST)
Message-ID: <6f7dfbe1-2a63-43b0-8d73-9ee81cd20de3@rnout.be>
Date: Sat, 31 May 2025 18:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>
References: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
 <20250516210452.342275-4-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516210452.342275-4-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/C+rKGYlHcFMrQbg7i2jnf5NGMccBBgovj9y8OaocZ4=;
 b=Mrpu63xmY6/KWGhEzLNVaXKBtyaGx+Tj5W4paOxIGlytgYTq+DLUBEezNrZna5TT8RWcB5
 85u09+1W57k8o8e42kUBEHoCVhqIezxR6TJa1gJTA5oJpQT+tMcmUMpqZylB2P6koSdvBl
 E2VZLdktTyAnj5COdioCH82jBBJ2vcLnqaNCMclqgrrcmkpTUEBdj1Gi91eC8ezysEWvaG
 EeuwfGKVvhC9tkdxtIolng3U7ChlXxfOqyLTYv98SM0jdE1ShBSrl9W/CEjZAywU2vtB4x
 Imir3OQBaiIGz/JYI05BKeN3x8sgxPJxM5BNLt+qF2m4uLpLqoTh7c4uB7dVdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Mrpu63xm
Subject: Re: [Buildroot] [PATCH 3/4] package/qt6/qt6multimedia: ffmpeg
 support needs headers >= 5.2
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

CgpPbiAxNi8wNS8yMDI1IDIzOjA0LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gVGhlIFY0TDIgY29kZSBpbiB0aGUgZmZtcGVnIHBsdWdpbiB1c2VzIFY0TDJfUElYX0ZN
VF9CR1JBMzIgd2hpY2ggd2FzCj4gb25seSBpbnRyb2R1Y2VkIGluIGtlcm5lbCBoZWFkZXJzIDUu
MiwgaW4gdXBzdHJlYW0ga2VybmVsIGNvbW1pdAo+IGUyNWVjOTE0MTExNGM3MTI0ZWViYTA5Mzg1
ZTI3MmRkNzZmYmU2MTcuCj4gCj4gRml4ZXM6Cj4gCj4gL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9i
dWlsZHJvb3Qvb3V0cHV0cy9xdC9idWlsZC9xdDZtdWx0aW1lZGlhLTYuOC4xL3NyYy9wbHVnaW5z
L211bHRpbWVkaWEvZmZtcGVnL3F2NGwyY2FtZXJhLmNwcDozNjo0MzogZXJyb3I6IOKAmFY0TDJf
UElYX0ZNVF9CR1JBCj4gMzLigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlOyBkaWQg
eW91IG1lYW4g4oCYVjRMMl9QSVhfRk1UX0JHUjMy4oCZPwo+ICAgICAzNiB8ICAgICB7IFFWaWRl
b0ZyYW1lRm9ybWF0OjpGb3JtYXRfQkdSQTg4ODgsIFY0TDJfUElYX0ZNVF9CR1JBMzIgIH0sCj4g
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fgo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFY0TDJfUElYX0ZNVF9CR1IzMgo+IAo+IHdoZW4gYnVpbGRpbmc6Cj4gCj4gICBC
UjJfYXJtPXkKPiAgIEJSMl9jb3J0ZXhfYTk9eQo+ICAgQlIyX0FSTV9FTkFCTEVfVkZQPXkKPiAg
IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09U
TElOPXkKPiAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WN19FQUJJSEZfTVVT
TF9TVEFCTEU9eQo+ICAgQlIyX1BBQ0tBR0VfUVQ2PXkKPiAgIEJSMl9QQUNLQUdFX1FUNkJBU0Vf
WENCPXkKPiAgIEJSMl9QQUNLQUdFX1FUNk1VTFRJTUVESUE9eQo+ICAgQlIyX1BBQ0tBR0VfUVQ2
TVVMVElNRURJQV9GRk1QRUc9eQo+ICAgQlIyX1BBQ0tBR0VfWE9SRzc9eQo+IAo+IGF0IGEgdGlt
ZSB3aGVuIHRoZSBCb290bGluIHN0YWJsZSB0b29sY2hhaW4gd2FzIHVzaW5nIExpbnV4IDQuMTkK
PiBoZWFkZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+CgogIEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgog
IFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9xdDYvcXQ2bXVsdGltZWRpYS9D
b25maWcuaW4gfCA3ICsrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDYvcXQ2bXVsdGltZWRpYS9Db25maWcuaW4gYi9w
YWNrYWdlL3F0Ni9xdDZtdWx0aW1lZGlhL0NvbmZpZy5pbgo+IGluZGV4IDMxMDdjYWE1OTcuLmY2
NGY2MGEwMDQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9xdDYvcXQ2bXVsdGltZWRpYS9Db25maWcu
aW4KPiArKysgYi9wYWNrYWdlL3F0Ni9xdDZtdWx0aW1lZGlhL0NvbmZpZy5pbgo+IEBAIC0yOCwx
MCArMjgsMTcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1FUNk1VTFRJTUVESUFfRVhBTVBMRVMKPiAg
IAloZWxwCj4gICAJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBRdDYgTXVsdGltZWRpYSBleGFt
cGxlcy4KPiAgIAo+ICtjb21tZW50ICJmZm1wZWcgcGx1Z2luIG5lZWRzIGtlcm5lbCBoZWFkZXJz
ID49IDUuMiIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfRkZNUEVHX0FSQ0hfU1VQUE9SVFMK
PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUFVMU0VBVURJT19IQVNfQVRPTUlDCj4gKwlkZXBl
bmRzIG9uICFCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNV8yCj4gKwo+ICAgY29uZmln
IEJSMl9QQUNLQUdFX1FUNk1VTFRJTUVESUFfRkZNUEVHCj4gICAJYm9vbCAiZmZtcGVnIHBsdWdp
biIKPiAgIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0ZGTVBFR19BUkNIX1NVUFBPUlRTCj4gICAJ
ZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QVUxTRUFVRElPX0hBU19BVE9NSUMKPiArCSMgVjRMMl9Q
SVhfRk1UX0JHUkEzMgo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVB
U1RfNV8yCj4gICAJIyBxdDYtbXVsdGltZWRpYSBmZm1wZWcgcGx1Z2luIG5lZWRzCj4gICAJIyBx
dDZiYXNlLWNvbmN1cnJlbnQsIFB1bHNlQXVkaW8gYW5kIGZmbXBlZy1zd2NhbGUuCj4gICAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0ZGTVBFRwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
