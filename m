Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893CEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 10:47:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1FD6102A
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 10:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B1FD6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embedded.rocks
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA2BE401A2;
	Sun,  7 Nov 2021 10:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qA_iTqxGxrAd; Sun,  7 Nov 2021 10:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC32A401C3;
	Sun,  7 Nov 2021 10:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4B561BF3AA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 10:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5184401C3
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 10:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBFjL4f1Z-_U for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 10:47:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25D22401A2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 10:47:13 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 213E8240101
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 11:47:10 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Hn9t552Nxz6tmm;
 Sun,  7 Nov 2021 11:47:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:mime-version:user-agent
 :content-type:content-type:organization:references:in-reply-to
 :date:date:from:from:subject:subject:message-id:received
 :received; s=default; t=1636282028; x=1636886829; bh=Q0VUDzUlNJ3
 Nqiyl3wIUOMVS28Z4IW1hiVRTMCFnT4M=; b=ZTIw/pnl0Co69qQwvcYm+hw3Eag
 P/7BzmUnUvcB87d1dz+kkGi/RPntblP+e5rIhLW3z2zBusbpKxdyjHtxlUnEY0PI
 OiIVu4BlkGBXlrEClyODTnFo9OlXPNXvGzb49wREdovSbzAzgQKC9LSt614bqFzp
 s9MHun/1iUbN2W7tAkS7vv60j/aK8TAEgG/dlH+gmG9vAPNTf6P5PnbtwHeO2K5Z
 EE06hGiuHGoOL0PC8HepSrcP2tjMv3Yl17QJCGsoXhOZg1ssW9yk3xijIIlOhc4c
 YUZSKh+pYvZmczSCzsrrWo3aPWnHhJQ3thOttYHq9Os1vY3SYvDENxiVcbg==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id psltufHYnPvq; Sun,  7 Nov 2021 11:47:08 +0100 (CET)
Received: from nzxt.fritz.box (port-92-193-208-175.dynamic.as20676.net
 [92.193.208.175]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Sun,  7 Nov 2021 11:47:08 +0100 (CET)
Message-ID: <b37969629a8e4c8f1d44b818eb0470aa5975e0f4.camel@embedded.rocks>
From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Date: Sun, 07 Nov 2021 10:47:07 +0000
In-Reply-To: <20211031210258.654193-1-romain.naour@gmail.com>
References: <20211031210258.654193-1-romain.naour@gmail.com>
Organization: Embedded Rocks
MIME-Version: 1.0
Subject: Re: [Buildroot] [WIP 1/2] package/luvi: don't use LUAJIT_VERSION
 for the luajit installation path
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

SGkgUm9tYWluLAoKSSBjYW4gY29uZmlybSB0aGF0IHRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBi
dWlsZCBlcnJvcjoKCmBgYApQQVRIPSIkQlIvb3V0cHV0L2hvc3QvYmluOiRCUi9vdXRwdXQvaG9z
dC9zYmluOi91c3IvbG9jYWwvYmluOi91c3IvYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL2xpYi9q
dm0vZGVmYXVsdC9iaW46L3Vzci9iaW4vc2l0ZV9wZXJsOi91c3IvYmluL3ZlbmRvcl9wZXJsOi91
c3IvYmluL2NvcmVfcGVybCIgIC91c3IvYmluL21ha2UgLWo5ICAtQyAkQlIvb3V0cHV0L2J1aWxk
L2x1dmktMi4xMi4wLwptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgJyRCUi9vdXRwdXQvYnVp
bGQvbHV2aS0yLjEyLjAnCm1ha2VbMl06IEVudGVyaW5nIGRpcmVjdG9yeSAnJEJSL291dHB1dC9i
dWlsZC9sdXZpLTIuMTIuMCcKbWFrZVszXTogRW50ZXJpbmcgZGlyZWN0b3J5ICckQlIvb3V0cHV0
L2J1aWxkL2x1dmktMi4xMi4wJwpbIDUwJV0gQnVpbGRpbmcgTHVhaml0dGVkICRCUi9vdXRwdXQv
YnVpbGQvbHV2aS0yLjEyLjAvc3JjL2x1YS9sdXZpYnVuZGxlLmx1YTogJEJSL291dHB1dC9idWls
ZC9sdXZpLTIuMTIuMC9qaXR0ZWRfdG1wL3NyYy9sdWEvbHV2aWJ1bmRsZS5sdWFfbHV2aV9nZW5l
cmF0ZWQubwpbIDUwJV0gQnVpbGRpbmcgTHVhaml0dGVkICRCUi9vdXRwdXQvYnVpbGQvbHV2aS0y
LjEyLjAvc3JjL2x1YS9sdXZpcGF0aC5sdWE6ICRCUi9vdXRwdXQvYnVpbGQvbHV2aS0yLjEyLjAv
aml0dGVkX3RtcC9zcmMvbHVhL2x1dmlwYXRoLmx1YV9sdXZpX2dlbmVyYXRlZC5vClsgNTAlXSBC
dWlsZGluZyBMdWFqaXR0ZWQgJEJSL291dHB1dC9idWlsZC9sdXZpLTIuMTIuMC9zcmMvbHVhL2lu
aXQubHVhOiAkQlIvb3V0cHV0L2J1aWxkL2x1dmktMi4xMi4wL2ppdHRlZF90bXAvc3JjL2x1YS9p
bml0Lmx1YV9sdXZpX2dlbmVyYXRlZC5vCmx1YWppdDogdW5rbm93biBsdWFKSVQgY29tbWFuZCBv
ciBqaXQuKiBtb2R1bGVzIG5vdCBpbnN0YWxsZWQKbHVhaml0OiB1bmtub3duIGx1YUpJVCBjb21t
YW5kIG9yIGppdC4qIG1vZHVsZXMgbm90IGluc3RhbGxlZAptYWtlWzNdOiAqKiogW0NNYWtlRmls
ZXMvbHV2aS5kaXIvYnVpbGQubWFrZTo3ODogaml0dGVkX3RtcC9zcmMvbHVhL2x1dmlwYXRoLmx1
YV9sdXZpX2dlbmVyYXRlZC5vXSBFcnJvciAxCmBgYAoKVGhlIGlzc3VlIGlzLCB0aGF0IExVQV9Q
QVRIIGlzIHNldCB0byBgJEJSL291dHB1dC9ob3N0L3NoYXJlL2x1YWppdC0wNWYxOTg0ZTFhODYy
ZTRiM2QzYzNiMzcwYzc3MzQ5MmUyZWRmODRhLz8ubHVhYCwgd2hpY2ggaXMgd3JvbmcsIGFzIHRo
ZSBpbnN0YWxsYXRpb24gcGF0aCBvZiBsdWFqaXQgaXMgYCRCUi9vdXRwdXQvaG9zdC9zaGFyZS9s
dWFqaXQtMi4xLjAtYmV0YTMvYC4KClNvLCB0aGUgZml4IHByb3Bvc2VkIGJ5IFJvbWFpbiBpcyBj
b3JyZWN0LgoKVGVzdGVkLWJ5OiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJlZGRlZC5y
b2Nrcz4KCkJlc3QgcmVnYXJkcwpKw7ZyZyBLcmF1c2UKCk9uIFN1biwgMjAyMS0xMC0zMSBhdCAy
MjowMiArMDEwMCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEx1YWppdCBwYWNrYWdlIGhhcyBiZWVu
IHJlY2VudGx5IHVwZGF0ZWQgdG8gdGhlIGxhdGVzdCBjb21taXQgaW4gdGhlCj4gbWFzdGVyIGJy
YW5jaCBbMV0uIFNpbmNlIHRoZW4gTFVBSklUX1ZFUlNJT04gZG9lc24ndCBjb250YWluIHRoZSBs
dWFqaXQKPiB2ZXJzaW9uIGFueW1vcmUgYnV0IGEgY29tbWl0IGhhc2g6Cj4gCj4gTFVBSklUX1ZF
UlNJT04gPSAwNWYxOTg0ZTFhODYyZTRiM2QzYzNiMzcwYzc3MzQ5MmUyZWRmODRhCj4gCj4gVXNl
IHBrZy1jb25maWcgLS12YXJpYWJsZT12ZXJzaW9uIGx1YWppdCBpbiBsdXZpIHBhY2thZ2UgdG8g
c2V0Cj4gTFVBX1BBVEggY29ycmVjdGx5Lgo+IAo+IEZpeGVzOgo+IGx1YWppdDogdW5rbm93biBs
dWFKSVQgY29tbWFuZCBvciBqaXQuKiBtb2R1bGVzIG5vdCBpbnN0YWxsZWQKPiAKPiBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI2MDUKPiAK
PiBbMV0gOTQ1MGI1M2M4ZTA2ZjFiNWE3NTg0MGI4MmMwZjQ2NjNhNWQ3NWM0NQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiBDYzogSsO2
cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+Cj4gLS0tCj4gVGhlIFRlc3RM
dXZpIGRvZXNuJ3Qgd29yayB5ZXQgZHVlIHRvIG1pc3Npbmcgcm5nIHN1cHBvcnQgb24gUWVtdSBh
cm12NyB0YXJnZXQKPiB1c2VkIHRvIHJ1biB0aGUgdGVzdC4gbHV2aSAtdiBpcyBzdHVjayBkdWUg
dG8gZ2V0cmFuZG9tKCkuCj4gLS0tCj4gIHBhY2thZ2UvbHV2aS9sdXZpLm1rIHwgOCArKysrKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1dmkvbHV2aS5tayBiL3BhY2thZ2UvbHV2aS9sdXZpLm1r
Cj4gaW5kZXggMzg2ZGFhZmMzMS4uZWY1Nzc3Y2FjOCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1
dmkvbHV2aS5tawo+ICsrKyBiL3BhY2thZ2UvbHV2aS9sdXZpLm1rCj4gQEAgLTksNyArOSw3IEBA
IExVVklfU09VUkNFID0gbHV2aS1zcmMtdiQoTFVWSV9WRVJTSU9OKS50YXIuZ3oKPiAgTFVWSV9T
SVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2x1dml0L2x1dmkvcmVsZWFzZXMvZG93bmxvYWQvdiQo
TFVWSV9WRVJTSU9OKQo+ICBMVVZJX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4gIExVVklfTElDRU5T
RV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4gLUxVVklfREVQRU5ERU5DSUVTID0gbGlidXYgbHVhaml0
IGx1diBob3N0LWx1YWppdAo+ICtMVVZJX0RFUEVOREVOQ0lFUyA9IGxpYnV2IGx1YWppdCBsdXYg
aG9zdC1sdWFqaXQgaG9zdC1wa2djb25mCj4gIAo+ICAjIERpc3BhdGNoIGFsbCBhcmNoaXRlY3R1
cmVzIG9mIEx1YUpJVAo+ICBpZmVxICgkKEJSMl9pMzg2KSx5KQo+IEBAIC0zMCwxMiArMzAsMTYg
QEAgZWxzZQo+ICBMVVZJX1RBUkdFVF9BUkNIID0gJChCUjJfQVJDSCkKPiAgZW5kaWYKPiAgCj4g
KyMgTFVBSklUX1ZFUlNJT04gYW5kIHRoZSBsdWFqaXQgaW5zdGFsbGF0aW9uIHBhdGggbWF5IG5v
dCB1c2UgdGhlCj4gKyMgc2FtZSB2YWx1ZS4gVXNlIHRoZSB2YWx1ZSBmcm9tIGx1YWppdC5wYyBm
aWxlLgo+ICtMVVZJX0xVQUpJVF9WRVJTSU9OID0gJChzaGVsbCAkKFBLR19DT05GSUdfSE9TVF9C
SU5BUlkpIC0tdmFyaWFibGU9dmVyc2lvbiBsdWFqaXQpCj4gKwo+ICAjIEJ1bmRsZWQgbHVhIGJp
bmRpbmdzIGhhdmUgdG8gYmUgbGlua2VkIHN0YXRpY2FsbHkgaW50byB0aGUgbHV2aSBleGVjdXRh
YmxlCj4gIExVVklfQ09ORl9PUFRTID0gXAo+ICAJLURCVUlMRF9TSEFSRURfTElCUz1PRkYgXAo+
ICAJLURXaXRoU2hhcmVkTGlibHV2PU9OIFwKPiAgCS1EVEFSR0VUX0FSQ0g9JChMVVZJX1RBUkdF
VF9BUkNIKSBcCj4gLQktRExVQV9QQVRIPSQoSE9TVF9ESVIpL3NoYXJlL2x1YWppdC0kKExVQUpJ
VF9WRVJTSU9OKS8/Lmx1YQo+ICsJLURMVUFfUEFUSD0kKEhPU1RfRElSKS9zaGFyZS9sdWFqaXQt
JChMVVZJX0xVQUpJVF9WRVJTSU9OKS8/Lmx1YQo+ICAKPiAgIyBBZGQgInJleCIgbW9kdWxlIChQ
Q1JFIHZpYSBidW5kbGVkIGxyZXhsaWIpCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfUENSRSkseSkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
