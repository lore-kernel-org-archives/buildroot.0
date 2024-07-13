Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA87C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD3CA6069E;
	Sat, 13 Jul 2024 09:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yznKKXSbX7Fu; Sat, 13 Jul 2024 09:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FBFB606BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FBFB606BD;
	Sat, 13 Jul 2024 09:45:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 718A71BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DF6E41940
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAkbs2FED6aL for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BD43418E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD43418E9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BD43418E9
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:45:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4266f3e0df8so18403535e9.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863918; x=1721468718;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LvXnSsyYm7UBeRmENbn18NW0GdJp5PjaITgYIduyG+I=;
 b=RbqoT7MUycKaMnV1sxrl5ArzA2el4WMHjYs9mMHoU/ZsRknL+prCkjNHt+KnEzhDx1
 h3SR5RrMpQ19iGwYJMaIwx77niNYnz87cQve8Eu3sO4Jgo+Q96Rrmw+IB1dvPLemAefl
 AX/HBm13SeGQ6yu+G4LEILXPbKUca9vIMcklDIfYTVS6a4GuGw0U/3KFCrwOwQ3wC6nU
 OEtsOpZSObAsoEnhhUAfAgSgeuBMgNLgPrLFnwGjz6XBLohOmkJJ0nWmwcevYwxEYSoE
 hqCxvO47qfTX447GkAOT9jSRQUg0pKlbVUoqWzDoBk3HjWfZulV0KKti9km7JccyPH+Q
 fKrw==
X-Gm-Message-State: AOJu0YzNk9V3QMo75g3cDQ5qWFVBw+9m0LLxMNR+bqv6Djq8KA3559ys
 oK1vmr3RBxFNxRWy/mdPgi9S52DR08337UZ3gbb7pO4c132T3Xjh3dvSdUuMn/l0GPn4879Ir2l
 JLls=
X-Google-Smtp-Source: AGHT+IFmaF6gdCOqFpLCNzcPm6uVmZe7Q7WSdY5fasNq5DpI9mSH3lLqLubLNyu1PLeemf7ZYyUtPw==
X-Received: by 2002:a05:600c:428b:b0:426:5f7d:add3 with SMTP id
 5b1f17b1804b1-426708f9d5amr93200315e9.36.1720863918438; 
 Sat, 13 Jul 2024 02:45:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef56f7sm14414205e9.47.2024.07.13.02.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 02:45:18 -0700 (PDT)
Message-ID: <5b520766-9e46-4c7e-a8f1-c86c90a3096c@smile.fr>
Date: Sat, 13 Jul 2024 11:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240713093744.2089572-1-romain.naour@smile.fr>
Content-Language: fr
In-Reply-To: <20240713093744.2089572-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863918; x=1721468718; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LvXnSsyYm7UBeRmENbn18NW0GdJp5PjaITgYIduyG+I=;
 b=t8f8bAJw0BI8NuHHLIht4abfhHV7CG5OxpIcLS8hw4T9RvtNeterQDXK8C5N+1BWUI
 TMdrWYLrWFBs+E09+44CsLjj2CDwWMmJIrOFgQfutPfov6jlMEk9AyZMYYkmR3Vdo8pL
 V/8RnRJdaNhb60Spz098cCgenWWmQ1JlG808A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=t8f8bAJw
Subject: Re: [Buildroot] [PATCH] configs/beagleboardx15: remove defconfig
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Theo Debrouwere <t.debrouwere@televic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxMy8wNy8yMDI0IMOgIDExOjM3LCBSb21haW4gTmFvdXIgYSDDqWNyaXTCoDoK
PiBUaGUgYmVhZ2xlYm9hcmR4MTUgYm9hcmRzIGZpbGVzIHNob3VsZCBiZSBtb3ZlZCB0bwo+IGJv
YXJkL2JlYWdsZWJvYXJkIGRpcmVjdG9yeSBidXQgZG9pbmcgc28gd2Ugbm90aWNlZCB0aGF0Cj4g
YmVhZ2xlYm9hcmR4MTVfZGVmY29uZmlnIHdhcyBmYWlsaW5nIHRvIGJ1aWxkIG9uIEJ1aWxkcm9v
dCdzCj4gR2l0bGFiLUNpIFsxXSBkdWUgdG9vIG9sZCBCU1AgKHVib290IDIwMTYuMTEgYW5kIGtl
cm5lbCA0LjkpCj4gYnVpbHQgd2l0aCB0aGUgaW50ZXJuYWwgdG9vbGNoYWluLgo+IAo+IFsxXSBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzczMTQ2MzM3
MDIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5m
cj4KPiBDYzogVGhlbyBEZWJyb3V3ZXJlIDx0LmRlYnJvdXdlcmVAdGVsZXZpYy5jb20+ClJldmll
d2VkIElSTCBkdXJpbmcgdGhlIEJ1aWxkcm9vdCBzdW1tZXIgY2FtcCB0b2RheS4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIC5jaGVj
a3BhY2thZ2VpZ25vcmUgICAgICAgICAgICAgICB8ICAxIC0KPiAgREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgLS0KPiAgYm9hcmQvYmVhZ2xlYm9hcmR4MTUvZ2VuaW1hZ2Uu
Y2ZnIHwgMjcgLS0tLS0tLS0tLS0tLS0tLS0KPiAgYm9hcmQvYmVhZ2xlYm9hcmR4MTUvcmVhZG1l
LnR4dCAgIHwgNDkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBjb25maWdzL2Jl
YWdsZWJvYXJkeDE1X2RlZmNvbmZpZyAgfCAyOSAtLS0tLS0tLS0tLS0tLS0tLS0KPiAgNSBmaWxl
cyBjaGFuZ2VkLCAxMDggZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBib2FyZC9i
ZWFnbGVib2FyZHgxNS9nZW5pbWFnZS5jZmcKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2Jl
YWdsZWJvYXJkeDE1L3JlYWRtZS50eHQKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvYmVh
Z2xlYm9hcmR4MTVfZGVmY29uZmlnCj4gCj4gZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2VpZ25v
cmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggYWRlNmM5ZmQyMC4uM2EyMTVlYjAzOCAx
MDA2NDQKPiAtLS0gYS8uY2hlY2twYWNrYWdlaWdub3JlCj4gKysrIGIvLmNoZWNrcGFja2FnZWln
bm9yZQo+IEBAIC0xNDIsNyArMTQyLDYgQEAgY29uZmlncy9iYW5hbmFwaV9tMl9iZXJyeV9kZWZj
b25maWcgbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNrSGFzaAo+ICBjb25maWdzL2JhbmFuYXBpX20y
X3VsdHJhX2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCj4gIGNvbmZpZ3Mv
YmFuYW5hcGlfbTJfemVyb19kZWZjb25maWcgbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNrSGFzaAo+
ICBjb25maWdzL2JhbmFuYXByb19kZWZjb25maWcgbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNrSGFz
aAo+IC1jb25maWdzL2JlYWdsZWJvYXJkeDE1X2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNl
Q2hlY2tIYXNoCj4gIGNvbmZpZ3MvYmVhZ2xlYm9uZV9kZWZjb25maWcgbGliX2RlZmNvbmZpZy5G
b3JjZUNoZWNrSGFzaAo+ICBjb25maWdzL2JlYWdsZXZfZGVmY29uZmlnIGxpYl9kZWZjb25maWcu
Rm9yY2VDaGVja0hhc2gKPiAgY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcgbGliX2RlZmNv
bmZpZy5Gb3JjZUNoZWNrSGFzaAo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVS
Uwo+IGluZGV4IDUzMzZmMGZlNzYuLmI2NmZkYTVmY2IgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVS
Uwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMzAyOSw4ICszMDI5LDYgQEAgTjoJVGFuIEVuIERl
IDxlbmRlLnRhbkBzdGFyZml2ZXRlY2guY29tPgo+ICBGOglwYWNrYWdlL2xpYmtjYXBpLwo+ICAK
PiAgTjoJVGhlbyBEZWJyb3V3ZXJlIDx0LmRlYnJvdXdlcmVAdGVsZXZpYy5jb20+Cj4gLUY6CWJv
YXJkL2JlYWdsZWJvYXJkeDE1Lwo+IC1GOgljb25maWdzL2JlYWdsZWJvYXJkeDE1X2RlZmNvbmZp
Zwo+ICBGOglwYWNrYWdlL3B1Z2l4bWwvCj4gIAo+ICBOOglUaGllcnJ5IEJ1bHRlbCA8dGJ1bHRl
bEBmcmVlLmZyPgo+IGRpZmYgLS1naXQgYS9ib2FyZC9iZWFnbGVib2FyZHgxNS9nZW5pbWFnZS5j
ZmcgYi9ib2FyZC9iZWFnbGVib2FyZHgxNS9nZW5pbWFnZS5jZmcKPiBkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCBiMTYwNDEwNWNkLi4wMDAwMDAwMDAwCj4gLS0tIGEvYm9hcmQvYmVh
Z2xlYm9hcmR4MTUvZ2VuaW1hZ2UuY2ZnCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDI3ICswLDAg
QEAKPiAtaW1hZ2UgYm9vdC52ZmF0IHsKPiAtCXZmYXQgewo+IC0JCWZpbGVzID0gewo+IC0JCQki
TUxPIiwKPiAtCQkJInUtYm9vdC5pbWciCj4gLQkJfQo+IC0JfQo+IC0KPiAtCXNpemUgPSA0TQo+
IC19Cj4gLQo+IC1pbWFnZSBzZGNhcmQuaW1nIHsKPiAtCWhkaW1hZ2Ugewo+IC0JfQo+IC0KPiAt
CXBhcnRpdGlvbiB1LWJvb3Qgewo+IC0JCXBhcnRpdGlvbi10eXBlID0gMHhDCj4gLQkJYm9vdGFi
bGUgPSAidHJ1ZSIKPiAtCQlpbWFnZSA9ICJib290LnZmYXQiCj4gLQl9Cj4gLQo+IC0JcGFydGl0
aW9uIHJvb3RmcyB7Cj4gLQkJcGFydGl0aW9uLXR5cGUgPSAweDgzCj4gLQkJaW1hZ2UgPSAicm9v
dGZzLmV4dDQiCj4gLQkJc2l6ZSA9IDUxMk0KPiAtCX0KPiAtfQo+IGRpZmYgLS1naXQgYS9ib2Fy
ZC9iZWFnbGVib2FyZHgxNS9yZWFkbWUudHh0IGIvYm9hcmQvYmVhZ2xlYm9hcmR4MTUvcmVhZG1l
LnR4dAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDVhZjJjOTE0YmEuLjAwMDAw
MDAwMDAKPiAtLS0gYS9ib2FyZC9iZWFnbGVib2FyZHgxNS9yZWFkbWUudHh0Cj4gKysrIC9kZXYv
bnVsbAo+IEBAIC0xLDQ5ICswLDAgQEAKPiAtQmVhZ2xlQm9hcmQgWDE1Cj4gLQo+IC1JbnRybwo+
IC09PT09PQo+IC1UaGlzIGNvbmZpZyBjdXJyZW50bHkgc3VwcG9ydHMgdGhlIGJlYWdsZWJvYXJk
IHgxNSwKPiAtYW5kIGdlbmVyYXRlcyBhIGJhcmVib25lIGltYWdlLgo+IC0KPiAtVGhlIGltYWdl
IG11c3QgYmUgZmxhc2hlZCB0byBhIFNEIGNhcmQgdG8gYmUgdXNlZC4KPiAtCj4gLUhvdyB0byBi
dWlsZCBpdAo+IC09PT09PT09PT09PT09PT0KPiAtCj4gLSAgJCBtYWtlIGJlYWdsZWJvYXJkeDE1
X2RlZmNvbmZpZwo+IC0KPiAtVGhlbiB5b3UgY2FuIGVkaXQgdGhlIGJ1aWxkIG9wdGlvbnMgdXNp
bmcKPiAtCj4gLSAgJCBtYWtlIG1lbnVjb25maWcKPiAtCj4gLUNvbXBpbGUgYWxsIGFuZCBidWls
ZCBhIHNkY2FyZCBpbWFnZToKPiAtCj4gLSAgJCBtYWtlCj4gLQo+IC1SZXN1bHQgb2YgdGhlIGJ1
aWxkCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAtCj4gLUFmdGVyIGJ1aWxkaW5nLCB5b3Ugc2hv
dWxkIGdldCBhIHRyZWUgbGlrZSB0aGlzOgo+IC0KPiAtICBvdXRwdXQvaW1hZ2VzLwo+IC0gICst
LSBhbTU3eHgtYmVhZ2xlLXgxNS5kdGIKPiAtICArLS0gYW01N3h4LWJlYWdsZS14MTUtcmV2YjEu
ZHRiCj4gLSAgKy0tIGJvb3QudmZhdAo+IC0gICstLSBNTE8KPiAtICArLS1yb290ZnMuZXh0Mgo+
IC0gICstLSByb290ZnMuZXh0NAo+IC0gICstLSByb290ZnMudGFyCj4gLSAgKy0tIHNkY2FyZC5p
bWcKPiAtICArLS0gdS1ib290LmltZwo+IC0gICstLSB1LWJvb3Qtc3BsLmJpbgo+IC0gICstLSB6
SW1hZ2UKPiAtCj4gLUhvdyB0byB3cml0ZSB0aGUgbWljcm9TRCBjYXJkCj4gLT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4gLQo+IC1PbmNlIHRoZSBidWlsZCBwcm9jZXNzIGlzIGZpbmlz
aGVkIHlvdSB3aWxsIGhhdmUgYW4gaW1hZ2UgY2FsbGVkICJzZGNhcmQuaW1nIgo+IC1pbiB0aGUg
b3V0cHV0L2ltYWdlcy8gZGlyZWN0b3J5Lgo+IC0KPiAtQ29weSB0aGUgYm9vdGFibGUgInNkY2Fy
ZC5pbWciIG9udG8gYW4gU0QgY2FyZCB3aXRoICJkZCI6Cj4gLQo+IC0gICQgc3VkbyBkZCBpZj1v
dXRwdXQvaW1hZ2VzL3NkY2FyZC5pbWcgb2Y9L2Rldi9zZFgKPiBkaWZmIC0tZ2l0IGEvY29uZmln
cy9iZWFnbGVib2FyZHgxNV9kZWZjb25maWcgYi9jb25maWdzL2JlYWdsZWJvYXJkeDE1X2RlZmNv
bmZpZwo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAzOWEwN2IxMWUuLjAwMDAw
MDAwMDAKPiAtLS0gYS9jb25maWdzL2JlYWdsZWJvYXJkeDE1X2RlZmNvbmZpZwo+ICsrKyAvZGV2
L251bGwKPiBAQCAtMSwyOSArMCwwIEBACj4gLUJSMl9hcm09eQo+IC1CUjJfY29ydGV4X2ExNT15
Cj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNF85PXkKPiAtQlIyX1JP
T1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+IC1C
UjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL2JlYWdsZWJvYXJkeDE1L2dlbmlt
YWdlLmNmZyIKPiAtQlIyX0xJTlVYX0tFUk5FTD15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT049eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI0Ljki
Cj4gLUJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJvbWFwMnBsdXMiCj4gLUJSMl9MSU5VWF9L
RVJORUxfRFRTX1NVUFBPUlQ9eQo+IC1CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0i
YW01N3h4LWJlYWdsZS14MTUgYW01N3h4LWJlYWdsZS14MTUtcmV2YjEiCj4gLUJSMl9MSU5VWF9L
RVJORUxfSU5TVEFMTF9UQVJHRVQ9eQo+IC1CUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPiAtQlIy
X1RBUkdFVF9ST09URlNfRVhUMl80PXkKPiAtQlIyX1RBUkdFVF9VQk9PVD15Cj4gLUJSMl9UQVJH
RVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQo+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RP
TV9WRVJTSU9OPXkKPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAx
Ni4xMSIKPiAtQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImFtNTd4eF9ldm0iCj4g
LUJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKPiAtIyBCUjJfVEFSR0VUX1VCT09UX0ZPUk1B
VF9CSU4gaXMgbm90IHNldAo+IC1CUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQo+IC1CUjJf
VEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNUT009eQo+IC1CUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9D
VVNUT01fTkFNRT0ic3BsL3UtYm9vdC1zcGwuYmluIgo+IC1CUjJfVEFSR0VUX1VCT09UX1NQTD15
Cj4gLUJSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9Ik1MTyIKPiAtQlIyX1BBQ0tBR0VfSE9TVF9E
T1NGU1RPT0xTPXkKPiAtQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gLUJSMl9QQUNLQUdF
X0hPU1RfTVRPT0xTPXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
