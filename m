Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74300E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 12:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF27417A7;
	Fri, 13 Dec 2024 12:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hggvEzJ0JXr; Fri, 13 Dec 2024 12:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5A2417A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5A2417A9;
	Fri, 13 Dec 2024 12:51:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5E3DECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 12:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C478C40120
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 12:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10vLthlq_fwJ for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 12:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 521C6433AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 521C6433AB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 521C6433AB
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 12:51:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1306E0003;
 Fri, 13 Dec 2024 12:51:07 +0000 (UTC)
Date: Fri, 13 Dec 2024 13:51:06 +0100
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>
Message-ID: <20241213135106.09ccf67f@windsurf>
In-Reply-To: <20241211-fix_gcc14_libsha1-v1-1-c9647718ccc2@bootlin.com>
References: <20241211-fix_gcc14_libsha1-v1-1-c9647718ccc2@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734094268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VyRE5rLnscQl1tPfJeDtdv3ZPUxCVnIFDrbYvVWaHgw=;
 b=o9osn+56kTdOxhzprSWRdGYP+0WOl5QF1SIVz9XQQQoVAvmf8ztXKidARSR4bk/DiSMjlY
 PI6RBHAIeD9wGexmC5xnK6Xe4CRovQeqixF53dDCI0L09AdW2Ul/Qn9kYNGMxl5tuus4J6
 WYqdt807OCDwNkutzF1RLzJQrXnNqA7+t8FIbAhmkr0utRFtNg/swbFOSbqTJ88xxq4S9M
 qeNmIA6LNN1UNDYFLdG1IhEWE5zDXQ09mSsHkNLIGucfbp0lMinJ2MfwUAij+yHmv2s0/G
 fqt4+sMNDcmh+GrZlmiXz4cpoEFNBOEDZ0yyznYVfTPhV2WRbJr/T+2G4dt4Ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o9osn+56
Subject: Re: [Buildroot] [PATCH] package/libsha1: Fix gcc14 compilation in
 libsha1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghCgpPbiBXZWQsIDExIERlYyAyMDI0
IDIwOjQ1OjE1ICswMTAwClRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVmaWxsZUBib290
bGluLmNvbT4gd3JvdGU6Cgo+IEdDQzE0IHJlbW92ZWQgdGhlIGltcGxpY2l0IGludCBzdXBwb3J0
Lgo+IFRoaXMgY29tbWl0IGFkZHMgYSBwYXRjaCB0byBsaWJzaGExIHRvIGZpeCBhbiBpbXBsaWNp
dCBpbnQgZGVjbGFyYXRpb24KPiBhcyByZWNvbW1lbmRlZC4KPiAKPiBMaW5rOiBodHRwczovL2dj
Yy5nbnUub3JnL2djYy0xNC9wb3J0aW5nX3RvLmh0bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgQm9ubmVmaWxsZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+CgpIb3cgZGlkIHlv
dSBub3RpY2UgdGhpcyBpc3N1ZT8gSXMgdGhlcmUgYW4gYXV0b2J1aWxkZXIgZmFpbHVyZT8KCkl0
IGxvb2tzIGxpa2UgeWVzLCBzbyB5b3Ugc2hvdWxkIGFkZDoKCkZpeGVzOgoKICBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy84N2RjOWJhOTY5MGNiYjZhODI4NzU3MzRjZTlj
YjhkYmFmODc4ZTQ2LwoKKGhpbnQ6IHlvdSBjYW4gc2VhcmNoIGF1dG9idWlsZGVyIHJlc3VsdHMg
YnkgZmFpbHVyZSByZWFzb24sCnVzaW5nIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC8/
cmVhc29uPWxpYnNoYSUgZm9yIGV4YW1wbGUpLgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJz
aGExLzAwMDEtdGVzdC1maXgtZ2NjLTE0LngtY29tcGlsZS1pbXBsaWNpdC1pbnQucGF0Y2ggYi9w
YWNrYWdlL2xpYnNoYTEvMDAwMS10ZXN0LWZpeC1nY2MtMTQueC1jb21waWxlLWltcGxpY2l0LWlu
dC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZTczMTZiYThmZTU1ZTVmNWUzNWM5YWZhN2UxZDU1MTg1
YjBhZWIxYQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xpYnNoYTEvMDAwMS10ZXN0
LWZpeC1nY2MtMTQueC1jb21waWxlLWltcGxpY2l0LWludC5wYXRjaAo+IEBAIC0wLDAgKzEsMzcg
QEAKPiArRnJvbSAxOTg3YjVmMjY0OGM4NTUzNmYxOWYxMWE4OGJhODk2OTUzYmQwMjU4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBUaG9tYXMgQm9ubmVmaWxsZSA8dGhvbWFzLmJv
bm5lZmlsbGVAYm9vdGxpbi5jb20+Cj4gK0RhdGU6IFdlZCwgMTEgRGVjIDIwMjQgMjA6MTc6NTcg
KzAxMDAKPiArU3ViamVjdDogW1BBVENIXSB0ZXN0OiBmaXggZ2NjLTE0LnggY29tcGlsZSAoaW1w
bGljaXQgaW50KQo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxh
aW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsK
PiArRml4ZXM6Cj4gKwo+ICsgIHRlc3QuYzoxNDo4OiBlcnJvcjogdHlwZSBkZWZhdWx0cyB0byDi
gJhpbnTigJkgaW4gZGVjbGFyYXRpb24gb2Yg4oCYbnVtX3Rlc3TigJkgWy1XaW1wbGljaXQtaW50
XQo+ICsgICAgIDE0IHwgc3RhdGljIG51bV90ZXN0Owo+ICsgICAgICAgIHwgICAgICAgIF5+fn5+
fn5+Cj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3BzZWlkZXJlci9saWJzaGEx
L2NvbW1pdC9kNDQ5ZjI2Zjc4MmJlOTFiMzg0N2Y4OGVkMmJkOTM3NTgyYTU3NWI2Cj4gKwo+ICtT
aWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CgpJZiB0aGUg
dXBzdHJlYW0gaXMgZnJvbSBQZXRlciwgaGUgc2hvdWxkIGFwcGVhciBhcyBhbiBhdXRob3IsIGFu
ZCB5b3UKc2hvdWxkIGFkZCB5b3VyIFNvQiBiZWxvdyBQZXRlcidzIFNvQi4gSSdtIG5vdCBzdXJl
IGhvdyB5b3UgbWFuYWdlZCB0bwpnZW5lcmF0ZSB0aGUgYWJvdmUgcGF0Y2gsIGJ1dCB5b3Ugc2hv
dWxkIGhhdmUgdXNlZCBnaXQgZm9ybWF0LXBhdGNoLAp3aGljaCB3b3VsZCBoYXZlIGdvdHRlbiB0
aGUgRnJvbTogZmllbGQgcHJvcGVybHkgcG9pbnRpbmcgdG8gUGV0ZXIgYXMKdGhlIGF1dGhvci4K
CkNvdWxkIHlvdSBhZGp1c3QgdGhvc2UgZGV0YWlscyBhbmQgc2VuZCBhIHYyPwoKVGhhbmtzIGEg
bG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
