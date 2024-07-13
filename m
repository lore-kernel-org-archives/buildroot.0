Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE8C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44BE681257;
	Sat, 13 Jul 2024 20:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDAZddQ5inCO; Sat, 13 Jul 2024 20:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 412F2812E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 412F2812E7;
	Sat, 13 Jul 2024 20:45:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F7251BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98C55404C1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dggWYo_D8aWc for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27C6D404BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27C6D404BF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27C6D404BF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:45:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 219441C0002;
 Sat, 13 Jul 2024 20:45:42 +0000 (UTC)
Date: Sat, 13 Jul 2024 22:45:42 +0200
To: Gero =?UTF-8?B?U2Nod8Okcmlja2U=?= <gero.schwaericke@posteo.de>
Message-ID: <20240713224542.537909e5@windsurf>
In-Reply-To: <20240602214056.619533-1-gero.schwaericke@posteo.de>
References: <20240602214056.619533-1-gero.schwaericke@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720903543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+X9eq99RR7Xloh7BeH6svPXMV5GupZtinKWaHWexIM=;
 b=hSNaboF1/V6EJnO2Y+E+4nM1MR6Vqn9TgrrcJ+2LnDLsjmqZpY2ltlkdzjJnom0ULNde4T
 F8FmemB+CAz5oK4FW8Ora0qFLATKoPN5CnhyO/wi/fiXsGKLFGxASFaoy4zqFMaQGT4llJ
 znLgnAy/xSvuI/wqmUvnSI/9du0WSf2NFUclg+gdPu1Mg44kEjAeRkFJ88FqV1a1tSn03l
 5WnxUIO1NkYW85CJT2BdMFRYCfi//3xXS1AcIXmOn2I/7gxkaTS2cUwZ3TYGTwZzegsgaS
 NWGTHBZvk61ucfehoFr8szwmpgHw6y/RKFIBTkDPopaA6uA9WREwnvK5jxNAkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hSNaboF1
Subject: Re: [Buildroot] [PATCH v4] configs/cubieboard1: new defconfig
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAgMiBKdW4gMjAyNCAyMTo0MDo1MCArMDAwMApHZXJvIFNjaHfDpHJpY2tlIDxnZXJv
LnNjaHdhZXJpY2tlQHBvc3Rlby5kZT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBk
ZWZjb25maWcgZm9yIEN1YmllYm9hcmQxIG1hZGUgYnkgQ3ViaWV0ZWNoLiBJdCBpcwo+IGJhc2Vk
IG9uIHRoZSBBbGx3aW5uZXIgQTEwIFNvQy4gU2VlOgo+IGh0dHA6Ly93d3cuY3ViaWV0ZWNoLmNv
bS9wcm9kdWN0LWRldGFpbC9jdWJpZWJvYXJkMS4KPiAKPiBUaGUgZGVmY29uZmlnIHVzZXMgdXBz
dHJlYW0gVS1Cb290IGFuZCBMaW51eC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJp
Y2tlIDxnZXJvLnNjaHdhZXJpY2tlQHBvc3Rlby5kZT4KPiBSZXZpZXdlZC1ieTogR2l1bGlvIEJl
bmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyB2MyAtPiB2NDoKPiAgIC0gcmVvcmRlciBkZWZjb25maWcgdG8gZm9sbG93IHJlZ3VsYXIg
b3B0aW9ucyBvcmRlcmluZwo+ICAgLSBidW1wIGtlcm5lbCBmcm9tIDYuOC4xMSB0byA2LjguMTIg
YW5kIHJlZnJlc2ggaGFzaGVzCj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiAgIC0gYnVtcCB1LWJvb3Qg
YW5kIGtlcm5lbCB2ZXJzaW9uCj4gICAtIHVwZGF0ZSBrZXJuZWwgZHRzIHBhdGggKG5ldyB2ZW5k
b3Igc3ViZGlyKQo+ICAgLSB1cGRhdGUgbXkgZW1haWwgYWRkcmVzcyBpbiBERVZFTE9QRVJTCj4g
ICAtIGFkZCBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkgdG8gZGVmY29uZmlnCj4g
ICAtIGFkZCBCUjJfR0xPQkFMX1BBVENIX0RJUiBhbmQgY3VzdG9tIGhhc2hlcyAodXRpbHMvYWRk
LWN1c3RvbS1oYXNoZXMpCj4gICAtIG1pbm9yIGltcHJvdmVtZW50cyB0byByZWFkbWUudHh0Cj4g
ICAtIGFkZCBsaW5rIHRvIGJvYXJkIGRldGFpbHMgaW4gY29tbWl0IG1lc3NhZ2UgKHJlcXVlc3Rl
ZCBieSBHaXVsaW8pCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gZml4IGNvbW1pdCB0aXRsZQo+
ICAgLSBhZGQgZW50cnkgdG8gREVWRUxPUEVSUwo+ICAgLSBhZGQgYm9hcmQvY3ViaWVib2FyZDEv
cmVhZG1lLnR4dAo+ICAgLSB1c2UgZXh0bGludXguY29uZiBpbnN0ZWFkIG9mIGJvb3QuY21kCj4g
LS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0
ICsrCj4gIGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9nZW5pbWFnZS5jZmcgICAgICB8IDE2
ICsrKysrKysKPiAgLi4uL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gg
IHwgIDEgKwo+ICAuLi4vY3ViaWVib2FyZDEvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAgICAg
fCAgMiArCj4gIC4uLi9jdWJpZWJvYXJkMS9wYXRjaGVzL3Vib290L3Vib290Lmhhc2ggICAgICB8
ICAyICsKPiAgYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQxL3JlYWRtZS50eHQgICAgICAgIHwg
MzIgKysrKysrKysrKysrKysKPiAgLi4uL2Jvb3QvZXh0bGludXgvZXh0bGludXguY29uZiAgICAg
ICAgICAgICAgIHwgIDUgKysrCj4gIGNvbmZpZ3MvY3ViaWVib2FyZDFfZGVmY29uZmlnICAgICAg
ICAgICAgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysKPiAgOCBmaWxlcyBjaGFuZ2VkLCAx
MDQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvY3ViaWV0ZWNoL2N1
YmllYm9hcmQxL2dlbmltYWdlLmNmZwo+ICBjcmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvY3ViaWV0
ZWNoL2N1YmllYm9hcmQxL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2N1YmlldGVjaC9j
dWJpZWJvYXJkMS9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9yZWFkbWUudHh0Cj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDEvcm9vdGZzX292ZXJsYXkvYm9vdC9leHRs
aW51eC9leHRsaW51eC5jb25mCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2N1YmllYm9h
cmQxX2RlZmNvbmZpZwoKU29ycnkgZm9yIHRoZSBkZWxheSwgZXZlcnl0aGluZyBsb29rZWQgZ29v
ZCwgc28gSSBhcHBsaWVkIHlvdXIgcGF0Y2guClRoYW5rcyBmb3IgeW91ciBlZmZvcnRzLCBhbmQg
dGhhbmtzIHRvIEdpdWxpbyBmb3IgdGhlIHJldmlldyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6
em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
