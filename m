Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A637D10F57
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 14:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECC940A97;
	Wed, 26 Nov 2025 14:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgKGLMv5d0Sd; Wed, 26 Nov 2025 14:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 621CE40B40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 621CE40B40;
	Wed, 26 Nov 2025 14:46:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E503359
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CAC540E3C
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJJv2tZtkgAb for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 14:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DEED40447
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DEED40447
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DEED40447
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:46:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 100D01A1D77
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:46:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DA51F60721;
 Wed, 26 Nov 2025 14:46:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 16069102F0883; Wed, 26 Nov 2025 15:46:49 +0100 (CET)
Message-ID: <0102f72e-c944-455a-96d3-a60736ac9376@bootlin.com>
Date: Wed, 26 Nov 2025 15:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
 <20251126-rasdaemon-v1-1-38c590f3e591@bootlin.com>
 <fbabe782-7e44-48ab-9437-0400080e817c@gmx.de>
Content-Language: en-US
In-Reply-To: <fbabe782-7e44-48ab-9437-0400080e817c@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764168410; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/mNIUI6dpchGgB6PDj2So0y95Og+EzMcnlJ7kr74hug=;
 b=LjB9JoPa5MdmRf+B3Rbb7UNgWsv0SVDpU9eU+nHsvid3n54RP9EwdxG6RhkuEgHQ2Osr9Q
 xWv1g825e8FGDf+/sWFZTcGt30govS+xRiU0b3qxH/ildXDeXdx/zbpfeXrQBJY4ZoUc7L
 jLL07W6XjcgcxDRUVA7TBEwN4s4Y1K2A9abYdlMr22rZXJ5ycx6PR/0ri0OCqt7dQ4Wd2M
 7N9ESaC/H8nCceS8XPLWD4P2htBSYSoCnzDaIAJaoTT/llxuhOh7KZQ2EHpazvwRgSIfT5
 PjpGexGqKTmqxqkBoCfBqeLzyk4BXHQ1pJIOJpEy9ZZf+ompVBhd+jZrEKq4Dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LjB9JoPa
Subject: Re: [Buildroot] [PATCH 1/2] package/rasdaemon: Add rasdaemon package
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEsCgpPbiAxMS8yNi8yNSAzOjMyIFBNLCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBIaSBC
YXN0aWVuIQo+IAo+IEFtIDI2LjExLjI1IHVtIDExOjIwIHNjaHJpZWIgQmFzdGllbiBDdXJ1dGNo
ZXQ6Cj4+IFJhc2RhZW1vbiBpcyBhIHRvb2wgdGhhdCBhaW1zIHRvIHJlcGxhY2UgdGhlIGVkYWMt
dG9vbCBhbmQgcHJvdmlkZSBhIHdheQo+PiB0byBjb2xsZWN0IGFsbCBoYXJkd2FyZSBlcnJvciBl
dmVudHMgcmVwb3J0ZWQgYnkgdGhlIExpbnV4IGtlcm5lbCBpbiBhCj4+IGNvbW1vbiBmcmFtZXdv
cmsuCj4+Cj4+IEFkZCBhIG5ldyBwYWNrYWdlIHRvIHN1cHBvcnQgcmFzZGFlbW9uIGluIHRoZSAn
SGFyZHdhcmUgaGFuZGxpbmcnCj4+IHNlY3Rpb24uIEl0IGRlcGVuZHMgb24gbGlidHJhY2VldmVu
dHMgdG8gZGV0ZWN0IHRoZSBmdHJhY2UgZXZlbnRzCj4+IGdlbmVyYXRlZCBieSB0aGUga2VybmVs
IGFuZCBvbiBzcWxpdGUgdG8gc3RvcmUgdGhlc2UgZXZlbnRzLgo+Pgo+PiBTdXBwb3J0IGZvciB0
aGUgUENJZSBBRVIgZXZlbnRzIGlzIG9wdGlvbm5hbCBhbmQgaW1wbGllcyBhIGRlcGVuZGVuY3kg
b24KPj4gcGNpdXRpbHMgc28gYWxzbyBhZGQgYSBkZWRpY2F0ZWQgJ3N1Yi1vcHRpb24nIHRvIGVu
YWJsZSBpdC4KPj4KPj4gQWRkIGEgU1lTViBpbml0IHNjcmlwdCB0byBzdGFydCAvIHN0b3AgdGhl
IGRhZW1vbgo+Pgo+PiBBZGQgbXlzZWxmIHRvIHRoZSBERVZFTE9QRVJTIGZpbGUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEJhc3RpZW4gQ3VydXRjaGV0IDxiYXN0aWVuLmN1cnV0Y2hldEBib290bGlu
LmNvbT4KPj4gLS0tCj4+IMKgIERFVkVMT1BFUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKwo+PiDCoCBwYWNrYWdlL0NvbmZpZy5pbsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIHBhY2thZ2UvcmFzZGFlbW9uL0Nv
bmZpZy5pbsKgwqDCoMKgwqAgfCAyMyArKysrKysrKysrKysrKysKPj4gwqAgcGFja2FnZS9yYXNk
YWVtb24vUzk1cmFzZGFlbW9uwqDCoCB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KyAKPj4gKysrKysrKysrKwo+PiDCoCBwYWNrYWdlL3Jhc2RhZW1vbi9yYXNkYWVtb24uaGFzaCB8
wqAgMSArCj4+IMKgIHBhY2thZ2UvcmFzZGFlbW9uL3Jhc2RhZW1vbi5ta8KgwqAgfCAzMyArKysr
KysrKysrKysrKysrKysrKysKPj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPj4gaW5kZXggCj4+
IGRiMDAxZDZiYjA3MDdhNTg3N2MwODQ5ZmE4NWZhNzM2Mzc3ZTYwZGQuLmIxZWFkNmQyNmM0ZThm
ZjE2MGJjYzdlZDg1YjA5NDVhYzVlNTUxZGMgMTAwNjQ0Cj4+IC0tLSBhL0RFVkVMT1BFUlMKPj4g
KysrIGIvREVWRUxPUEVSUwo+PiBAQCAtMzQxLDYgKzM0MSw5IEBAIEY6wqDCoMKgIHBhY2thZ2Uv
dGNwZHVtcC8KPj4gwqAgRjrCoMKgwqAgcGFja2FnZS90aS11aW0vCj4+IMKgIEY6wqDCoMKgIHBh
Y2thZ2UvdWh1YmN0bC8KPj4gK046wqDCoMKgIEJhc3RpZW4gQ3VydXRjaGV0IDxiYXN0aWVuLmN1
cnV0Y2hldEBib290bGluLmNvbT4KPj4gK0Y6wqDCoMKgIHBhY2thZ2UvcmFzZGFlbW9uLwo+PiAr
Cj4+IMKgIE46wqDCoMKgIEJheGljaGUgU3UgPGJheGljaGVAZ21haWwuY29tPgo+PiDCoCBGOsKg
wqDCoCBwYWNrYWdlL3F0Ni9xdDZtdWx0aW1lZGlhLwo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9D
b25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+PiBpbmRleCAKPj4gMTJmMzI3Y2IyNzM1MjY3
ODFkOTMxYjgzNGUyNGQwZGY1MDI0ZTgwZS4uMWE5M2NlYzJmYTIyZTNhNmU3MGFjYmY3OTliMzJi
MDBkNWU4YjVkZSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPj4gKysrIGIvcGFj
a2FnZS9Db25maWcuaW4KPj4gQEAgLTU4NCw2ICs1ODQsNyBAQCBlbmRtZW51Cj4+IMKgwqDCoMKg
wqAgc291cmNlICJwYWNrYWdlL3BydS1zb2Z0d2FyZS1zdXBwb3J0L0NvbmZpZy5pbiIKPj4gwqDC
oMKgwqDCoCBzb3VyY2UgInBhY2thZ2UvcHVsc2V2aWV3L0NvbmZpZy5pbiIKPj4gwqDCoMKgwqDC
oCBzb3VyY2UgInBhY2thZ2UvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS9Db25maWcuaW4iCj4+
ICvCoMKgwqAgc291cmNlICJwYWNrYWdlL3Jhc2RhZW1vbi9Db25maWcuaW4iCj4+IMKgwqDCoMKg
wqAgc291cmNlICJwYWNrYWdlL3Jhc3BpLWdwaW8vQ29uZmlnLmluIgo+PiDCoMKgwqDCoMKgIHNv
dXJjZSAicGFja2FnZS9yZG1hLWNvcmUvQ29uZmlnLmluIgo+PiDCoMKgwqDCoMKgIHNvdXJjZSAi
cGFja2FnZS9yZWFkLWVkaWQvQ29uZmlnLmluIgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yYXNk
YWVtb24vQ29uZmlnLmluIGIvcGFja2FnZS9yYXNkYWVtb24vQ29uZmlnLmluCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4+IGluZGV4IAo+PiAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwLi5mNmNlYjM1ODVjZTU2MTJiYTU5OGIxODJlNjUzOGE0OWQxYWRiOGY4Cj4+IC0t
LSAvZGV2L251bGwKPj4gKysrIGIvcGFja2FnZS9yYXNkYWVtb24vQ29uZmlnLmluCj4+IEBAIC0w
LDAgKzEsMjMgQEAKPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9SQVNEQUVNT04KPj4gK8KgwqDCoCBi
b29sICJyYXNkYWVtb24iCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMg
bGlidHJhY2VldmVudAo+PiArwqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJUUkFDRUVWRU5U
Cj4+ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX1NRTElURQo+PiArwqDCoMKgIHNlbGVjdCBC
UjJfUEFDS0FHRV9BUkdQX1NUQU5EQUxPTkUgaWYgQlIyX1RPT0xDSEFJTl9VU0VTX1VDTElCQyAK
Pj4gfHwgQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wKPj4gK8KgwqDCoCBoZWxwCj4+ICvCoMKgwqDC
oMKgIHJhc2RhZW1vbiBpcyBhIHRvb2wgdGhhdCBjb2xsZWN0cyBhbGwgaGFyZHdhcmUgZXJyb3Ig
ZXZlbnRzCj4+ICvCoMKgwqDCoMKgIHJlcG9ydGVkIGJ5IHRoZSBMaW51eCBLZXJuZWwgZnJvbSBz
ZXZlcmFsIHNvdXJjZXMgKEVEQUMsIE1DRQo+PiArwqDCoMKgwqDCoCBQQ0ksIC4uLikgaW50byBv
bmUgY29tbW9uIGZyYW1ld29yay4KPj4gK8KgwqDCoMKgwqAgU2VlIGh0dHBzOi8vZ2l0aHViLmNv
bS9tY2hlaGFiL3Jhc2RhZW1vbiBmb3IgZGV0YWlscy4KPj4gKwo+PiAraWYgQlIyX1BBQ0tBR0Vf
UkFTREFFTU9OCj4+ICsKPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9SQVNEQUVNT05fQUVSCj4+ICvC
oMKgwqAgYm9vbCAiRW5hYmxlIEFFUiBzdXBwb3J0Igo+PiArwqDCoMKgIGRlZmF1bHQgeQo+PiAr
wqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9QQ0lVVElMUwo+PiArwqDCoMKgIGhlbHAKPj4gK8Kg
wqDCoMKgwqAgRW5hYmxlIGhhbmRsaW5nIG9mIEFFUiAoQWR2YW5jZWQgRXJyb3IgUmVwb3J0aW5n
KSBldmVudHMgb24KPj4gK8KgwqDCoMKgwqAgUENJZQo+PiArCj4+ICtlbmRpZgo+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9yYXNkYWVtb24vUzk1cmFzZGFlbW9uIGIvcGFja2FnZS9yYXNkYWVtb24v
IAo+PiBTOTVyYXNkYWVtb24KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggCj4+IDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjRmMjExZjFlZWZiOGNmZTA4
YjExNTBjOTFlYjAyN2RkZGY2MDg1YjkKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdl
L3Jhc2RhZW1vbi9TOTVyYXNkYWVtb24KPj4gQEAgLTAsMCArMSw2MiBAQAo+PiArIyEvYmluL3No
Cj4+ICsjCj4+ICsjIFM5NXJhc2RhZW1vbsKgwqDCoCBTdGFydHMgUmFzZGFlbW9uLgo+PiArIwo+
PiArIyBzaGVsbGNoZWNrIGRpc2FibGU9U0MyMzE3ICMgZnVuY3Rpb25zIGFyZSBjYWxsZWQgdmlh
IHZhcmlhYmxlCj4+ICsKPj4gK0RBRU1PTj0icmFzZGFlbW9uIgo+PiArCj4+ICtzdGFydCgpIHsK
Pj4gK8KgwqDCoCBwcmludGYgIlN0YXJ0aW5nICVzOiAiICIkREFFTU9OIgo+PiArCj4+ICvCoMKg
wqAgaWYgISBncmVwIC1xIGRlYnVnZnMgL3Byb2MvbW91bnRzIDsgdGhlbgo+PiArwqDCoMKgwqDC
oMKgwqAgIyByYXNkYWVtb24gZmFpbHMgc2lsZW50bHkgaWYgZGVidWdmcyBpc24ndCBtb3VudGVk
Cj4gCj4gUHJpbnRpbmcgdGhhdCBpbnN0ZWFkIG9mIGEgY29tbWVudCB3b3VsZCBiZSBoZWxwZnVs
LCBzbyB1c2VycyB3aXRob3V0IAo+IGRlYnVnZnMga25vdyB3aHkgcmFzZGFlbW9uIGZhaWxzIHRv
IHN0YXJ0Lgo+IAoKVHJ1ZSwgd2lsbCBkbwoKPj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8gIkZBSUwi
Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gJD8KPiAKPiBUaGlzIHdvdWxkIHJldHVybiB0aGUg
ZXhpdCBzdGF0dXMgb2YgImVjaG8iLCB3aGljaCBpcyBwcmFjdGljYWxseSBhbHdheXMgCj4gZ29p
bmcgdG8gYmUgMC4gInJldHVybiAxIiB3b3VsZCBwcm9iYWJseSBiZSBtb3JlIGFwcHJvcHJpYXRl
Lgo+IAoKSW5kZWVkLCB0aGFua3MKCj4+ICvCoMKgwqAgZmkKPj4gKwo+PiArwqDCoMKgIHN0YXJ0
LXN0b3AtZGFlbW9uIC0tc3RhcnQgLS1leGVjICIvdXNyL3NiaW4vJERBRU1PTiIKPj4gK8KgwqDC
oCBzdGF0dXM9JD8KPj4gK8KgwqDCoCBpZiBbICIkc3RhdHVzIiAtZXEgMCBdOyB0aGVuCj4+ICvC
oMKgwqDCoMKgwqDCoCBlY2hvICJPSyIKPj4gK8KgwqDCoCBlbHNlCj4+ICvCoMKgwqDCoMKgwqDC
oCBlY2hvICJGQUlMIgo+PiArwqDCoMKgIGZpCj4+ICvCoMKgwqAgcmV0dXJuICIkc3RhdHVzIgo+
PiArfQo+PiArCj4+ICtzdG9wKCkgewo+PiArwqDCoMKgIHByaW50ZiAiU3RvcHBpbmcgJXM6ICIg
IiREQUVNT04iCj4+ICvCoMKgwqAgc3RhcnQtc3RvcC1kYWVtb24gLS1zdG9wIC0tZXhlYyAiL3Vz
ci9zYmluLyREQUVNT04iCj4+ICvCoMKgwqAgc3RhdHVzPSQ/Cj4+ICvCoMKgwqAgaWYgWyAiJHN0
YXR1cyIgLWVxIDAgXTsgdGhlbgo+PiArwqDCoMKgwqDCoMKgwqAgZWNobyAiT0siCj4+ICvCoMKg
wqAgZWxzZQo+PiArwqDCoMKgwqDCoMKgwqAgZWNobyAiRkFJTCIKPj4gK8KgwqDCoCBmaQo+PiAr
wqDCoMKgICMgJERBRU1PTiBkZWxldGVzIGl0cyBQSUQgZmlsZSBvbiBleGl0LCB3YWl0IGZvciBp
dCB0byBiZSBnb25lCj4+ICvCoMKgwqAgd2hpbGUgWyAtZiAiJFBJREZJTEUiIF07IGRvCj4gCj4g
VGhlIFBJREZJTEUgdmFyaWFibGUgaXNuJ3QgZGVmaW5lZCBhbnl3aGVyZSwgdGhhdCBjYW4ndCBi
ZSByaWdodC4gCgpJbmRlZWQgLi4uCgo+IEdlbmVyYWxseSAqYWxsKiBzdGFydC1zdG9wLWRhZW1v
biBjYWxscyBzaG91bGQgdXNlIC0tcGlkZmlsZSAkUElERklMRSBzbyAKPiBzdGFydC1zdG9wLWRh
ZW1vbiBjYW4ga2VlcCB0cmFjayBvZiBleGFjdCBwcm9jZXNzIChpbiBhZGRpdGlvbiB0byAtLSAK
PiBleGVjKS4gRXhhY3RseSBob3cgdG8gbWFuYWdlIHRoZSBQSUQgZmlsZSBkZXBlbmRzIG9uIHRo
ZSBiZWhhdmlvciBvZiB0aGUgCj4gZGFlbW9uLCBwbGVhc2Ugc2VlOgo+IGh0dHBzOi8vbmlnaHRs
eS5idWlsZHJvb3Qub3JnLyNfaGFuZGxpbmdfdGhlX3BpZF9maWxlCgpUaGFua3MgZm9yIHRoZSBw
b2ludGVyLCBJIGRpZG4ndCBrbm93IGFib3V0IHRoZSAtLW1ha2UtcGlkZmlsZSBvcHRpb24sIApJ
J2xsIHVzZSBpdC4KCj4gKG9yIGRvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1kaXJlY3Rvcnku
YWRvYyBpbiB0aGUgcmVwbywgc2VhcmNoIGZvciAKPiBQSUQgdG8gZmluZCB0aGUgc2VjdGlvbikK
PiAKPiBJbiBhbnkgY2FzZSwgeW91IG5lZWQgdG8gc2V0IHRoZSBQSURGSUxFIHZhcmlhYmxlIGlu
IHRoZSBpbml0IHNjcmlwdC4gOy0pCj4gCgoKQmVzdCByZWdhcmRzLApCYXN0aWVuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
