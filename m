Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B5FC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 08:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 841CE407FF;
	Tue, 14 May 2024 08:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z8DnTDFR8OJ; Tue, 14 May 2024 08:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83780408D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83780408D4;
	Tue, 14 May 2024 08:02:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8111BF372
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 673104010F
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xI4fvyz5XPjL for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 08:02:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FCBB400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FCBB400FE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FCBB400FE
 for <buildroot@buildroot.org>; Tue, 14 May 2024 08:02:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31EEC60006;
 Tue, 14 May 2024 08:02:18 +0000 (UTC)
Date: Tue, 14 May 2024 10:02:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240514100217.35add5c1@windsurf>
In-Reply-To: <ZkMEATm9Efp16zRg@waldemar-brodkorb.de>
References: <ZkMEATm9Efp16zRg@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715673738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxHD+S1HE82fGDRHgOSEprpyUgtwgp+FAJ6vT9vFM8M=;
 b=ikScRnY5sJrGu1Igv7dRGRkYHT0hknbR4Z+e6P/j2wu7nQptBeX8aOeJDaL8K1OJinqiZs
 XKTDCSHPJGnSwUrWp9hoXkBniOELrOojQ0/DZ3pjZibSTl9qxuUitnHF6O5zxiBYPT6gRV
 IX7eYlauyL9tG+LqitNZ3MHezQ512keXAPAxen+5U3sSdwjoPlGbP6zmqTuf8UARZQYdfN
 IX4rnrhGNaPGgX7NfOejLYUex+TUmiM5Qy5jw+IMX9n6WfD/0soav2L0rLV4m/2AZf3yQl
 NoH6qnjgjpO3s3BOYDNQQ7BGTXEwE7blMVwZzlIZPfDK2oC03zML0C7Lqm2c9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ikScRnY5
Subject: Re: [Buildroot] [PATCH 1/3] arch: add support for loongarch64
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNCBNYXkgMjAyNCAwODoyNjowOSArMDIwMApXYWxkZW1hciBCcm9ka29yYiA8d2J4
QG9wZW5hZGsub3JnPiB3cm90ZToKCj4gU2lnbmVkLW9mZi1ieTogV2FsZGVtYXIgQnJvZGtvcmIg
PHdieEBvcGVuYWRrLm9yZz4KPiAtLS0KPiAgYXJjaC9Db25maWcuaW4gICAgICAgICAgICAgfCAx
MiArKysrKysrKysrKysKPiAgYXJjaC9Db25maWcuaW4ubG9vbmdhcmNoNjQgfCAxNCArKysrKysr
KysrKysrKwo+ICBwYWNrYWdlL2dsaWJjL0NvbmZpZy5pbiAgICB8ICAxICsKPiAgcGFja2FnZS9t
dXNsL0NvbmZpZy5pbiAgICAgfCAgMSArCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9Db25maWcuaW4ubG9vbmdhcmNoNjQKClRo
aXMgbmVlZHMgYW4gZW50cnkgaW4gdGhlIERFVkVMT1BFUlMgZmlsZS4KCklzIHRoaXMgYXJjaGl0
ZWN0dXJlIHN1cHBvcnRlZCBpbiBhbGwgdmVyc2lvbnMgb2YgYmludXRpbHMvZ2NjL2dkYiB3ZQpz
dXBwb3J0PwoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4ubG9vbmdhcmNoNjQgYi9hcmNo
L0NvbmZpZy5pbi5sb29uZ2FyY2g2NAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uMmI1YmFjMDk1ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL0NvbmZpZy5p
bi5sb29uZ2FyY2g2NAo+IEBAIC0wLDAgKzEsMTQgQEAKPiArY29uZmlnIEJSMl9BUkNICj4gKwlk
ZWZhdWx0ICJsb29uZ2FyY2g2NCIKPiArCj4gK2NvbmZpZyBCUjJfTk9STUFMSVpFRF9BUkNICj4g
KwlkZWZhdWx0ICJsb29uZ2FyY2giCj4gKwo+ICtjb25maWcgQlIyX0VORElBTgo+ICsJZGVmYXVs
dCAiTElUVExFIgo+ICsKPiArY29uZmlnIEJSMl9SRUFERUxGX0FSQ0hfTkFNRQo+ICsJZGVmYXVs
dCAiTG9vbmdBcmNoIgo+ICsKCkJhc2VkIG9uIHRoZSBnY2MgZG9jdW1lbnRhdGlvbiwgSSBzZWUg
dHdvIC1tYXJjaCB2YWx1ZXM6CgogICAgIOKAmGxvb25nYXJjaDY04oCZCiAgICAgICAgICBBIGdl
bmVyaWMgQ1BVIHdpdGggNjQtYml0IGV4dGVuc2lvbnMuCiAgICAg4oCYbGE0NjTigJkKICAgICAg
ICAgIExvb25nQXJjaCBMQTQ2NCBDUFUgd2l0aCBMQlQsIExTWCwgTEFTWCwgTFZaLgoKQW5kIGFs
c28gMyBBQklzOgoKICAgICDigJhscDY0ZOKAmQogICAgICAgICAgVXNlcyA2NC1iaXQgZ2VuZXJh
bCBwdXJwb3NlIHJlZ2lzdGVycyBhbmQgMzIvNjQtYml0CiAgICAgICAgICBmbG9hdGluZy1wb2lu
dCByZWdpc3RlcnMgZm9yIHBhcmFtZXRlciBwYXNzaW5nLiAgRGF0YSBtb2RlbCBpcwogICAgICAg
ICAgTFA2NCwgd2hlcmUg4oCYaW504oCZIGlzIDMyIGJpdHMsIHdoaWxlIOKAmGxvbmcgaW504oCZ
IGFuZCBwb2ludGVycwogICAgICAgICAgYXJlIDY0IGJpdHMuCiAgICAg4oCYbHA2NGbigJkKICAg
ICAgICAgIFVzZXMgNjQtYml0IGdlbmVyYWwgcHVycG9zZSByZWdpc3RlcnMgYW5kIDMyLWJpdAog
ICAgICAgICAgZmxvYXRpbmctcG9pbnQgcmVnaXN0ZXJzIGZvciBwYXJhbWV0ZXIgcGFzc2luZy4g
IERhdGEgbW9kZWwgaXMKICAgICAgICAgIExQNjQsIHdoZXJlIOKAmGludOKAmSBpcyAzMiBiaXRz
LCB3aGlsZSDigJhsb25nIGludOKAmSBhbmQgcG9pbnRlcnMKICAgICAgICAgIGFyZSA2NCBiaXRz
LgogICAgIOKAmGxwNjRz4oCZCiAgICAgICAgICBVc2VzIDY0LWJpdCBnZW5lcmFsIHB1cnBvc2Ug
cmVnaXN0ZXJzIGFuZCBubyBmbG9hdGluZy1wb2ludAogICAgICAgICAgcmVnaXN0ZXJzIGZvciBw
YXJhbWV0ZXIgcGFzc2luZy4gIERhdGEgbW9kZWwgaXMgTFA2NCwgd2hlcmUKICAgICAgICAgIOKA
mGludOKAmSBpcyAzMiBiaXRzLCB3aGlsZSDigJhsb25nIGludOKAmSBhbmQgcG9pbnRlcnMgYXJl
IDY0IGJpdHMuCgpTaG91bGQgd2UgZG8gc29tZXRoaW5nIGFib3V0IHRoaXM/CgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
