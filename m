Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F546CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 20:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1005E83EA7;
	Mon,  1 Sep 2025 20:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z_P1msK0VZP; Mon,  1 Sep 2025 20:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3104183EA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3104183EA5;
	Mon,  1 Sep 2025 20:32:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10EBAD2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C13783EB1
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jhwoaYAnYtg for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 20:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3CF883EA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3CF883EA8
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3CF883EA8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:49 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71d71bcab6fso37784537b3.0
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 13:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756758769; x=1757363569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNkoBrrZC52hMuOlyRjtKs8+tz0q1PDeqFuNzkBR0D8=;
 b=CDpT/sbAqWGajEI4fgldAJlUrb3VG6LG4Z+lhwBj+7BadC00SipgnJYEOA9ff9Ip1o
 z57hDVlLYeNYDzlS1Ro0F+3tPIGYvRV0aXbsybIBmDGlBdwoJ71mjrQegcnZ+SWj7HMb
 bkEw6IaqiQRs0uu/qfpnElHVJiDXLSy4R9SKHZm1pTu2BbJBUdL8GEGV84SHJz/K9psM
 wMUnpqEBqnmMF5Pd1g+BPoejBQDxpHT/VdjnHS413i9CW1vbwnxI/g5RPCm9giT83edX
 cpHmeSU+MNLt+Ib/ZmB6gyYQXbdanMNzreIMTeLp2oBkXTG5rw52yFYJ3ixdI27Ovrkf
 AF5A==
X-Gm-Message-State: AOJu0Ywt4PGPB2jeWO6LVgeNAE884qcW7wkHv/UoGPdLKjAKiAKnaLOu
 I++15RaqDLq2e+WJYd+xpaTPs8ugJo18J9y6YR+EGT7ebVgdZRVQ+NfccGndXxp6+KUsAKv21hq
 9Mhq6HLx6f1DX0njv50eCVn7dQA1Cwp6Gr1UBVuw3Cw==
X-Gm-Gg: ASbGncuDRl9ojHlCkMzdUIVZ5HQf4QHL8BZU2rpB3iS5kiNgb7DeV5KoID80jjv2nEb
 9wfTXUCNd/YWtFG7mXdTfSHX5dWxCtVUY2SAIWxg+tF4WeQcu5+/QmvUTzc6rMEMUh6+9LNmdcD
 xbBBccbKl5P+07xxnY0P0M01aUr0MLIVxdWlAk6vPsY110kNOBUUJytt3ltgSvXS9sS4HMNJJOT
 F9F
X-Google-Smtp-Source: AGHT+IEt3ZLCm8b+6cml+to724TsK95+pC7vV3k+CtCrwL07aUCygWUlExBqL+l1lRlVoAqkmXQOqxc9mHsBPMAIrFA=
X-Received: by 2002:a05:690c:b17:b0:71f:ecde:87ac with SMTP id
 00721157ae682-722763cfbf8mr114166247b3.16.1756758765151; Mon, 01 Sep 2025
 13:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
 <20250814153259.6822-2-dario.binacchi@amarulasolutions.com>
 <20250815172851.77009124@windsurf>
In-Reply-To: <20250815172851.77009124@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 1 Sep 2025 22:32:34 +0200
X-Gm-Features: Ac12FXylBfzJdNSvgtsFubkZASnSVpyeZOcHY2eKhSppv6fDnTYWjpLfAgEJ2mc
Message-ID: <CABGWkvq49W6eNFm__67hxYHK4p6Ff-_hGzrd5pguYb_2M_aGXw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, 
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 linux-amarula@amarulasolutions.com, 
 "Giuseppe D'Angelo" <giuseppe.dangelo@kdab.com>, 
 Angelo Compagnucci <angelo@amarulasolutions.com>,
 Richard GENOUD <richard.genoud@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756758769; x=1757363569;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNkoBrrZC52hMuOlyRjtKs8+tz0q1PDeqFuNzkBR0D8=;
 b=Eb2vjHVs4WZgwYRqEnz8rqj3UboAj73CPlkWPvKafdI+G48OroW7SK0bUfwvko/F/Y
 sW8xY/niBt632YzlrGlswLfVPgDFYGWRfiB23TWw1v8QrqASb858NpguNg+aLSIQlTdS
 jKJ40VUVSFcAU9KvkYRWwlDmHkbcSazeocoOY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Eb2vjHVs
Subject: Re: [Buildroot] [RFC v3 1/5] package/qt6: Add qmake functionality
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

SGVsbG8gVGhvbWFzLAoKT24gRnJpLCBBdWcgMTUsIDIwMjUgYXQgNToyOOKAr1BNIFRob21hcyBQ
ZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8g
RGFyaW8sCj4KPiBUaGFua3MgZm9yIGJyaW5naW5nIHRoaXMgZnVydGhlci4gVGhpcyByZWFsbHkg
c2VlbXMgbGlrZSBhIGNvcHkvcGFzdGUKPiBvZiB0aGUgUXQ1IGxvZ2ljLCB3aXRoIGV2ZW4gc29t
ZSBwYXJ0cyB0aGF0IGFyZSBkZWFkIGNvZGUgKHNlZSBiZWxvdykuCj4gSG93IG11Y2ggaGF2ZSB5
b3UgdmFsaWRhdGVkIHRoYXQgZXZlcnl0aGluZyBhZGRlZCBieSB0aGlzIHBhdGNoIGlzCj4gYWN0
dWFsbHkgKm5lZWRlZCosIGFzIG9wcG9zZWQgdG8ganVzdCBibGluZGx5IGNvcHkvcGFzdGVkIGZy
b20gdGhlIFF0NQo+IGxvZ2ljPwo+Cj4gQWxzbywgaW4gdGhlIGNvbW1pdCBsb2c6Cj4KPiA+IGZs
YWdzL2Nyb3NzLWNvbXBpbGVyIHRoZSBiaWdnZXN0IGRpZmZlcmVuY2UgaXMgdGhhdCB3aGVyZSBw
cmV2aW91c2x5Cj4gPiBxdC5jb25mIHdhcyB1c2VkIHRvIGZpeHVwIHBlci1wYXRocyBidWlsZHMs
IHRoaXMgaXMgbm93IGFsd2F5cwo+ID4gY3JlYXRlZCB3aXRoIGNoYW5nZWQgY29udGVudHMgc28g
cW1ha2UgbG9va3MgYXQgdGhlIGNvcnJlY3QgdGFyZ2V0Cj4gPiBkaXJlY3Rvcmllcy4KCkkgdGhp
bmsgdGhlIGNvbW1pdCBtZXNzYWdlIHJlZmVycyB0byBIb3N0RGF0YT0uLi90YXJnZXQvdXNyIGlu
IHF0LmNvbmYuaW4sCndoaWNoIEkgbGF0ZXIgZml4ZWQgdG8gSG9zdERhdGE9QEBTVEFHSU5HX0RJ
UkBAL3Vzci4KU28gaW4gdjQgSSB3aWxsIHJlbW92ZSB0aGF0IGNvbW1lbnQgZnJvbSB0aGUgY29t
bWl0IG1lc3NhZ2UuCgo+Cj4gSSdtIGEgYml0IGNvbmZ1c2VkIGJ5IHdoYXQgdGhpcyBtZWFucy4g
SXMgdGhpcyBhYm91dAo+IFFUNl9JTlNUQUxMX1FUX0NPTkYgYmVpbmcgY2FsbGVkIG5vdCBvbmx5
IGJ5IFFUNl9RVF9DT05GX0ZJWFVQIGluIHRoZQo+IEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklF
Uz15IGNhc2UgYnV0IGFsc28gYmVpbmcgY2FsbGVkIGJ5Ogo+Cj4gUVQ2QkFTRV9QT1NUX0lOU1RB
TExfU1RBR0lOR19IT09LUyArPSBRVDZfSU5TVEFMTF9RVF9DT05GCj4KPiAgPwoKU2luY2UgUVQ2
X1FUX0NPTkZfRklYVVAsIHVubGlrZSBRVDVfUVRfQ09ORl9GSVhVUCwgaXMgbm90IGNhbGxlZCwK
SSB3aWxsIHJlbW92ZSBpdCBpbiB2NC4KCj4KPiBJZiBzbywgd2h5IGRvZXMgdGhpcyBoYXMgdG8g
YmUgZGlmZmVyZW50Pwo+Cj4gT24gVGh1LCAxNCBBdWcgMjAyNSAxNzozMjo1NSArMDIwMAo+IERh
cmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6
Cj4KPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ2L3F0NmJhc2UvcXQ2YmFzZS5tayBiL3Bh
Y2thZ2UvcXQ2L3F0NmJhc2UvcXQ2YmFzZS5tawo+ID4gaW5kZXggNTFhNGYxYjViZTdmLi42OTdk
MWE5NmE5MjAgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3F0Ni9xdDZiYXNlL3F0NmJhc2UubWsK
PiA+ICsrKyBiL3BhY2thZ2UvcXQ2L3F0NmJhc2UvcXQ2YmFzZS5tawo+ID4gQEAgLTU1LDYgKzU1
LDkgQEAgUVQ2QkFTRV9DT05GX09QVFMgPSBcCj4gPiAgICAgICAtREZFQVRVUkVfc3lzdGVtX3ps
aWI9T04gXAo+ID4gICAgICAgLURGRUFUVVJFX3N5c3RlbV9saWJiMj1PTgo+ID4KPiA+ICtRVDZC
QVNFX0NGTEFHUyA9ICQoVEFSR0VUX0NGTEFHUykKPiA+ICtRVDZCQVNFX0NYWEZMQUdTID0gJChU
QVJHRVRfQ1hYRkxBR1MpCj4KPiBUaGVzZSB2YXJpYWJsZXMgYXJlIG5vdCAiY2hhbmdlZCIgYW55
d2hlcmUsIHNvIHlvdSBjb3VsZCBkaXJlY3RseSB1c2UKPiBUQVJHRVRfQ0ZMQUdTL1RBUkdFVF9D
WFhGTEFHUy4gVW5sZXNzIHRoZSBnb2FsIGlzIHRvIGtlZXAgdGhlIGxvZ2ljIGFzCj4gc2ltaWxh
ciBhcyBxdDUgYXMgcG9zc2libGUuCgpJbiB0aGlzIGNhc2UsIEkgd291bGQgcHJlZmVyIHRvIGtl
ZXAgdXNpbmcgUVQ2QkFTRV9DRkxBR1MgYW5kIFFUNkJBU0VfQ1hYRkxBR1MsCnRvIGtlZXAgdGhl
IGxvZ2ljIGFzIGNsb3NlIGFzIHBvc3NpYmxlIHRvIHRoYXQgb2YgUVQ1IGFuZCBpbiBjYXNlIHRo
ZXkKbWlnaHQgYmUgbW9kaWZpZWQKZWxzZXdoZXJlIGluIHRoZSBmdXR1cmUuIEkgd291bGQga2Vl
cCB0aGVtIGluIHY0LCBidXQgSSBoYXZlIG5vCnByb2JsZW0gcmVtb3ZpbmcgdGhlbQppbiBhIHBv
c3NpYmxlIHY1IGlmIHlvdSB0aGluayBpdOKAmXMgYXBwcm9wcmlhdGUuCgo+Cj4gPiArCj4gPiAg
IyB4ODYgb3B0aW1pemF0aW9uIG9wdGlvbnMuIFdoaWxlIHdlIGhhdmUgYSBCUjJfWDg2X0NQVV9I
QVNfQVZYNTEyLCBpdAo+ID4gICMgaXMgbm90IGNsZWFyIHlldCBob3cgaXQgbWFwcyB0byBhbGwg
dGhlIGF2eDUxMiogb3B0aW9ucyBvZiBRdCwgc28gd2UKPiA+ICAjIGZvciBub3cga2VlcHMgdGhl
bSBkaXNhYmxlZC4KPiA+IEBAIC00MzEsNSArNDM0LDIwIEBAIGRlZmluZSBRVDZCQVNFX1JNX1VT
Ul9NS1NQRUNTCj4gPiAgZW5kZWYKPiA+ICBRVDZCQVNFX1RBUkdFVF9GSU5BTElaRV9IT09LUyAr
PSBRVDZCQVNFX1JNX1VTUl9NS1NQRUNTCj4gPgo+ID4gK2RlZmluZSBRVDZCQVNFX01BS0VfQlJf
U1BFQwo+ID4gKyAgICAgbWtkaXIgLXAgJChARCkvbWtzcGVjcy9kZXZpY2VzL2xpbnV4LWJ1aWxk
cm9vdC1nKysvCj4gPiArICAgICBzZWQgJ3MvQEVHTEZTX0RFVklDRUAvJChRVDZCQVNFX0VHTEZT
X0RFVklDRSkvZycgXAo+ID4gKyAgICAgICAgICAgICAkKFFUNkJBU0VfUEtHRElSKS9xbWFrZS5j
b25mLmluID4gXAo+ID4gKyAgICAgICAgICAgICAkKEBEKS9ta3NwZWNzL2RldmljZXMvbGludXgt
YnVpbGRyb290LWcrKy9xbWFrZS5jb25mCj4KPiAkKFFUNkJBU0VfRUdMRlNfREVWSUNFKSBkb2Vz
bid0IHNlZW0gdG8gYmUgZGVmaW5lZCBhbnl3aGVyZSwgc28gSSBoYXZlCj4gc29tZSBkb3VidHMg
dGhhdCB0aGlzIGlzIGRvaW5nIHNvbWV0aGluZyB1c2VmdWwuCj4KPiBUaGlzIGFsc28gbWVhbnMg
dGhlIEBFR0xGU19ERVZJQ0VAIGluIHFtYWtlLmNvbmYuaW4gaXMgbm90IHJlbGV2YW50LgoKSSB3
aWxsIGRyb3AgaW4gdjQKCj4KPiA+ICsgICAgICQoSU5TVEFMTCkgLW0gMDY0NCAtRCAkKFFUNkJB
U0VfUEtHRElSKS9xcGxhdGZvcm1kZWZzLmggXAo+ID4gKyAgICAgICAgICAgICAkKEBEKS9ta3Nw
ZWNzL2RldmljZXMvbGludXgtYnVpbGRyb290LWcrKy9xcGxhdGZvcm1kZWZzLmgKPiA+ICtlbmRl
Zgo+ID4gKwo+ID4gK1FUNkJBU0VfQ09ORl9PUFRTICs9IC1EUVRfUU1BS0VfREVWSUNFX09QVElP
TlM9Q1JPU1NfQ09NUElMRT0iJChUQVJHRVRfQ1JPU1MpIjtCUl9DT01QSUxFUl9DRkxBR1M9IiQo
UVQ2QkFTRV9DRkxBR1MpIjtCUl9DT01QSUxFUl9DWFhGTEFHUz0iJChRVDZCQVNFX0NYWF9GTEFH
UykiCj4KPiBXaGF0IGlzIHRoaXMgZG9pbmc/IERvZXMgaXQgYWN0dWFsbHkgd29yaz8gSSdtIGFz
a2luZyBiZWNhdXNlIHRoYXQKPiBkb2Vzbid0IHNlZW0gdG8gZXhpc3QgaW4gdGhlIFF0NSBjYXNl
LgoKWWVzLCB0aGVzZSBzZXR0aW5ncyBhcmUgdXNlZCBieSBwYWNrYWdlL3F0Ni9xdDZiYXNlL3Ft
YWtlLmNvbmYsIGFuZCBpZgpJIHJlbW92ZSB0aGVtCkkgZ2V0IHRoZSBmb2xsb3dpbmcgY29tcGls
YXRpb24gZXJyb3Igd2hlbiBidWlsZGluZyBxd3QgKGFuZCBhbHNvIGN1dGVrZXlib2FyZCk6Cgov
aG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3QtcXQ2L2J1aWxkcm9vdC1xdDYvb3V0cHV0L2hv
c3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC91c3IvaW5jbHVkZS9nbnUv
c3R1YnMuaDo3OjExOgpmYXRhbCBlcnJvcjogZ251L3N0dWJzLXNvZnQuaDogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQogICAgNyB8ICMgaW5jbHVkZSA8Z251L3N0dWJzLXNvZnQuaD4KICAgICAg
fCAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+CmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCgpB
bmQsIGlmIEnigJltIG5vdCBtaXN0YWtlbiwgdGhlIHNhbWUgYXBwcm9hY2ggaXMgYWxzbyBhZG9w
dGVkIGZvciBxdDU6CgokIGdpdCBncmVwIEJSX0NPTVBJTEVSX0NGTEFHUyBwYWNrYWdlL3F0NQpw
YWNrYWdlL3F0NS9xdDViYXNlL3FtYWtlLmNvbmYuaW46UU1BS0VfQ0ZMQUdTICAgICAgICAgICAr
PQokJHtCUl9DT01QSUxFUl9DRkxBR1N9CnBhY2thZ2UvcXQ1L3F0NWJhc2UvcXQ1YmFzZS5tazog
ICAgICAgICAtZGV2aWNlLW9wdGlvbgpCUl9DT01QSUxFUl9DRkxBR1M9IiQoUVQ1QkFTRV9DRkxB
R1MpIiBcCgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFz
Cj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczov
L2Jvb3RsaW4uY29tCgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51
eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEg
TGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQz
IDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
