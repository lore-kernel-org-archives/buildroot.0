Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27651C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 16:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9374840BB3;
	Thu, 22 Aug 2024 16:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WQuG6ghRtb4; Thu, 22 Aug 2024 16:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284AF40B36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284AF40B36;
	Thu, 22 Aug 2024 16:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0999B1BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 16:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E67C481B8A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 16:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqzIR9s5QTII for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 16:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85EFE81992
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85EFE81992
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85EFE81992
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 16:58:50 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a86984e035aso78911566b.2
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 09:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724345928; x=1724950728;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwlvTiUdBX6ShTSgxf+Kmhav/EJl5n3Wjj1p/cGDWRs=;
 b=cyVfmNmwwL8T7l2u+Ls2iWlfzCwaEFzc4Wp42Vn+3+k0Z75caTZUiGpF1giIepVML7
 +NyOeVhpd2XW96ok7zRlX9GNJjRav5o4izZq6ErlCD36eHMgywYvxtUY4i07ZulCgH9I
 9FG5lSwhaoDEdPQBQPBDwNbH2wdE3wfZjkfemjiWAsSRCUUuD17Ebe0MIEWigWRxxljC
 vXeFuqZ2IX8UU62vMCHQ2of9HKGihL4/gnxykN+ow4vyYmKYRL12ucmTXOZrW0B4COAb
 +vNSiINKaIOiP00Dv34zcqVc4SDyX2tJoQSiktRGKc3RQRF0beY1M9+ToGvlbXxnN78k
 0D5g==
X-Gm-Message-State: AOJu0YyrJzeyOg7vjVHN9nsOcM7Cc64ajN/iUbc8Om7g4HoZmR7GeSmw
 57k80VJAukCDZzk+0QpO4By1s5YOBuIY9ebXUEuYo3EPVVHjDu8xiPQ+E2Q3+2R/MABg3uBFXDr
 f
X-Google-Smtp-Source: AGHT+IHHWwrljpPtAC3PH5HzyvBwzFmLnnHqbn/n04WjUKLAmhboC+9TuYwyMrecRDtAYVkX96/9pg==
X-Received: by 2002:a17:907:940e:b0:a7a:8378:625e with SMTP id
 a640c23a62f3a-a866f2f9d1dmr427143466b.26.1724345927529; 
 Thu, 22 Aug 2024 09:58:47 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f29004csm143194266b.46.2024.08.22.09.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 09:58:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 213145F8D5;
 Thu, 22 Aug 2024 17:58:46 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <Zsdfx5CUXg8ARG75@landeda> (Yann E. MORIN's message of "Thu, 22
 Aug 2024 17:56:55 +0200")
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
 <20240822130220.4135741-5-alex.bennee@linaro.org>
 <Zsdfx5CUXg8ARG75@landeda>
Date: Thu, 22 Aug 2024 17:58:46 +0100
Message-ID: <871q2gmr3t.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724345928; x=1724950728; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwlvTiUdBX6ShTSgxf+Kmhav/EJl5n3Wjj1p/cGDWRs=;
 b=ORYYidH7INZVVTz/gbwUVOblhd2rhhoLWwgADhx35VrE+nHiaXp1h5gwGyVtpWPcFv
 4zs0BfmtoutkFwqlJzQE9GbRKePSBbazRZxpf7+r0omXAr5PfpC3rrhS7sLJY3XWd9g+
 xkZXjXnzAad0RJ5i/FqXug7HsoDEeAP35K7OengtDjr8vEtrphNZEkB/14V96JNzgL2G
 qF/ngIndp7wYtHnAPgWkMaXltPcWAtwykqVbnM+etm/GZfm/qvDrFpd5jhug/54P8s9l
 oaETLA77FeXB4zHNlGadqrvSaxCUypczx+tZaRnRUn/XmU2+SP1KlCPUf9LXlySIOarP
 OAZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ORYYidH7
Subject: Re: [Buildroot] [PATCH 4/4] package/mesa3d: bump to 24.2.0
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Illhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JpdGVzOgoKPiBBbGV4
LCBBbGwsCj4KPiBPbiAyMDI0LTA4LTIyIDE0OjAyICswMTAwLCBBbGV4IEJlbm7DqWUgc3Bha2Ug
dGh1c2x5Ogo+PiBXaGlsZSBWaXJ0SU8gVmVudXMgc3VwcG9ydCB3ZW50IGluIGVhcmxpZXIgdGhp
cyBpcyB0aGUgZmlyc3QgdmVyc2lvbgo+PiB0aGF0IGlzIGtub3duIHRvIHdvcmsgd2VsbC4KPgo+
IFRoaXMgY29tbWl0IGxvZyBpcyBjb25mdXNpbmc6IGl0IHRhbGtzIGFib3V0IFZpcnRJTyBWZW51
cywgYnV0IHRoZXJlIGlzCj4gbm8gc3VjaCBhZGRpdGlvbiBpbiB0aGUgcGF0Y2guCgpTdXBwb3J0
IGZvciBWaXJ0SU8gdmVudXMgd2FzIGFkZGVkIGluIHBhdGNoIDEvNCBidXQgdGVzdGluZyBoYXMg
c2hvd24gaXQKbmVlZHMgYXQgbGVhc3QgMjQuMi4wIHRvIHdvcmsgcHJvcGVybHkuCgo+IEl0IGhv
d2V2ZXIgYWRkcyBhIGRlcGVuZGVuY3kgb24KPiBob3N0LXB5dGhvbi1weXlhbWwsIGJ1dCB0aGF0
IGlzIG5vdCBleHBsYWluZWQsIGFuZCBkb2VzIG5vdCBzZWVtCj4gcmVsYXRlZAoKSXQgd2FzIGEg
ZGVwZW5kZW5jeSBJIG5lZWRlZCB0byBhZGQgdG8gc3VwcG9ydCB0aGUgYnVpbGQuCgo+IHRvIFZp
cnRJTyBWZW51cyBlaXRoZXIuLi4KPgo+IENvdWxkIHlvdSBjbGFyaWZ5LCBwbGVhc2U/Cj4KPiBB
bHNvLCBzZWUgYmVsb3cuLi4KPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+Cj4+IC0tLQo+PiAgcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNh
M2QtaGVhZGVycy5tayB8IDIgKy0KPj4gIHBhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoICAgICAg
ICAgICAgICAgfCA1ICsrLS0tCj4+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgICAgICAgICAg
ICAgICAgIHwgMyArKy0KPj4gIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVz
YTNkLWhlYWRlcnMubWsgYi9wYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1r
Cj4+IGluZGV4IDMzYzYwYjI4NWYuLjk4YWZiNzdhOWMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uv
bWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsKPj4gKysrIGIvcGFja2FnZS9tZXNhM2Qt
aGVhZGVycy9tZXNhM2QtaGVhZGVycy5tawo+PiBAQCAtMTIsNyArMTIsNyBAQCBlbmRpZgo+PiAg
Cj4+ICAjIE5vdCBwb3NzaWJsZSB0byBkaXJlY3RseSByZWZlciB0byBtZXNhM2QgdmFyaWFibGVz
LCBiZWNhdXNlIG9mCj4+ICAjIGZpcnN0L3NlY29uZCBleHBhbnNpb24gdHJpY2tlcnkuLi4KPj4g
LU1FU0EzRF9IRUFERVJTX1ZFUlNJT04gPSAyNC4wLjkKPj4gK01FU0EzRF9IRUFERVJTX1ZFUlNJ
T04gPSAyNC4yLjAKPj4gIE1FU0EzRF9IRUFERVJTX1NPVVJDRSA9IG1lc2EtJChNRVNBM0RfSEVB
REVSU19WRVJTSU9OKS50YXIueHoKPj4gIE1FU0EzRF9IRUFERVJTX1NJVEUgPSBodHRwczovL2Fy
Y2hpdmUubWVzYTNkLm9yZwo+PiAgTUVTQTNEX0hFQURFUlNfRExfU1VCRElSID0gbWVzYTNkCj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCBiL3BhY2thZ2UvbWVzYTNk
L21lc2EzZC5oYXNoCj4+IGluZGV4IGQ1MDZkMzk4YjguLjFmZjExZjliZDggMTAwNjQ0Cj4+IC0t
LSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21l
c2EzZC5oYXNoCj4+IEBAIC0xLDUgKzEsNCBAQAo+PiAtIyBGcm9tIGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1KdW5lLzAwMDc2NC5odG1s
Cj4+IC1zaGEyNTYgIDUxYWE2ODZjYTQwNjBlMzg3MTFhOWU4ZjYwYzhmMWVmYWE1MTZiYWY0MTE5
NDZlZDdmMmMyNjVjZDU4MmNhNGMgIG1lc2EtMjQuMC45LnRhci54ego+PiAtc2hhNTEyICBkZTJl
ZTZjOWRmMWZjMTA2ZWUxMGJlZmUwYTc2YmUxZTljZmU4M2Q2NWRiZGI4M2JhZDZkOGQ3Y2ZhYTA4
NTIzMmZiMTE1MjkzYTFhNzkwYjM3YjUwYjFmZTE0YmQ1OGFhZmJjZmU1YTE1ZTk1M2I1OTAxYTcx
MDVkNTc1NjlhNSAgbWVzYS0yNC4wLjkudGFyLnh6Cj4+ICsjIEZyb20gaHR0cHM6Ly9kb2NzLm1l
c2EzZC5vcmcvcmVsbm90ZXMvMjQuMi4wLmh0bWwKPj4gK3NoYTI1NiAgYzAyYmI3MmNlYTI5MGY3
OGIxMTg5NWEwYzk1YzdjOTIzOTRmMTgwZDdmZjY2ZDRhNzYyZWM2OTUwYTU4YWRkZiAgbWVzYS0y
NC4yLjAudGFyLnh6Cj4KPiBUaGVyZSBwcmV2aW91c2x5IHdhcyBzaGEyNTYgX2FuZF8gc2hhNTEy
IGhhc2hlcywgYnV0IG5vdyB5b3Ugb25seSBhZGQgYQo+IHNoYTI1NiBvbmUuIENhbiB5b3UgZXh0
ZW5kIGEgbGl0dGxlIGJsdXJiIGFib3V0IHRoYXQsIHBsZWFzZT8KClN1cmUgLSBvbmx5IHRoZSBz
aGEyNTYgd2FzIGluIHRoZSByZWxhc2UgYW5ub3VuY2VtZW50LiBJIGNvdWxkIGNhbGN1bGF0ZQpv
bmUgaWYgeW91IHdhbnQ/Cgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4+ICAjIExp
Y2Vuc2UKPj4gIHNoYTI1NiAgYTAwMjc1YTUzMTc4ZTI2NDVmYjY1YmU5OWE3ODVjMTEwNTEzNDQ2
YTUwNzFmZjJjNjk4ZWQyNjBhZDkxN2Q3NSAgZG9jcy9saWNlbnNlLnJzdAo+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4+
IGluZGV4IGQzYjUwMTA2NDguLjI5ZjI2YzU2NjMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5tawo+PiArKysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPj4gQEAgLTUs
NyArNSw3IEBACj4+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiAgCj4+ICAjIFdoZW4gdXBk
YXRpbmcgdGhlIHZlcnNpb24sIHBsZWFzZSBhbHNvIHVwZGF0ZSBtZXNhM2QtaGVhZGVycwo+PiAt
TUVTQTNEX1ZFUlNJT04gPSAyNC4wLjkKPj4gK01FU0EzRF9WRVJTSU9OID0gMjQuMi4wCj4+ICBN
RVNBM0RfU09VUkNFID0gbWVzYS0kKE1FU0EzRF9WRVJTSU9OKS50YXIueHoKPj4gIE1FU0EzRF9T
SVRFID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcKPj4gIE1FU0EzRF9MSUNFTlNFID0gTUlU
LCBTR0ksIEtocm9ub3MKPj4gQEAgLTIxLDYgKzIxLDcgQEAgTUVTQTNEX0RFUEVOREVOQ0lFUyA9
IFwKPj4gIAlob3N0LWJpc29uIFwKPj4gIAlob3N0LWZsZXggXAo+PiAgCWhvc3QtcHl0aG9uLW1h
a28gXAo+PiArCWhvc3QtcHl0aG9uLXB5eWFtbCBcCj4+ICAJZXhwYXQgXAo+PiAgCWxpYmRybSBc
Cj4+ICAJemxpYgo+PiAtLSAKPj4gMi4zOS4yCj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBU
ZWNoIExlYWQgQCBMaW5hcm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
