Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DE1C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 12:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43D9410E1;
	Tue,  9 Jul 2024 12:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0QPIHmQAKaQ; Tue,  9 Jul 2024 12:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BBE3410E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BBE3410E0;
	Tue,  9 Jul 2024 12:36:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D99C21BF275
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 12:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D447581C93
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 12:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-zKyOgkxd-b for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 12:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4031D81C81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4031D81C81
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4031D81C81
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 12:36:32 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 14:36:30 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 14:36:30 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 14:36:29 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 09 Jul 2024 14:36:28 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,195,1716242400"; d="scan'208";a="167073555"
Date: Tue, 9 Jul 2024 14:36:28 +0200
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Message-ID: <Zo0uzK1YuSABRvVK@tl-lnx-nyma7486-2>
References: <20240223201354.478070-1-flavio.tapajos@newtesc.com.br>
 <20240223201354.478070-2-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240223201354.478070-2-flavio.tapajos@newtesc.com.br>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX208.corporate.adroot.infra.ftgroup (10.115.27.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1720528593; x=1752064593;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=e+XVhW1Adrnt/fQpxHKg+noJb7EQaDESfe+XE8vrTAs=;
 b=CPVntTDTlWATEA1JCKercBZWr0Kgxgd9jbq7j1uEQfuB6DkBURG9tj8z
 vU2oTuxg5bHn7w9ad1WdtPMIHsQTgeKnJYqp7VS6v82qyzX2B5BnvBJEm
 xHL0LemC8t4FRf6KtOPr11BD37F5k599+1lFFRqfRXE9oCqG/nPvOJcjC
 HDjvW957s/c9HTHGU0csOywgJdvoW6OyUiq+hKb5+iEqJY7d/ZJccucvF
 m/+Zhst4ALQ+WYBnCi9CusjmSB7Iglok+iIC+jGb/NFFyx02ADn73BgIq
 EaZtwqzOvbA6iM0Q/pKn877O+OY2f/UAJq5uWpTEEy9RC4uKG3NdHrceF
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=CPVntTDT
Subject: Re: [Buildroot] [PATCH 2/2] package/python-paho-mqtt: bump version
 to 2.0.0
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
Cc: Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmzDoXZpbywgQWxsLAoKT24gMjAyNC0wMi0yMyAxNzoxMyAtMDMwMCwgRmzDoXZpbyBUYXBhasOz
cyBzcGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8Zmxhdmlv
LnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+Cj4gLS0tClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tcGFoby1tcXR0L3B5dGhvbi1wYWhvLW1xdHQubWsgYi9wYWNrYWdlL3B5
dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBhaG8tbXF0dC5tawo+IGluZGV4IGYyNTVhNzg0N2QuLmI5
MTgwZTNiYTAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tcGFoby1tcXR0L3B5dGhvbi1w
YWhvLW1xdHQubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBhaG8t
bXF0dC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gIAo+IC1QWVRIT05fUEFIT19NUVRUX1ZFUlNJT04gPSAxLjYuMQo+ICtQWVRIT05fUEFIT19N
UVRUX1ZFUlNJT04gPSAyLjAuMAoKVGhhbiBrIHlvdSBmb3IgdGhpcyBidW1wLiBZb3UgZm9yZ290
IHRvIG1lbnRpb24gdGhhdCB2ZXJzaW9uIDIuMC4wIHdhcwphbiBBUEkgYnJlYWthZ2UsIHJlcXVp
cmluZyBhbGwgdXNlcnMgdG8gZml4IHRoZWlyIGNvZGUuCgpVcHN0cmVhbSBoYXMgbm93IHJlbGVh
c2VkIDIuMS4wLCB3aGljaCBtYWtlcyB0aGF0IGNoYW5nZSBiYWNrd2FyZApjb21wYXRpYmxlLgoK
SSd2ZSBqc3V0IHNlbnQgYSBwYXRjaCB0byBidW1wIHRvIDIuMS4wIGluc3RlYWQ6CiAgICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvYjgwZmE2MWQxZjg1ZTJlNDE4YWZhOWViMTA1
YTNhZWRkYWE2ZDU4OC4xNzIwNTI4Mzg1LmdpdC55YW5uLm1vcmluQG9yYW5nZS5jb20vVC8jdQoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIFBZVEhPTl9QQUhPX01RVFRfU0lURSA9ICQoY2Fs
bCBnaXRodWIsZWNsaXBzZSxwYWhvLm1xdHQucHl0aG9uLHYkKFBZVEhPTl9QQUhPX01RVFRfVkVS
U0lPTikpCj4gIFBZVEhPTl9QQUhPX01RVFRfTElDRU5TRSA9IEVQTC0yLjAsIEVETHYxLjAKPiAg
UFlUSE9OX1BBSE9fTVFUVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQgZXBsLXYyMCBlZGwt
djEwCj4gLS0gCj4gMi40My4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19f
X19fX19fX19fCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLTogICAgICAg
XyAgICA6LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwgQVNDSUkgUklCQk9OIHwKfCAgICAgICAgICAgICAg
ICAgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCAgXy8gLSAvJyAgIHwgXCAvIENBTVBBSUdOICAgICB8
CnwgKzMzIDYzOC40MTEuMjQ1ICctLS0tLS0tLS0tLS0tLS0tLS0tLTogKF8gICAgYC0tLCB8ICBY
ICBBR0FJTlNUICAgICAgfAp8IHlhbm4ubW9yaW4gKGF0KSBvcmFuZ2UuY29tICAgICAgICAgICB8
Xz0iICAgICwtLScgfCAvIFwgSFRNTCBNQUlMICAgIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tOl9fX19fXy9fX19fXzotLS0tLS0tLS0tLS0tLS0tLS0nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkNlIG1lc3NhZ2Ug
ZXQgc2VzIHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVzIGluZm9ybWF0aW9ucyBj
b25maWRlbnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZlbnQgZG9uYw0KcGFzIGV0
cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRvcmlzYXRpb24uIFNpIHZv
dXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxsZXogbGUgc2lnbmFsZXIN
CmEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50
ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVy
YXRpb24sDQpPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0ZSBzaSBjZSBtZXNzYWdl
IGEgZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2kuDQoNClRoaXMgbWVzc2Fn
ZSBhbmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxl
Z2VkIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3RlZCBieSBsYXc7DQp0aGV5IHNob3Vs
ZCBub3QgYmUgZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29waWVkIHdpdGhvdXQgYXV0aG9yaXNhdGlv
bi4NCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRz
Lg0KQXMgZW1haWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMgbm90IGxpYWJsZSBmb3IgbWVz
c2FnZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQgb3IgZmFsc2lmaWVkLg0KVGhh
bmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
