Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F3C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E1D2811AC;
	Sun, 18 May 2025 14:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWbiC_Zh0BLI; Sun, 18 May 2025 14:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6075E80DE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6075E80DE4;
	Sun, 18 May 2025 14:42:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA7F1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC4E40C21
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSHaTrSiZlKh for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:42:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0CB92404F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CB92404F0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CB92404F0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF50E1C102D; Sun, 18 May 2025 16:42:08 +0200 (CEST)
Message-ID: <063cd7bc-bd70-4a18-b833-df8c4402de72@rnout.be>
Date: Sun, 18 May 2025 16:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250516134151.203697-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516134151.203697-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579329; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wPviBECx0ATq/AO/+7WjuJL2vGsdOYIKVCSqpXbRFao=;
 b=UXNp94ZEjQYIqxp4DCfiLVfTGEkoFR1aJ8VGliP7YxA2rsndx3U3jSm/8zpcY7LFPB9RdN
 9NjchHm7GhB3CJ7XO7U3tFkD24w1ewIjVzdPWW+c6WSJLHW4cKpA5GtRv6Hs0te/rO3lcw
 zGiH8V5bGNXCu0u+oHqal9isaKr9G1iHVoXkW9Wn9MxhTLPFoYmM28H0PMzefIx7LOpUKd
 Gtul4Tceh4+BDQAKNqnmqjMy1GnPTkk9WzODDKyAGwQOppCgKzg689lQTZvWiysi6JhTNg
 rPjFwIBhTp2jlfdmcrGXO+kp0VGUEYjZ+TQzqnWSM6n6G1amlCjjOfgUOLVBJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UXNp94ZE
Subject: Re: [Buildroot] [PATCH] package/android-tools: add patch to fix GCC
 15.x build issue
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8wNS8yMDI1IDE1OjQxLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gaG9zdC1hbmRyb2lkLXRvb2xzIGZhaWxzIHRvIGJ1aWxkIHdoZW4gdGhlIGhvc3QgZ2Nj
IHZlcnNpb24gaXMgPj0KPiAxNS54LiBBIHNpbXBsZSBwYXRjaCBhbGxvd3MgdG8gZml4IHRoZSBp
c3N1ZSBieSBhZGp1c3RpbmcgaG93Cj4gYWxsb2NhdGVfaW5vZGUoKSBnZXRzIGNhbGxlZC4KPiAK
PiBGaXhlczoKPiAKPiAgICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMv
ZTgxNTI0OTA1NDBlZTE5NjgxODJmNGViNzgxM2U1ZTk0MGYzZTliMy8KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKICBB
cHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0K
PiAgIC4uLnMtY29udGVudHMuYy1hbGxvY2F0ZV9pbm9kZS1kb2Vzbi10LS5wYXRjaCB8IDU3ICsr
KysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hbmRyb2lkLXRvb2xzLzAwMTctZXh0cmFzLWV4
dDRfdXRpbHMtY29udGVudHMuYy1hbGxvY2F0ZV9pbm9kZS1kb2Vzbi10LS5wYXRjaAo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2FuZHJvaWQtdG9vbHMvMDAxNy1leHRyYXMtZXh0NF91dGlscy1j
b250ZW50cy5jLWFsbG9jYXRlX2lub2RlLWRvZXNuLXQtLnBhdGNoIGIvcGFja2FnZS9hbmRyb2lk
LXRvb2xzLzAwMTctZXh0cmFzLWV4dDRfdXRpbHMtY29udGVudHMuYy1hbGxvY2F0ZV9pbm9kZS1k
b2Vzbi10LS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
YTliYWY0ZGMyOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2FuZHJvaWQtdG9vbHMv
MDAxNy1leHRyYXMtZXh0NF91dGlscy1jb250ZW50cy5jLWFsbG9jYXRlX2lub2RlLWRvZXNuLXQt
LnBhdGNoCj4gQEAgLTAsMCArMSw1NyBAQAo+ICtGcm9tIGI4MjJjOGUyZjM4MGJhNjE1ODYwMWU2
MjFhMTI5MjdhNDI2NGZmNjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IFRob21h
cyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gK0RhdGU6IEZyaSwg
MTYgTWF5IDIwMjUgMTU6MzI6MDAgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBleHRyYXMvZXh0
NF91dGlscy9jb250ZW50cy5jOiBhbGxvY2F0ZV9pbm9kZSgpIGRvZXNuJ3QgdGFrZQo+ICsgYW55
IGFyZ3VtZW50Cj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+
ICtGaXhlczoKPiArCj4gKy9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVp
bGQvaG9zdC1hbmRyb2lkLXRvb2xzLTQuMi4yK2dpdDIwMTMwMjE4L2V4dHJhcy9leHQ0X3V0aWxz
L2NvbnRlbnRzLmM6IEluIGZ1bmN0aW9uIOKAmG1ha2VfZGlyZWN0b3J54oCZOgo+ICsvaG9tZS90
aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtYW5kcm9pZC10b29scy00
LjIuMitnaXQyMDEzMDIxOC9leHRyYXMvZXh0NF91dGlscy9jb250ZW50cy5jOjEwMjoyOTogZXJy
b3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhhbGxvY2F0ZV9pbm9kZeKAmTsg
ZXhwZWN0ZWQgMCwgaGF2ZSAxCj4gKyAgMTAyIHwgICAgICAgICAgICAgICAgIGlub2RlX251bSA9
IGFsbG9jYXRlX2lub2RlKGluZm8pOwo+ICsKPiArYW5kIHNpbWlsYXIgYnVpbGQgZmFpbHVyZXMg
dGhhdCBvY2N1ciB3aXRoIEdDQyAxNS54Lgo+ICsKPiArVXBzdHJlYW06IE4vQSwgd2UncmUgdG9v
IGZhciBmcm9tIHVwc3RyZWFtCj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRo
b21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gKy0tLQo+ICsgZXh0cmFzL2V4dDRfdXRpbHMv
Y29udGVudHMuYyB8IDYgKysrLS0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2V4dHJhcy9leHQ0X3V0aWxzL2Nv
bnRlbnRzLmMgYi9leHRyYXMvZXh0NF91dGlscy9jb250ZW50cy5jCj4gK2luZGV4IDYzMDA2ODAu
LmIwMzM2YTQgMTAwNjQ0Cj4gKy0tLSBhL2V4dHJhcy9leHQ0X3V0aWxzL2NvbnRlbnRzLmMKPiAr
KysrIGIvZXh0cmFzL2V4dDRfdXRpbHMvY29udGVudHMuYwo+ICtAQCAtOTksNyArOTksNyBAQCB1
MzIgbWFrZV9kaXJlY3RvcnkodTMyIGRpcl9pbm9kZV9udW0sIHUzMiBlbnRyaWVzLCBzdHJ1Y3Qg
ZGVudHJ5ICpkZW50cmllcywKPiArIAlsZW4gPSBibG9ja3MgKiBpbmZvLmJsb2NrX3NpemU7Cj4g
Kwo+ICsgCWlmIChkaXJfaW5vZGVfbnVtKSB7Cj4gKy0JCWlub2RlX251bSA9IGFsbG9jYXRlX2lu
b2RlKGluZm8pOwo+ICsrCQlpbm9kZV9udW0gPSBhbGxvY2F0ZV9pbm9kZSgpOwo+ICsgCX0gZWxz
ZSB7Cj4gKyAJCWRpcl9pbm9kZV9udW0gPSBFWFQ0X1JPT1RfSU5POwo+ICsgCQlpbm9kZV9udW0g
PSBFWFQ0X1JPT1RfSU5POwo+ICtAQCAtMTY3LDcgKzE2Nyw3IEBAIHUzMiBtYWtlX2ZpbGUoY29u
c3QgY2hhciAqZmlsZW5hbWUsIHU2NCBsZW4pCj4gKyAJc3RydWN0IGV4dDRfaW5vZGUgKmlub2Rl
Owo+ICsgCXUzMiBpbm9kZV9udW07Cj4gKwo+ICstCWlub2RlX251bSA9IGFsbG9jYXRlX2lub2Rl
KGluZm8pOwo+ICsrCWlub2RlX251bSA9IGFsbG9jYXRlX2lub2RlKCk7Cj4gKyAJaWYgKGlub2Rl
X251bSA9PSBFWFQ0X0FMTE9DQVRFX0ZBSUxFRCkgewo+ICsgCQllcnJvcigiZmFpbGVkIHRvIGFs
bG9jYXRlIGlub2RlXG4iKTsKPiArIAkJcmV0dXJuIEVYVDRfQUxMT0NBVEVfRkFJTEVEOwo+ICtA
QCAtMTk2LDcgKzE5Niw3IEBAIHUzMiBtYWtlX2xpbmsoY29uc3QgY2hhciAqZmlsZW5hbWUsIGNv
bnN0IGNoYXIgKmxpbmspCj4gKyAJdTMyIGlub2RlX251bTsKPiArIAl1MzIgbGVuID0gc3RybGVu
KGxpbmspOwo+ICsKPiArLQlpbm9kZV9udW0gPSBhbGxvY2F0ZV9pbm9kZShpbmZvKTsKPiArKwlp
bm9kZV9udW0gPSBhbGxvY2F0ZV9pbm9kZSgpOwo+ICsgCWlmIChpbm9kZV9udW0gPT0gRVhUNF9B
TExPQ0FURV9GQUlMRUQpIHsKPiArIAkJZXJyb3IoImZhaWxlZCB0byBhbGxvY2F0ZSBpbm9kZVxu
Iik7Cj4gKyAJCXJldHVybiBFWFQ0X0FMTE9DQVRFX0ZBSUxFRDsKPiArLS0KPiArMi40OS4wCj4g
KwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
