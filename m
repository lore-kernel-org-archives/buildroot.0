Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562F8D12D4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 19:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1236F80DAA;
	Sun, 10 Nov 2024 19:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WG3mjXCb3iZd; Sun, 10 Nov 2024 19:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2250180DB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2250180DB5;
	Sun, 10 Nov 2024 19:42:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EF84DAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E4C6605A1
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-r4VXI8XPMe for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 19:42:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 317286059B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 317286059B
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 317286059B
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:42:11 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-5139cd0032cso1424029e0c.2
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 11:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731267730; x=1731872530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PtJ33CBHN/ZtR8j/3+Pr+a47UaHeS3bYMg22sEn151g=;
 b=f7TBkMYUyENH6hus1Wsu8GcRk2cRmeA0GK1ZDzm/Yh+9rIwY5DsHf/Fo4zW9ucLySV
 yRttjaaKs/3G8Py9FIZhCrgybI5H9MOoTKyKFlS61mk8suhPSJ/GDOswCOxmlgU0u6YL
 sQKF1O1Y+njXVDtAdbkePYRYEyCy4Qj0h6yf9EDqCVJvC8QwNFg22u28tVYT2/kwMnwg
 p2QNRqzMgvNuITuBh9cbHCIfFv6Nq6wH42N+SEQ7DT7Diu8asrwTF35iWHp9jpjMbXBn
 ZpmwoQa7+U3r8SAQh51P4ur5ed9M2D2xqhf8ZPbASY5PrDbSmoeKTjoztMZec0sQnTI7
 uhdQ==
X-Gm-Message-State: AOJu0Yy28m4FVOHot9ayG937rBX6kbLgY2IsaDxQG/Fu7JSD3ZpxcqVj
 R3OXih1eNhyGFfvquMsPQRaSxMMDjYYMcxqj8r8bcBi2piiBfGtl3pW4l7MXB7ileSUXgBDq07W
 goDRTgLSmOEQ8p0w7OVfg1Hgq1eq3+czB4zo=
X-Google-Smtp-Source: AGHT+IFry/2IHUVFccDLqXcqGqyd43FXAQ3yBLjCk8mkujp3jTD3EGzPdkIVEk0n7vcW+Xig4B2ezXSzSuw3pmIx5kg=
X-Received: by 2002:a05:6102:e0e:b0:4a4:9194:d2c1 with SMTP id
 ada2fe7eead31-4aae16d97a6mr7510201137.27.1731267729902; Sun, 10 Nov 2024
 11:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20241101180635.1028681-1-james.hilliard1@gmail.com>
 <349dca54-4070-4f4f-b3ab-6f453a2f4aa3@mind.be>
In-Reply-To: <349dca54-4070-4f4f-b3ab-6f453a2f4aa3@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 10 Nov 2024 12:41:58 -0700
Message-ID: <CADvTj4pq2mSWH4SAeTcpuSFKR5_r13+tYWyMq=GaNzZ+ShHOMg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731267730; x=1731872530; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PtJ33CBHN/ZtR8j/3+Pr+a47UaHeS3bYMg22sEn151g=;
 b=jzflXR2EZ4aJUDFJ1on33WDIPLh0FdAQP3eqKZBcudfH+tYD2nCqekU2NyBEVf+bIP
 U7+9ZIRgHraWjAkoAru7QanT67eqn9zLlPL0wH+1vGWzgR/7MjuzpYEEOl9EBByad3pF
 erXgrCg73BoNTJj5S1xCogViv7yve5gQD9/OhQcGUgyOyyWXzUFivoVwK6ZzDI00pKKy
 pSqixps6ujO4HTGAjUI9GAJvEd2S3vEhVX1Gwt8GbDtYwc0JzFd80ML16wMCt4lwJzMZ
 Tgz4ssA6MPu6sK6Zi2pfGxnVN8pILQ3t/1gpnVjz86jhdmi2oR4BHqvnLa+pFi+2/RsJ
 mvlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jzflXR2E
Subject: Re: [Buildroot] [PATCH 1/1] package/swig: bump to version 4.3.0
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

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCAxOjEx4oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+ICAgSGkgSmFtZXMsCj4KPiBPbiAwMS8xMS8yMDI0IDE5
OjA2LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxp
YXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIHBhY2thZ2Uvc3dp
Zy9zd2lnLmhhc2ggfCAyICstCj4gPiAgIHBhY2thZ2Uvc3dpZy9zd2lnLm1rICAgfCA0ICsrLS0K
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3dpZy9zd2lnLmhhc2ggYi9wYWNrYWdlL3N3aWcv
c3dpZy5oYXNoCj4gPiBpbmRleCAyMTU5MGM0MjJhLi45YzFkYmNjMmZjIDEwMDY0NAo+ID4gLS0t
IGEvcGFja2FnZS9zd2lnL3N3aWcuaGFzaAo+ID4gKysrIGIvcGFja2FnZS9zd2lnL3N3aWcuaGFz
aAo+ID4gQEAgLTEsNSArMSw1IEBACj4gPiAgICMgTG9jYWxseSBjb21wdXRlZDoKPiA+IC1zaGEy
NTYgIDJhZjA4YWNlZDhmY2Q2NWNkYjVjYzYyNDI2NzY4OTE0YmVkYzczNWIxYzI1MDMyNTIwMzcx
NmY3OGUzOWFjOWIgIHN3aWctNC4xLjEudGFyLmd6Cj4gPiArc2hhMjU2ICBmNzIwM2VmNzk2ZjYx
YWY5ODZjNzBjMDU4MTYyMzZjYmQwZDMxYjdhYTk2MzFlNWFiNTMwMjBhYjc4MDRhYTllICBzd2ln
LTQuMy4wLnRhci5nego+ID4gICBzaGEyNTYgIGY1M2FiYWVlZDc3NTAxOGQ1MTlhMWI5NjE1ZjBj
YTE3ODk0NzcyYmQ5Y2EyMWMyYTE1NmJmMzQwYWM0MWMxM2UgIExJQ0VOU0UKPiA+ICAgc2hhMjU2
ICA4Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0
NWViNjViOTAzICBMSUNFTlNFLUdQTAo+ID4gICBzaGEyNTYgIDdmNTBkOTQyMzczYTg3MTIxMWM1
ZWZlZTAzZjNkYjJmOWVmZDFjZmYxMDAyYjBlZjhlMzc0OGJhYTYxMWE1YzIgIExJQ0VOU0UtVU5J
VkVSU0lUSUVTCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zd2lnL3N3aWcubWsgYi9wYWNrYWdl
L3N3aWcvc3dpZy5tawo+ID4gaW5kZXggYWQ1ODVjM2Y5Ny4uN2U4NGJkZDQzMSAxMDA2NDQKPiA+
IC0tLSBhL3BhY2thZ2Uvc3dpZy9zd2lnLm1rCj4gPiArKysgYi9wYWNrYWdlL3N3aWcvc3dpZy5t
awo+ID4gQEAgLTQsOCArNCw4IEBACj4gPiAgICMKPiA+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiA+Cj4gPiAtU1dJR19WRVJTSU9OX01BSk9SID0gNC4xCj4gPiAtU1dJR19WRVJTSU9OID0g
JChTV0lHX1ZFUlNJT05fTUFKT1IpLjEKPiA+ICtTV0lHX1ZFUlNJT05fTUFKT1IgPSA0LjMKPiA+
ICtTV0lHX1ZFUlNJT04gPSAkKFNXSUdfVkVSU0lPTl9NQUpPUikuMAo+Cj4gICBJJ3ZlIHRyaWVk
IGJ1aWxkaW5nIGxpYnNlbGludXggYW5kIHB5dGhvbi1weWxpYmZkdCBhZnRlciB0aGlzIGJ1bXAs
IGFuZCBib3RoCj4gZ2l2ZSBtZSBhbiBlcnJvciBsaWtlIHRoaXM6Cj4KPiAyMDI0LTExLTA0VDIx
OjAzOjU1IGxpYmZkdC9saWJmZHRfd3JhcC5jOiBJbiBmdW5jdGlvbiDigJhfd3JhcF9mZHRfZ2V0
X3Byb3BlcnR5X3figJk6Cj4gMjAyNC0xMS0wNFQyMTowMzo1NSBsaWJmZHQvbGliZmR0X3dyYXAu
Yzo2ODI5OjE5OiBlcnJvcjogdG9vIGZldyBhcmd1bWVudHMgdG8KPiBmdW5jdGlvbiDigJhTV0lH
X1B5dGhvbl9BcHBlbmRPdXRwdXTigJkKPiAyMDI0LTExLTA0VDIxOjAzOjU1IDY4MjkgfCAgICAg
ICByZXN1bHRvYmogPSBTV0lHX1B5dGhvbl9BcHBlbmRPdXRwdXQocmVzdWx0b2JqLAo+IGJ1ZmYp
Owo+IDIwMjQtMTEtMDRUMjE6MDM6NTUgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KPiAyMDI0LTExLTA0VDIxOjAzOjU1IGxpYmZkdC9saWJmZHRfd3JhcC5jOjEy
NTk6MTogbm90ZTogZGVjbGFyZWQgaGVyZQo+IDIwMjQtMTEtMDRUMjE6MDM6NTUgMTI1OSB8IFNX
SUdfUHl0aG9uX0FwcGVuZE91dHB1dChQeU9iamVjdCogcmVzdWx0LCBQeU9iamVjdCoKPiBvYmos
IGludCBpc192b2lkKSB7Cj4gMjAyNC0xMS0wNFQyMTowMzo1NSB8IF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+Cj4KPiAgIE5vdywgSSBoYXZlbid0IGludmVzdGlnYXRlZCB0b28gbXVjaCwgYW5k
IEkgaGF2ZW4ndCBkb25lIGEgY2xlYW4gYnVpbGQgc28gdGhhdAo+IG1heSBiZSB0aGUgcHJvYmxl
bSAodGhvdWdoIEkgZG9uJ3QgaW1tZWRpYXRlbHkgc2VlIGhvdykuIEJ1dCBJIGp1c3Qgd2FudGVk
IHRvCj4gY2hlY2s6IGhhdmUgeW91IGJ1aWxkLXRlc3RlZCBhIGJ1bmNoIG9mIHBhY2thZ2VzIHRo
YXQgdXNlIHN3aWc/CgpweXRob24tcHlsaWJmZHQgc3dpZyA0LjMuMCBjb21wYXRpYmlsaXR5IHdh
cyBmaXhlZCBpbiB0aGlzIGNvbW1pdDoKaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWls
ZHJvb3QvY29tbWl0LzhmNjFkYjM3YjFkMmQ2YWFhOWIxZDJiM2JjOTI2ZjJiZTc0MTA1YmMKCldl
IG5lZWQgdG8gYmFja3BvcnQgYSBwYXRjaCBmb3IgbGlic2VsaW51eCBjb21wYXRpYmlsaXR5IHdp
dGggc3dpZyA0LjMuMDoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9wYXRjaC8yMDI0MTExMDE5MzczNC4xNDYzMTQxLTEtamFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbS8KCkkgdGVzdGVkIHNvbWUgb3RoZXIgcGFja2FnZXMgdXNpbmcgc3dpZyBhbmQgZGlkbid0
IGZpbmQgYW55IG90aGVyIGJ1aWxkCnJlZ3Jlc3Npb25zIHRyaWdnZXJlZCBieSB1cGRhdGluZyBz
d2lnIHRvIHZlcnNpb24gNC4zLjAuCgo+Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPgo+ID4g
ICBTV0lHX1NJVEUgPSBodHRwOi8vZG93bmxvYWRzLnNvdXJjZWZvcmdlLm5ldC9wcm9qZWN0L3N3
aWcvc3dpZy9zd2lnLSQoU1dJR19WRVJTSU9OKQo+ID4gICBIT1NUX1NXSUdfREVQRU5ERU5DSUVT
ID0gaG9zdC1iaXNvbiBob3N0LXBjcmUyCj4gPiAgIEhPU1RfU1dJR19DT05GX09QVFMgPSBcCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
