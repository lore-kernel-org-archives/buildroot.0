Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6B4CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 21:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5876080F5E;
	Mon, 18 May 2026 21:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1y0h5VfWuDgx; Mon, 18 May 2026 21:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60EA580F7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779140709;
	bh=hrF5SOyU+qsR5SwWE2S/6Bcf84vI02YZXwxC6ZUN11g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=koNsRoVNwZxJjH2xm+3GRLt3RkWjsWCf1b//cynqXOAfNL66QVuywl2TWM6mnnniV
	 uwUjf0zyGKdtIFKjmP+cpOHHXZ2Hc4e2L+Ups5Yl2Kwf79zdGxZM4m9tJpyYPe8Q3l
	 FOSpKTZE1CEDbYMs7mGxXFOK7BMDjK48HDWadmh+DUlYhGFsv0dfY9B9e/XVmAvwrk
	 6XfbAPy5wwRznBrgElyH52tilddxtoTjMA9vBExUASP2IQiP2zHRdQncaqQHQQpk68
	 0qlY0aXxHQcvMrTuI6GK7AzaEkPa2mtHBoO5xn32Aawqhy5CqPXxcKusDi3TF9YOHl
	 Ylaq+JZPdeRAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EA580F7F;
	Mon, 18 May 2026 21:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B99265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38367406D7
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgQyoxtC-9HT for <buildroot@buildroot.org>;
 Mon, 18 May 2026 21:45:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBB06405C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBB06405C5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBB06405C5
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:45:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72sJ-1wRaCa3Cvv-00FWYY; Mon, 18
 May 2026 23:44:59 +0200
Message-ID: <50d79d89-bc0c-4d1d-90c0-12c653d39079@gmx.li>
Date: Mon, 18 May 2026 23:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
References: <20260516081236.7065-1-and@gmx.li>
 <1a85ea51-ed54-4bdd-a652-4a187f275369@rnout.be>
Content-Language: de-DE, en-US
In-Reply-To: <1a85ea51-ed54-4bdd-a652-4a187f275369@rnout.be>
X-Provags-ID: V03:K1:kkvfe+GeVULw3d6r2ArEAzxecv9eaUpiwiyivSSB+Qko8V8WVmm
 gCacI1EKqynIdy2nXgMpNiuzaj08eezyS3fri4aYPYP2KmF/BheMvxNdx1wJk+ri1mJo6TD
 YFg1Ny/B+tWR01v3dhqEVwCLuqBLNH/qXMDel1N2jojnFX76kgVcAv82Xdfej14gVmiVUhS
 VxpZ2jtacc90g+APWScyw==
UI-OutboundReport: notjunk:1;M01:P0:xdc779BYSBE=;MQHJCS85DYL7+bue3BGu6Wi66GP
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779140699; x=1779745499; i=and@gmx.li;
 bh=NqeSv2KsQpGUnP8lbZ6VqC9pUfjX6kkWtg2gm3gYLjA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KuTU3ejSfbhMsjYQHrvlsFe0znK/NFNryw/o/YrzCKvRpvv1aUN0HeodYiae6tTm
 vEqHzPLtvLy1rRWEIDswRNJKofCKe2rBMIU++mjD9jzvv6zHZp8e+BsI8+IWFmNgA
 h+wtluw/Sw0l6uCNm5cGKPjsDfMYkJbeo3zrY4X810k717/+bU+9z0LbTwxdNLcLJ
 DK/PItGkGhnz227jXxHGnB5P5PxgJRfYSfZrb3buxxJZ2NPQE5zdsyN1hn45p+DAy
 Tt3C3y6X9DPkm2tmikLoCleYcFMQgj8uKhdsZ9JE7cXrRUU7leGEFrtb+cpqw/8vx
 EkAJpcg8w4l3YMRC4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=KuTU3ejS
Subject: Re: [Buildroot] [PATCH v3 1/1] package/libargon2: conditionally
 shared/static lib build
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
From: Andreas via buildroot <buildroot@buildroot.org>
Reply-To: Andreas <and@gmx.li>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKQW0gMTguMDUuMjYgdW0gMjA6NDEgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSB2aWEgYnVpbGRyb290Ogo+IMKgSGkgQW5kcmVhcywKPgo+IMKgU29ycnkgdG8gZ2l2ZSB5
b3UgZmVlZGJhY2sgb25seSB3aGVuIHlvdSdyZSBhbHJlYWR5IGF0IHYzLi4uCj4KPiBPbiAxNi8w
NS8yMDI2IDEwOjEyLCBBbmRyZWFzIE1vaHIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gbGliYXJn
b24yIGJ1aWxkIHNoYXJlZCBhbmQgc3RhdGljIGxpYiBieSBkZWZhdWx0Lgo+Pgo+PiBBZGQgY29u
ZGl0aW9uYWxseSBCUjJfU0hBUkVEX0xJQlMgYW5kIEJSMl9TVEFUSUNfTElCUyBzdXBwb3J0Cj4+
IGFuZCBhZGQgdmVyc2lvbiB0byBwa2ctY29uZmlnLgo+Cj4gwqBUaGF0IHNlY29uZCBwYXJ0IHJl
YWxseSBzaG91bGQgYmUgYSBzZXBhcmF0ZSBwYXRjaC4gV2l0aCBhIGJpdCBtb3JlIAo+IGV4cGxh
bmF0aW9uIHRvbyBiZWNhdXNlIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IGV4YWN0bHkgdGhpcyBk
b2VzLCBvciAKPiB3aGF0IGhhcHBlbnMgaWYgeW91IGRvbid0IHNldCB0aGlzLiBDYW4gYmUgYXMg
c2ltcGxlIGFzICJXaXRob3V0IHRoaXMsIAo+IHBrZy1jb25maWcgLS1wYWNrYWdlLXZlcnNpb24g
bGliYXJnb24yIHJlcG9ydHMgQnVpbGRyb290J3MgdmVyc2lvbiAKPiBpbnN0ZWFkIG9mIGxpYmFy
Z29uMidzIHZlcnNpb24iIChpZiB0aGF0IGlzIGFjdHVhbGx5IHdoYXQgaGFwcGVucywgb2YgCj4g
Y291cnNlIDotKQo+CkxJQkFSR09OMl9PUFRTICs9IEFSR09OMl9WRVJTSU9OPSQoTElCQVJHT04y
X1ZFUlNJT04pCgplbnN1cmUgY29ycmVjdCB2ZXJzaW9uIHN0cmluZyBhdCBmaWxlIHVzci9saWIv
cGtnY29uZmlnL2xpYmFyZ29uMi5wYwoKQ3VycmVudDoKCiMgZ3JlcCBWZXJzaW9uIGxpYmFyZ29u
Mi5wYwpWZXJzaW9uOiBaRVJPCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgTW9ociA8YW5k
QGdteC5saT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjM6Cj4+IC0gYWRkIHZlcnNpb24gdG8gcGtn
LWNvbmZpZwo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIGFkZCBjb25kaXRpb25hbGx5IHNoYXJlZCBs
aWIgYnVpbGQKPj4gLS0tCj4+IMKgIHBhY2thZ2UvbGliYXJnb24yL0NvbmZpZy5pbsKgwqDCoCB8
IDUgLS0tLS0KPj4gwqAgcGFja2FnZS9saWJhcmdvbjIvbGliYXJnb24yLm1rIHwgNyArKysrKysr
Cj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJhcmdvbjIvQ29uZmlnLmluIGIvcGFja2FnZS9s
aWJhcmdvbjIvQ29uZmlnLmluCj4+IGluZGV4IDZiYmE3NGNmYjIuLjczYzFlMGQ3NzcgMTAwNjQ0
Cj4+IC0tLSBhL3BhY2thZ2UvbGliYXJnb24yL0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL2xp
YmFyZ29uMi9Db25maWcuaW4KPj4gQEAgLTEsMTIgKzEsNyBAQAo+PiDCoCBjb25maWcgQlIyX1BB
Q0tBR0VfTElCQVJHT04yCj4+IMKgwqDCoMKgwqAgYm9vbCAibGliYXJnb24yIgo+PiDCoMKgwqDC
oMKgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPj4gLcKgwqDCoCBkZXBlbmRzIG9uICFCUjJfU1RB
VElDX0xJQlMKPgo+IMKgVGhpcyBkZXBlbmRlbmN5IHdhcyBwcm9wYWdhdGVkIHRvIG90aGVyIHN5
bWJvbHMsIGUuZy4gCj4gQlIyX1BBQ0tBR0VfUEhQX0VYVF9MSUJBUkdPTjIsIAo+IEJSMl9QQUNL
QUdFX1BZVEhPTl9BUkdPTjJfQ0ZGSV9CSU5ESU5HUywgQlIyX1BBQ0tBR0VfQ1JZUFRTRVRVUCwg
YW5kIAo+IHNob3VsZCBiZSByZW1vdmVkIGZyb20gdGhlcmUgKG9yIHRoZSBjb21tZW50cyB1cGRh
dGVkKS4KPgpPbmNlIHRoZSBzdGF0aWMgYnVpbGQgbGliYXJnb24yIHBhdGNoIGhhcyBiZWVuIGFj
Y2VwdGVkLCBJIHdpbGwgc2VuZCB0aGUgCm5leHQgcGF0Y2ggZm9yIHRoZSBsaWJhcmdvbjIgZGVw
ZW5kZW50IHBhY2thZ2VzLCBzdWNoIGFzIGNyeXB0c2V0dXAsIHRvIApyZWxheCB0aGVpciBzdGF0
aWMgYnVpbGQgYmxvY2tpbmcuCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KPj4gwqDCoMKgwqDC
oCBoZWxwCj4+IMKgwqDCoMKgwqDCoMKgIEEgbW9kZXJuIHBhc3N3b3JkIGhhc2hpbmcgYWxnb3Jp
dGhtCj4+IMKgIMKgwqDCoMKgwqDCoMKgIGh0dHBzOi8vcGFzc3dvcmQtaGFzaGluZy5uZXQvI2Fy
Z29uMgo+PiAtCj4+IC1jb21tZW50ICJsaWJhcmdvbiBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5h
bWljIGxpYnJhcnkiCj4+IC3CoMKgwqAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+PiAtwqDCoMKg
IGRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJTCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmFy
Z29uMi9saWJhcmdvbjIubWsgCj4+IGIvcGFja2FnZS9saWJhcmdvbjIvbGliYXJnb24yLm1rCj4+
IGluZGV4IGIzZjZlMWIyMTYuLmU5NjhhYTA4YTMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbGli
YXJnb24yL2xpYmFyZ29uMi5tawo+PiArKysgYi9wYWNrYWdlL2xpYmFyZ29uMi9saWJhcmdvbjIu
bWsKPj4gQEAgLTExLDYgKzExLDcgQEAgTElCQVJHT04yX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Cj4+IMKgIExJQkFSR09OMl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPj4gwqAgwqAgTElCQVJHT04y
X09QVFMgPSBMSUJSQVJZX1JFTD1saWIKPj4gK0xJQkFSR09OMl9PUFRTICs9IEFSR09OMl9WRVJT
SU9OPSQoTElCQVJHT04yX1ZFUlNJT04pCj4+IMKgIMKgICMgR0NDX1RBUkdFVF9BUkNIIGlzIG5v
dCBkZWZpbmVkIGZvciBhbGwgYXJjaGl0ZWN0dXJlcywgYnV0IAo+PiBsaWJhcmdvbjIKPj4gwqAg
IyBvbmx5IHVzZXMgaXQgdG8gZGV0ZWN0IGlmIHNvbWUgeDg2IG9wdGltaXphdGlvbnMgY2FuIGJl
IHVzZWQsIGFuZAo+PiBAQCAtMjMsNiArMjQsMTIgQEAgaWZlcSAoJChCUjJfVE9PTENIQUlOX0hB
U19USFJFQURTKSwpCj4+IMKgIExJQkFSR09OMl9PUFRTICs9IE5PX1RIUkVBRFM9MQo+PiDCoCBl
bmRpZgo+PiDCoCAraWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4+ICtMSUJBUkdPTjJfT1BU
UyArPSBMSUJfU0g9IExJTktFRF9MSUJfU0g9Cj4+ICtlbHNlIGlmZXEgKCQoQlIyX1NIQVJFRF9M
SUJTKSx5KQo+PiArTElCQVJHT04yX09QVFMgKz0gTElCX1NUPQo+PiArZW5kaWYKPj4gKwo+PiDC
oCBkZWZpbmUgTElCQVJHT04yX0JVSUxEX0NNRFMKPj4gwqDCoMKgwqDCoCAkKFRBUkdFVF9NQUtF
X0VOVikgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoTUFLRSkgLUMgJChARCkgXAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgJChMSUJBUkdPTjJfT1BUUykKCkkgd2lsbCBjcmVhdGUgdjQgdG8gYWRk
cmVzcyB0aGUgbWlub3IgcGtnLWNvbmZpZyB2ZXJzaW9uIGlzc3VlIGFuZCB0aGUgCm1ham9yIHN0
YXRpYy1idWlsZCBibG9ja2luZyBpc3N1ZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
