Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958C2E7DEEF
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4985440A46;
	Mon,  2 Feb 2026 14:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAtYapUKcB9O; Mon,  2 Feb 2026 14:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B78C40A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042007;
	bh=tGB3B/XmOsiSYjYVNLGbWQjxROaS+y1B1N07ly1GPYw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L+DzIdOTqPmT1Zr5w79r+KL4YzRFbgS4YwPjgYfB5d5GY/785HDyS5xYEM5hhgVMC
	 LOrc+hpzMfquoBYlNtxuxkiRF2AMvfI/lSs8BLxjpz+IDvmIr6VIO5pDecUYbfOLi3
	 o6G5vmapXMo51IsfQVlN/FktHG1nuM17BGSijvIO0P2WfopDJWokADZAoHgE7uHjob
	 sirRl1ATU+iMVaO6911Fccjjn0iB5mjfZqp78Su2VgdNGFIiR04DwdJbojcMbivALR
	 AH5NOgSZxQyQn8+UG363C78twnTRM0okLUsP1JLWj97dbskLT8gIe0ZMvSPdd/ny32
	 dZ4rsCWZXuIhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B78C40A48;
	Mon,  2 Feb 2026 14:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4104F23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 373C081E2E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhYBuAecScMb for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:20:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E823481D21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E823481D21
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E823481D21
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4A73619F574;
 Mon,  2 Feb 2026 15:19:58 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:55634])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 02 Feb 2026 15:19:58 +0100
MIME-Version: 1.0
Date: Mon, 02 Feb 2026 15:19:58 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Vincent_Stehl=C3=A9?=
 <vincent.stehle@arm.com>
In-Reply-To: <39a51a3a-816f-4666-bfa1-4ed769cf88a3@smile.fr>
References: <20260124131337.1022030-1-ju.o@free.fr>
 <20260124131337.1022030-3-ju.o@free.fr>
 <82fffd9a-dcd8-4dc6-8f33-c85e8d3f836c@smile.fr>
 <a3c30c525a648b03b3ee9755fdcd6a4d@free.fr>
 <39a51a3a-816f-4666-bfa1-4ed769cf88a3@smile.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <f34c272d9ce129774ac2abe9db6a2675@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770042002;
 bh=zR0KR0icnoQ9taqQGwqgs/5Xnt1pnGEZXCZDeg/Mymc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=db/11B1vESb6OvIadItKWUeRxsvk6RnyHyHiODRhurwkGKFtbfF74A9sIlNnlVF8s
 xF6KwZ0oKMNlp0h1bAjHy0Qdw1YwRXVB+6Ee1/qfbiO5ra3QJjkuN74iKAA4ON19rE
 1q8kp0bU/uxHIvRoVqF8NPn5MQAKaMc7p9cWeREK5r/VG6z6JLHt7NwAB7PXCabfuM
 20BTRfoq/NkgB2+H4GsB0Ys0UoCHRmbvcAdE/SKjUMxSuBZbKkjmQjQbc/0Nnqp2Uv
 Ac904ukowLwRuZc29ER/oJ1+EPmtyu2Aakopq9DqndNwK4xc4MsjGWv6YZQ4IAmQTF
 7q3Nexnxi3Jjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=db/11B1v
Subject: Re: [Buildroot] [PATCH 3/3] boot/edk2: bump to version
 edk2-stable202511
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLCBBbGwsCgpPbiAwMi8wMi8yMDI2IDEwOjUxLCBSb21haW4gTmFvdXIgdmlhIGJ1
aWxkcm9vdCB3cm90ZToKPiBIZWxsbyBKdWxpZW4sIEFsbCwKPiAKPiBMZSAwMS8wMi8yMDI2IMOg
IDIyOjUzLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgo+PiBIaSBSb21haW4sCj4+IAo+PiBP
biAwMS8wMi8yMDI2IDIyOjIxLCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+
IEhlbGxvIEp1bGllbiwKPj4+IAo+Pj4gTGUgMjQvMDEvMjAyNiDDoCAxNDoxMywgSnVsaWVuIE9s
aXZhaW4gYSDDqWNyaXTCoDoKPj4+PiBGb3IgcmVsZWFzZSBub3RlcyBzaW5jZSBlZGsyLXN0YWJs
ZTIwMjUwOCwgc2VlOgo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxl
YXNlcy90YWcvZWRrMi1zdGFibGUyMDI1MTEKPj4+PiAKPj4+PiBUaGlzIGNvbW1pdCBhbHNvIHVw
ZGF0ZXMgdGhlIGVkazItcGxhdGZvcm1zIHBhY2thZ2VzIHdpdGggdGhlIGxhc3QKPj4+PiBjb21t
aXQgbWVyZ2VkIGF0IHRoZSBlZGsyIHJlbGVhc2UgZGF0ZSAoMjAyNS0xMS0xOSksIHdoaWNoIAo+
Pj4+IGNvcnJlc3BvbmRzCj4+Pj4gdG8gY29tbWl0IFsxXS4KPj4+PiBUaGUgZWRrMi1ub24tb3Np
IHBhY2thZ2UgaXMgYWxzbyB1cGRhdGVkIHRoZSBzYW1lIHdheSwgd2hpY2gKPj4+PiBjb3JyZXNw
b25kcyB0byBjb21taXQgWzJdLgo+Pj4+IAo+Pj4+IFRoaXMgY29tbWl0IGFsc28gYWRkcyBhbiBl
ZGsyLXBsYXRmb3JtcyBwYWNrYWdlIHBhdGNoIHRvIGZpeCBhIAo+Pj4+IE1hcnZlbGwKPj4+PiBi
dWlsZCBmYWlsdXJlIHNlZW4gd2l0aCB0aGUgU29saWRSdW4gTWFjY2hpYXRvQmluIHBsYXRmb3Jt
Lgo+Pj4+IAo+Pj4+IFRoaXMgY29tbWl0IGhhcyBiZWVuIHJ1bnRpbWUgdGVzdGVkIHdpdGggdGVz
dHMgdXNpbmcgRURLMiBwYWNrYWdlLAo+Pj4+IHdpdGggY29tbWFuZHM6Cj4+Pj4gCj4+Pj4gwqDC
oMKgIHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAo+Pj4+IMKgwqDCoMKgwqDCoMKgIC1kIGRs
IC1vIG91dHB1dF9mb2xkZXIgXAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdHMuYm9v
dC50ZXN0X2VkazIgXAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdHMuYm9vdC50ZXN0
X2dydWIuVGVzdEdydWJBQXJjaDY0RUZJIFwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRl
c3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViUmlzY1Y2NEVGSSBcCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1Ylg4NjY0RUZJIFwKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlc3RzLnBhY2thZ2UudGVzdF9md3RzCj4+Pj4gCj4+Pj4g
SXQgaGFzIGFsc28gYmVlbiBydW50aW1lIHRlc3RlZCAoYnkgYm9vdGluZyBpbiBxZW11KSB3aXRo
IGRlZmNvbmZpZ3MKPj4+PiB1c2luZyBFREsyIHBhY2thZ2U6Cj4+Pj4gcWVtdV9hYXJjaDY0X3Ni
c2FfZGVmY29uZmlnCj4+Pj4gcWVtdV9sb29uZ2FyY2g2NF92aXJ0X2VmaV9kZWZjb25maWcKPj4+
PiBxZW11X3Jpc2N2NjRfdmlydF9lZmlfZGVmY29uZmlnCj4+Pj4gcWVtdV94ODZfNjRfZWZpX2Rl
ZmNvbmZpZwo+Pj4+IAo+Pj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIt
cGxhdGZvcm1zLwo+Pj4+IGNvbW1pdC8xZTY0YzExMDlhZTJhYzAxODUzNTFlOGQwYzE5NzMyOTcw
ZDRmZWNmCj4+Pj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi1ub24tb3Np
Lwo+Pj4+IGNvbW1pdC85NGQwNDg5ODExMTZlMmUzZWRhNTJkYWQxYTg5OTU4ZWU0MDQwOThkCj4+
Pj4gCj4+Pj4gQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KPj4+PiBDYzogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4+Pj4gQ2M6IFZpbmNlbnQgU3RlaGzDqSA8
dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPgo+Pj4+IC0tLQo+Pj4+IFRoZSBlZGsyLXBsYXRmb3JtcyBwYXRjaCBj
b250YWlucyBDUi1MRiBsaW5lIGVuZGluZ3MsIHdoaWNoIG1pZ2h0IGJlIAo+Pj4+IGNoYW5nZWQK
Pj4+PiBieSB0aGUgbWFpbGluZyBsaXN0IHRvIExGLiBUaGlzIGNhbiBtYWtlIHRoZSBwYXRjaCBu
b3QgYXBwbHkgCj4+Pj4gY2xlYW5seS4gRm9yCj4+Pj4gY29udmVuaWVuY2UsIEkgYWxzbyBwdWJs
aXNoZWQgdGhvc2UgcGF0Y2hlcyBhdDoKPj4+PiBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4v
YnVpbGRyb290Ly0vY29tbWl0cy9idW1wX2VkazItc3RhYmxlMjAyNTExCj4+Pj4gLS0tCj4+Pj4g
wqBDb25maWcuaW4ubGVnYWN5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKwo+Pj4+IMKgYm9vdC9lZGsyL0NvbmZpZy5pbsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMiAr
LS0KPj4+PiDCoGJvb3QvZWRrMi9lZGsyLmhhc2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+Pj4gwqBib290L2VkazIvZWRrMi5t
a8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMTUgKy0tLQo+Pj4+IMKgcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2jC
oMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4+IMKgcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1u
b24tb3NpLm1rwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+Pj4gwqAuLi5NYXJ2ZWxsLWZp
eC1TTUJJT1MtdHlwZS03LXN0cnVjdHVyZXMucGF0Y2ggfCA4MCAKPj4+PiArKysrKysrKysrKysr
KysrKysrCj4+Pj4gwqBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2jC
oMKgwqAgfMKgIDIgKy0KPj4+PiDCoHBhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9y
bXMubWvCoMKgwqDCoMKgIHzCoCAyICstCj4+Pj4gwqA5IGZpbGVzIGNoYW5nZWQsIDk3IGluc2Vy
dGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+Pj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+Pj4+
IHBhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvMDAwMS1TaWxpY29uLU1hcnZlbGwtZml4LVNNQklPUy0K
Pj4+PiB0eXBlLTctc3RydWN0dXJlcy5wYXRjaAo+Pj4+IAo+Pj4gCj4+PiAuLi4KPj4+IAo+Pj4+
IGRpZmYgLS1naXQgYS9ib290L2VkazIvZWRrMi5tayBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4+Pj4g
aW5kZXggMmMwODlhZWZjYS4uZGJhNGFlZDUxMyAxMDA2NDQKPj4+PiAtLS0gYS9ib290L2VkazIv
ZWRrMi5tawo+Pj4+ICsrKyBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4+Pj4gQEAgLTQsNyArNCw3IEBA
Cj4+Pj4gwqAjCj4+Pj4gwqAKPj4+PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Pj4+IAo+Pj4+
IC1FREsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjUwOAo+Pj4+ICtFREsyX1ZFUlNJT04gPSBl
ZGsyLXN0YWJsZTIwMjUxMQo+Pj4+IMKgRURLMl9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3Rp
YW5vY29yZS9lZGsyCj4+Pj4gwqBFREsyX1NJVEVfTUVUSE9EID0gZ2l0Cj4+Pj4gwqBFREsyX0xJ
Q0VOU0UgPSBCU0QtMi1DbGF1c2UtUGF0ZW50Cj4+Pj4gQEAgLTU2LDE0ICs1Niw3IEBAIEVESzJf
R0lUX1NVQk1PRFVMRVMgPSBZRVMKPj4+PiDCoEVESzJfQlVJTERfUEFDS0FHRVMgPSAkKEBEKS9C
dWlsZC9CdWlsZHJvb3QKPj4+PiDCoEVESzJfUEFDS0FHRVNfUEFUSFMgPSAkKEBEKSAkKEVESzJf
QlVJTERfUEFDS0FHRVMpIAo+Pj4+ICQoU1RBR0lOR19ESVIpL3Vzci9zaGFyZS8KPj4+PiBlZGsy
LXBsYXRmb3Jtcwo+Pj4+IAo+Pj4+IC1pZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9P
Vk1GX0kzODYpLHkpCj4+Pj4gLUVESzJfQVJDSCA9IElBMzIKPj4+PiAtRURLMl9ERVBFTkRFTkNJ
RVMgKz0gaG9zdC1uYXNtCj4+Pj4gLUVESzJfUEFDS0FHRV9OQU1FID0gT3ZtZlBrZwo+Pj4+IC1F
REsyX1BMQVRGT1JNX05BTUUgPSBPdm1mUGtnSWEzMgo+Pj4+IC1FREsyX0JVSUxEX0RJUiA9IE92
bWZJYTMyCj4+Pj4gLQo+Pj4+IC1lbHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JN
X09WTUZfWDY0KSx5KQo+Pj4+ICtpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9PVk1G
X1g2NCkseSkKPj4+PiDCoEVESzJfQVJDSCA9IFg2NAo+Pj4+IMKgRURLMl9ERVBFTkRFTkNJRVMg
Kz0gaG9zdC1uYXNtCj4+Pj4gwqBFREsyX1BBQ0tBR0VfTkFNRSA9IE92bWZQa2cKPj4+PiBAQCAt
NzQsMTMgKzY3LDEzIEBAIGVsc2UgaWZlcSAKPj4+PiAoJChCUjJfVEFSR0VUX0VESzJfUExBVEZP
Uk1fQVJNX1ZJUlRfUUVNVSkseSkKPj4+PiDCoEVESzJfQVJDSCA9IEFBUkNINjQKPj4+PiDCoEVE
SzJfUEFDS0FHRV9OQU1FID0gQXJtVmlydFBrZwo+Pj4+IMKgRURLMl9QTEFURk9STV9OQU1FID0g
QXJtVmlydFFlbXUKPj4+PiAtRURLMl9CVUlMRF9ESVIgPSAkKEVESzJfUExBVEZPUk1fTkFNRSkt
JChFREsyX0FSQ0gpCj4+Pj4gK0VESzJfQlVJTERfRElSID0gJChFREsyX1BMQVRGT1JNX05BTUUp
LUFBcmNoNjQKPj4+PiAKPj4+PiDCoGVsc2UgaWZlcSAoJChCUjJfVEFSR0VUX0VESzJfUExBVEZP
Uk1fQVJNX1ZJUlRfUUVNVV9LRVJORUwpLHkpCj4+Pj4gwqBFREsyX0FSQ0ggPSBBQVJDSDY0Cj4+
Pj4gwqBFREsyX1BBQ0tBR0VfTkFNRSA9IEFybVZpcnRQa2cKPj4+PiDCoEVESzJfUExBVEZPUk1f
TkFNRSA9IEFybVZpcnRRZW11S2VybmVsCj4+Pj4gLUVESzJfQlVJTERfRElSID0gJChFREsyX1BM
QVRGT1JNX05BTUUpLSQoRURLMl9BUkNIKQo+Pj4+ICtFREsyX0JVSUxEX0RJUiA9ICQoRURLMl9Q
TEFURk9STV9OQU1FKS1BQXJjaDY0Cj4+PiAKPj4+IEl0IHNlZW1zIHRoZSBjb21taXQgbG9nIGRv
ZXNuJ3QgZXhwbGFpbiB0aGlzIGNoYW5nZS4KPj4gCj4+IFlvdSBhcmUgY29ycmVjdC4gSSBmb3Jn
b3QgdG8gaW5jbHVkZSB0aGUgZXhwbGFuYXRpb24uCj4+IAo+PiBUaGUgZm9sbG93aW5nIHRleHQg
c2hvdWxkIGJlIGFkZGVkIGluIHRoZSBjb21taXQgbG9nOgo+PiAKPj4gIiIiCj4+IFVwc3RyZWFt
IGNvbW1pdCBbM10gcmVtb3ZlZCB0aGUgMzJiaXQgQVJNIFZpcnR1YWwgUGxhdGZvcm1zLiBUaGUK
Pj4gc3BlY2lmaWMgY2hhbmdlIFs0XSBjaGFuZ2VkIGEgIiQoQVJDSCkiIHRvICJBQXJjaDY0Ii4g
UG9zc2libGUKPj4gdmFsdWVzIGZvciAiJChBUkNIKSIgd2VyZSAiQUFSQ0g2NCIgb3IgIkFSTSIu
IFNpbmNlIExpbnV4IGhhcwo+PiBhIGNhc2Ugc2Vuc2l0aXZlIGZpbGVzeXN0ZW0sIHRoZSBFREsy
X0JVSUxEX0RJUiB2YWx1ZXMgbmVlZHMgdG8gYmUKPj4gdXBkYXRlZCBhY2NvcmRpbmdseS4KPj4g
Cj4+IFszXSBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvY29tbWl0Lwo+PiBiNDcx
ZWQyOTY5NGMzNzVlYTFiNmI0ODRlYjcxYWY3M2VkNjFmZWNlCj4+IFs0XSBodHRwczovL2dpdGh1
Yi5jb20vdGlhbm9jb3JlL2VkazIvY29tbWl0Lwo+PiBiNDcxZWQyOTY5NGMzNzVlYTFiNmI0ODRl
YjcxYWY3M2VkNjFmZWNlI2RpZmYtNTUyMDBhYzkzNGJiZTZlODFiYjQxNThiZmZmNDc5Nzk5MmIx
M2ZiMWFmYjk1ZmU5ODI4NTMwMjRjNjAxODQzMEwyMC1SMjEKPj4gIiIiCj4+IAo+PiBGb3IgY29u
dmVuaWVuY2UsIEkndmUgYWxzbyBwdWJsaXNoZWQgdGhpcyB1cGRhdGVkIGNvbW1pdCBsb2cgYXQ6
Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9jb21taXRzL2J1bXBf
ZWRrMi1zdGFibGUyMDI1MTFfdjIKPj4gCj4+IFRlbGwgbWUgaWYgeW91IHdhbnQgbWUgdG8gc2Vu
ZCBhIHYyIG9uIHRoZSBsaXN0Lgo+IAo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4KPiAKPiBGb3Ig
dGhlIHVwY29taW5nIDIwMjYuMDIgcmVsZWFzZSwgSSdtIG5vdCBzdXJlIGlmIHdlIHNob3VsZCBt
ZXJnZSB0aGlzIAo+IHNlcmllcwo+IHJpZ2h0IG5vdy4gSW5kZWVkIHVwc3RyZWFtIEVESzIgcmVt
b3ZlZCB0aGUgSUEzMiBzdXBwb3J0LCBzbyB3ZSBoYXZlIHRvIAo+IGZvbGxvdwo+IHVwc3RyZWFt
IGNoYW5nZSBmb3IgdGhlIGxvbmctdGVybSBidXQgd2Ugc3VkZGVubHkgcmVtb3ZlIGl0IGZyb20g
Cj4gQnVpbGRyb290IHdoaWxlCj4gdXBzdHJlYW0gc3RpbGwgcHJvdmlkZSBhIHNwZWNpZmljIGJy
YW5jaCBmb3IgImFueSBsb25nIHRlcm0gY29uc3VtZXJzIi4KPiAKPiBJbiBhbiBvdGhlciBoYW5k
LCB0aGUgMjAyNi4wMiByZWxlYXNlIHdpbGwgbm90IGJlIGFuIExUUyByZWxlYXNlIChzZWUKPiBo
dHRwczovL2J1aWxkcm9vdC5vcmcvbHRzLmh0bWwpLgo+IAo+IFRob3VnaHRzPwoKU2luY2UgMjAy
Ni4wMiB3aWxsIG5vdCBiZSBhIEJ1aWxkcm9vdCBMVFMgdmVyc2lvbiwgaXQgZG9lcyBub3QgcmVh
bGx5IAptYXR0ZXIKaWYgdGhpcyBwYXRjaCBpcyBhcHBsaWVkIG5vdyBvZiBqdXN0IGFmdGVyIHRo
ZSB1cGNvbWluZyAyMDI2LjAyIHRhZy4gSXQgCndpbGwKanVzdCBleHRlbmQgYnkgdGhpcyBJQTMy
IGFuZCBBUk0zMiBzdXBwb3J0IGJ5IDMgbW9udGhzICh3aGljaCBpcyBub3QgCm11Y2gpLgoKSSBh
bSBnZW5lcmFsbHkgaW5jbGluZWQgdG8gZm9sbG93IHRoZSB1cHN0cmVhbSBkZWNpc2lvbnMgYW5k
IHRvIGtlZXAKcGFja2FnZXMgdXAgdG8gZGF0ZS4gU28gSSBiZWxpZXZlIHdlIHdpbGwgcmVtb3Zl
IHRoaXMgc3VwcG9ydCBzb29uZXIgb2YKbGF0ZXIuIEkgaGF2ZSBubyBvcGluaW9uIGlmIHdlIHNo
b3VsZCBkbyB0aGF0IGJlZm9yZSBvciBhZnRlciB0aGUgCjIwMjYuMDIuCkluIGFueSBjYXNlcywg
dGhlIHByZXZpb3VzIEVESzIgdmVyc2lvbiB0aGF0IHN0aWxsIHN1cHBvcnRzIHRob3NlCmFyY2hp
dGVjdHVyZXMgYXJlIGluIHRoZSBCdWlsZHJvb3QgTFRTLiBTbyB3ZSBjb3VsZCBldmVudHVhbGx5
IHBpY2sKdGhvc2UgRURLMiBtYWludGVuYW5jZSB2ZXJzaW9ucyBmb3IgQnVpbGRyb290IExUUyBi
cmFuY2hlcy4KCkkgbGV0IG90aGVycyBjb21tZW50IG9uIHRoYXQgdG9waWMsIGlmIG5lZWRlZC4K
Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+PiAKPj4+IEJlc3QgcmVnYXJkcywKPj4+
IFJvbWFpbgo+PiAKPj4gQmVzdCByZWdhcmRzLAo+PiAKPj4gSnVsaWVuLgoKQmVzdCByZWdhcmRz
LAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
