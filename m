Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76910C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 13:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3948340855;
	Mon,  8 Apr 2024 13:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGS5EhFiYpPC; Mon,  8 Apr 2024 13:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADCE640840
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCE640840;
	Mon,  8 Apr 2024 13:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3B11BF59F
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6320360B05
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01krsS5dfFNe for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 13:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 193A960AFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193A960AFF
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 193A960AFF
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 13:47:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-415515178ceso28491425e9.0
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 06:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712584077; x=1713188877;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xLg6bCSekyOu97CHmiTmIZfbGIV02TNgAK/AQQmH9U4=;
 b=NeeZ3OgT68aG0OJYJyk4Y2tRYCF2ApWpCiJIASizHCw3Ahiegh08BEUmIDWr9Qi1am
 Jk9hMPggXmsCVhN8ct/uvGKibyoYVl6WcEKGBAMgg0oRA0bVPi67vY9BppjaUdJWM8XE
 0IKiCYCCrUFecBCNbiXvz1BWEXTBH60Sx2Xk9b4hjGjRkFFgial2JVxeVyH9gaXsVkw8
 7qcublzIEqlceHeqzEpVEa39qmv4b3te3szRI6iDOdhMxw81CV0rN/XtBNIctnPg4xlA
 dU8AuWcFwaeTg0w2p0EsWhzmxnjufTIN20LEFNSQd0yDW4eOn6nhYuruhqoBWYn3DM/q
 VWVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6JA/1GvmQvnBf3ew41aAuU+1+COENSGyOtJJHRxxQ7VeQ5ThQvVO2Fw1clUFhuzB5KKTsFHSIUKYBjsV/6sM/75y7Xlf2Kg==
X-Gm-Message-State: AOJu0Yx8+EmQEdH/JzYJsY7m01PMaBvS1Ymw9HhV4ssds4rWIJz9sQvy
 NtVR25nS5znfe1G0KAMNbsfFor8qAQJqa+YmbxkD5RKKp+tuYt8va4QZCyOnHqQ=
X-Google-Smtp-Source: AGHT+IHgKI7vpakwIPuak+qvcgvP74cEaqYcyfuMOd5XwkyQo7IKW/Lk8U6oYSpbP/0JuvN4d1cL1A==
X-Received: by 2002:a05:600c:1e1e:b0:416:950b:6aee with SMTP id
 ay30-20020a05600c1e1e00b00416950b6aeemr287575wmb.9.1712584076959; 
 Mon, 08 Apr 2024 06:47:56 -0700 (PDT)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 s26-20020adfa29a000000b00345660dafffsm5081985wra.80.2024.04.08.06.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:47:55 -0700 (PDT)
Message-ID: <1ec8e03b-f5b7-41cf-bfe4-17f99a871e93@mind.be>
Date: Mon, 8 Apr 2024 15:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
Content-Language: en-GB
In-Reply-To: <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712584077; x=1713188877; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xLg6bCSekyOu97CHmiTmIZfbGIV02TNgAK/AQQmH9U4=;
 b=ifXQ6WRekhru08jE1XHUB+kchBytF9viHWdqyQQ2DYt7vMxPCNZ/8dkJHGnnxax7gx
 dEZNGwRC/6u65mI6AL0jny47VgIXIdSbzdyFm75jP22fmfyNFsRsu6Ni6wGW2aj15BzF
 +3m/TCE4KY+eLe6Z5NsvrVWdppoOXPAHP1kY5xfs4/+2YHFO4qfixykWikkakC0oweyr
 vxfzy2Aj/EO7ICTXSyGKws4t7Tm5VHt1Uwt8i6cog9kbvStjVHY5x2CXIe761Mu6qeyO
 +MyBP6oFyuviQiSZ/Fx2A7OmvvU8r7/lIiD6UkjpzRW+rtZ8g1hXc01W3LaMLDHvZ0XD
 UD0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ifXQ6WRe
Subject: Re: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS
 devices
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA3LzA0LzIwMjQgMjI6MzAsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwNy8wNC8yMDI0IDEyOjM0LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4+IFRoaXMgc2VyaWVzIGFp
bXMgaW5pdGlhbGx5IHRvIGZpeCBBTTYyeC1TSyBIUy1GUyBkZXZpY2VzIGJ1dCBkb2luZyBzbwo+
PiB3b3VsZCByZXF1aXJlcyBhZGRpbmcgYSBUSSBsZWdhY3kgdG9vbCAidGktazMtY29yZS1zZWNk
ZXYiIGludG8gQnVpbGRyb290Lgo+PiB0aS1rMy1jb3JlLXNlY2RldiBpcyByZXBsYWNlZCBieSB1
LWJvb3QncyBiaW5tYW4gdG9vbCBzaW5jZSB2MjAyMy4xMCByZWxlYXNlCj4+IG9mIHUtYm9vdC4K
Pj4KPj4gSW5zdGVhZCwgd2UgYnVtcCB0aGUgQlNQIHRvIHVzZSB0aGUgbGF0ZXN0IHUtYm9vdCBy
ZWxlYXNlICgyMDI0LjAxKSB0byB1c2UKPj4gYmlubWFuLiBEb2luZyBzbyByZXF1aXJlcyB0byBy
ZXdvcmsgdGhlIFRJIEszIFNvQyBzdXBwb3J0IGluIEJ1aWxkcm9vdC4KPj4KPj4gVGhpcyBuZXcg
dmVyc2lvbiAodjEyKSBvZiB0aGlzIHNlcmllcyByZW1vdmUgdGhlIHRpLWszIHBhY2thZ2UgYW5k
Cj4+IGFsbCBTT0MgYW5kIFNFQ1RZUEUgb3B0aW9ucy4gQXMgc3VnZ2VzdGVkIGJ5IE1pY2hhZWwg
V2FsbGUsIGNvcHkgdGhlCj4+IGRlZmF1bHQgdGlib290My5iaW4gYW5kIHN5c2Z3Lml0YiAoaWYg
YW55KSBpZiBubyBjdXN0b20gZmlsZSBuYW1lIGlzCj4+IHByb3ZpZGVkIG9uIHRoZSBkZWZjb25m
aWcuIFNpbmNlIHN1Y2ggZmlsZSBuYW1lIGNhbiBiZSBjdXN0b21pemVkLAo+PiB0aGUgdXNlciBt
dXN0IHByb3ZpZGUgdGhlIGNvbXBsZXRlIGZpcm13YXJlIG5hbWUgaWYgbm90IHVzaW5nIHRoZQo+
PiBkZWZhdWx0IG9uZS4KPj4KPj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9i
dWlsZHJvb3QvMjAyNC1BcHJpbC82ODg5NDMuaHRtbAo+Pgo+PiBXaXRoIHRoZSBhZHZpY2Ugb2Yg
QW5kcmVhcyBEYW5uZW5iZXJnIChUSSBLMyBhcmNoaXRlY3QpLCB3ZSBzd2l0Y2gKPj4gQU02Mngv
QU02MkF4L0FNNjR4IHRvIEhTLUZTIGJ5IGRlZmF1bHQuCj4+Cj4+IFRlc3RzIHBlcmZvcm1lZCBv
biBlYXJsaWVyIHJldmlzaW9uIG9mIHRoaXMgc2VyaWVzOgo+Pgo+PiAqIGNvbXBpbGVkIHRpX2Ft
NjJ4X3NrX2RlZmNvbmZpZwo+PiDCoMKgICogc3VjY2Vzcwo+PiAqIGJvb3RlZCBvbiBBTTYyeCBT
SyBFVk0gKEUzKQo+PiDCoMKgICogc3VjY2Vzcwo+PiDCoMKgICogbm8gb2J2aW91cyBlcnJvcnMg
aW4gZG1lc2cKPj4KPj4gVGVzdGVkLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvLnNjaHdhZXJp
Y2tlQGdyYW5kY2VudHJpeC5uZXQ+Cj4+Cj4+IERhcmlvIEJpbmFjY2hpICgxMCk6Cj4+IMKgwqAg
Ym9vdC90aS1rMy1yNS1sb2FkZXI6IGRyb3AgaGFzaCBmb3IgdmVyc2lvbiAyMDIyLjEwCj4+IMKg
wqAgYm9vdC90aS1rMy1yNS1sb2FkZXI6IGFkZCBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9V
U0VfQklOTUFOIG9wdGlvbgo+PiDCoMKgIGJvb3QvdWJvb3Q6IGFkZCBCUjJfVEFSR0VUX1VCT09U
X1VTRV9CSU5NQU4gb3B0aW9uCj4+IMKgwqAgYm9vdC90aS1rMy1yNS1sb2FkZXI6IGluc3RhbGwg
dGlib290My5iaW4gYW5kIHN5c2Z3Lml0YiB0bwo+PiDCoMKgwqDCoCBCSU5BUklFU19ESVIKPj4g
wqDCoCBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzogYnVtcCBVLUJvb3QgdmVyc2lvbiB0
byAyMDI0LjAxCj4+IMKgwqAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWc6IGJ1bXAgTGlu
dXggdmVyc2lvbiB0byA2LjYuMTgKPj4gwqDCoCBib2FyZC90aS9hbTYyeC1zazogZ2VuZXJhbGl6
ZSBwb3N0LWJ1aWxkLnNoCj4+IMKgwqAgYm9hcmQvdGkvYW02Mngtc2s6IG1vdmUgcG9zdC1idWls
ZC5zaCB0byBib2FyZC90aS9jb21tb24vYW02eHgKPj4gwqDCoCBjb25maWdzL3RpX2FtNjR4X3Nr
X2RlZmNvbmZpZzogYnVtcCBVLUJvb3QgdmVyc2lvbiB0byAyMDI0LjAxCj4+IMKgwqAgY29uZmln
cy90aV9hbTY0eF9za19kZWZjb25maWc6IGJ1bXAgTGludXggdmVyc2lvbiB0byA2LjYuMTgKPj4K
Pj4gUm9tYWluIE5hb3VyICg2KToKPj4gwqDCoCBib2FyZC90aS9hbTZ7Miw0fXgtc2s6IGFkZCBh
cm0tdHJ1c3RlZC1maXJtd2FyZSB2Mi43IGhhc2gKPj4gwqDCoCBib290L3Vib290OiByZW5hbWUg
VElfSzNfRE0gb3B0aW9uIHRvIGNvdmVyIGZ1cnRoZXIgVEkgSzMgU29DcyBzdXBwb3J0Cj4+IMKg
wqAgYm9vdC91Ym9vdDogcmVtb3ZlIEJSMl9UQVJHRVRfVUJPT1RfVElfSzNfRE1fU09DTkFNRQo+
PiDCoMKgIGJvb3QvdGktazMtaW1hZ2UtZ2VuOiByZW1vdmUgcGFja2FnZQo+PiDCoMKgIGJvb3Qv
dGktazMtcjUtbG9hZGVyOiByZW1vdmUgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJ
Tk1BTgo+PiDCoMKgIHBhY2thZ2UvdGktazM6IHN3aXRjaCBBTTYyeC9BTTYyQXgvQU02NHggdG8g
SFMtRlMgYnkgZGVmYXVsdAo+Cj4gwqBQYXRjaGVzIDEtNSBhcHBsaWVkIHRvIG1hc3Rlci4gQW5k
IHRoZXJlIEkgc3RvcHBlZCwgZHVlIHRvIHRoZSBTV1NGVyB0eXBvLiBJIAo+IGNvdWxkIGhhdmUg
Zml4ZWQgaXQgdXAgbXlzZWxmIGJ1dCBpdCdzIHJlYWxseSBldmVyeSBwYXRjaCB0aGF0IG5lZWRz
IHRvIGJlIAo+IHVwZGF0ZWQuLi4KCgogwqBJIGFsc28gcmV2aWV3ZWQgdGhlIHJlc3Qgb2YgdGhl
IHNlcmllcyB3aXRoIG1pbm9yIGNvbW1lbnRzLCBzbyB5b3UgY2FuIGFwcGx5IAp0aGVtIGRpcmVj
dGx5ICh3aXRoIG15IFJldmlld2VkLWJ5OiBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1p
bmQuYmU+KQoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKCj4KPgo+IMKgUmVnYXJkcywKPiDCoEFy
bm91dAo+Cj4+Cj4+IMKgIENvbmZpZy5pbi5sZWdhY3nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTUgKysrKwo+PiDCoCBERVZFTE9Q
RVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAtCj4+IMKgIGJvYXJkL3RpL2FtNjJ4LXNrL2dlbmltYWdl
LmNmZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArLQo+PiDCoCAuLi4vYXJt
LXRydXN0ZWQtZmlybXdhcmUuaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAyICsKPj4gwqAgLi4uL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2jC
oCB8wqAgMSArCj4+IMKgIGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFz
aMKgwqDCoCB8wqAgMiArCj4+IMKgIC4uLi90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lmhhc2jCoMKgwqDCoMKgIHzCoCAyICsKPj4gwqAgYm9hcmQvdGkvYW02NHgtc2svZ2VuaW1hZ2Uu
Y2ZnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3ICstCj4+IMKgIC4uLi9hcm0t
dHJ1c3RlZC1maXJtd2FyZS5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgKwo+PiDCoCAuLi4vcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaMKg
IHzCoCAxICsKPj4gwqAgYm9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNo
wqDCoMKgIHzCoCAyICsKPj4gwqAgLi4uL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIu
aGFzaMKgwqDCoMKgwqAgfMKgIDEgKwo+PiDCoCBib2FyZC90aS9jb21tb24vYW02eHgvcG9zdC1i
dWlsZC5zaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNTggKysrKysrKysrKysrKysKPj4gwqAgYm9v
dC9Db25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAtCj4+IMKgIGJvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZp
Zy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDc3IC0tLS0tLS0tLS0tLS0tLS0t
LS0KPj4gwqAgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2jCoMKgwqDC
oCB8wqAgMyAtCj4+IMKgIGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5ta8Kg
wqDCoMKgwqDCoCB8IDU0IC0tLS0tLS0tLS0tLS0KPj4gwqAgYm9vdC90aS1rMy1yNS1sb2FkZXIv
Q29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzMgKysrKysrKysKPj4g
wqAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2jCoMKgwqDCoCB8wqAg
MSAtCj4+IMKgIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5ta8KgwqDCoMKg
wqDCoCB8IDQwICsrKysrKysrKy0KPj4gwqAgYm9vdC91Ym9vdC9Db25maWcuaW7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDM1ICsrKysrLS0tLQo+
PiDCoCBib290L3Vib290L3Vib290Lm1rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrLQo+PiDCoCBjb25maWdzL3RpX2FtNjJ4X3NrX2Rl
ZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjEgKystLS0KPj4gwqAg
Y29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDIwICsrKy0tCj4+IMKgIDI0IGZpbGVzIGNoYW5nZWQsIDIyMSBpbnNlcnRpb25zKCsp
LCAxNzggZGVsZXRpb25zKC0pCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCAKPj4gYm9hcmQvdGkv
YW02Mngtc2svcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2Fy
ZS5oYXNoCj4+IMKgIGNyZWF0ZSBtb2RlIDEyMDAwMCBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVz
L2xpbnV4LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNoCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKPj4gwqAgY3JlYXRl
IG1vZGUgMTAwNjQ0IAo+PiBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRl
ci90aS1rMy1yNS1sb2FkZXIuaGFzaAo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+IGJvYXJk
L3RpL2FtNjR4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmly
bXdhcmUuaGFzaAo+PiDCoCBjcmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvdGkvYW02NHgtc2svcGF0
Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaAo+PiDCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4+IMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCAKPj4gYm9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy90aS1rMy1yNS1s
b2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2gKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNzU1IGJvYXJk
L3RpL2NvbW1vbi9hbTZ4eC9wb3N0LWJ1aWxkLnNoCj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBi
b290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KPj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IGJv
b3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5oYXNoCj4+IMKgIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWsKPj4KPj4gLS0g
Cj4+IDIuNDQuMAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
