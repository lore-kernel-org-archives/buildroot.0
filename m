Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E57C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 22:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD2B61151;
	Wed, 16 Jul 2025 22:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0PGm3vbSeLB; Wed, 16 Jul 2025 22:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE1661513
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE1661513;
	Wed, 16 Jul 2025 22:01:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52C471514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 22:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3867483EBB
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 22:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 510kxhfZJqT2 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 22:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 014C183EB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 014C183EB9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 014C183EB9
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 22:01:56 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so2966075e9.1
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 15:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752703315; x=1753308115;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwOOe35Ir5lVrSV0kQHOIT6m065M9oRgLj7dvARaQM8=;
 b=tKSaKwSvgMw9LApM7KXUGu+aaqKG52OSKdgCcAo2cgW5xyExobgh2PQIVbL+KxMkbZ
 PGIHxqtWbfSyzAhsFHDyVTVlw4EeILbIgtBkBLavKPJMzEXSp4l0RlNEVPQPOtvkSNzW
 DoLriz10MSHcDutMYmaII7KzhGYEz3JpOaA0DkJcsLKjGULpviAtHeyNclvipddeqM8m
 BEMCSux34f2u0dO7hKvSVErA3XZDZxSeoXqc9Ip1j7Ee97ZrjWZPmtK++7oBNQ6glTCP
 68Pp8xOuIo9anKXC9aK+1QcIIOEIAo/QaapXCzIBYacg/w9Wo3nsttPD489FMHNPyYCW
 cCVg==
X-Gm-Message-State: AOJu0Yy5ZScueKyD0SLi6CUe/tSTjR/dr1XnP9P5O1Rm3EQ5F8Fk5NRz
 BR8Jb+waji1tfKjnx/tkZOCFXK5JxId9k0VxQ1FK/AXo7zaU289GxTza1KrK9A==
X-Gm-Gg: ASbGncsLb8B5DI3kzKa/3Eo2rGU1o9LegbxtnmE2K8yi35zUh20FpcHuFv34kMkXMVB
 dCPMkM2gb/yTSgg54A1hNQpaufiETBD8ZcR1OEfctDmAEZ1jP9MqraKdAJeiwNtnzJy7sn19Xpg
 jXaSPkr6RXBNDLG4vDRYd9CsNkEyqSVYH1ZcRahFRv7M8EgPffwCBYOrYBYGOQFJToVizQGr9Y3
 31Vl97B6JpvQnw+Kx/+871XBLhACsUaAG+4VipP1VNE5Eruj0StCQd5vIFK4J/iq6FbU/oMktiX
 0MDdLFmT8P/jarE2FPolVBuitWwZeim/AL8IGwDqK31NbABNsRUovqCCHC/5wqovmrNoXxw+Aa6
 hG+CkJHfYwOxPD0YGC8sa7QaySjt8LigvqHijaw==
X-Google-Smtp-Source: AGHT+IEg5+2UBL8ZgJlem84G9M+TGSgn53d4e5gBS6VCjR/Tp9zO4VHwMlOAKxpb+rWR8dJL7EemuQ==
X-Received: by 2002:a05:600c:6304:b0:456:11cc:360d with SMTP id
 5b1f17b1804b1-45630f704fdmr31873655e9.9.1752703314568; 
 Wed, 16 Jul 2025 15:01:54 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45634f5d964sm4066855e9.12.2025.07.16.15.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 15:01:54 -0700 (PDT)
Date: Thu, 17 Jul 2025 00:01:52 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20250716220152.GA125918@pevik>
References: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
 <8c5d92c3-172b-405e-8711-1b561c7ae7b1@grenoble.cnrs.fr>
 <20250716203906.GA9246@pevik>
 <25430fea-b185-436e-8f88-b53f4fe04673@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25430fea-b185-436e-8f88-b53f4fe04673@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752703315; x=1753308115; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwOOe35Ir5lVrSV0kQHOIT6m065M9oRgLj7dvARaQM8=;
 b=QmxVfm+ZfUkhiphkY2PAq8yJ2SNLwWqN2Rt6jqO6mt+OfSjXrXJmSMDWhVUDARHO6E
 aG8CuE/49WwG4RaApSqMNueWi0ahYimVpuv86oJQLwf8ekeQhtwz6DQpjaNMnVBgRBlf
 4pGH7z+qgdzk7sMWSorGk32KmRjrZBtLndRDlZ+3nEf9jim7qA26GAcnk6eKAq/eU5Jb
 IwWjbZmiPaHyOPMG1sEjFMAuZ1d33D91rhA5FloVdjgry25Ff42ii6V7LrVJNvGiIMTV
 KwvBOOf/NZ0C6J0Dbf65Z9OtIUA2ELTXt88oBWwHWEdX9h1fs5zBSqGV18vIO4b8S3xa
 JDmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QmxVfm+Z
Subject: Re: [Buildroot] [PATCH v2 1/4] support/kconfig/patches: make all
 patches quilt-friendly
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBPbiAxNi8wNy8yMDI1IDIyOjM5LCBQZXRyIFZvcmVsIHdyb3RlOgo+ID4gSGkgRWRnYXIsCgo+
ID4+IEFjY29yZGluZyB0byBzdXBwb3J0L2tjb25maWcvUkVBRE1FLmJ1aWxkcm9vdCwgdGhlIHBh
dGNoZXMgaW4KPiA+PiBzdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8gYXJlIG1lYW50IHRvIGJlIGFw
cGxpZWQgYnkgcXVpbHQuIEhvd2V2ZXIsIHR3bwo+ID4+IG9mIHRob3NlIHBhdGNoZXMgYXJlIGlu
IGdpdCBmb3JtYXQsIHdoaWNoIG1ha2VzIHF1aWx0IGVycm9yIG91dCB3aXRoOgoKPiA+PiAgICAg
QXBwbHlpbmcgcGF0Y2ggcGF0Y2hlcy8yMi1rY29uZmlnLWx4ZGlhbG9nLWZpeC1jaGVjay13aXRo
LUdDQzE0LnBhdGNoCj4gPj4gICAgIGNhbid0IGZpbmQgZmlsZSB0byBwYXRjaCBhdCBpbnB1dCBs
aW5lIDMyCj4gPj4gICAgIFsuLi5dCj4gPj4gICAgIE5vIGZpbGUgdG8gcGF0Y2guICBTa2lwcGlu
ZyBwYXRjaC4KCj4gPj4gRml4IHRoZSBmb3JtYXQgdG8gbWFrZSBxdWlsdCBoYXBweS4KCj4gPiBI
b3cgYWJvdXQgdXNpbmcgJ2dpdCBxdWlsdGltcG9ydCcgaW5zdGVhZD8KCj4gSSBkaWRuJ3Qga25v
dyBhYm91dCDigJxnaXQgcXVpbHRpbXBvcnTigJ0uIEkgZ3Vlc3MKPiBzdXBwb3J0L2tjb25maWcv
UkVBRE1FLmJ1aWxkcm9vdCBjb3VsZCBiZSByZXdyaXR0ZW4gdG8gdXNlIGl0LCBhbHRob3VnaAo+
IHRoZSBmYWN0IHRoYXQg4oCcZ2l0IHF1aWx0aW1wb3J04oCdIGNyZWF0ZXMgY29tbWl0cyBtYXkg
c29tZXdoYXQgY29tcGxpY2F0ZQo+IHRoZSBwcm9jZWR1cmUgZGVzY3JpYmVkIHRoZXJlLgoKT0ss
IGFsdGhvdWdoIEkgcmVncmV0IGxvb3NpbmcgbWV0YWRhdGEsIEknbSBub3QgYWdhaW5zdCB1c2lu
ZyBxdWlsdCBmb3JtYXQuCgpJIGhhdmUgbmV2ZXIgdXNlZCBxdWlsdCB0byB1cGRhdGUsIHRoZXJl
Zm9yZSBJIGhhdmVuJ3QgZXhwZXJpZW5jZWQgcHJvYmxlbXMgd2l0aAphIHBhdGNoIGZvcm1hdC4g
SWYgc3VwcG9ydC9rY29uZmlnL1JFQURNRS5idWlsZHJvb3QgaXMgc3RpbGwgdXAgdG8gZGF0ZSBh
bmQgdGhpcwpwYXRjaCBpcyB1cGRhdGVkIGl0J2QgYmUgZ29vZCB0byB1cGRhdGUgc3VwcG9ydC9r
Y29uZmlnL1JFQURNRS5idWlsZHJvb3QgdG8KbWVudGlvbiBob3cgdG8gY3JlYXRlIHF1aWx0IGNv
bXBhdGlibGUgcGF0Y2hlcy4gSSBzdXBwb3NlIGl0J3Mgc29tZXRoaW5nIGxpa2U6CgpnaXQgZm9y
bWF0LXBhdGNoIC0tbm8tc2lnbmF0dXJlIC0tbm8tc3RhdCAtLXN1YmplY3QtcHJlZml4PSIiIC4u
LgoKS2luZCByZWdhcmRzLApQZXRyCgo+IFJlZ2FyZHMsCgo+IEVkZ2FyLgoKPiA+IEtpbmQgcmVn
YXJkcywKPiA+IFBldHIKCj4gPj4gU2lnbmVkLW9mZi1ieTogRWRnYXIgQm9uZXQgPGJvbmV0QGdy
ZW5vYmxlLmNucnMuZnI+Cj4gPj4gLS0tCj4gPj4gIC4uLmNvbmZpZy1seGRpYWxvZy1maXgtY2hl
Y2std2l0aC1HQ0MxNC5wYXRjaCB8IDExICsrKy0tLS0KPiA+PiAgLi4ub25maWctbW4tY29uZi1o
YW5kbGUtYmFja3NwYWNlLUgta2V5LnBhdGNoIHwgMzEgKysrKysrKysrLS0tLS0tLS0tLQo+ID4+
ICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKPiA+
PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjIta2NvbmZpZy1seGRpYWxv
Zy1maXgtY2hlY2std2l0aC1HQ0MxNC5wYXRjaCBiL3N1cHBvcnQva2NvbmZpZy9wYXRjaGVzLzIy
LWtjb25maWctbHhkaWFsb2ctZml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2gKPiA+PiBpbmRleCA0
MTA4MWJiNDVkLi5lZGNjODU3MTkwIDEwMDY0NAo+ID4+IC0tLSBhL3N1cHBvcnQva2NvbmZpZy9w
YXRjaGVzLzIyLWtjb25maWctbHhkaWFsb2ctZml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2gKPiA+
PiArKysgYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMi1rY29uZmlnLWx4ZGlhbG9nLWZpeC1j
aGVjay13aXRoLUdDQzE0LnBhdGNoCj4gPj4gQEAgLTI1LDEwICsyNSwxMCBAQCBUZXN0ZWQtYnk6
IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgo+ID4+ICAga2NvbmZpZy9seGRpYWxv
Zy9jaGVjay1seGRpYWxvZy5zaCB8IDIgKy0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKPiA+PiAtZGlmZiAtLWdpdCBhL2tjb25maWcvbHhkaWFs
b2cvY2hlY2stbHhkaWFsb2cuc2ggYi9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNo
Cj4gPj4gLWluZGV4IDE2Y2Q5YTMxODYuLjI3ZDZjMzBhNTcgMTAwNzU1Cj4gPj4gLS0tLSBhL2tj
b25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKPiA+PiAtKysrIGIva2NvbmZpZy9seGRp
YWxvZy9jaGVjay1seGRpYWxvZy5zaAo+ID4+ICtJbmRleDoga2NvbmZpZy5uZXcvbHhkaWFsb2cv
Y2hlY2stbHhkaWFsb2cuc2gKPiA+PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4+ICstLS0ga2NvbmZpZy5vcmln
L2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoCj4gPj4gKysrKyBrY29uZmlnL2x4ZGlhbG9nL2No
ZWNrLWx4ZGlhbG9nLnNoCj4gPj4gIEBAIC00OCw3ICs0OCw3IEBAIHRyYXAgInJtIC1mICR0bXAi
IDAgMSAyIDMgMTUKPiA+PiAgIGNoZWNrKCkgewo+ID4+ICAgICAgICAgICAkY2MgLXggYyAtIC1v
ICR0bXAgMj4vZGV2L251bGwgPDwnRU9GJwo+ID4+IEBAIC0zOCw2ICszOCwzIEBAIGluZGV4IDE2
Y2Q5YTMxODYuLjI3ZDZjMzBhNTcgMTAwNzU1Cj4gPj4gICBFT0YKPiA+PiAgIAlpZiBbICQ/ICE9
IDAgXTsgdGhlbgo+ID4+ICAgCSAgICBlY2hvICIgKioqIFVuYWJsZSB0byBmaW5kIHRoZSBuY3Vy
c2VzIGxpYnJhcmllcyBvciB0aGUiICAgICAgIDE+JjIKPiA+PiAtLS0gCj4gPj4gLTIuNDQuMAo+
ID4+IC0KPiA+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjMta2NvbmZp
Zy1tbi1jb25mLWhhbmRsZS1iYWNrc3BhY2UtSC1rZXkucGF0Y2ggYi9zdXBwb3J0L2tjb25maWcv
cGF0Y2hlcy8yMy1rY29uZmlnLW1uLWNvbmYtaGFuZGxlLWJhY2tzcGFjZS1ILWtleS5wYXRjaAo+
ID4+IGluZGV4IDZlMzIxMTVmNzAuLmY3MmY5ZjMzOWIgMTAwNjQ0Cj4gPj4gLS0tIGEvc3VwcG9y
dC9rY29uZmlnL3BhdGNoZXMvMjMta2NvbmZpZy1tbi1jb25mLWhhbmRsZS1iYWNrc3BhY2UtSC1r
ZXkucGF0Y2gKPiA+PiArKysgYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMy1rY29uZmlnLW1u
LWNvbmYtaGFuZGxlLWJhY2tzcGFjZS1ILWtleS5wYXRjaAo+ID4+IEBAIC0xNiwxMSArMTYsMTEg
QEAgU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9u
ZXh0LmNvbT4KPiA+PiAgIGtjb25maWcvbmNvbmYuZ3VpLmMgICAgICAgICB8IDMgKystCj4gPj4g
ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCj4gPj4g
LWRpZmYgLS1naXQgYS9rY29uZmlnL2x4ZGlhbG9nL2lucHV0Ym94LmMgYi9rY29uZmlnL2x4ZGlh
bG9nL2lucHV0Ym94LmMKPiA+PiAtaW5kZXggNjExOTQ1NjExYmY4Li4xZGNmYjI4OGVlNjMgMTAw
NjQ0Cj4gPj4gLS0tLSBhL2tjb25maWcvbHhkaWFsb2cvaW5wdXRib3guYwo+ID4+IC0rKysgYi9r
Y29uZmlnL2x4ZGlhbG9nL2lucHV0Ym94LmMKPiA+PiAtQEAgLTExMyw3ICsxMTMsOCBAQCBpbnQg
ZGlhbG9nX2lucHV0Ym94KGNvbnN0IGNoYXIgKnRpdGxlLCBjb25zdCBjaGFyICpwcm9tcHQsIGlu
dCBoZWlnaHQsIGludCB3aWR0aAo+ID4+ICtJbmRleDoga2NvbmZpZy9seGRpYWxvZy9pbnB1dGJv
eC5jCj4gPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KPiA+PiArLS0tIGtjb25maWcub3JpZy9seGRpYWxvZy9pbnB1
dGJveC5jCj4gPj4gKysrKyBrY29uZmlnL2x4ZGlhbG9nL2lucHV0Ym94LmMKPiA+PiArQEAgLTEy
Niw3ICsxMjYsOCBAQCBpbnQgZGlhbG9nX2lucHV0Ym94KGNvbnN0IGNoYXIgKnRpdGxlLCBjb25z
dCBjaGFyICpwcm9tcHQsIGludCBoZWlnaHQsIGludCB3aWR0aAo+ID4+ICAgCQkJY2FzZSBLRVlf
RE9XTjoKPiA+PiAgIAkJCQlicmVhazsKPiA+PiAgIAkJCWNhc2UgS0VZX0JBQ0tTUEFDRToKPiA+
PiBAQCAtMzAsMTAgKzMwLDEwIEBAIGluZGV4IDYxMTk0NTYxMWJmOC4uMWRjZmIyODhlZTYzIDEw
MDY0NAo+ID4+ICAgCQkJCWlmIChwb3MpIHsKPiA+PiAgIAkJCQkJd2F0dHJzZXQoZGlhbG9nLCBk
bGcuaW5wdXRib3guYXRyKTsKPiA+PiAgIAkJCQkJaWYgKGlucHV0X3ggPT0gMCkgewo+ID4+IC1k
aWZmIC0tZ2l0IGEva2NvbmZpZy9uY29uZi5jIGIva2NvbmZpZy9uY29uZi5jCj4gPj4gLWluZGV4
IGE0NjcwZjRlODI1YS4uYWM5MmMwZGVkNmM1IDEwMDY0NAo+ID4+IC0tLS0gYS9rY29uZmlnL25j
b25mLmMKPiA+PiAtKysrIGIva2NvbmZpZy9uY29uZi5jCj4gPj4gK0luZGV4OiBrY29uZmlnL25j
b25mLmMKPiA+PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+ID4+ICstLS0ga2NvbmZpZy5vcmlnL25jb25mLmMKPiA+
PiArKysrIGtjb25maWcvbmNvbmYuYwo+ID4+ICBAQCAtMTA0OCw3ICsxMDQ4LDcgQEAgc3RhdGlj
IGludCBkb19tYXRjaChpbnQga2V5LCBzdHJ1Y3QgbWF0Y2hfc3RhdGUgKnN0YXRlLCBpbnQgKmFu
cykKPiA+PiAgIAkJc3RhdGUtPm1hdGNoX2RpcmVjdGlvbiA9IEZJTkRfTkVYVF9NQVRDSF9VUDsK
PiA+PiAgIAkJKmFucyA9IGdldF9tZXh0X21hdGNoKHN0YXRlLT5wYXR0ZXJuLAo+ID4+IEBAIC00
MywxMSArNDMsMTEgQEAgaW5kZXggYTQ2NzBmNGU4MjVhLi5hYzkyYzBkZWQ2YzUgMTAwNjQ0Cj4g
Pj4gICAJCXN0YXRlLT5wYXR0ZXJuW3N0cmxlbihzdGF0ZS0+cGF0dGVybiktMV0gPSAnXDAnOwo+
ID4+ICAgCQlhZGpfbWF0Y2hfZGlyKCZzdGF0ZS0+bWF0Y2hfZGlyZWN0aW9uKTsKPiA+PiAgIAl9
IGVsc2UKPiA+PiAtZGlmZiAtLWdpdCBhL2tjb25maWcvbmNvbmYuZ3VpLmMgYi9rY29uZmlnL25j
b25mLmd1aS5jCj4gPj4gLWluZGV4IDdiZTYyMGExZmNkYi4uNzdmNTI1YTg2MTdjIDEwMDY0NAo+
ID4+IC0tLS0gYS9rY29uZmlnL25jb25mLmd1aS5jCj4gPj4gLSsrKyBiL2tjb25maWcvbmNvbmYu
Z3VpLmMKPiA+PiAtQEAgLTQzOSw3ICs0MzksOCBAQCBpbnQgZGlhbG9nX2lucHV0Ym94KFdJTkRP
VyAqbWFpbl93aW5kb3csCj4gPj4gK0luZGV4OiBrY29uZmlnL25jb25mLmd1aS5jCj4gPj4gKz09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KPiA+PiArLS0tIGtjb25maWcub3JpZy9uY29uZi5ndWkuYwo+ID4+ICsrKysga2Nv
bmZpZy9uY29uZi5ndWkuYwo+ID4+ICtAQCAtNDQwLDcgKzQ0MCw4IEBAIGludCBkaWFsb2dfaW5w
dXRib3goV0lORE9XICptYWluX3dpbmRvdywKPiA+PiAgIAkJY2FzZSBLRVlfRihGX0VYSVQpOgo+
ID4+ICAgCQljYXNlIEtFWV9GKEZfQkFDSyk6Cj4gPj4gICAJCQlicmVhazsKPiA+PiBAQCAtNTcs
NiArNTcsMyBAQCBpbmRleCA3YmU2MjBhMWZjZGIuLjc3ZjUyNWE4NjE3YyAxMDA2NDQKPiA+PiAg
IAkJY2FzZSBLRVlfQkFDS1NQQUNFOgo+ID4+ICAgCQkJaWYgKGN1cnNvcl9wb3NpdGlvbiA+IDAp
IHsKPiA+PiAgIAkJCQltZW1tb3ZlKCZyZXN1bHRbY3Vyc29yX3Bvc2l0aW9uLTFdLAo+ID4+IC0t
LSAKPiA+PiAtMi40OC4xCj4gPj4gLQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
