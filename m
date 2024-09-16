Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278C3C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 09:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF2E1400B4;
	Mon, 16 Sep 2024 09:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2H83YYqoNMdG; Mon, 16 Sep 2024 09:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B8C4402CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B8C4402CE;
	Mon, 16 Sep 2024 09:37:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A09C31BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CA3280C1B
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUtWbw3q1pBj for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 09:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AD5380BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AD5380BF5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AD5380BF5
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 09:37:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.117.145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1432CB00576
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:37:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 11:37:12 +0200
Date: Mon, 16 Sep 2024 11:37:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <Zuf8SEGiJzIZRcsx@landeda>
References: <20240911190900.982461-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911190900.982461-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726479434;
 bh=puTnlhq7YpxcQYsFjITUgwYqLwjxLMEc1wS2BZLjkOM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=q8w/Vp+bW5jxK3JV/pAZD4ThztQJMambLJhzLN0PRqR34+6/be1kJsR5G55+IrK3a
 /WXgRhre3ks8ENBWElyHQoGdkhOSCV/hKzIqHeRLjuGqdcZMouBkJkXqB63MGBB1C7
 cC+Cpbqs44m5sigLs82UPGU6Ju9Cv3rWw3kvn/YfMDOsX4cq/Fqhs9UTQ9/P/eKwHl
 biregfrxD/AN6ebV0LNUZBV2Ik7T5Hlm/tuwux09SfGM+3tU7McqrTB0yFklMZpMt5
 QCcIEBPLX6Xmin8LFl9Fgyf7jMJb6nJm1p6Jb9YQxea/rd3oW2AYcVMkkMN/KMYz7v
 92rkcgwEm3Cpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q8w/Vp+b
Subject: Re: [Buildroot] [PATCH] support/scripts: fix RPATH fixups
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gMjAyNC0wOS0xMSAyMTowOSArMDIwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVz
bHk6Cj4gQ29tbWl0IGE4N2FiY2Y2ZGE2NSAoTWFrZWZpbGU6IHJ1biBQUEQgYW5kIFJQQVRIIGZp
eHVwIGluIGhvc3QtZmlhbGl6ZSkKPiAoc2ljKSBtb3ZlZCB0aGUgZml4dXBzIHBldmlvdXNseSBk
b25lIGluIHByZXBhcmUtc2RrLCB0byBob3N0LWZpbmFsaXplLgo+IAo+IFRoaXMgZXhwb3NlZCBh
IGJ1ZyBpbiBmaXgtcnBhdGgsIHdoZW4gUlBBVEggY29udGFpbnMgbXVsdGlwbGUgZW50cmllcywK
PiBsaWtlOiAgL1BQRC9ob3N0LWZvby9ob3N0L2xpYjovUFBEL2hvc3QtZm9vL2hvc3QvbGliL2Zv
bwo+IAo+IEluIHRoYXQgc2l0dWF0aW9uLCB3ZSB3YW50IHRvIGdldCByaWQgb2YgL1BQRC9ob3N0
LWZvbyBhbmQgcmVwbGFjZSBpdAo+IHdpdGggdGhlIGZpbmFsZSBIT1NUX0RJUiwgc28gd2UgbWFu
Z2xlIHRoZSBSUEFUSCB3aXRoIGEgc2VkIGV4cHJlc3Npb24uCj4gCj4gSG93ZXZlciwgdGhhdCBz
ZWQgZXhwcmVzc2lvbiBvbmx5IGV2ZXIgcmVwbGFjZXMgdGhlIGZpcnN0IG1hdGNoLCBhcyBpdAo+
IGlzIG1pc3NpbmcgdGhlICdnJyBvcHRpb24uIFRodXMsIHRoZSBzZWNvbmQgKGFuZCBmb2xsb3dp
bmcpIHBhcnRzIG9mCj4gUlBBVEggYXJlIHN0aWxsIHJlZmVycmluZyB0byB0aGUgUFBELCBhbmQg
dGh1cyBwYXRjaGVsZiBkb2VzIG5vdCBmaW5kIGl0Cj4gcmVsYXRpdmUgdG8gdGhlIGZpbmFsIEhP
U1RfRElSLCBhbWQgcm9wcyBpdC4gVGhpcyBldmVudHVhbGx5IGxlYWQgdG8gYQo+IGZpbmFsIFJQ
QVRIIHNldCBhcyAkT1JJR0lOLy4uL2xpYiBpbnN0ZWFkIG9mIHRoZSBleHBlY3RlZAo+ICRPUklH
SU4vLi4vbGliOiRPUklHSU4vLi4vbGliL2Zvbwo+IAo+IFRoaXMgaXMgdGhlIGNhc2UgZm9yIGhv
c3Qtc3lzdGVtZCwgd2hpY2ggaW5zdGFsbHMgc29tZSBvZiBpdHMgbGlicmFyaWVzCj4gaW4gJFBS
RUZJWC9saWIvc3lzdGVtZC8gYW5kIGFkZHMgYW4gUlBBVEggc2V0IGFwcHJvcHJpYXRlbHkgdG8K
PiAvUFBEL2hvc3Qtc3lzdGVtZC9ob3N0L2xpYjovUFBEL2hvc3Qtc3lzdGVtZC9ob3N0L2xpYi9z
eXN0ZW1kIGFuZCB0aGF0Cj4gZ2V0cyBpbmNvcnJlY3RseSBtYW5nbGVkLgo+IAo+IEZpeGVzOiBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9pc3N1ZXMvMzkKPiAK
PiBBbHNvIGZpeCBhIHR5cG8gaW4gdGhlIGNvbW1lbnQganVzdCBhYm92ZS4KPiAKPiBSZXBvcnRl
ZC1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIEBqbHNhbHZhZG9yCj4gU2lnbmVkLW9mZi1i
eTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CgpKb3PDqSBwcm92aWRl
ZCB0aGVpciByZXZpZXcgb24gdGhlIEdpdExhYiBpc3N1ZToKICAgIGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2lzc3Vlcy8zOSNub3RlXzIxMDA3OTUwNTEKClRl
c3RlZC1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFp
bC5jb20+ClJldmlld2VkLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpv
c2VsdWlzQGdtYWlsLmNvbT4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBzdXBw
b3J0L3NjcmlwdHMvZml4LXJwYXRoIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0
cy9maXgtcnBhdGggYi9zdXBwb3J0L3NjcmlwdHMvZml4LXJwYXRoCj4gaW5kZXggMWU1ODY0NmNl
YS4uZDM0MjE1MDRhNSAxMDA3NTUKPiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvZml4LXJwYXRoCj4g
KysrIGIvc3VwcG9ydC9zY3JpcHRzL2ZpeC1ycGF0aAo+IEBAIC04NCw5ICs4NCw5IEBAIHBhdGNo
X2ZpbGUoKSB7Cj4gICAgICAjIHdvcmsgd2l0aCB0aGUgLS1tYWtlLXJwYXRoLXJlbGF0aXZlICR7
cm9vdGRpcn0gaW52b2NhdGlvbiBhcwo+ICAgICAgIyB0aGUgcGVyLXBhY2thZ2UgaG9zdCBkaXJl
Y3RvcnkgaXMgbm90IHdpdGhpbiAke3Jvb3RkaXJ9LiBTbywKPiAgICAgICMgd2UgcmV3cml0ZSBh
bGwgUlBBVEhzIHBvaW50aW5nIHRvIHBlci1wYWNrYWdlIGRpcmVjdG9yaWVzIHNvCj4gLSAgICAj
IHRoYXQgdGhleSBwb2ludCB0byB0aGUgZ2xvYmFsIGhvc3QgZGlyZWN0cnkuCj4gKyAgICAjIHRo
YXQgdGhleSBwb2ludCB0byB0aGUgZ2xvYmFsIGhvc3QgZGlyZWN0b3J5Lgo+ICAgICAgIyBzaGVs
bGNoZWNrIGRpc2FibGU9U0MyMDAxICMgJHt2YXIvL3NlYXJjaC9yZXBsYWNlfSBoYXJkIHdoZW4g
c2VhcmNoIG9yIHJlcGxhY2UgaGF2ZSAvIGluIHRoZW0KPiAtICAgIGNoYW5nZWRfcnBhdGg9IiQo
ZWNobyAiJHtycGF0aH0iIHwgc2VkICJzQCR7UEVSX1BBQ0tBR0VfRElSfS9bXi9dXCsvaG9zdEAk
e0hPU1RfRElSfUAiKSIKPiArICAgIGNoYW5nZWRfcnBhdGg9IiQoZWNobyAiJHtycGF0aH0iIHwg
c2VkICJzQCR7UEVSX1BBQ0tBR0VfRElSfS9bXi9dXCsvaG9zdEAke0hPU1RfRElSfUBnIikiCj4g
ICAgICBpZiB0ZXN0ICIke3JwYXRofSIgIT0gIiR7Y2hhbmdlZF9ycGF0aH0iIDsgdGhlbgo+ICAg
ICAgICAgICIke1BBVENIRUxGfSIgLS1zZXQtcnBhdGggIiR7Y2hhbmdlZF9ycGF0aH0iICIke2Zp
bGV9Igo+ICAgICAgZmkKPiAtLSAKPiAyLjQ2LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
