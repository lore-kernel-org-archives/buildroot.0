Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD99D65C66
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 15:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 950E86102C;
	Wed, 17 Dec 2025 15:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLj7wn_Nmzv0; Wed, 17 Dec 2025 15:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FBA60AEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765985436;
	bh=QAe/+tgsmYjE6bi+uU801AA4OuuKvRd0ONGBvWcKw2A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OZaSQnXnvYyhM5gieXY1jUvNy0sHfZSLKJtylV3IIL6GSug26Cx7EJmMn0HKXRXoD
	 VW7RCkjOZyyDdo3jdkP9m0g93F6YeVyD8AqzfzCjIzmUrtzW7EchU25b+SfRU6o93x
	 Sk6AGR/uDwZq0YeokInIWYdsfaI1DNjP9IsWOTuA4RkiYuuq+m8wUYbK06WuJYAVix
	 GQLe9S3E5mzOCmC7Dm9tyI1FtnMSqw7S78tKXwSuQ2iyeV8xQADeIzJaJhZShrgYPw
	 Xqx4pxdlHti2C1abIIzNy5Xl5UqGhsnvlmAxYo22RVgtwS/eBGCBKwPY2u/payU/Z3
	 srx6zdlDhslkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FBA60AEC;
	Wed, 17 Dec 2025 15:30:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EB6935B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 15:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 810D7405FC
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 15:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QkYOjtNd2KC for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 15:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A7B940415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A7B940415
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A7B940415
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 15:30:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C93D24E41C63;
 Wed, 17 Dec 2025 15:30:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9FBF16072F;
 Wed, 17 Dec 2025 15:30:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B914D102F0AE0; Wed, 17 Dec 2025 16:30:23 +0100 (CET)
Message-ID: <d1fd147a-3d1a-4286-941d-05dc0e44ef3c@bootlin.com>
Date: Wed, 17 Dec 2025 16:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>
References: <20251201-rasdaemon-v3-0-8ad394bdc372@bootlin.com>
 <20251201-rasdaemon-v3-1-8ad394bdc372@bootlin.com>
 <c517b6068e9301eabb9d433d1689cccc@free.fr>
Content-Language: en-US
In-Reply-To: <c517b6068e9301eabb9d433d1689cccc@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765985426; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1zaJQUQoFSRqyWassG2zg7z+80IkaRIU+6e2aTRwTnU=;
 b=wvrw63ImeAynPyKEPT7ewvdHas0Me1bWVlR9JycoQIdY+q4sJJWJmMMXpi5vrcoAfnuXj6
 l+M3sD39CBNfV395FrL1LbT/IQkyi3hb11cnkmYAlNW318mT89V4B0Vk/T6A+LWRo1ltd5
 cwPO73YtxrrnnBn4uU6GWymh40UdH2IW8dfSi/zzZUibB68t093UhafEyhKZGjXAB4/LRd
 lfsSrrQ2rOm9qswqHnoEa99dd7wjvEwoeUPA0IJOZniFHDXu++yr6uDCx4gBUpmTd96dxS
 U+aA348qxNDjDdF6gf2261jC75Wr5CHm9XpHUpQ7V0sEdriGwq+vj+kjkHW1Ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wvrw63Im
Subject: Re: [Buildroot] [PATCH v3 1/2] package/rasdaemon: Add rasdaemon
 package
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gMTIvMTMvMjUgMTE6MTEgUE0sIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+
IEhpIEJhc3RpZW4sCj4gCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guwqAgSSBoYXZlIGZldyBjb21t
ZW50cy4gU2VlIGJlbG93Lgo+IAo+IE9uIDAxLzEyLzIwMjUgMTU6MDgsIEJhc3RpZW4gQ3VydXRj
aGV0IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IFJhc2RhZW1vbiBpcyBhIHRvb2wgdGhhdCBhaW1z
IHRvIHJlcGxhY2UgdGhlIGVkYWMtdG9vbCBhbmQgcHJvdmlkZSBhIHdheQo+PiB0byBjb2xsZWN0
IGFsbCBoYXJkd2FyZSBlcnJvciBldmVudHMgcmVwb3J0ZWQgYnkgdGhlIExpbnV4IGtlcm5lbCBp
biBhCj4+IGNvbW1vbiBmcmFtZXdvcmsuCj4+Cj4+IEFkZCBhIG5ldyBwYWNrYWdlIHRvIHN1cHBv
cnQgcmFzZGFlbW9uIGluIHRoZSAnSGFyZHdhcmUgaGFuZGxpbmcnCj4+IHNlY3Rpb24uIEl0IGRl
cGVuZHMgb24gbGlidHJhY2VldmVudHMgdG8gZGV0ZWN0IHRoZSBmdHJhY2UgZXZlbnRzCj4+IGdl
bmVyYXRlZCBieSB0aGUga2VybmVsIGFuZCBvbiBzcWxpdGUgdG8gc3RvcmUgdGhlc2UgZXZlbnRz
Lgo+Pgo+PiBTdXBwb3J0IGZvciB0aGUgUENJZSBBRVIgZXZlbnRzIGlzIG9wdGlvbm5hbCBhbmQg
aW1wbGllcyBhIGRlcGVuZGVuY3kgb24KPj4gcGNpdXRpbHMgc28gYWxzbyBhZGQgYSBkZWRpY2F0
ZWQgJ3N1Yi1vcHRpb24nIHRvIGVuYWJsZSBpdC4KPj4KPj4gQWRkIGEgU1lTViBpbml0IHNjcmlw
dCB0byBzdGFydCAvIHN0b3AgdGhlIGRhZW1vbgo+Pgo+PiBBZGQgbXlzZWxmIHRvIHRoZSBERVZF
TE9QRVJTIGZpbGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJhc3RpZW4gQ3VydXRjaGV0IDxiYXN0
aWVuLmN1cnV0Y2hldEBib290bGluLmNvbT4KPj4gLS0tCj4gWy4uLl0KPj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcmFzZGFlbW9uL0NvbmZpZy5pbiBiL3BhY2thZ2UvcmFzZGFlbW9uL0NvbmZpZy5p
bgo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAKPj4gMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNjhjZWYzYTMxM2JmMmI4MmE4MzA2ZWQ1ZTBlYzU4MWNk
NjE4NTMxZAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvcmFzZGFlbW9uL0NvbmZp
Zy5pbgo+PiBAQCAtMCwwICsxLDI1IEBACj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfUkFTREFFTU9O
Cj4+ICvCoMKgwqAgYm9vbCAicmFzZGFlbW9uIgo+PiArwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9T
VEFUSUNfTElCUyAjIGxpYnRyYWNlZXZlbnQKPiAKPiByYXNkYWVtb24gc2VlbXMgdG8gdXNlIHVu
Y29uZGl0aW9uYWxseSB0aHJlYWRzLiBTZWU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL21jaGVoYWIv
cmFzZGFlbW9uL2Jsb2IvdjAuOC40L3Jhcy1ldmVudHMuaCNMMTAKPiAKPiBTbyB5b3UgcHJvYmFi
bHkgbWlzcyBoZXJlIGEgImRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyIuCj4g
VGhlIENvbmZpZy5pbiBjb21tZW50IGFsc28gbmVlZHMgdG8gYmUgdXBkYXRlZCBhdCB0aGUgZW5k
IG9mIHRoZSBmaWxlLgo+IAoKSW5kZWVkLCBJJ2xsIGFkZCBpdC4KCj4+ICvCoMKgwqAgc2VsZWN0
IEJSMl9QQUNLQUdFX0xJQlRSQUNFRVZFTlQKPj4gK8KgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0Vf
U1FMSVRFCj4gCj4gU1FMaXRlIGlzIGFuIG9wdGlvbmFsIGRlcGVuZGVuY3kuIFNlZToKPiBodHRw
czovL2dpdGh1Yi5jb20vbWNoZWhhYi9yYXNkYWVtb24vYmxvYi92MC44LjQvY29uZmlndXJlLmFj
I0wyOAo+IAo+IFNvIHlvdSBkb24ndCBuZWVkIHRvIHNlbGVjdCBCUjJfUEFDS0FHRV9TUUxJVEUg
aGVyZSwgYW5kIHlvdSBjb3VsZAo+IHByZWZlcmFibHkgaGF2ZSBpbiB0aGUgLm1rIGZpbGUgc29t
ZXRoaW5nIGxpa2U6Cj4gCj4gaWZlcSAoJChCUjJfUEFDS0FHRV9TUUxJVEUpLHkpCj4gUkFTREFF
TU9OX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1zcWxpdGUzCj4gUkFTREFFTU9OX0RFUEVOREVOQ0lF
UyArPSBzcWxpdGUKPiBlbHNlCj4gUkFTREFFTU9OX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtc3Fs
aXRlMwo+IGVuZGlmCj4gCgpTbyBmYXIgdGhlIHJhc2RhZW1vbidzIGJ1aWxkIHdpdGhvdXQgLS1l
bmFibGUtc3FsaXRlMyBmYWlscywgdGhpcyBpcyB3aHkgCkkgaGFkIGFkZGVkIGl0IHVuY29uZGl0
aW9uYWxseS4gQnV0IHlvdSdyZSByaWdodCwgaXQgaXNuJ3QgdGhlIHByb3BlciBvZiAKZG9pbmcg
c28gSSBqdXN0IG9wZW5lZCBhIFBSIG9uIHJhc2RhZW1vbidzIGdpdGh1YiB0byBmaXggdGhpcy4K
Cj4+ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX0FSR1BfU1RBTkRBTE9ORSBpZiBCUjJfVE9P
TENIQUlOX1VTRVNfVUNMSUJDIAo+PiB8fCBCUjJfVE9PTENIQUlOX1VTRVNfTVVTTAo+PiArwqDC
oMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgcmFzZGFlbW9uIGlzIGEgdG9vbCB0aGF0IGNvbGxlY3Rz
IGFsbCBoYXJkd2FyZSBlcnJvciBldmVudHMKPj4gK8KgwqDCoMKgwqAgcmVwb3J0ZWQgYnkgdGhl
IExpbnV4IEtlcm5lbCBmcm9tIHNldmVyYWwgc291cmNlcyAoRURBQywgTUNFCj4+ICvCoMKgwqDC
oMKgIFBDSSwgLi4uKSBpbnRvIG9uZSBjb21tb24gZnJhbWV3b3JrLgo+IAo+IENvdWxkIGZvcm1h
dCB0aGUgaGVscCBzdHJpbmcgbGlrZSBvdGhlciBCdWlsZHJvb3QgcGFja2FnZXMsCj4gcGxlYXNl
Pwo+IAo+IFlvdSBzaG91bGQgaGF2ZSBhIGJsYW5rIGxpbmUsIGZvbGxvd2VkIGJ5IGp1c3QgdGhl
IGhvbWVwYWdlIHVybDoKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vbWNoZWhhYi9yYXNkYWVtb24K
PiAKClN1cmUsIHdpbGwgZG8uCgo+PiArwqDCoMKgwqDCoCBTZWUgaHR0cHM6Ly9naXRodWIuY29t
L21jaGVoYWIvcmFzZGFlbW9uIGZvciBkZXRhaWxzLgo+PiArCj4+ICtpZiBCUjJfUEFDS0FHRV9S
QVNEQUVNT04KPj4gKwo+PiArY29uZmlnIEJSMl9QQUNLQUdFX1JBU0RBRU1PTl9BRVIKPj4gK8Kg
wqDCoCBib29sICJFbmFibGUgQUVSIHN1cHBvcnQiCj4+ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNL
QUdFX1BDSVVUSUxTCj4+ICvCoMKgwqAgaGVscAo+PiArwqDCoMKgwqDCoCBFbmFibGUgaGFuZGxp
bmcgb2YgQUVSIChBZHZhbmNlZCBFcnJvciBSZXBvcnRpbmcpIGV2ZW50cyBvbgo+PiArwqDCoMKg
wqDCoCBQQ0llCj4+ICsKPj4gK2VuZGlmCj4+ICsKPj4gK2NvbW1lbnQgInJhc2RhZW1vbiBuZWVk
cyBhIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnkiCj4gCj4gVGhlIGNvbW1lbnQgc2hvdWxk
IGJlY29tZToKPiBjb21tZW50ICJyYXNkYWVtb24gbmVlZHMgYSB0b29sY2hhaW4gdy8gdGhyZWFk
cywgZHluYW1pYyBsaWJyYXJ5Igo+IAoKT2ssIHRoYW5rcy4KCj4+ICvCoMKgwqAgZGVwZW5kcyBv
biBCUjJfU1RBVElDX0xJQlMKPiAKPiBIZXJlIHRoZSBjb25kaXRpb24gc2hvdWxkIGJlY29tZToK
PiBkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8IEJSMl9TVEFUSUNfTElC
Uwo+IAoKT2ssIHRoYW5rcy4KCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Jhc2RhZW1vbi9yYXNk
YWVtb24ubWsgYi9wYWNrYWdlL3Jhc2RhZW1vbi8gCj4+IHJhc2RhZW1vbi5tawo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAKPj4gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMC4uNTBhYzk3YTM3ZGNiZTYzNDQzYmRkY2E1MDVlYmM3YzkyOTExNmU1Mwo+PiAt
LS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvcmFzZGFlbW9uL3Jhc2RhZW1vbi5tawo+PiBA
QCAtMCwwICsxLDMzIEBACj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiArIwo+PiArIyBy
YXNkYWVtb24KPj4gKyMKPj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+ICsKPj4gK1JBU0RB
RU1PTl9WRVJTSU9OID0gMC44LjQKPj4gK1JBU0RBRU1PTl9TSVRFID0gJChjYWxsIGdpdGh1Yixt
Y2hlaGFiLHJhc2RhZW1vbix2JChSQVNEQUVNT05fVkVSU0lPTikpCj4+ICtSQVNEQUVNT05fTElD
RU5TRSA9IEdQTC0yLjArCj4+ICtSQVNEQUVNT05fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPj4g
K1JBU0RBRU1PTl9BVVRPUkVDT05GID0gWUVTCj4+ICsKPj4gK1JBU0RBRU1PTl9ERVBFTkRFTkNJ
RVMgPSBsaWJ0cmFjZWV2ZW50IHNxbGl0ZQo+IAo+IFRoZSAic3FsaXRlIiBkZXBlbmRlbmN5IGNv
dWxkIGJlIHJlbW92ZWQgYW5kIGFkZGVkIGluIGEgY29uZGl0aW9uYWwKPiBibG9jaywgYXMgSSBz
dWdnZXN0ZWQuCj4gCgpPaywgSSdsbCBkbyB0aGlzLgoKPj4gKyMgcmFzZGFlbW9uIHVzZXMgYXJn
cC5oIHdoaWNoIGlzIG5vdCBwcm92aWRlZCBieSB1Y2xpYmMgb3IgbXVzbCBieSAKPj4gZGVmYXVs
dC4KPj4gKyMgVXNlIHRoZSBhcmdwLXN0YW5kYWxvbmUgcGFja2FnZSB0byBwcm92aWRlIHRoaXMu
Cj4+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0FSR1BfU1RBTkRBTE9ORSkseSkKPj4gK1JBU0RBRU1P
Tl9ERVBFTkRFTkNJRVMgKz0gYXJncC1zdGFuZGFsb25lCj4+ICtSQVNEQUVNT05fQ09ORl9FTlYg
Kz0gTElCUz0iLWxhcmdwIgo+PiArZW5kaWYKPj4gKwo+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9S
QVNEQUVNT05fQUVSKSx5KQo+PiArUkFTREFFTU9OX0RFUEVOREVOQ0lFUyArPSBwY2l1dGlscwo+
PiArUkFTREFFTU9OX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1hZXIKPj4gK2Vsc2UKPj4gK1JBU0RB
RU1PTl9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWFlcgo+PiArZW5kaWYKPj4gKwo+PiArZGVmaW5l
IFJBU0RBRU1PTl9JTlNUQUxMX0lOSVRfU1lTVgo+PiArwqDCoMKgICQoSU5TVEFMTCkgLW0gMDc1
NSAtRCBwYWNrYWdlL3Jhc2RhZW1vbi9TOTVyYXNkYWVtb24gXAo+PiArwqDCoMKgwqDCoMKgwqAg
JChUQVJHRVRfRElSKS9ldGMvaW5pdC5kL1M5NXJhc2RhZW1vbgo+PiArZW5kZWYKPj4gKwo+PiAr
JChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQo+Pgo+PiAtLSAKPj4gMi41MS4xCj4gCj4gQ291
bGQgeW91IHNlbmQgYW4gdXBkYXRlZCBwYXRjaCwgcGxlYXNlPwoKU3VyZSwgSSdsbCBqdXN0IHdh
aXQgZm9yIG15IFBSIHRvIGJlIG1lcmdlZCBiZWZvcmUgZG9pbmcgc28uCgoKQmVzdCByZWdhcmRz
LApCYXN0aWVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
