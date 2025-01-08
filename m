Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36582E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000FE80A65;
	Wed,  8 Jan 2025 20:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaWjs1qWl8Hs; Wed,  8 Jan 2025 20:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E0F280C71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E0F280C71;
	Wed,  8 Jan 2025 20:47:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CA6A1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A68B6083A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oc1NcvSpZez5 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7713C60821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7713C60821
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7713C60821
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:47:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1959241074; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 20:47:03 +0000 (UTC)
Message-ID: <887d0d3d-caa8-49e6-b2d8-a11f22e93230@korsgaard.com>
Date: Wed, 8 Jan 2025 21:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20241230222407.4D17882A1E@busybox.osuosl.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241230222407.4D17882A1E@busybox.osuosl.org>
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=jAMgcqNUCMdRPzJYlRJAS1CY/05gSPoYeZd31a+VIHrYwrCSwQv9ftbt7R5UgPohDgaSwFlEjL77GAcjDBO3834zdjqkzTUiVte7yERWcz0k+uzuOxk4VA7yQPv9mcJDg6a/K+voJkxz+1CuF3btPLJc7puyXktK31dINkkG6T2qHkT12dJQohxd6iIYoK0BZ39d3Lrf3MVWmDUzDlvJTfNJj81i1NxlNBSibMMIdFgi+S9ybuq1/+In7f9RveGVz+9y+CcM/zKoHPnr1q2UxFAKZpAN/g39gjOS8SRZ505i6K9y8QaV0MUkhp7VZjMzi8cRmxbcltgHMsZoO+OXzA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Yk2JWQINmriL4xTboEPm+jKIl6VctPBoP+KLxLvo4as=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=jAMgcqNU
Subject: Re: [Buildroot] [git commit] package/libxml2: fix compilation with
 GCC 14.x and uClibc
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTIvMzAvMjQgMjM6MTksIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBjb21taXQ6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9
Y2E2M2M0NDA5YjNjODExZThjNGVlMTljMjg2MGM1M2FmMzVjNGNlMQo+IGJyYW5jaDogaHR0cHM6
Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hlYWRzL21hc3Rl
cgo+IAo+IFRoZSBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5nIGVycm9ycyBhbmQgd2FybmluZ3Mg
cmFpc2VkIGJ5IHRoZQo+IGNvbXBpbGF0aW9uIG9mIGxpYnhtbDIgd2l0aCB0aGUgY29tYmluYXRp
b24gb2YgR0NDIDE0LnggYW5kIHVDbGliYy4KPiAKPiBlbmNvZGluZy5jOiBJbiBmdW5jdGlvbiDi
gJh4bWxFbmNJbnB1dENodW5r4oCZOgo+IGVuY29kaW5nLmM6MjIwOTozMjogd2FybmluZzogY29t
cGFyaXNvbiBiZXR3ZWVuIHBvaW50ZXIgYW5kIGludGVnZXIKPiAgIDIyMDkgfCAgICAgZWxzZSBp
ZiAoaGFuZGxlci0+aWNvbnZfaW4gIT0gTlVMTCkgewo+ICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefgo+IGVuY29kaW5nLmM6IEluIGZ1bmN0aW9uIOKAmHhtbEVuY091
dHB1dENodW5r4oCZOgo+IGVuY29kaW5nLmM6MjI2OTozMzogd2FybmluZzogY29tcGFyaXNvbiBi
ZXR3ZWVuIHBvaW50ZXIgYW5kIGludGVnZXIKPiAgIDIyNjkgfCAgICAgZWxzZSBpZiAoaGFuZGxl
ci0+aWNvbnZfb3V0ICE9IE5VTEwpIHsKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+Cj4gZW5jb2RpbmcuYzogSW4gZnVuY3Rpb24g4oCYeG1sQ2hhckVuY0Nsb3Nl
RnVuY+KAmToKPiBlbmNvZGluZy5jOjI2ODE6Mjk6IHdhcm5pbmc6IGNvbXBhcmlzb24gYmV0d2Vl
biBwb2ludGVyIGFuZCBpbnRlZ2VyCj4gICAyNjgxIHwgICAgIGlmICgoaGFuZGxlci0+aWNvbnZf
b3V0ICE9IE5VTEwpIHx8IChoYW5kbGVyLT5pY29udl9pbiAhPSBOVUxMKSkgewo+ICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IGVuY29kaW5nLmM6MjY4MTo2MDogd2Fy
bmluZzogY29tcGFyaXNvbiBiZXR3ZWVuIHBvaW50ZXIgYW5kIGludGVnZXIKPiAgIDI2ODEgfCAg
ICAgaWYgKChoYW5kbGVyLT5pY29udl9vdXQgIT0gTlVMTCkgfHwgKGhhbmRsZXItPmljb252X2lu
ICE9IE5VTEwpKSB7Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IGVuY29kaW5nLmM6MjY4MzozMjogd2Fybmlu
ZzogY29tcGFyaXNvbiBiZXR3ZWVuIHBvaW50ZXIgYW5kIGludGVnZXIKPiAgIDI2ODMgfCAgICAg
ICAgIGlmIChoYW5kbGVyLT5pY29udl9vdXQgIT0gTlVMTCkgewo+ICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefgo+IGVuY29kaW5nLmM6MjY4NjozMjogZXJyb3I6IGFz
c2lnbm1lbnQgdG8g4oCYaWNvbnZfdOKAmSB7YWthIOKAmGxvbmcgaW504oCZfSBmcm9tIOKAmHZv
aWQgKuKAmSBtYWtlcyBpbnRlZ2VyIGZyb20gcG9pbnRlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQt
Y29udmVyc2lvbl0KPiAgIDI2ODYgfCAgICAgICAgICAgICBoYW5kbGVyLT5pY29udl9vdXQgPSBO
VUxMOwo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gZW5jb2Rp
bmcuYzoyNjg4OjMxOiB3YXJuaW5nOiBjb21wYXJpc29uIGJldHdlZW4gcG9pbnRlciBhbmQgaW50
ZWdlcgo+ICAgMjY4OCB8ICAgICAgICAgaWYgKGhhbmRsZXItPmljb252X2luICE9IE5VTEwpIHsK
PiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IGVuY29kaW5nLmM6
MjY5MTozMTogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYaWNvbnZfdOKAmSB7YWthIOKAmGxvbmcg
aW504oCZfSBmcm9tIOKAmHZvaWQgKuKAmSBtYWtlcyBpbnRlZ2VyIGZyb20gcG9pbnRlciB3aXRo
b3V0IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0KPiAgIDI2OTEgfCAgICAgICAgICAgICBoYW5k
bGVyLT5pY29udl9pbiA9IE5VTEw7Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXgo+IG1ha2VbNF06ICoqKiBbTWFrZWZpbGU6MTE0NzogbGlieG1sMl9sYS1lbmNvZGlu
Zy5sb10gRXJyb3IgMQo+IAo+IFRoaXMgY29kZSBoYXMgYmVlbiBpbiBsaWJ4bWwyIHByZXR0eSBt
dWNoIGZvcmV2ZXI6IGl0IHdhcyBwYXJ0aWFsbHkKPiBpbnRyb2R1Y2VkIGluIHZlcnNpb24gMi4x
LjA6IDQ5NmExY2Y1OTI4NCAoIjQ5NmExY2Y1OTI4NCByZXZhbXBlZCB0aGUKPiBlbmNvZGluZyBz
dXBwb3J0LCBhZGRlZCBpY29udiBzdXBwb3J0LCBzbyBub3cgbGlieG1sIGlmIikgYW5kCj4gcGFy
dGlhbGx5IGluIHZlcnNpb24gMi4yLjM6IDg3Yjk1Mzk1NzMwNSAoIkxhcmdlIHN5bmMgYmV0d2Vl
biBteSBXM0MKPiBiYXNlIGFuZCBHbm9tZSdzIG9uZToiKS4gQW5kIHRoZSBmaXJzdCB0aW1lIEJ1
aWxkcm9vdCBwYWNrYWdlZAo+IGxpYnhtbDIsIGl0IHdhcyB2ZXJzaW9uIDIuNi4yOS4KPiAKPiBI
b3dldmVyLCBib3RoIGdsaWJjIGFuZCBtdXNsIGRlZmluZSBpY29udl90IGFzICJ2b2lkICoiLCB3
aGljaCBtZWFudAo+IHRoZSBsaWJ4bWwyIGNvZGUgd2FzIG5vdCBwcm9ibGVtYXRpYy4gdUNsaWJj
IGRlZmluZXMgaWNvbnZfdCBhcwo+ICJsb25nIiwgd2hpY2ggZ2VuZXJhdGVkIG9ubHkgYSB3YXJu
aW5nLi4uIHVudGlsIEdDQyBnb3QgdXBkYXRlZCB0byBHQ0MKPiAxNC54LCB3aGljaCB0dXJuZWQg
dGhpcyB3YXJuaW5nIGludG8gYW4gZXJyb3IsIGNhdXNpbmcgdGhlIGJ1aWxkCj4gZmFpbHVyZS4K
PiAKPiBGaXhlczoKPiAKPiAgICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy9mZDRmOGQyZThkOGVlNjhkOWUxOGY3NjFjZWZmMzUwMTg4ZTU1YTg3Lwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgoKQ29tbWl0dGVkIHRvIDIwMjQuMTEueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
