Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3752CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512996063D;
	Mon,  2 Sep 2024 16:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6_1OZNIln0y; Mon,  2 Sep 2024 16:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8976064C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8976064C;
	Mon,  2 Sep 2024 16:53:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8C6E1BF343
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D611580DB8
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrFNmBJW1Bua for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 657D480C68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 657D480C68
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 657D480C68
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:53:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53345dcd377so6087102e87.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 09:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725296026; x=1725900826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZ511m/24MJSGpqNMrYIqzoTN/FgF8Pftpu1OrMqTow=;
 b=qDVt3cvoIB5We1bj5G8nfKLNCmkFx53k9bn6UQFhi8B2pz9fCpb2Rmz9LJ2B+KwMqq
 aCz0u0Tm91dGaIioPIOOoPujd70VwkmYYv6QCnV/5zdTtNm4A3hscJl14efOl4j2M1ne
 oSZR1jf46URl7tF8wdxy06TT2phgsFg5khCcm6XJoZO5ubfJDHbf0X7VzdznZ4G1/mwc
 F2j4pVw569hsHtc66CFLUtCEwVj+8sJFka5Y1F4Nfy7RpCgYpzyehDzqSqLCT+R82rJj
 b2HfhcK/VNL5zRyG5XNi7KpVLmtN4WV4hSSFRiqSlvY3MGaHR/yVuoBQz7qtGIDH6T7l
 b/qw==
X-Gm-Message-State: AOJu0YxOnOQ73Rq5QNRIKRIM+F7NkwgXpGOH8ZcCBeN2Ojdn76s4BGSe
 gDQsw2hTrgJjDzclsjEvatMc531M6tG5dDUJQvV/H349sJ1nooOBty3c7XsPiZWqrC5GyQniLQ8
 boeNNEVLEFRu7RoApVFJOs74f1Tdg0drR2wUnjA==
X-Google-Smtp-Source: AGHT+IHitG2to5B7wYYrS6d92Llz0X9xq0XGTJIL6Ef+x+1eRy6Lu9mb7B3Fqn+ght6Gy7O/MRkO84YeYMGFPm76xAk=
X-Received: by 2002:a05:6512:39d4:b0:533:cf5a:eb32 with SMTP id
 2adb3069b0e04-53546b03dbemr8556236e87.19.1725296025322; Mon, 02 Sep 2024
 09:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240902074109.50173-1-michael@amarulasolutions.com>
 <ZtXqSMVTSbe12Td3@landeda>
 <CAOf5uwkEq-2vojxqxv_AF7hFw8JXfpSFY-UX7+QGwj1BhDPJ4A@mail.gmail.com>
In-Reply-To: <CAOf5uwkEq-2vojxqxv_AF7hFw8JXfpSFY-UX7+QGwj1BhDPJ4A@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 2 Sep 2024 18:53:34 +0200
Message-ID: <CAOf5uw=m4LOk97OT1dTP=2-uP6QZ1WQyHfKYSQmWCirDaxXvgQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725296026; x=1725900826;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZ511m/24MJSGpqNMrYIqzoTN/FgF8Pftpu1OrMqTow=;
 b=iVqy3mNT1yce5CvANXhEcQM81aefn/xC94ylzH8CxBfayKCuCoXTTeB1vH96sae8tU
 6atebwGLwG5IqBirrkSyhRu9JVV1cLVUpI2tK7WT+oL7RIV3dd3pORKCeJMpZP8MqS5b
 W/c2D+pJAxZVFkwVoLpHw6Y8nHU3KZGbc0vvk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iVqy3mNT
Subject: Re: [Buildroot] [PATCH 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubgoKT24gTW9uLCBTZXAgMiwgMjAyNCBhdCA2OjQz4oCvUE0gTWljaGFlbCBOYXp6YXJl
bm8gVHJpbWFyY2hpCjxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+IEhJ
IFlhbm4KPgo+IE9uIE1vbiwgU2VwIDIsIDIwMjQgYXQgNjozOeKAr1BNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+Cj4gPiBNaWNoYWVsLCBBbGwsCj4g
Pgo+ID4gT24gMjAyNC0wOS0wMiAwOTo0MSArMDIwMCwgTWljaGFlbCBUcmltYXJjaGkgc3Bha2Ug
dGh1c2x5Ogo+ID4gPiBKdXN0IGEgc2ltcGxlIGNsb25lIC0tZGVwdGggMSBzaG91bGQgYmUgZW5v
dWdoIHRvIHBhcnNlIHRoZQo+ID4gPiBjdmUgYW5kIGdlbmVyYXRlIHRoZSBwa2ctc3RhdHMgcmVw
b3J0LiBUaGUgc3BhY2Ugbm93IGRvZXMKPiA+ID4gbm90IHRha2UgaW4gYWNjb3VudCBvZiB0aGUg
ZnVsbCBoaXN0b3J5IGFuZCBvbmx5IHVzZSAyLjJHYgo+ID4KPiA+IEkganVzdCBkaWQgYm90aCBh
IGZ1bGwgY2xvbmUgYW5kIGEgZGVwdGgtMSBjbG9uZSwgYW5kIHRoZSBzaXplIGRlbHRhIGlzCj4g
PiBub3QgdGhhdCBtdWNoOiAyLjlHaUIgdnMuIDIuMkdpQiwgc28gd2UncmUgc3RpbGwgaW4gdGhl
IHNhbWUgbGVhZ3VlLgo+ID4KPiA+IFN0aWxsLCB0aGUgZG93bmxvYWQgc2l6ZSBkb2VzIGNoYW5n
ZTogZnJvbSA5ODMuNTVNaUIgZG93biB0byAyNzAuNzhNaUI7Cj4gPiB0aGUgcmVtb3RlIGhhcyB0
byBjb21wcmVzcyBvYmplY3RzIHNwZWNpZmljYWxseSBmb3IgdGhlIGRlcHRoLTEgY2xvbmUsCj4g
PiB3aGljaCB0YWtlcyBhIGJpdCBvZiB0aW1lLCBidXQgdGhlcmUgbGVzcyBkZWx0YXMgdG8gcmVz
b2x2ZSBsb2NhbGx5LCBzbwo+ID4gaXQncyBhIG5ldCB0aW1lIHdpbiB0b286IDJtMTdzIHZzIDFt
aW43cyAob24gYSAxMDBNYnBzIGxpbmspLgo+ID4KPgo+IElmIHlvdSBoYXZlIGEgZHNsIGFuZCBk
b3dubG9hZCBsaW5rIG9mIDEwTWJwcyB0aGlzIG1ha2VzIHJlYWxseSBzZW5zZQo+IGFuZCB0aGlz
IGp1c3QgdGVuZAo+IHRvIGluY3JlYXNlIGluIHNpemUuICBZb3UgMSBtaW51dGVzIGNhbiBiZSB0
ZW4gMTAgbWludXRlcyBvbiBuZXR3b3JrIGNvbmdlc3Rpb24KPgoKSSB0aGluayB0aGF0IHRoZSBy
ZWFsIHJlYXNvbiBjb3VsZCB0aGF0IHRoZSBuZXh0IHB1bGwgd2lsbCBiZQpwcm9ibGVtYXRpYy4g
WWVzLCB5b3UgY2FuIGRyb3AgdGhpcyBwYXRjaAoKQW55d2F5IHRoZSBzZWNvbmQgb25lIGRvZXMg
bm90IGRlcGVuZCBvbiBpdAoKTWljaGFlbAoKCj4gTWljaGFlbAo+Cj4gPiBJcyBpdCBldmVudHVh
bGx5IHdvcnRoIGl0PyBJIGxpa2UgdGhpbmdzIHRvIGJlIHNpbXBsZSByYXRoZXIgdGhhbiBoYXZl
Cj4gPiBjb21wbGV4IGhldXJpc3RpY3MsIGFuZCBzdG9yYWdlIG5vd2FkYXlzIGlzIGNoZWFwLCBh
bmQgYmFuZHdpZHRoIGlzIG9ubHkKPiA+IHJlYWxseSBwYWlkIG9uIHRoZSBmaXJzdCBjbG9uZSwg
c2luY2UgdGhlIGZvbGxvd2luZyBjYWxscyB3b3VsZCBvbmx5Cj4gPiBwdWxsIHdoYXQncyBtaXNz
aW5nLCB3aGljaCB3aWxsIGV2ZW50dWFsbHkgY2F1c2UgdGhlIGxvY2FsIGNsb25lIHRvIGdyb3cK
PiA+IHRvIGEgc2l6ZSB0aGF0IHdvdWxkIG5vdCBkaWZmZXIgYnkgbXVjaCBpZiB0aGUgZmlyc3Qg
Y2xvbmUgaGFkIGJlZW4gYQo+ID4gZnVsbCBvbmUuCj4gPgo+ID4gU28sIEkgJ20gYSBiaXQgY29t
bmZpY3RlZCBhYm91dCB0aGF0IG9uZSwgYnV0IHdvdWxkIHRlbmQgdG8gc2F5IG5vLi4uCj4gPiBM
ZWF2aW5nIHBlbmRpbmcgZm9yIG90aGVyIG1haW50YWluZXJzIHRvIGNoaW1lIGluLgo+ID4KPiA+
IFJlZ2FyZHMsCj4gPiBZYW5uIEUuIE1PUklOLgo+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+IC0tLQo+
ID4gPiAgc3VwcG9ydC9zY3JpcHRzL2N2ZS5weSB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEv
c3VwcG9ydC9zY3JpcHRzL2N2ZS5weSBiL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkKPiA+ID4gaW5k
ZXggZTI1ODI1NTgxZS4uN2QxMTVhMjhiNSAxMDA3NTUKPiA+ID4gLS0tIGEvc3VwcG9ydC9zY3Jp
cHRzL2N2ZS5weQo+ID4gPiArKysgYi9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5Cj4gPiA+IEBAIC04
Miw3ICs4Miw3IEBAIGNsYXNzIENWRToKPiA+ID4gICAgICAgICAgICAgICMgaGFwcGlseSBjbG9u
ZXMgaW50byBhbiBlbXB0eSBkaXJlY3RvcnkuCj4gPiA+ICAgICAgICAgICAgICBvcy5tYWtlZGly
cyhudmRfZ2l0X2RpcikKPiA+ID4gICAgICAgICAgICAgIHN1YnByb2Nlc3MuY2hlY2tfY2FsbCgK
PiA+ID4gLSAgICAgICAgICAgICAgICBbImdpdCIsICJjbG9uZSIsIE5WRF9CQVNFX1VSTCwgbnZk
X2dpdF9kaXJdLAo+ID4gPiArICAgICAgICAgICAgICAgIFsiZ2l0IiwgImNsb25lIiwgIi0tZGVw
dGgiLCAiMSIsIE5WRF9CQVNFX1VSTCwgbnZkX2dpdF9kaXJdLAo+ID4gPiAgICAgICAgICAgICAg
ICAgIHN0ZG91dD1zdWJwcm9jZXNzLkRFVk5VTEwsCj4gPiA+ICAgICAgICAgICAgICAgICAgc3Rk
ZXJyPXN1YnByb2Nlc3MuREVWTlVMTCwKPiA+ID4gICAgICAgICAgICAgICkKPiA+ID4gLS0KPiA+
ID4gMi40My4wCj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cj4gPgo+ID4gLS0KPiA+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
Cj4gPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBS
SUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+ID4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
PiA+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+
ID4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPgo+Cj4KPiAtLQo+IE1pY2hhZWwgTmF6emFyZW5v
IFRyaW1hcmNoaQo+IENvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgo+IE0uICsz
OSAzNDcgOTEzIDIxNzAKPiBtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+Cj4gQW1hcnVsYSBTb2x1dGlvbnMgQlYKPiBKb29w
IEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MCj4gVC4gKzMxICgwKTg1IDEx
MSA5MTcyCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IHd3dy5hbWFydWxhc29sdXRpb25z
LmNvbQoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBDaGll
ZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVsYXNv
bHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQW1hcnVsYSBT
b2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTApU
LiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVs
YXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
