Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3936C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8195B40574;
	Wed,  7 Aug 2024 10:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1P6RcHFZJCU; Wed,  7 Aug 2024 10:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F494057F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16F494057F;
	Wed,  7 Aug 2024 10:06:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD4C31BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5A2C80E41
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Y17DEwKBw7z for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5111880DC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5111880DC5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5111880DC5
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:06:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89033FF802;
 Wed,  7 Aug 2024 10:06:20 +0000 (UTC)
Date: Wed, 7 Aug 2024 12:06:19 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20240807120619.66304f2e@windsurf>
In-Reply-To: <20240807051411.299665-3-salvador.joseluis@gmail.com>
References: <874j7x2c1k.fsf@tarshish>
 <20240807051411.299665-3-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723025180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLt2VCpmOZ+xIm8HinhyovQeAp2iedNRsnGldgC1p90=;
 b=Q048TmhwkAanR6KmAHQQHhX4NFZTSsQhg3niKOl5CTNlAaXnWRup23wU7/UEqrtx0CGZEW
 zxL3YmO8wMtVA3+kPaCYkSEcNnn9Q2+is0GBfc2peTRejIiJDoJvlcL+LdSwnIylWLuzgZ
 9OWCf/tpMVly6hbsxC4A0IhOrVbm93u5UiSbrB0FENeFvzK0eKy2Xvmr15w+yDb7H2F4ub
 Ez5pcCGsBbTGS2SV2hGEjAuvOjX9XQJ1avB9XBCCSxr1fvUm40OYrfUiBeED+v+abA5PgR
 iV3d2yyp+f1DKn1q+acA2X/yOHHtk2QhHKRiX28Jlwd0IPmD73cU+BanJso4cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q048Tmhw
Subject: Re: [Buildroot] [PATCH v2 1/2] package/zfs: replace wip patch by
 upstream patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpUaGFua3MgZm9yIHRoaXMgdjIuIEhvd2V2ZXIsIHBsZWFzZSBhbHdheXMg
cmVzZW5kIHRoZSBjb21wbGV0ZSBzZXJpZXMKd2hlbiB5b3UncmUgc2VuZGluZyBhIG5ldyBpdGVy
YXRpb24sIG5vdCBpbmRpdmlkdWFsIHBhdGNoZXMuIE90aGVyd2lzZQppdCdzIHJlYWxseSBhIG1l
c3MgZm9yIHVzIG1haW50YWluZXJzIHRvIHVuZGVyc3RhbmQgd2hpY2ggcGF0Y2hlcwpzaG91bGQg
YmUgYXBwbGllZC4KCkFub3RoZXIgcmVxdWVzdCBiZWxvdy4KCk9uIFdlZCwgIDcgQXVnIDIwMjQg
MDc6MTQ6MTMgKzAyMDAKSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9y
IFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHYxIC0+
IHYyOgo+ICAgICAtIFJlbW92ZWQgWkZTX0FVVE9SRUNPTkYgKHN1Z2dlc3RlZCBieSBCYXJ1Y2gg
U2lhY2gpCj4gCj4gIC4uLmxsLWZpeC1mb3ItU0VFS19EQVRBLVNFRUtfSE9MRS10ZXN0cy5wYXRj
aCB8ICA2OSArKysrKysrKwo+ICAuLi5zLWlnbm9yZS1pZi1TRUVLX0RBVEEtaXMtbm90LWRlZmlu
ZWQucGF0Y2ggfCAxNjIgLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvemZzL3pmcy5tayAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAtCj4gIDMgZmlsZXMgY2hhbmdlZCwgNjkg
aW5zZXJ0aW9ucygrKSwgMTY1IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS96ZnMvMDAwMS1aVFMtc21hbGwtZml4LWZvci1TRUVLX0RBVEEtU0VFS19IT0xFLXRlc3Rz
LnBhdGNoCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3pmcy8wMDAxLXRlc3RzLWNwX2Zp
bGVzLWlnbm9yZS1pZi1TRUVLX0RBVEEtaXMtbm90LWRlZmluZWQucGF0Y2gKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS96ZnMvMDAwMS1aVFMtc21hbGwtZml4LWZvci1TRUVLX0RBVEEtU0VFS19I
T0xFLXRlc3RzLnBhdGNoIGIvcGFja2FnZS96ZnMvMDAwMS1aVFMtc21hbGwtZml4LWZvci1TRUVL
X0RBVEEtU0VFS19IT0xFLXRlc3RzLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwLi45YTdhMTM5YTllCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uv
emZzLzAwMDEtWlRTLXNtYWxsLWZpeC1mb3ItU0VFS19EQVRBLVNFRUtfSE9MRS10ZXN0cy5wYXRj
aAo+IEBAIC0wLDAgKzEsNjkgQEAKPiArRnJvbSAyY2NlZmQ0YWZmOThjZjM1NWM3ZDEzYjNmOTJi
YjRkMzkwZGZhNTIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBUaW5vIFJlaWNo
YXJkdCA8bWlsa3ktemZzQG1jbWlsay5kZT4KPiArRGF0ZTogU3VuLCA0IEF1ZyAyMDI0IDExOjU4
OjEzICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gWlRTOiBzbWFsbCBmaXggZm9yIFNFRUtfREFU
QS9TRUVLX0hPTEUgdGVzdHMKPiArCj4gK1NvbWUgbGliYydzIGxpa2UgdUNsaWJjIGxhZyB0aGUg
cHJvcGVyIGRlZmluaXRpb24gb2YgU0VFS19EQVRBCj4gK2FuZCBTRUVLX0hPTEUuIFNpbmNlIHdl
IGhhdmUgb25seSB0d28gZmlsZXMgaW4gWlRTIHdoaWNoIHVzZQo+ICt0aGVzZSBkZWZpbml0b25z
LCBsZXQncyBkZWZpbmUgdGhlbSBieSBoYW5kOgo+ICsKPiArYGBgCj4gKyNpZm5kZWYgU0VFS19E
QVRBCj4gKyNkZWZpbmUgU0VFS19EQVRBIDMKPiArI2VuZGlmCj4gKyNpZm5kZWYgU0VFS19IT0xF
Cj4gKyNkZWZpbmUgU0VFS19IT0xFIDQKPiArI2VuZGlmCj4gK2BgYAo+ICsKPiArVGhlcmUgc2hv
dWxkIGJlIG5vIGZhaWx1cmVzLCBiZWNhdXNlOgo+ICstIEZyZWVCU0QgaGFzIHN1cHBvcnQgZm9y
IFNFRUtfREFUQS9TRUVLX0hPTEUgc2luY2UgRnJlZUJTRCA4Cj4gKy0gTGludXggaGFzIGl0IHNp
bmNlIExpbnV4IDMuMQo+ICstIHRoZSBsaWJjIHdpbGwgc3VibWl0IHRoZSBwYXJhbWV0ZXJzIHVu
Y2hhbmdlZCB0byB0aGUga2VybmVsCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBUaW5vIFJlaWNoYXJk
dCA8bWlsa3ktemZzQG1jbWlsay5kZT4KPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuemZzL3pmcy9wdWxsLzE2NDEzCgpXZSBuZWVkIHlvdSB0byBhZGQgeW91ciBTaWduZWQtb2Zm
LWJ5IGhlcmUuCgpDb3VsZCB5b3Ugc2VuZCBhIHYzIHdpdGggdGhpcyAoYW5kIGJvdGggcGF0Y2hl
cyEpID8KClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
