Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AC5E74AD8
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD518846B4;
	Tue,  3 Dec 2024 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEY2bNfwVRgO; Tue,  3 Dec 2024 21:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A69846B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A69846B5;
	Tue,  3 Dec 2024 21:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B56122073
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 952204290B
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXS8tGY71Oaf for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 21:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 286B042947
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286B042947
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 286B042947
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:20:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CA65919F59C;
 Tue,  3 Dec 2024 22:20:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52566])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 22:20:34 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 22:20:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: Jannik Becher <becher.jannik@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <e1f1a937-1679-4c79-98ea-3ce33836b92f@gmail.com>
References: <e1f1a937-1679-4c79-98ea-3ce33836b92f@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <95548cc1a7dd601a39d06d8f7290ea8a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733260837;
 bh=Wt2rxwzCorB3pM1g0Tx4qny2AI1fKMs8o/ErvIqACOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L/ONcOJg9Oa8WJqvEox3dmMoxcPETz2aGLFaiCCrijLifSxHYSoyKpkeWpYLS/8DS
 ZI0pQZC74QPHWzPS2xWvNkSAGOx/IAUkMBrO7tTkEQQ+J5kKgzptxEBW7InvjplBWz
 n6+yf8yCgzu5Z895Vq6LsGU0WJCti00LnevT17/bTKeV5MQOsId6vq01XFK249n9wN
 Xx6OPx7WaGYpNjcnPuqTaE0U1YtXpGC59XZHKqcIhpc+uoOHP7LDpvGp/9b6/ZeJNg
 Dekr0YA/elfhFKnR6aVOIBwyJgVF+U2j/iJzFVM6ggVGFqdoR1x/1xjNLAVpb9n/Rl
 +k5uDasOlsNog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L/ONcOJg
Subject: Re: [Buildroot] [PATCH 1/2] package/igh-ethercat: bump version to
 1.6.2
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

SGkgSmFubmlrLAoKT24gMDMvMTIvMjAyNCAwNjowNywgSmFubmlrIEJlY2hlciB3cm90ZToKPiBG
cm9tIGIwMWYwZTJjMGNmMThkMjVmYjQ5ZWIyOTM0YjI1YTVlODY1ODEwZmUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCj4gRnJvbTogSmFubmlrIEJlY2hlciA8YmVjaGVyLmphbm5pa0BnbWFpbC5j
b20+Cj4gRGF0ZTpNb24sIDIgRGVjIDIwMjQgMTk6NTA6MDkgKzAxMDAKPiBTdWJqZWN0OiBbUEFU
Q0ggMS8yXSBwYWNrYWdlL2lnaC1ldGhlcmNhdDogYnVtcCB2ZXJzaW9uIHRvIDEuNi4yCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFubmlrIEJlY2hlciA8YmVjaGVyLmphbm5pa0BnbWFpbC5jb20+Cj4g
LS0tCj4gcGFja2FnZS9pZ2gtZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lmhhc2ggfCAyICstCj4gcGFj
a2FnZS9pZ2gtZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lm1rIMKgwqB8IDEgKwo+IDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvaWdoLWV0aGVyY2F0L2lnaC1ldGhlcmNhdC5oYXNoIAo+IGIvcGFja2FnZS9pZ2gtZXRo
ZXJjYXQvaWdoLWV0aGVyY2F0Lmhhc2gKPiBpbmRleCA2N2ExNTJjNmFlLi4xYTc3MmQ3ZWE2IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvaWdoLWV0aGVyY2F0L2lnaC1ldGhlcmNhdC5oYXNoCj4gKysr
IGIvcGFja2FnZS9pZ2gtZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lmhhc2gKPiBAQCAtMSw0ICsxLDQg
QEAKPiAjIExvY2FsbHkgY29tcHV0ZWQKPiAtc2hhMjU2IAo+IMKgN2U0ZDhmMzQ5N2MwYmMwYjY0
YTE1MWMwZDA3NDM0OWZlNzYxNDc2NzU2MzY0MmQ2ZmVkYjE5NTY3ZWFmYTFlMSAKPiDCoGlnaC1l
dGhlcmNhdC1mNWRjMTA5MTc2NDAwZjU0MGE4NjgyYTJjOWVlMjBkNDExZDE0ZDYxLnRhcgo+IC5n
ego+ICtzaGEyNTYgCj4gwqAzZGRkMTY4NzMyN2M5YzU4OWUzYjUzZGM2ZmRlMmU2MGQ3NmFiYTA3
ZTg2NjJiZjQ2ZTUxODA3ZmY3ODE1MjE0IAo+IMKgaWdoLWV0aGVyY2F0LWNhNjZjZDZhZTliODIx
YmZiZWM2ZDY4ZWUxYjQzZGEzNTljNTg5NGMudGFyCj4gLmd6Cj4gc2hhMjU2IAo+IMKgMjMxZjdl
ZGNjNzM1MmQ3NzM0YTk2ZWVmMGI4MDMwZjc3OTgyNjc4YzUxNjg3NmZjYjgxZTI1YjMyZDY4NTY0
YyAKPiDCoENPUFlJTkcKPiBzaGEyNTYgCj4gwqBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJj
NzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxIAo+IMKgQ09QWUlORy5MRVNTRVIK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pZ2gtZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lm1rIAo+IGIv
cGFja2FnZS9pZ2gtZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lm1rCj4gaW5kZXggNWI2MThhYjU0YS4u
MGQzNmI2ZDcyNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2lnaC1ldGhlcmNhdC9pZ2gtZXRoZXJj
YXQubWsKPiArKysgYi9wYWNrYWdlL2lnaC1ldGhlcmNhdC9pZ2gtZXRoZXJjYXQubWsKPiBAQCAt
NSw2ICs1LDcgQEAKPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+IAo+IAo+IElHSF9FVEhFUkNB
VF9WRVJTSU9OID0gZjVkYzEwOTE3NjQwMGY1NDBhODY4MmEyYzllZTIwZDQxMWQxNGQ2MQo+ICtJ
R0hfRVRIRVJDQVRfVkVSU0lPTiA9IGNhNjZjZDZhZTliODIxYmZiZWM2ZDY4ZWUxYjQzZGEzNTlj
NTg5NGMKClRoaXMgcGF0Y2ggYWRkcyBhIG5ldyB2ZXJzaW9uICJjYTY2Yy4uLiIgYnV0IGRvZXMg
bm90IHJlbW92ZSB0aGUgb2xkIApvbmUuCkNvdWxkIHlvdSBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2gg
cmVtb3ZpbmcgdGhlIG9sZCB2ZXJzaW9uIHBsZWFzZT8KCkFsc28sIHRoZSBjb21taXQgbG9nIG9u
ZSBsaW5lciBtZW50aW9uIGEgYnVtcCB0byAxLjYuMi4gVGhlIHRhZyBwb2ludHMgCnRvIGEKZGlm
ZmVyZW50IGNvbW1pdC4gU2VlOgpodHRwczovL2dpdGxhYi5jb20vZXRoZXJsYWIub3JnL2V0aGVy
Y2F0Ly0vY29tbWl0cy8xLjYuMj9yZWZfdHlwZT10YWdzCgpJcyB0aGlzIGludGVuZGVkPyBpLmUu
IGRvIHlvdSBuZWVkIHRoZSBjb21taXQKaHR0cHM6Ly9naXRsYWIuY29tL2V0aGVybGFiLm9yZy9l
dGhlcmNhdC8tL2NvbW1pdC81ODAyYzcyODE4ZGYwN2QzNDQ2OTYzMGE4OTQzOTE1Y2NlNzM4NjI2
CgpJZiB5ZXMsIEkgc3VnZ2VzdCB5b3UgYWRkIGEgbm90ZSBpbiB0aGUgY29tbWl0IGxvZyBhYm91
dCB0aGF0LgpJZiBubywgeW91IGNvdWxkIHVzZSB0aGUgdGFnIHJlZmVyZW5jZSAiMS42LjIiLgoK
PiBJR0hfRVRIRVJDQVRfU0lURSA9ICQoY2FsbCAKPiBnaXRsYWIsZXRoZXJsYWIub3JnLGV0aGVy
Y2F0LCQoSUdIX0VUSEVSQ0FUX1ZFUlNJT04pKQo+IElHSF9FVEhFUkNBVF9MSUNFTlNFID0gR1BM
LTIuMCAoSWdIIEV0aGVyQ0FUIG1hc3RlciksIExHUEwtMi4xIAo+IChsaWJyYXJpZXMpCj4gSUdI
X0VUSEVSQ0FUX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIENPUFlJTkcuTEVTU0VSCj4gCj4gLS0K
PiAyLjQ3LjEKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
