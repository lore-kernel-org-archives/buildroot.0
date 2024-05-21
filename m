Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B17DC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 15:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E20AC40BA0;
	Tue, 21 May 2024 15:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XL4dNLEBGOMa; Tue, 21 May 2024 15:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36FE9404F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36FE9404F6;
	Tue, 21 May 2024 15:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 814AC1BF299
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 15:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79CB44069F
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 15:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up2yC2aBl0bf for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 15:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7D5D402F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D5D402F4
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7D5D402F4
 for <buildroot@buildroot.org>; Tue, 21 May 2024 15:06:51 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5b31f2c6e52so1578979eaf.2
 for <buildroot@buildroot.org>; Tue, 21 May 2024 08:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716304011; x=1716908811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGuN8bJVbMqkBXKFZbrN7W6zmjoLinAErJNhKCeliok=;
 b=mCGYKzUwBRKUxPCc3tNTgYXl+iv+8u3xpUevdi5FOILwx3DgFVcbj3IX7yjNzNU7w3
 Sa+AeUSBAdI1/KYy3uuoiT/GX3eYir1J+qcY+kxfPjg37Cc0i4v0LluloijCFWXH+TjT
 VNDyhVFbmSMXeE42rmWGNquHQ4LMJW+QxaWLG0nIKAgwgOM1iHv2A/neH2sfqdBqFTKc
 DUFevnVlndHMXheysFGi+od5lMATnDk2Go6jNsNucNj3AFz4jKLA4TlG8nmrd2Zg/KEp
 IOoS3eSBarfu3E8Pw9CLdtev3MPJLqg67x184PEM0caxBszFkH5PaTAqMllBdUogqARa
 J5cw==
X-Gm-Message-State: AOJu0YzlxEwG4OOnbzuciQNKqyqwNt14QvDj0ZWJTiQeclk510dIV4Ts
 c0g5zQEDppyG/KtksjHfchQo1suMU9TD0N3ArGyjD4O4Yo6+51Dq6fouwhiDBz2tNbhylhtN7PK
 DZZaXZluo2AMQjQsMr/fYC5uC0ZN9/wsJrbVqVA==
X-Google-Smtp-Source: AGHT+IHCqbqDexcyQ0nCWQTlC/ys1BH0/mNZ3SoMsPmFLORXJayJIYawRoAJUEpMMojj0zk3AmEEWwvkMrENyk+xZZM=
X-Received: by 2002:a05:6359:4c81:b0:193:f899:f9b9 with SMTP id
 e5c5f4694b2df-193f899f9d3mr3463448955d.9.1716304010697; Tue, 21 May 2024
 08:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CABGWkvqz7-bnCJ6JBjp3rpbeSnDEZw55jNNHOmpbyGA772xDvA@mail.gmail.com>
 <20240520112336.7431520d@windsurf>
In-Reply-To: <20240520112336.7431520d@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 21 May 2024 17:06:39 +0200
Message-ID: <CABGWkvpxUxPrhib7vmKRhA32FYojB=-tnZJr=qiQCKM-=+L7uQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716304011; x=1716908811;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGuN8bJVbMqkBXKFZbrN7W6zmjoLinAErJNhKCeliok=;
 b=a0phCk20xpdMfkueoUSmFwQ4IAkatOjaNujEQ8rBKvJ6lpQu4Cr/G9rabErDjlo3U0
 sD300ExPcK8YKmCshsxjOHUhfGnp5L3nyG+udwqTOKvolkM83rtQmREejCGoECSZp4qV
 WQdT/w23ZLG97nphjF35WIlImfHrTS9TzjCQc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=a0phCk20
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: quentin.schulz@theobroma-systems.com, Xuanhao Shi <X15000177@gmail.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBHZXJvIGFuZCBBbGwsCgpPbiBNb24sIE1heSAyMCwgMjAyNCBhdCAxMToy
M+KAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdy
b3RlOgo+Cj4gSGVsbG8gRGFyaW8sCj4KPiBbIFlvdXIgZS1tYWlsIGNsaWVudCBjb25maWd1cmF0
aW9uIHNlZW1zIHNvbWV3aGF0IGJyb2tlbiwgeW91ciBsaW5lcwo+ICAgYXJlIGJhZGx5IHdyYXBw
ZWQgXQo+Cj4gT24gTW9uLCAyMCBNYXkgMjAyNCAxMDowNTozNCArMDIwMAo+IERhcmlvIEJpbmFj
Y2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+ID4g
Tm93IHRoZSBxdWVzdGlvbiBpcyBob3cgdG8gZG8gdGhpcy4gVG8gbWUgeW91ciBwcm9wb3NhbCBs
b29rcwo+ID4gPiByZWFzb25hYmxlLCB0aG91Z2ggc29tZSBwZW9wbGUgaGFkIHRoZSBmZWVkYmFj
ayB0aGF0IGJtYXAtdG9vbHMgd2lsbAo+ID4gPiBub3Qgd29yayBpbiBhbGwgY2FzZXMgKHNob3Vs
ZCB3ZSB0aGVuIGdyYWNlZnVsbHkgaGFuZGxlIHRoaXMgZmFpbHVyZQo+ID4gPiBjYXNlPykuCj4g
Pgo+ID4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgdGhlIGZpcnN0IHBhdGNoIGluIHRoZSBz
ZXJpZXMgc2VlbXMKPiA+IHJlYXNvbmFibGUgdG8gR2VybyBhcyB3ZWxsLgo+ID4gVGhlcmVmb3Jl
LCBib3RoIG9mIHlvdSBhcmUgaW4gZmF2b3Igb2YgbWVyZ2luZyB0aGlzIHBhdGNoLiBUaGUgaXNz
dWUKPiA+IGFyaXNlcyBmb3IgR2Vybwo+ID4gcmVnYXJkaW5nIHRoZSBhcHBsaWNhdGlvbiBvZiB0
aGUgc2Vjb25kIHBhdGNoLCB3aGljaCBJIGFkZGVkIG9ubHkgYXMKPiA+IGFuIGV4YW1wbGUgdXNl
IGNhc2UuCj4gPiBJIHRoaW5rIG1lcmdpbmcgdGhlIGZpcnN0IHBhdGNoIHdvdWxkIGdpdmUgdGhl
IG9wcG9ydHVuaXR5IHRvIHVzZQo+ID4gYm1hcHRvb2wgYW5kIHJlYWxpemUgaXRzCj4gPiB1c2Vm
dWxuZXNzLiBBZnRlciBhbGwsIHRoZSBwYXRjaCBpcyBiYWNrd2FyZCBjb21wYXRpYmxlLiBJdHMg
dXNlIGNvdWxkCj4gPiB0aGVuIGxlYWQgdG8gc3Vic2VxdWVudAo+ID4gaW1wcm92ZW1lbnRzLgo+
ID4KPiA+IFJlZ2FyZGluZyB0aGUgc2Vjb25kIHBhdGNoLCBJIHRoZW4gYXNrIHlvdTogSXMgaXQg
Y29ycmVjdCBub3QgdG8KPiA+IHByb2NlZWQgd2l0aCBtZXJnaW5nIHRoaXMKPiA+IHBhdGNoIGZv
ciB0aGUgcmVhc29uIG1lbnRpb25lZCBieSBHZXJvIChpLmUuLCBlbmNyeXB0ZWQgZGlyZWN0b3J5
KT8gSXQKPiA+IHNlZW1zIHRvIG1lIHRoYXQKPiA+IGJtYXB0b29sIGlzIHVzZWQgaW4gWW9jdG8s
IHNvIGlzIGl0IGNvcnJlY3QgdG8gc2F5IHRoYXQgeW91IHdvdWxkIGhhdmUKPiA+IHRoZSBzYW1l
IHByb2JsZW0KPiA+IHdpdGggWW9jdG8/IEkgaG9wZSwgR2VybywgeW91IGRvIG5vdCBtaXN1bmRl
cnN0YW5kIG1lLgo+Cj4gWWVzLCB0aGUgZmlyc3QgcGF0Y2ggaXMgcmVhc29uYWJsZSwgYnV0IGlm
IHdlIGNhbid0IGFwcGx5IHNvbWV0aGluZwo+IGxpa2UgdGhlIHNlY29uZCBwYXRjaCwgdGhlbiBp
dCBtaWdodCBtZWFuIHRoYXQgdGhlIGFwcHJvYWNoIHRha2VuIGluCj4gdGhlIGZpcnN0IHBhdGNo
IGlzbid0IGNvcnJlY3QuIEluZGVlZCwgaWYgd2UgY2FuJ3QgZW5hYmxlIGJ5IGRlZmF1bHQKPiB0
aGUgZ2VuZXJhdGlvbiBvZiBibWFwLWNhcGFibGUgaW1hZ2VzIGluIGRlZmNvbmZpZ3MsIGl0IGtp
bmQgb2YgbGltaXRzCj4gdGhlIHVzZWZ1bG5lc3Mgb2YgdGhpcyBibWFwLXRvb2wgaW50ZWdyYXRp
b24uCj4KPiBJIHdhcyBob3BpbmcgZm9yIHRoZSBvdGhlciBCUiBtYWludGFpbmVycyB0byBjaGlt
ZSBpbiB3aXRoIHNvbWUgb3Bpbmlvbi4KPgo+IERvIHdlIGhhdmUgYSB3YXkgdG8gZGV0ZWN0IHRo
YXQgdGhlIGJtYXAtdG9vbCBnZW5lcmF0aW9uIHdpbGwgZmFpbCwgYW5kCj4gaW4gdGhpcyBjYXNl
IGdyYWNlZnVsbHkgc2tpcCB0aGUgYm1hcC10b29sIGxvZ2ljPwoKSSByYW4gc29tZSB0ZXN0cyBh
bmQgdHJpZWQgdG8gcmVwcm9kdWNlIEdlcm8ncyBpc3N1ZS4KV2l0aCB0aGVzZSBjaGFuZ2VzLCBp
biBjYXNlIG9mIGFuIGVycm9yLCB0aGUgbWFrZSBjb21tYW5kIHdvdWxkIG5vdCBmYWlsLgoKZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCBiL3N1cHBvcnQvc2NyaXB0cy9n
ZW5pbWFnZS5zaAppbmRleCA3MjU5MmViYjcxMGQuLjEyMmFhMGUwZGM4MSAxMDA3NTUKLS0tIGEv
c3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoCisrKyBiL3N1cHBvcnQvc2NyaXB0cy9nZW5pbWFn
ZS5zaApAQCAtNTksNyArNTksMTIgQEAgaWYgWyAiJHtHRU5JTUFHRV9DUkVBVEVfQk1BUH0iID0g
InllcyIgXTsgdGhlbgogICAgIGNudD0kKGdyZXAgLWMgIiR7aW1hZ2V9IiAiJHtHRU5JTUFHRV9D
Rkd9IikKICAgICBbICIke2NudH0iIC1ndCAxIF0gJiYgY29udGludWU7CiAgICAgaW1hZ2VfcGF0
aD0iJHtCSU5BUklFU19ESVJ9LyR7aW1hZ2V9IgotICAgIGJtYXB0b29sIGNyZWF0ZSAiJHtpbWFn
ZV9wYXRofSIgLW8gIiR7aW1hZ2VfcGF0aH0uYm1hcCIKLSAgICBnemlwIC1jICIke2ltYWdlX3Bh
dGh9IiA+ICIke2ltYWdlX3BhdGh9Lmd6IgorICAgIFRNUF9TVERFUlI9JChta3RlbXAgLXQgLnRt
cC5nZW5pbWFnZS5YWFhYWFhYWFhYKQorICAgIGJtYXB0b29sIGNyZWF0ZSAiJHtpbWFnZV9wYXRo
fSIgLW8gIiR7aW1hZ2VfcGF0aH0uYm1hcCIgMj4ke1RNUF9TVERFUlJ9CisgICAgaWYgdGVzdCAk
PyAtZXEgMCA7IHRoZW4KKyAgICAgIGd6aXAgLWMgIiR7aW1hZ2VfcGF0aH0iID4gIiR7aW1hZ2Vf
cGF0aH0uZ3oiCisgICAgZWxzZQorICAgICAgZWNobyAiQ2Fubm90IGdlbmVyYXRlIGJtYXAgZm9y
IGZpbGUgJHtpbWFnZV9wYXRofS4gUGxlYXNlIHJlYWQKbG9nIGVycm9yICR7VE1QX1NUREVSUn0g
Zm9yIGRldGFpbHMiCisgICAgZmkKICAgZG9uZSA8IDwoZ3JlcCAnXmltYWdlICcgIiR7R0VOSU1B
R0VfQ0ZHfSIgfCBjdXQgLWQgJyAnIC1mIDIpCiBmaQoKVGhlIGNoYW5nZSBnZW5lcmFsbHkgaGFu
ZGxlcyBhbnkgdHlwZSBvZiBlcnJvciwgYnV0IGluIHRoZSBjYXNlCmhpZ2hsaWdodGVkIGJ5IEdl
cm8sIGl0IHNlZW1zIHRvIG1lCnRoYXQgbm90IHRvbyBtdWNoIHRpbWUgaXMgd2FzdGVkIGVuY291
bnRlcmluZyB0aGUgZXJyb3IsIHNpbmNlCmJtYXB0b29sIGluaXRpYWxseSB0cmllcyB0byB1bmRl
cnN0YW5kIGlmCnRoZSBzeXN0ZW0gc3VwcG9ydHMgdGhlIEZJRU1BUCBpb2N0bCBvciB0aGUgU0VF
S19IT0xFL1NFRUtfREFUQQpmdW5jdGlvbmFsaXR5IG9mIHRoZSBmaWxlIHNlZWsKc3lzY2FsbC4K
CkFzIGNhbiBiZSBzZWVuIGluIHRoZSBGaWxlbWFwLnB5IGZpbGU6CgpkZWYgZmlsZW1hcChpbWFn
ZSk6CiAgICAiIiIKICAgIENyZWF0ZSBhbmQgcmV0dXJuIGFuIGluc3RhbmNlIG9mIGEgRmlsZW1h
cCBjbGFzcyAtICdGaWxlbWFwRmllbWFwJyBvcgogICAgJ0ZpbGVtYXBTZWVrJywgZGVwZW5kaW5n
IG9uIHdoYXQgdGhlIHN5c3RlbSB3ZSBydW4gb24gc3VwcG9ydHMuIElmIHRoZQogICAgRklFTUFQ
IGlvY3RsIGlzIHN1cHBvcnRlZCwgYW4gaW5zdGFuY2Ugb2YgdGhlICdGaWxlbWFwRmllbWFwJyBj
bGFzcyBpcwogICAgcmV0dXJuZWQuIE90aGVyd2lzZSwgaWYgJ1NFRUtfSE9MRScgaXMgc3VwcG9y
dGVkIGFuIGluc3RhbmNlIG9mIHRoZQogICAgJ0ZpbGVtYXBTZWVrJyBjbGFzcyBpcyByZXR1cm5l
ZC4gSWYgbm9uZSBvZiB0aGVzZSBhcmUgc3VwcG9ydGVkLCB0aGUKICAgIGZ1bmN0aW9uIGdlbmVy
YXRlcyBhbiAnRXJyb3InIHR5cGUgZXhjZXB0aW9uLgogICAgIiIiCgogICAgdHJ5OgogICAgICAg
IHJldHVybiBGaWxlbWFwRmllbWFwKGltYWdlKQogICAgZXhjZXB0IEVycm9yTm90U3VwcDoKICAg
ICAgICByZXR1cm4gRmlsZW1hcFNlZWsoaW1hZ2UpCgpDYW4gdGhlc2UgY2hhbmdlcyBtYWtlIHRo
ZSBwYXRjaGVzIGFjY2VwdGFibGU/CgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4gQmVz
dCByZWdhcmRzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgoKCi0tIAoKRGFyaW8gQmluYWNjaGkK
ClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFz
b2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVs
YSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0
bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3
LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
