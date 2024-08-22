Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1673C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 19:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 486B881422;
	Thu, 22 Aug 2024 19:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENoHwQSudnlI; Thu, 22 Aug 2024 19:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70AE881CA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70AE881CA0;
	Thu, 22 Aug 2024 19:41:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8012C1BF334
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 19:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D33060E34
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 19:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAHX2Upmya4L for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 19:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3B6460E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B6460E0A
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3B6460E0A
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 19:41:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a2b4so2025290a12.0
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 12:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724355696; x=1724960496;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMSBRMR3qDJX3lQJJuHym9OHpwrZU1kUPhhmmxVC35c=;
 b=I7rM5Xw+v70zuGK7qEAfNPDIm4toRueAyBdriPOlXR4nANQvAjTWKB4XaOx7YaCkNx
 my/isUYRamO+n272QZ+1u+ONh+gw4e8g98Z+239PcpF92BNsuK0Dgz1WwrvKqO8cWImq
 ZqTrLto/8CPL3WCRAENf9t3pVjXJub0jeChvO2VkA5R8VqDhpc6HDSTuAmMjbKOLMAt9
 h91fWNmEyN35APXXuSH1F9RaCJU3RAhfZ3iWykaNQMgFl7IwQMpQgIR2sVDvJxdcjHFM
 C4CzLFlrwAG/x0zzrMDOBLib9Cxj+/TEDuNPh/3Ug6xt1frKA9npE0nRKdb9mbSr8V5y
 bjNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbaNbLIWPFtyxhRhnuE2dv9yYeBSUanqb+uN+204PF/+VVvs/bQBZcpcPK7CUJ4WF2xCbm4965ohA=@buildroot.org
X-Gm-Message-State: AOJu0YxeNivmLAqOt/WL7DUV6G6iRH5E+X62amwrFKJh/MJgYYdj7Cfq
 ThFTp0ucRhE7ttVJF6f4dj0l8td5rT1Zg8UyMwoH4ro/AEcTULkoVPwjp1GgpvfFa6G45J7b29B
 X
X-Google-Smtp-Source: AGHT+IHh4B8EV8uaHzRdiVFOT1mCxEcHkZi1Vzb2GOz3mT1vwKV90vf2Lz8cIw12goBq6ERZF2bZ9g==
X-Received: by 2002:a05:6402:3484:b0:5bf:1974:2ba5 with SMTP id
 4fb4d7f45d1cf-5bf2c0697a7mr4383914a12.19.1724355695602; 
 Thu, 22 Aug 2024 12:41:35 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c4377sm1292614a12.74.2024.08.22.12.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 12:41:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2B8985F8D5;
 Thu, 22 Aug 2024 20:41:34 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <Zsd0Z2v3PVmsqeJI@landeda> (Yann E. MORIN's message of "Thu, 22
 Aug 2024 19:24:55 +0200")
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
 <20240822130220.4135741-5-alex.bennee@linaro.org>
 <Zsdfx5CUXg8ARG75@landeda> <871q2gmr3t.fsf@draig.linaro.org>
 <Zsd0Z2v3PVmsqeJI@landeda>
Date: Thu, 22 Aug 2024 20:41:34 +0100
Message-ID: <87seuwl501.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724355696; x=1724960496; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CMSBRMR3qDJX3lQJJuHym9OHpwrZU1kUPhhmmxVC35c=;
 b=GQC6ksrS5Xz4Q2UjMws/NtM+DeR70hgXU1EAW4Gh7+VWDX0zqN70KehIsgcT3w29CM
 vkE3werWzTU6xRwx0t8VaulPv2FQjiKpeLs04Quff+RQP0X94+ngagx2mW2awgfiPqdG
 sKWbfUsrxbe3Bx6mr9akRvgFNbKXYXUZje5ZuFXrNmgzeKqrymtXpWtzqap6StdTK+uz
 H8Mt1ZY+CjwhG8FlKz/iJ1Ypwl2/dq7LCwgQtczDBuvkV6+owPPb7IL1K6GDQqlD2oKL
 MYZXXJI9HJMieBDgkGmhOq79dyO/K3FzW9NiUV18pEYF82rYgYedhb6whF2+oEhPsopx
 ZZHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GQC6ksrS
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
LCBBbGwsCj4KPiBPbiAyMDI0LTA4LTIyIDE3OjU4ICswMTAwLCBBbGV4IEJlbm7DqWUgc3Bha2Ug
dGh1c2x5Ogo+PiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cml0
ZXM6Cj4+ID4gT24gMjAyNC0wOC0yMiAxNDowMiArMDEwMCwgQWxleCBCZW5uw6llIHNwYWtlIHRo
dXNseToKPj4gPj4gV2hpbGUgVmlydElPIFZlbnVzIHN1cHBvcnQgd2VudCBpbiBlYXJsaWVyIHRo
aXMgaXMgdGhlIGZpcnN0IHZlcnNpb24KPj4gPj4gdGhhdCBpcyBrbm93biB0byB3b3JrIHdlbGwu
Cj4+ID4gVGhpcyBjb21taXQgbG9nIGlzIGNvbmZ1c2luZzogaXQgdGFsa3MgYWJvdXQgVmlydElP
IFZlbnVzLCBidXQgdGhlcmUgaXMKPj4gPiBubyBzdWNoIGFkZGl0aW9uIGluIHRoZSBwYXRjaC4K
Pj4gU3VwcG9ydCBmb3IgVmlydElPIHZlbnVzIHdhcyBhZGRlZCBpbiBwYXRjaCAxLzQgYnV0IHRl
c3RpbmcgaGFzIHNob3duIGl0Cj4+IG5lZWRzIGF0IGxlYXN0IDI0LjIuMCB0byB3b3JrIHByb3Bl
cmx5Lgo+Cj4gT0ssIHRoYW5rcywgSSBzZWUuCj4KPiBTbywgaWYgaXQgbmVlZHMgMjQuMi4wLCBv
bmx5IGFkZCBpdCBhZnRlciB0aGUgYnVtcCB0byAyNC4yLjA7IHRoZXJlIGlzCj4gbm8gcG9pbnQg
aW4gYWRkaW5nIGFuIG9wdGlvbiBmb3IgYSBmZWF0dXJlIHRoYXQgaXMga25vd24gYnJva2VuIGlu
Cj4gMjQuMC45Lgo+Cj4gQWxzbywgcGF0Y2ggMSBkb2VzIG5vdCBtZW50aW9uIFZlbnVzIGF0IGFs
bDsgaXQgbWVudGlvbnMgVmlydElPIFZ1bGthbiwKPiBhbmQgZXhjZXB0IGZvciBoYXZpbmcgdGhl
IHNhbWUgZmlyc3QgbGV0dGVyLCB0aGUgY29ubmVjdGlvbiBpcyBub3QKPiBvYnZpb3VzLgo+Cj4g
U28sIGNvdWxkIHlvdSByZXdvcmsgdGhlIHNlcmllcyBpbiBhIG1vcmUgbG9naWNhbCBvcmRlciwg
cG9zc2libHkKPiBzb21ldGhpbmcgbGlrZToKPgo+ICAgKiAxLzMgcGFja2FnZS92a21hcms6IGFk
ZCB2bWthcmsgYmVuY2htYXJraW5nIHRvb2wKPiAgICogMi8zIHBhY2thZ2UvbWVzYTNkOiBidW1w
IHRvIDI0LjIuMAo+ICAgKiAzLzMgcGFja2FnZS9tZXNhM2Q6IGFkZCBvcHRpb24gdG8gZW5hYmxl
IFZJUlRJTyB2dWxrYW4gZHJpdmVyCj4KPiBBbHNvLCBJIHN1c3BlY3QgdGhlIGZvbGxvd2luZyBw
YXRjaCBkb2VzIG5vdCBiZWxvbmcgdG8gdGhlIHNlcmllczsgSQo+IGRvbid0IHNlZSBob3cgaXQg
aXMgcmVsYXRlZCB0byBtZXNhM2Qgb3IgdGhlIGJ1bXAgdGhlcmVvZjoKPgo+ICAgKiBib2FyZC9x
ZW11OiBhZGQgcG9zdC1idWlsZCBzY3JpcHQgdG8gYWFyY2g2NF92aXJ0X2RlZmNvbmZpZwoKWW91
IG5lZWQgdG8gYmUgbG9nZ2VkIGludG8gYSBmcmFtZWJ1ZmZlciBjb25zb2xlIHRvIHN0YXJ0IHdl
c3RvbiB0byBiZQphYmxlIHRvIHRlc3QgdGhlIHZpcnRpby12dWxrYW4gR1BVLgoKPgo+IFJlZ2Fy
ZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+PiA+IEl0IGhvd2V2ZXIgYWRkcyBhIGRlcGVuZGVuY3kg
b24KPj4gPiBob3N0LXB5dGhvbi1weXlhbWwsIGJ1dCB0aGF0IGlzIG5vdCBleHBsYWluZWQsIGFu
ZCBkb2VzIG5vdCBzZWVtCj4+ID4gcmVsYXRlZAo+PiAKPj4gSXQgd2FzIGEgZGVwZW5kZW5jeSBJ
IG5lZWRlZCB0byBhZGQgdG8gc3VwcG9ydCB0aGUgYnVpbGQuCj4+IAo+PiA+IHRvIFZpcnRJTyBW
ZW51cyBlaXRoZXIuLi4KPj4gPgo+PiA+IENvdWxkIHlvdSBjbGFyaWZ5LCBwbGVhc2U/Cj4+ID4K
Pj4gPiBBbHNvLCBzZWUgYmVsb3cuLi4KPj4gPgo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJl
bm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4+ID4+IC0tLQo+PiA+PiAgcGFja2FnZS9t
ZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5tayB8IDIgKy0KPj4gPj4gIHBhY2thZ2UvbWVz
YTNkL21lc2EzZC5oYXNoICAgICAgICAgICAgICAgfCA1ICsrLS0tCj4+ID4+ICBwYWNrYWdlL21l
c2EzZC9tZXNhM2QubWsgICAgICAgICAgICAgICAgIHwgMyArKy0KPj4gPj4gIDMgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+PiA+PiAKPj4gPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsgYi9wYWNrYWdl
L21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCj4+ID4+IGluZGV4IDMzYzYwYjI4NWYu
Ljk4YWZiNzdhOWMgMTAwNjQ0Cj4+ID4+IC0tLSBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVz
YTNkLWhlYWRlcnMubWsKPj4gPj4gKysrIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2Qt
aGVhZGVycy5tawo+PiA+PiBAQCAtMTIsNyArMTIsNyBAQCBlbmRpZgo+PiA+PiAgCj4+ID4+ICAj
IE5vdCBwb3NzaWJsZSB0byBkaXJlY3RseSByZWZlciB0byBtZXNhM2QgdmFyaWFibGVzLCBiZWNh
dXNlIG9mCj4+ID4+ICAjIGZpcnN0L3NlY29uZCBleHBhbnNpb24gdHJpY2tlcnkuLi4KPj4gPj4g
LU1FU0EzRF9IRUFERVJTX1ZFUlNJT04gPSAyNC4wLjkKPj4gPj4gK01FU0EzRF9IRUFERVJTX1ZF
UlNJT04gPSAyNC4yLjAKPj4gPj4gIE1FU0EzRF9IRUFERVJTX1NPVVJDRSA9IG1lc2EtJChNRVNB
M0RfSEVBREVSU19WRVJTSU9OKS50YXIueHoKPj4gPj4gIE1FU0EzRF9IRUFERVJTX1NJVEUgPSBo
dHRwczovL2FyY2hpdmUubWVzYTNkLm9yZwo+PiA+PiAgTUVTQTNEX0hFQURFUlNfRExfU1VCRElS
ID0gbWVzYTNkCj4+ID4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCBi
L3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCj4+ID4+IGluZGV4IGQ1MDZkMzk4YjguLjFmZjEx
ZjliZDggMTAwNjQ0Cj4+ID4+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCj4+ID4+
ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCj4+ID4+IEBAIC0xLDUgKzEsNCBAQAo+
PiA+PiAtIyBGcm9tIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2Et
YW5ub3VuY2UvMjAyNC1KdW5lLzAwMDc2NC5odG1sCj4+ID4+IC1zaGEyNTYgIDUxYWE2ODZjYTQw
NjBlMzg3MTFhOWU4ZjYwYzhmMWVmYWE1MTZiYWY0MTE5NDZlZDdmMmMyNjVjZDU4MmNhNGMgIG1l
c2EtMjQuMC45LnRhci54ego+PiA+PiAtc2hhNTEyICBkZTJlZTZjOWRmMWZjMTA2ZWUxMGJlZmUw
YTc2YmUxZTljZmU4M2Q2NWRiZGI4M2JhZDZkOGQ3Y2ZhYTA4NTIzMmZiMTE1MjkzYTFhNzkwYjM3
YjUwYjFmZTE0YmQ1OGFhZmJjZmU1YTE1ZTk1M2I1OTAxYTcxMDVkNTc1NjlhNSAgbWVzYS0yNC4w
LjkudGFyLnh6Cj4+ID4+ICsjIEZyb20gaHR0cHM6Ly9kb2NzLm1lc2EzZC5vcmcvcmVsbm90ZXMv
MjQuMi4wLmh0bWwKPj4gPj4gK3NoYTI1NiAgYzAyYmI3MmNlYTI5MGY3OGIxMTg5NWEwYzk1Yzdj
OTIzOTRmMTgwZDdmZjY2ZDRhNzYyZWM2OTUwYTU4YWRkZiAgbWVzYS0yNC4yLjAudGFyLnh6Cj4+
ID4KPj4gPiBUaGVyZSBwcmV2aW91c2x5IHdhcyBzaGEyNTYgX2FuZF8gc2hhNTEyIGhhc2hlcywg
YnV0IG5vdyB5b3Ugb25seSBhZGQgYQo+PiA+IHNoYTI1NiBvbmUuIENhbiB5b3UgZXh0ZW5kIGEg
bGl0dGxlIGJsdXJiIGFib3V0IHRoYXQsIHBsZWFzZT8KPj4gCj4+IFN1cmUgLSBvbmx5IHRoZSBz
aGEyNTYgd2FzIGluIHRoZSByZWxhc2UgYW5ub3VuY2VtZW50LiBJIGNvdWxkIGNhbGN1bGF0ZQo+
PiBvbmUgaWYgeW91IHdhbnQ/Cj4+IAo+PiA+Cj4+ID4gUmVnYXJkcywKPj4gPiBZYW5uIEUuIE1P
UklOLgo+PiA+Cj4+ID4+ICAjIExpY2Vuc2UKPj4gPj4gIHNoYTI1NiAgYTAwMjc1YTUzMTc4ZTI2
NDVmYjY1YmU5OWE3ODVjMTEwNTEzNDQ2YTUwNzFmZjJjNjk4ZWQyNjBhZDkxN2Q3NSAgZG9jcy9s
aWNlbnNlLnJzdAo+PiA+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIv
cGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4+ID4+IGluZGV4IGQzYjUwMTA2NDguLjI5ZjI2YzU2
NjMgMTAwNjQ0Cj4+ID4+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+PiA+PiArKysg
Yi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPj4gPj4gQEAgLTUsNyArNSw3IEBACj4+ID4+ICAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiA+PiAgCj4+ID4+ICAjIFdoZW4gdXBkYXRpbmcgdGhl
IHZlcnNpb24sIHBsZWFzZSBhbHNvIHVwZGF0ZSBtZXNhM2QtaGVhZGVycwo+PiA+PiAtTUVTQTNE
X1ZFUlNJT04gPSAyNC4wLjkKPj4gPj4gK01FU0EzRF9WRVJTSU9OID0gMjQuMi4wCj4+ID4+ICBN
RVNBM0RfU09VUkNFID0gbWVzYS0kKE1FU0EzRF9WRVJTSU9OKS50YXIueHoKPj4gPj4gIE1FU0Ez
RF9TSVRFID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcKPj4gPj4gIE1FU0EzRF9MSUNFTlNF
ID0gTUlULCBTR0ksIEtocm9ub3MKPj4gPj4gQEAgLTIxLDYgKzIxLDcgQEAgTUVTQTNEX0RFUEVO
REVOQ0lFUyA9IFwKPj4gPj4gIAlob3N0LWJpc29uIFwKPj4gPj4gIAlob3N0LWZsZXggXAo+PiA+
PiAgCWhvc3QtcHl0aG9uLW1ha28gXAo+PiA+PiArCWhvc3QtcHl0aG9uLXB5eWFtbCBcCj4+ID4+
ICAJZXhwYXQgXAo+PiA+PiAgCWxpYmRybSBcCj4+ID4+ICAJemxpYgo+PiA+PiAtLSAKPj4gPj4g
Mi4zOS4yCj4+ID4+IAo+PiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiA+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+ID4+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4+ID4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+PiAKPj4gLS0gCj4+IEFsZXggQmVubsOpZQo+PiBWaXJ0dWFsaXNh
dGlvbiBUZWNoIExlYWQgQCBMaW5hcm8KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIApBbGV4IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFk
IEAgTGluYXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
