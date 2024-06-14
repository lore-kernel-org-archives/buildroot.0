Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DA1C27C77
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 18:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C486F401EF;
	Fri, 14 Jun 2024 18:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z25JwptiGqLx; Fri, 14 Jun 2024 18:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A80B40213
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A80B40213;
	Fri, 14 Jun 2024 18:03:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEFAD1BF32D
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 18:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCF47607A1
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 18:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EtYiBUJMOVY for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 18:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 405A860687
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 405A860687
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 405A860687
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 18:03:29 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-797f222c9f9so140989985a.3
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 11:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718388208; x=1718993008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cZCeREHBpDrG2L3MB9Nhi95kbiuXxCDu8YjNRdWt/ZU=;
 b=Kv3bqaXHtwhRhn5ssSMI2mUsYTcbCW/H6qJj1mO2TF83BbZCDOVlgOaJcxuayhnylj
 3eVdnp6SA021RcFgOBG9WERN8Zjwi0rggf3Jk+domDPBL5TBXCNKvMOF5RAbbRUPU0zq
 K98+rex0HCdxkQ4As9e5ePwWcN63eGrMxzd15LAZ4EErQ2o4vbIoQDyIHSVXBuXotFdC
 qv92IIY8uTE0AyAk3PH9B62ABPy2qjrM9DdXug2LYjPduatiZ2XBcV0WiwORYvbqW0+8
 9APGFhGQk+VdJTs3xyEyZCZiT5lgz5E9wrsewdnpOgekJstJ13h8JCNxsas9IcOU47NG
 W12w==
X-Gm-Message-State: AOJu0Yy4QXZAeHiLEcOddXdC04cZE1Sku3G803e7463o12M94402hmWz
 d/izr46dqSvL7i+sYE0LcLGMno73aRQyW1TNnyJ0baO+ppjd0AJLNCzvOYJ8KSX5KbpXk4Zoanl
 SEfCRUlKirfSB5gU5LzYkcvALIjqlCQ==
X-Google-Smtp-Source: AGHT+IFRVyIJ/ynn+K7Slz43HGuYnHZEyBd24+huAz+dS+yljZAUszO37nkpoOj3ROswViKtiGbukqNCmcZNmLJQfXY=
X-Received: by 2002:ac8:7d4a:0:b0:440:f03b:7990 with SMTP id
 d75a77b69052e-44216859978mr36645981cf.5.1718388207848; Fri, 14 Jun 2024
 11:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <cea1e19d0c970055e04dbdbcfd7f1c74d2f4d694.1718382114.git.yann.morin.1998@free.fr>
 <Zmx-y2XW4ygziuh0@landeda>
In-Reply-To: <Zmx-y2XW4ygziuh0@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 14 Jun 2024 12:03:16 -0600
Message-ID: <CADvTj4q7pj+omVnVUgyA1OPX5+wvY9v18qi=8VVJ61SuUFQ+ow@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718388208; x=1718993008; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cZCeREHBpDrG2L3MB9Nhi95kbiuXxCDu8YjNRdWt/ZU=;
 b=irb2H3ecETcMz5m/yO8jtjIdYOS30MNSFfLSqRlCRKdY2oK+egAWDEAJP50mAt8nAM
 /YUnw84U6lz2KRKEfgahAusXBsmgyiRBsatpU/k37mswP66WVXK53FJhT+uvZAeNK7VA
 usUkyb2OrAQtbqGh+/damSoM9u30OYNAc83tWBPjrqrqh5U6rDGhWa5rw6yfgWQmXVRI
 9Rd1z9Ee2sGlWE489wTMhsOP2i8wcnxH2fkDkqGcL2IkoIKAPwqW3uvwKmqrJ7y6IELg
 W5e0LiYxt7/NJkFsG+3u0DGiviKWrNwq6YUhnjmxhmis3U6oQHEwq9qtTRjpNb8L+zLs
 USEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=irb2H3ec
Subject: Re: [Buildroot] [PATCH 5/6] package/python-pydantic-core: bump for
 fixes with python 3.12
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

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgMTE6MzPigK9BTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1v
cmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBBbGwsCj4KPiBPbiAyMDI0LTA2LTE0IDE4OjIx
ICswMjAwLCBZYW5uIEUuIE1PUklOIHNwYWtlIHRodXNseToKPiA+IFRoZSBwYWNrYWdlIGlzIG5v
dCB5ZXQgYXZhaWxhYmxlIG9uIFB5UEksIHNvIGdvIGZldGNoIGl0IGF0IHRoZSBzb3VyY2UuCj4K
PiBXZWxsLCBhdCBsZWFzdCBpdCB3YXMgbm8gdHdoZW4gSSBuZWVkZWQgdG8gd3JpdGUgdGhlIHBh
dGNoLgo+Cj4gQW5kIGV2ZW4gdGhvdWdoIGl0IG5vdyBpcyBvbiBQeVBJLCBJIGFtIHN0aWxsIG9m
IHRoZSBvcGluaW9uIHRoYXQsIHdoZW4KPiB0aGUgb2ZmaWNpYWwgdXBzdHJlYW0gcmVwbyBpcyB1
c2FibGUgYXMtaXMsIGl0IGlzIGJldHRlciB0byB1c2UgdGhlCj4gc291cmNlcyBmcm9tIHRoZXJl
IHRoYW4gZnJvbSB0aGUgcGFja2FnZSBvbiBQeVBJLCBmb3Igd2hpY2ggd2UgaGF2ZSBubwo+IHdh
eSB0byBrbm93IGhvdyBpdCBoYXMgYmVlbiBnZW5lcmF0ZWQuIFdlIHNob3VsZCBvbmx5IHJlbHkg
b24gZmV0Y2hpbmcKPiBmcm9tIFB5UEkgdGhvcyBwYWNrYWdlcyBmb3Igd2hpY2ggdGhlIHVwc3Ry
ZWFtIHNvdXJjZXMgYXJlIG5vdCBlbm91Z2gKPiAoZS5nLiBuZWVkcyBoZWF2eSB0b29saW5nIHRo
YXQgd2UgbGFjaykuCgpJJ20gbm90IHN1cmUgd2h5IGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gcHJl
ZmVyIGdpdCBzb3VyY2VzIGZvciBQeVBpCnBhY2thZ2VzIHdoZW4gd2UgcHJlZmVyIHJlbGVhc2Ug
dGFyYmFsbHMgZm9yIG5vbi1QeVBpIHBhY2thZ2VzIGFzClB5UGkgc2Rpc3QgdGFyYmFsbHMgYXJl
IGVmZmVjdGl2ZWx5IHJlbGVhc2UgdGFyYmFsbHMuCgpPbmUgYWR2YW50YWdlIHRvIHVzaW5nIFB5
UGkgcmVsZWFzZXMgaXMgeW91IGF2b2lkIGlzc3VlcyB3aXRoIGhhc2gncwpjaGFuZ2luZyBkdWUu
Cgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5u
IEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiA+IC0tLQo+ID4gIHBhY2thZ2Uv
cHl0aG9uLXB5ZGFudGljLWNvcmUvcHl0aG9uLXB5ZGFudGljLWNvcmUuaGFzaCB8IDIgKy0KPiA+
ICBwYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1jb3JlL3B5dGhvbi1weWRhbnRpYy1jb3JlLm1rICAg
fCA3ICsrKy0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcHlkYW50aWMtY29y
ZS9weXRob24tcHlkYW50aWMtY29yZS5oYXNoIGIvcGFja2FnZS9weXRob24tcHlkYW50aWMtY29y
ZS9weXRob24tcHlkYW50aWMtY29yZS5oYXNoCj4gPiBpbmRleCBiNWQ5NzVjYjNiLi5kMTFiM2Jm
YmI0IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9weXRob24tcHlkYW50aWMtY29yZS9weXRob24t
cHlkYW50aWMtY29yZS5oYXNoCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1jb3Jl
L3B5dGhvbi1weWRhbnRpYy1jb3JlLmhhc2gKPiA+IEBAIC0xLDQgKzEsNCBAQAo+ID4gICMgTG9j
YWxseSBjYWxjdWxhdGVkIGFmdGVyIHZlbmRvcmluZwo+ID4gLXNoYTI1NiAgMjNmNWUxMDg3MmQ5
YzNkNDllYmMxZmNiZDMxNzYxMmViNjNkNjVhN2FmZDg4ZGJlZjhkMjNjYjYzZDgzMGNiNCAgcHl0
aG9uLXB5ZGFudGljLWNvcmUtMi4xNC42LWNhcmdvMi50YXIuZ3oKPiA+ICtzaGEyNTYgIDMzNTli
NDM3Y2E3NGM4ZjdlMWI4ZWM0NzdiMWZmMWUzOWYwZmZmMDhhYmIwZWIxNzE5NTNmOWJjM2U4Nzcz
YzYgIHB5dGhvbi1weWRhbnRpYy1jb3JlLXYyLjE5LjAtZ2l0NC1jYXJnbzIudGFyLmd6Cj4gPiAg
IyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiA+ICBzaGEyNTYgIDJhZmRkMzBk
NTRiNGQ2MmI2ZjQ4OGE2YmNjMTU0NmU4NGVjNTA2MWYxM2Y0MjA5YzAzZDAxMjM0ODc4Mzc5NWEg
IExJQ0VOU0UKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1jb3JlL3B5
dGhvbi1weWRhbnRpYy1jb3JlLm1rIGIvcGFja2FnZS9weXRob24tcHlkYW50aWMtY29yZS9weXRo
b24tcHlkYW50aWMtY29yZS5tawo+ID4gaW5kZXggMzgxMjhlYmU0Ni4uNzlkMDZkZWFiMiAxMDA2
NDQKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5ZGFudGljLWNvcmUvcHl0aG9uLXB5ZGFudGlj
LWNvcmUubWsKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXB5ZGFudGljLWNvcmUvcHl0aG9uLXB5
ZGFudGljLWNvcmUubWsKPiA+IEBAIC00LDEwICs0LDkgQEAKPiA+ICAjCj4gPiAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiA+Cj4gPiAtUFlUSE9OX1BZREFOVElDX0NPUkVfVkVSU0lPTiA9IDIu
MTQuNgo+ID4gLVBZVEhPTl9QWURBTlRJQ19DT1JFX1NPVVJDRV9QWVBJID0gcHlkYW50aWNfY29y
ZS0kKFBZVEhPTl9QWURBTlRJQ19DT1JFX1ZFUlNJT04pLnRhci5nego+ID4gLVBZVEhPTl9QWURB
TlRJQ19DT1JFX1NJVEVfUFlQSSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy9iMi83ZC84MzA0ZDg0NzFjZmU0Mjg4Zjk1YTMwNjVlYmRhNTZmOTc5MGQwODdlZGMzNTZh
ZDViZDgzYzg5ZTJkNzkKPiA+IC1QWVRIT05fUFlEQU5USUNfQ09SRV9TSVRFID0gJChQWVRIT05f
UFlEQU5USUNfQ09SRV9TSVRFX1BZUEkpLyQoUFlUSE9OX1BZREFOVElDX0NPUkVfU09VUkNFX1BZ
UEkpP2J1aWxkcm9vdC1wYXRoPWZpbGVuYW1lCj4gPiArUFlUSE9OX1BZREFOVElDX0NPUkVfVkVS
U0lPTiA9IHYyLjE5LjAKPiA+ICtQWVRIT05fUFlEQU5USUNfQ09SRV9TSVRFID0gaHR0cHM6Ly9n
aXRodWIuY29tL3B5ZGFudGljL3B5ZGFudGljLWNvcmUKPiA+ICtQWVRIT05fUFlEQU5USUNfQ09S
RV9TSVRFX01FVEhPRCA9IGdpdAo+ID4gIFBZVEhPTl9QWURBTlRJQ19DT1JFX1NFVFVQX1RZUEUg
PSBtYXR1cmluCj4gPiAgUFlUSE9OX1BZREFOVElDX0NPUkVfTElDRU5TRSA9IE1JVAo+ID4gIFBZ
VEhPTl9QWURBTlRJQ19DT1JFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiAtLQo+ID4gMi40
NS4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
PiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
