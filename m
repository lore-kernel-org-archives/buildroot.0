Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EDBC48BF3
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E8242091;
	Fri, 16 Feb 2024 21:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6UYrWvFLEq2; Fri, 16 Feb 2024 21:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25EE41FE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C25EE41FE7;
	Fri, 16 Feb 2024 21:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D74AB1BF2C7
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3480417F2
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQBdAci_kqpD for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22C65400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22C65400E5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22C65400E5
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:38:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-411d715c401so19444585e9.1
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708119523; x=1708724323;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UGEUJ0C01WCC99TJUgaxBP+4vbPM+/ezLBOSAfAdBdU=;
 b=cl72KNz46DOdvqSwAcJA7WmpQM17GZjmmrlZKVvbSQHEhWHuXRFK5RbINLvOR7SLV+
 dKMDQV0Xq476f+NazlYidxfk4jwTZaj7KBftsEhuFCaClXXi4gYqezCDl4gOSAZITUhV
 U8P9m2sNLyfO36lzPJhCRFOm6hMZX3g6xt2kyHt/tTpvVDfbByTh8X6wvfzdiwmppOmC
 KY0ebhMMMLzPj5w/BBNaZFjtOMOIh7Tl5wHYDxzZTPl9qZsiXZCerra2JFBVd4/ArUr5
 /etLToHunMcGF4u3mFyStwLq7AMyButzZoNo/6wFzL0W6lBWWyhJ+xgp3jsjYChDj6qw
 N4LQ==
X-Gm-Message-State: AOJu0YzlaJhD6MShSI8ra3WzbKQKLoFH3flCaDDGIoek899LNTxjHQus
 VE5qU7cRWME3ZIBMmwPtPZQl/20kOrgzwI4jpBYHy/rKPCCqAB4w1lEBo47llgQ=
X-Google-Smtp-Source: AGHT+IH5GTCdnqlxkOCq6jG/xAwhWhkLgsTb88A8UKJegnWNQbvV4wFhjNTlqSnDB3ml710cYzjomg==
X-Received: by 2002:a5d:6744:0:b0:33d:2017:2928 with SMTP id
 l4-20020a5d6744000000b0033d20172928mr1586731wrw.59.1708119523126; 
 Fri, 16 Feb 2024 13:38:43 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h15-20020adffa8f000000b0033b75d0993esm3187738wrr.74.2024.02.16.13.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 13:38:42 -0800 (PST)
Message-ID: <b3065644-f654-49fc-9560-31caa0beffbe@smile.fr>
Date: Fri, 16 Feb 2024 22:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
 <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
 <20240216200635.crek5j23p3hybg2p@dasso>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240216200635.crek5j23p3hybg2p@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708119523; x=1708724323;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UGEUJ0C01WCC99TJUgaxBP+4vbPM+/ezLBOSAfAdBdU=;
 b=sLEfsQn0IZaFPm9mVE/ki4rfJ6bFxR2GsNvfRVYZ2DqkP6/+f909feZ8SxpNThZkjz
 hoUoZxcF5VBjSEpMlVvz567zeEunpoNsuFayDLAXuQ4fUe7arkiK8QZ3/pccSO30hhsn
 WhpSALWqUTpURme5rtopHhIEaX9MUEFKo8MSZMtnZqF20cQqP/z3S6o8Y0WeA+Zgyku5
 NsWlp/Y4rFlPsz7VJ5sR8QdSQgET0V9ix9yJ0BEx569aDC6TjsODAmRCtg+9mytwuZpW
 hlxkmtiHcxXasbaJ5M+PgKMfw606T0k6kDbP3zusMh+a+87XOoRXpWKekLcNaeLUQJTY
 2r6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=sLEfsQn0
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywKCkxlIDE2LzAyLzIwMjQgw6AgMjE6MDYsIEFuZHJlYXMgRGFubmVuYmVy
ZyBhIMOpY3JpdMKgOgo+IE9uIFRodSwgRmViIDE1LCAyMDI0IGF0IDExOjIwOjUwQU0gKzAxMDAs
IEFsZXhhbmRlciBTdmVyZGxpbiB3cm90ZToKPj4gSGkgUm9tYWluLAo+Pgo+PiBPbiBUdWUsIDIw
MjQtMDItMTMgYXQgMTg6MjggKzAxMDAsIFJvbWFpbiBOYW91ciB3cm90ZToKPj4+IC1jaG9pY2UK
Pj4+IC0JcHJvbXB0ICJTZWN1cml0eSB0eXBlIgo+Pj4gLQloZWxwCj4+PiAtCcKgIFRoZSB0YXJn
ZXQgU29DIHNlY3VyaXR5IHR5cGUgb3B0aW9uIGZvciBpbWFnZSBnZW4uwqAgVmFsaWQKPj4+IC0J
wqAgb3B0aW9ucyBhcmUgImdwIiBmb3IgR2VuZXJhbCBQdXJwb3NlIGRldmljZXMsICJocy1mcyIg
Zm9yCj4+PiAtCcKgIEhpZ2ggU2VjdXJpdHkgLSBGaWVsZCBTZWN1cmFibGUgZGV2aWNlcywgb3Ig
ImhzIiBmb3IgSGlnaAo+Pj4gLQnCoCBTZWN1cml0eSAtIFNlY3VyaXR5IEVuZm9yY2luZyBkZXZp
Y2VzLsKgIE5vdGUgZm9yIGFsbCBIaWdoCj4+PiAtCcKgIFNlY3VyaXR5IGRldmljZSB2YXJpYW50
cyB0aGUgVElfU0VDVVJFX0RFVl9QS0cgZW52aXJvbm1lbnRhbAo+Pj4gLQnCoCB2YXJpYWJsZSBt
dXN0IGJlIGRlZmluZWQgYXQgYnVpbGQgdGltZSBwb2ludGluZyB0byBhIHZhbGlkCj4+PiAtCcKg
IGNvcmUtc2VjZGV2LWszIGZvbGRlciBsb2NhdGlvbiwgb3RoZXJ3aXNlIHRoZSBidWlsZCB3aWxs
Cj4+PiAtCcKgIGZhaWwsIHNlZQo+Pj4gLQnCoCBodHRwczovL2dpdC50aS5jb20vY2dpdC9zZWN1
cml0eS1kZXZlbG9wbWVudC10b29scy9jb3JlLXNlY2Rldi1rMwo+Pj4gLQo+Pj4gLWNvbmZpZyBC
UjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0dQCj4+PiAtCWJvb2wgImdwIgo+Pj4g
LQo+Pj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZTCj4+
PiAtCWJvb2wgImhzLWZzIgo+Pj4gLQo+Pj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdF
X0dFTl9TRUNUWVBFX0hTCj4+PiAtCWJvb2wgImhzIgo+Pj4gLQo+Pj4gLWVuZGNob2ljZQo+Pgo+
PiBhbm90aGVyIG9ic2VydmF0aW9uIEkgbWFkZSBqdXN0IG5vdzogcHJldmlvdXNseSBCUjJfVEFS
R0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0dQPXkKPj4gd2FzIHRoZSBkZWZhdWx0LCB3aGlj
aCBkaWRuJ3QgYm9vdCBvbiBteSBIUy1GUyBTb0MuCj4+Cj4+IFlvdSBwYXRjaHNldCBzdGFydGVk
IG91dC1vZi10aGUtYm94LCB3aGljaCwgSSBjb25jbHVkZSwgbWVhbnMsIEhTLUZTIGlzIG5vdyB0
aGUKPj4gZGVmYXVsdCBmb3IgQU02MnguIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEgcHJvYmxl
bSwgdGhvdWdoLgo+IAo+IEhTLUZTIHNob3VsZCBiZSB0aGUgZGVmYXVsdCBmb3IgYWxsIFRJIEFN
NnggZGV2aWNlcy4gVGhpcyBpcyBvdXIKPiAicHJvZHVjdGlvbiBzaWxpY29uIiBhbmQgd2hhdCdz
IHVzZWQgZm9yIChhbG1vc3QpIGFsbCBwcm9qZWN0cywKPiBlc3BlY2lhbGx5IG5ldyBwcm9qZWN0
cy4gVGhpcyBiZWluZyBzYWlkIGhhdmluZyBzdXBwb3J0IGZvciBHUCBkZXZpY2UKPiB2YXJpYW50
cyBzdGlsbCBpcyBkZXNpcmFibGUgZm9yIGV4aXN0aW5nIGJvYXJkcy9wcm9qZWN0cywgc3VjaCBh
cyB0aGUKPiBjdXJyZW50IEJlYWdsZVBsYXkgYm9hcmRzIChhbW9uZ3N0IGVhcmxpZXIgdmVyc2lv
biBvZiBUSSBzdGFydGVyIGtpdAo+IEVWTXMgZm9yIEFNNngpLgoKVGhhbmsgeW91LCBJIHdhcyBu
b3QgYXdhcmUgb2YgdGhpcy4KCkkgZm91bmQgeW91ciBwb3N0IGluIHRoZSBUSSBmb3J1bSBhYm91
dCB0aGUgcmVjZW50IHN3aXRjaCBmcm9tIEdQIHRvIEhTLUZTCmRldmljZSBpbiBZb2N0byBbMV0u
CgpDdXJyZW50bHkgZXhpc3RpbmcgYW02NC9hbTYyIGRlZmNvbmZpZ3MgYXJlIHN0aWxsIHRhcmdl
dGluZyBHUCBkZXZpY2VzIGJ1dCB3ZQpzaG91bGQgYWRkIGFkZGl0aW9uYWwgY29tbWl0cyB0byBk
byB0aGUgc3dpdGNoIHRvIEhTLUZTLgoKV2hhdCBhYm91dCBvdGhlciBTb0Mgb2YgdGhlIEszIGFy
Y2hpdGVjdHVyZT8KSXMgdGhlIERSQTgyOS9KNzIxZSBkZXZpY2Ugd2lsbCBhbHNvIHN3aXRjaCB0
byBIUy1GUyBieSBkZWZhdWx0PwoKRnJvbSB0aGUgdS1ib290IGszIGRvY3VtZW50YXRpb24sIGl0
J3Mgbm90IGNsZWFyIHdpdGNoIGRldmljZSB0eXBlIGlzIHVzZWQgYnkKZGVmYXVsdCBhY3Jvc3Mg
YWxsIGszIFNvQy4gQnkgZGVmYXVsdCBJIHdhcyBleHBlY3RpbmcgdGhlIEdQIHR5cGUgZm9yIGFs
bCB0aGUgazMKZmFtaWx5IChJIHdhcyB3cm9uZykuCgpbMV0KaHR0cHM6Ly9lMmUudGkuY29tL3N1
cHBvcnQvcHJvY2Vzc29ycy1ncm91cC9wcm9jZXNzb3JzL2YvcHJvY2Vzc29ycy1mb3J1bS8xMjEw
NDQzL2ZhcS1hbTYyNS1nZW5lcmF0aW5nLXNpdGFyYS1hbTYyeC1hbTYyYXgtYW02NHgtZ3AtZGV2
aWNlLWJvb3RhYmxlLW1tYy1zZC1jYXJkLWltYWdlcy11c2luZy1zZGstdjgtNi1hbmQteW9jdG8K
ClsyXQpodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9ibG9iL21hc3Rlci9k
b2MvYm9hcmQvdGkvazMucnN0P3JlZl90eXBlPWhlYWRzJnBsYWluPTEjTDEwOAoKQmVzdCByZWdh
cmRzLApSb21haW4KCj4gCj4gLS0KPiBBbmRyZWFzIERhbm5lbmJlcmcKPiBUZXhhcyBJbnN0cnVt
ZW50cyBJbmMKPiAKPiAKPj4KPj4gLS0gCj4+IEFsZXhhbmRlciBTdmVyZGxpbi4KPj4KPj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
