Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8F9C25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306C94209B;
	Sun, 12 May 2024 10:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggDbC3mjWQbP; Sun, 12 May 2024 10:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC364420A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC364420A9;
	Sun, 12 May 2024 10:05:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0668C1BF86C
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDF964209B
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7P5E6O72yMai for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03E0C420B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03E0C420B0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03E0C420B0
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:05:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90EF91BF204;
 Sun, 12 May 2024 10:05:45 +0000 (UTC)
Date: Sun, 12 May 2024 12:05:44 +0200
To: Jon Henrik =?UTF-8?B?QmrDuHJuc3RhZA==?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20240512120544.002e958a@windsurf>
In-Reply-To: <20240305093839.3152030-2-jonhenrik@qbee.io>
References: <20240305093839.3152030-1-jonhenrik@qbee.io>
 <20240305093839.3152030-2-jonhenrik@qbee.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715508346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HA4Ih/oYLsXeJDlTSqP1moIh6GbecYY+2IF6oyNxZ/o=;
 b=CANq2csvobwCiTKPePpyNX9m6LL+pAgO0D8eRxtFCote5zzTaXi1dp4MTv3Y1cOilT0Diz
 m3OV7vxeaqDwLJRbMAtfiWXVjqX3b/Qo53vC7VLbbaBaEiyARxc/PY3qe6HfQNoCxA2+iF
 rjCDv20JtYkAOvRGaHf5s3SH75RCDe7dzppderAjE9rrAus+Qa27SgUZDIJF0ToOoi88Kp
 SuTPpRUM2wBDxVwSKU3l6N3yunDUE3BQMRlH0rWHEjhKoBYuo6HAMseZXHfUQmDUOsz04/
 GlWVKEXcKZBs8aGfD4YVoMhkSytsdvEsI+I72gb84rW6Ksa018qHm0JOGNC54w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CANq2csv
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
Cc: Christian Stewart <christian@aperture.us>,
 Jon Henrik =?UTF-8?B?QmrDuHJuc3RhZA==?= <jonhenrik@qbee.io>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9uLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLCBhbmQgc29ycnkgZm9yIHRoZSBsb25n
IGRlbGF5IGluIGdldHRpbmcgYmFjayB0bwp5b3UuIEkgaGF2ZSBhcHBsaWVkIHlvdXIgcGF0Y2gs
IHdpdGggc29tZSBmaXhlcyAoc2VlIGJlbG93KS4KCk9uIFR1ZSwgIDUgTWFyIDIwMjQgMTA6Mzg6
MzkgKzAxMDAKSm9uIEhlbnJpayBCasO4cm5zdGFkIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWJlZS1hZ2VudC9D
b25maWcuaW4gYi9wYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4wMmUzNTgyN2VmCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvcWJlZS1hZ2VudC9Db25maWcuaW4KPiBAQCAtMCwwICsxLDE3IEBACj4gK2Nv
bmZpZyBCUjJfUEFDS0FHRV9RQkVFX0FHRU5UCj4gKwlib29sICJxYmVlLWFnZW50Igo+ICsJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4gKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfSVBUQUJMRVMgIyBydW50aW1lCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
QlVTWUJPWF9TSE9XX09USEVSUyAjIHJ1bnRpbWUKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9TSEFE
T1cgIyBydW50aW1lCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfQkFTSCAjIHJ1bnRpbWUKCldoZW4g
eW91IHNlbGVjdCBzb21ldGhpbmcsIHlvdSBuZWVkIHRvIHJlcGxpY2F0ZSB0aGUgImRlcGVuZHMg
b24iIG9mCnRoZSB0aGluZyB5b3UgYXJlIHNlbGVjdGluZy4gU28gaGVyZToKCisgICAgICAgZGVw
ZW5kcyBvbiBCUjJfVVNFX01NVSAjIGJhc2gKKyAgICAgICBkZXBlbmRzIG9uICFCUjJfU1RBVElD
X0xJQlMgIyBzaGFkb3cKKyAgICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19B
VF9MRUFTVF80XzE0ICMgc2hhZG93Cgo+ICsJaGVscAo+ICsJICBRYmVlIGlzIGEgZGV2aWNlIG1h
bmFnZW1lbnQgcGxhdGZvcm0gdGhhdCBjb21wcmlzZQo+ICsJICBvZiBhbiBvcGVuLXNvdXJjZSBh
Z2VudCBhbmQgYSBob3N0ZWQgU2FhUyBiYWNrZW5kLgo+ICsJICBUaGlzIGNvbmZpZyBpbnN0YWxs
cyBwcmUtYnVpbHQgc3RhdGljIGJpbmFyaWVzIG1hZGUKPiArCSAgd2l0aCB0aGUgb2ZmaWNpYWwg
cHVibGljIHNpZ25pbmcga2V5IGZvciBxYmVlLmlvLiBUaGUKPiArCSAgYmluYXJpZXMgd2lsbCB3
b3JrIHNlYW1sZXNzbHkgd2l0aCB0aGUgcWJlZS5pbyBkZXZpY2UKPiArCSAgbWFuYWdlbWVudCBi
YWNrZW5kLgo+ICsKPiArCSAgaHR0cHM6Ly9naXRodWIuY29tL3FiZWUtaW8vcWJlZS1hZ2VudAo+
ICsJICBodHRwczovL3FiZWUuaW8KCkFuZCB5b3UgbmVlZCB0byBhZGQgYSBDb25maWcuaW4gY29t
bWVudCBhYm91dCB0aG9zZSBkZXBlbmRlbmNpZXM6CgorY29tbWVudCAicWJlZS1hZ2VudCBuZWVk
cyBhIHRvb2xjaGFpbiB3LyBoZWFkZXJzID49IDQuMTQsIGR5bmFtaWMgbGlicmFyeSIKKyAgICAg
ICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMKKyAg
ICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCisgICAgICAgZGVwZW5kcyBvbiBCUjJfU1RBVElD
X0xJQlMgfHwgXAorICAgICAgICAgICAgICAgIUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFT
VF80XzE0Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNo
IGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMWM2YTM2MWZmNgo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoCj4gQEAgLTAsMCArMSwzIEBACj4g
KyMgTG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1NiAgYjFiNWE2ZDRlMThmYmQ4NTM2ZDA1NjE2
YzYzMmYxMGVmMzA5ZDI2MDM2YTE5YzVjZTI4ZDA2MzVjNDVkOGNhYiAgcWJlZS1hZ2VudC0yMDI0
LjA5LnRhci5negoKSSBoYWQgdG8gdXBkYXRlIHRoZSBoYXNoIGFuZCB0aGUgZmlsZW5hbWUsIGR1
ZSB0byB0aGUgcmVjZW50IGNoYW5nZXMgaW4KdGhlIGRvd25sb2FkIGluZnJhc3RydWN0dXJlIChu
b3QgeW91ciBmYXVsdCwgdGhlIGNoYW5nZXMgd2VyZSBjb21taXR0ZWQKdmVyeSByZWNlbnRseSku
Cgo+ICtzaGEyNTYgIDAyZDA3ZDk2YmU5OWViMDQyYjAxYmE2NTAwNzlhNDQwY2UyNmE3OGM1ZTBl
MWU4MDYwYzMzYThjOWUyMDA0MDQgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVl
LWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tawo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNjYwMzcxOTVjMQo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tawo+IEBA
IC0wLDAgKzEsMzUgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHFiZWUt
YWdlbnQgcGFja2FnZQo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtRQkVF
X0FHRU5UX1ZFUlNJT04gPSAyMDI0LjA5CgpBZGRlZCBhIGNvbW1lbnQgYWJvdmUgdGhpcyBsaW5l
LCBzYXlpbmcgdGhhdCBRQkVFX0FHRU5UX0NPTU1JVF9JRApzaG91bGQgYmUga2VwdCBpbiBzeW5j
LgoKPiArUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQs
JChRQkVFX0FHRU5UX1ZFUlNJT04pKQo+ICtRQkVFX0FHRU5UX0xJQ0VOU0UgPSBBcGFjaGUtMi4w
Cj4gK1FCRUVfQUdFTlRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiArCj4gK1FCRUVfQUdFTlRf
Q09NTUlUX0lEID0gYzMwZDQzYjhlNjRjZmVmOTYwY2VlOTQ3NWI1OGFlMDgzZTRhZDI0Ngo+ICsK
PiArUUJFRV9BR0VOVF9HT01PRCA9IGdvLnFiZWUuaW8vYWdlbnQKPiArCj4gK1FCRUVfQUdFTlRf
TERGTEFHUyA9IC1zIC13IFwKPiArCS1YICQoUUJFRV9BR0VOVF9HT01PRCkvYXBwLlZlcnNpb249
JChRQkVFX0FHRU5UX1ZFUlNJT04pIFwKPiArCS1YICQoUUJFRV9BR0VOVF9HT01PRCkvYXBwLkNv
bW1pdD0kKFFCRUVfQUdFTlRfQ09NTUlUX0lEKQo+ICsKPiArZGVmaW5lIFFCRUVfQUdFTlRfSU5T
VEFMTF9UQVJHRVRfQ01EUwo+ICsJJChJTlNUQUxMKSAtbSAwNzU1ICQoQEQpL2Jpbi9xYmVlLWFn
ZW50ICQoVEFSR0VUX0RJUikvdXNyL2Jpbi9xYmVlLWFnZW50Cj4gKwkkKElOU1RBTEwpIC1EIC1t
IDA2MDAgJChARCkvcGFja2FnZS9zaGFyZS9zc2wvY2EuY2VydCAkKFRBUkdFVF9ESVIpL2V0Yy9x
YmVlL3Bwa2V5cy9jYS5jZXJ0Cj4gK2VuZGVmCgpBcyBzdWdnZXN0ZWQgYnkgWWFubiBFLiBNb3Jp
biBpbiBhIHByZXZpb3VzIGl0ZXJhdGlvbiwgSSBkcm9wcGVkIHRoZQppbnN0YWxsYXRpb24gb2Yg
dGhlIGJpbmFyeSBmcm9tIHRoZXJlLCBhbmQgdHVybmVkIHRoaXMgaW50byBhCnBvc3QtaW5zdGFs
bCB0YXJnZXQgaG9vay4gSW5kZWVkLCB0aGUgZ29sYW5nLXBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUK
YWxyZWFkeSB0YWtlcyBjYXJlIG9mIGluc3RhbGxpbmcgdGhlIGJpbmFyeS4KClRoYW5rcyBhIGxv
dCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
