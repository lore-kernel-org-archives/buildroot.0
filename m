Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC0CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 12:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD24B41537;
	Mon,  1 Sep 2025 12:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJYPA1kxY99F; Mon,  1 Sep 2025 12:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CADF541533
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CADF541533;
	Mon,  1 Sep 2025 12:35:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4592E10E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36A75404B8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9RrjV5GRypG for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 12:35:11 +0000 (UTC)
X-Greylist: delayed 549 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Sep 2025 12:35:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45E08404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45E08404B6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=richard.genoud@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45E08404B6
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:35:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3E9B94E40C5C;
 Mon,  1 Sep 2025 12:25:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1729960699;
 Mon,  1 Sep 2025 12:25:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A40421C22D86D; 
 Mon,  1 Sep 2025 14:25:47 +0200 (CEST)
Message-ID: <52c037ee-ec2c-4c20-bfcc-3ee892db71af@bootlin.com>
Date: Mon, 1 Sep 2025 14:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
 <dda8aca0-2c2c-40bc-922f-a8f613aca52f@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <dda8aca0-2c2c-40bc-922f-a8f613aca52f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756729557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=F8GAv6e6DFOoy/DJENs9o01re/hTFHpgum8bIuMkuyY=;
 b=KcNqfhe/bz00W+JRFY27Kq9bFOy/oPGMTgbhWWj3aX9Zfqg4RIeZDXVrFQ3njl6TF1N65Y
 TBwsyPpV2G/pXJy3CWUZ21HR7SCNCliCz1mzPvj15rn6bPAfxvod3AZKmK79/kOuGn9iGd
 zrR7qy+CvXSTQWYLj0iWEBIejoi6mW4xAnoFFV9oedHmc5Bje3ORGfPqfTtyCT/iiwWc7y
 w2ZE8OKZpSX/faCY3y3RuglAGY3GDLYqzHnX/yiESvC0H/rUoVJwmEHajwT/M8QiVjMXbT
 cwF9AIJUARJD5ImtfS5eZ0vPzAIiS38iE2fI4qXj8LNy+uHRGpDkByWK1sEqtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KcNqfhe/
Subject: Re: [Buildroot] [RFC v3 0/5] Support qmake for Qt6
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
From: Richard GENOUD via buildroot <buildroot@buildroot.org>
Reply-To: Richard GENOUD <richard.genoud@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDEvMDkvMjAyNSDDoCAxMDowMywgUmljaGFyZCBHRU5PVUQgYSDDqWNyaXTCoDoKPiBMZSAx
NC8wOC8yMDI1IMOgIDE3OjMyLCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdMKgOgo+PiBUaGUgc2Vy
aWVzIHN1cHBvcnRzIHFtYWtlIGZvciBxdDYuCj4gVGhpcyBpcyBncmVhdCB0byBoYXZlIHRoaXMg
bW92aW5nIGZvcndhcmQuCj4gCj4gVGhhbmtzIGZvciB0aGlzIGpvYiEKPiAKCkkndmUgdGVzdGVk
IHRoYXQgb24gYSBjbGllbnQncyBwcm9qZWN0IHRoYXQgd2FzIHByZXZpb3VzbHkgdXNpbmcgUXQ1
IHFtYWtlLgpCdWlsZHJvb3QgKDIwMjUuMDIuNSksIGFybSB0b29sY2hhaW4sIGJ1aWxkIGFuZCBy
ZWxvY2F0ZSBzZGsuClRoZSBwcm9qZWN0IHVzZXMgcmVjdXJzaXZlIHFtYWtlLCBpdCB3b3JrcyBs
aWtlIGEgY2hhcm0uCgpUZXN0ZWQtYnk6IFJpY2hhcmQgR0VOT1VEIDxyaWNoYXJkLmdlbm91ZEBi
b290bGluLmNvbT4KCj4+Cj4+IEFzIHN0YXRlZCBpbiBodHRwczovL2RvYy5xdC5pby9xdC02L3F0
Ni1idWlsZHN5c3RlbS5odG1sOgo+Pgo+PiDCoMKgICJUaGlzIG9ubHkgYWZmZWN0cyB1c2VycyB0
aGF0IHdhbnQgdG8gYnVpbGQgUXQgZnJvbSBzb3VyY2VzLgo+PiDCoMKgwqAgWW91IGNhbiBzdGls
bCB1c2UgcW1ha2UgYXMgYSBidWlsZCB0b29sIGZvciB5b3VyIGFwcGxpY2F0aW9ucy4iCj4+Cj4+
IFRoaXMgc2VyaWVzIHJldml2ZXMgYW4gb2xkZXIgcGF0Y2ggdGhhdCBleHBvcnRlZCBxbWFrZSBm
b3IgUXQ2LAo+PiBhcHBseWluZyBhIG1pbmltYWwgZml4LiBJdCBleHRlbmRzIHBrZy1xbWFrZSB0
byBzdXBwb3J0IFF0NiBhbmQgdXNlcwo+PiBxd3QgYW5kIGN1dGVrZXlib2FyZCBhcyB0ZXN0IGNh
c2VzIHRvIHZhbGlkYXRlIHRoZSBjaGFuZ2VzLgo+Pgo+PiBUaGUgc2VyaWVzIGlzIG1hcmtlZCBh
cyBSRkMgYmVjYXVzZSBoYXJkY29kaW5nIHRoZSBRdDUgYW5kIFF0NiB2ZXJzaW9uCj4+IG51bWJl
cnMgaW4gcGtnLXFtYWtlIGlzIG5vdCBpZGVhbCwgZXZlbiBpZiB0aGUgUXQ1IHZlcnNpb25zIHdl
cmUKPj4gYWxyZWFkeSBoYXJkY29kZWQuCj4+Cj4+IEFuIGFsdGVybmF0aXZlIGFwcHJvYWNoIGNv
dWxkIGJlIHRvIGFkZCBhIEJSMl9QQUNLQUdFX1FUezUsNn0gCj4+IF9WRVJTSU9OX1ZBTFVFCj4+
IG9wdGlvbiwgYnV0IHRoaXMgY2FuIGJlIGRpc2N1c3NlZCBkdXJpbmcgcmV2aWV3Lgo+Pgo+PiBE
YXJpbyBCaW5hY2NoaSAoNCk6Cj4+IMKgwqAgcGFja2FnZS9xd3Q6IGJ1bXAgdG8gdmVyc2lvbiA2
LjMuMAo+PiDCoMKgIHBhY2thZ2UvcGtnLXFtYWtlOiBzdXBwb3J0IFF0Ngo+PiDCoMKgIHBhY2th
Z2UvcXd0OiBlbmFibGUgYnVpbGQgd2l0aCBRdDYKPj4gwqDCoCBwYWNrYWdlL2N1dGVrZXlib2Fy
ZDogZW5hYmxlIGJ1aWxkIHdpdGggUXQ2Cj4+Cj4+IEplc3NlIFZhbiBHYXZlcmUgKDEpOgo+PiDC
oMKgIHBhY2thZ2UvcXQ2OiBBZGQgcW1ha2UgZnVuY3Rpb25hbGl0eQo+Pgo+PiDCoCBwYWNrYWdl
L2N1dGVrZXlib2FyZC9Db25maWcuaW7CoMKgwqDCoMKgwqAgfCAxMyArKysrKystLS0tCj4+IMKg
IHBhY2thZ2UvY3V0ZWtleWJvYXJkL2N1dGVrZXlib2FyZC5tayB8wqAgNiArKysrLQo+PiDCoCBw
YWNrYWdlL3BrZy1xbWFrZS5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjEg
KysrKysrKysrKysrLS0tLQo+PiDCoCBwYWNrYWdlL3F0Ni9xdDYubWvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOCArKysrKysrKysrKysrKwo+PiDCoCBwYWNrYWdlL3F0
Ni9xdDZiYXNlL3FtYWtlLmNvbmYuaW7CoMKgwqAgfCAzNiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4+IMKgIHBhY2thZ2UvcXQ2L3F0NmJhc2UvcXBsYXRmb3JtZGVmcy5owqAgfMKgIDEg
Kwo+PiDCoCBwYWNrYWdlL3F0Ni9xdDZiYXNlL3F0LmNvbmYuaW7CoMKgwqDCoMKgwqAgfMKgIDcg
KysrKysrCj4+IMKgIHBhY2thZ2UvcXQ2L3F0NmJhc2UvcXQ2YmFzZS5ta8KgwqDCoMKgwqDCoCB8
IDE4ICsrKysrKysrKysrKysrCj4+IMKgIHBhY2thZ2UvcXd0L0NvbmZpZy5pbsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIyICsrKysrKysrKystLS0tLS0tCj4+IMKgIHBhY2thZ2Uv
cXd0L3F3dC5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrLS0t
LQo+PiDCoCBwYWNrYWdlL3F3dC9xd3QubWvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDYgKysrKy0KPj4gwqAgMTEgZmlsZXMgY2hhbmdlZCwgMTMyIGluc2VydGlvbnMo
KyksIDI0IGRlbGV0aW9ucygtKQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDYv
cXQ2YmFzZS9xbWFrZS5jb25mLmluCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3F0
Ni9xdDZiYXNlL3FwbGF0Zm9ybWRlZnMuaAo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9xdDYvcXQ2YmFzZS9xdC5jb25mLmluCj4+Cj4gCgoKLS0gClJpY2hhcmQgR2Vub3VkLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
