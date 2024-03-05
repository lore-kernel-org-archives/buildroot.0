Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4F2C5478C
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 06:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7466941559;
	Tue,  5 Mar 2024 06:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pik-Agr4WQX4; Tue,  5 Mar 2024 06:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 266F84152C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 266F84152C;
	Tue,  5 Mar 2024 06:59:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BEA21BF2BF
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 06:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68EE84074A
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 06:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48LqEUSz99TO for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 06:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EAA6B40715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA6B40715
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAA6B40715
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 06:59:08 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4256x4Pb033826;
 Tue, 5 Mar 2024 00:59:04 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4256x4ts008519
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Mar 2024 00:59:04 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 00:59:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 00:59:03 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4256x3mN028800;
 Tue, 5 Mar 2024 00:59:03 -0600
Date: Tue, 5 Mar 2024 00:59:03 -0600
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240305065903.mxeyicojzwrpe2tt@dasso>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-21-dario.binacchi@amarulasolutions.com>
 <056ae2bc-0380-4d86-b554-06a375a44bf5@smile.fr>
 <CABGWkvpi3jgV70jXi3Leti6+EgODiLnBCkmaYjb_qMcqEMZNmA@mail.gmail.com>
 <73584dbb-97d6-4b72-a58e-540a4beab266@smile.fr>
 <CABGWkvo7j-HAi_AmtLuiEnuUG9LTWEn57KqKpuzrG_OxP6uL_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvo7j-HAi_AmtLuiEnuUG9LTWEn57KqKpuzrG_OxP6uL_w@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1709621944;
 bh=d6PN9lh30GLeC/Mbnisg4pM0Jg0HOj34qpIobIkWLDU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=EZJtUVdalQbhnMa5DakOAaq68jgmLEMbOKZnFA5+JMXcQ6Sfhc54MIQ5faf/BWCuZ
 qq5BssIExjbORk8dnwqq5eB7vleMYmBBrKQ6D0p6kUJS98bU/NMzhtMlufvtbFdPhx
 aIoWCQ48WQbfFZHwcsEWN91OhSpq6h1H7OGgbAV0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=EZJtUVda
Subject: Re: [Buildroot] [PATCH v8 20/23] package/ti-k3: fix
 BR2_PACKAGE_TI_K3_SOC setting for am64x SOC
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIFJvbWFpbiwKCk9uIFN1biwgTWFyIDAzLCAyMDI0IGF0IDEwOjUwOjEwQU0gKzAxMDAs
IERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBPbiBTYXQsIE1hciAy
LCAyMDI0IGF0IDExOjUy4oCvUE0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+
IHdyb3RlOgo+ID4KPiA+IEhlbGxvIERhcmlvLAo+ID4KPiA+IExlIDAyLzAzLzIwMjQgw6AgMTU6
MjEsIERhcmlvIEJpbmFjY2hpIGEgw6ljcml0IDoKPiA+ID4gSGkgUm9tYWluLCBBbGwsCj4gPiA+
Cj4gPiA+IE9uIFNhdCwgTWFyIDIsIDIwMjQgYXQgMTI6MDbigK9QTSBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gSGkgRGFyaW8sCj4gPiA+
Pgo+ID4gPj4gTGUgMDEvMDMvMjAyNCDDoCAxNDozNiwgRGFyaW8gQmluYWNjaGkgYSDDqWNyaXQg
Ogo+ID4gPj4+IEluIHRoZSBjYXNlIG9mIFNPQyBhbTY0eCwgdGktazMtcjUtbG9hZGVyIGNyZWF0
ZXMgdGhlIGZvbGxvd2luZwo+ID4gPj4+IHRpYm9vdDMuYmluIGZpbGVzOgo+ID4gPj4+IC0gR1Ag
ICAgLT4gdGlib290M19hbTY0eC1ncC1ldm0uYmluCj4gPiA+Pj4gLSBIUyAgICAtPiB0aWJvb3Qz
X2FtNjR4X3NyMi1ocy1ldm0uYmluCj4gPiA+Pj4gLSBIU19GUyAtPiB0aWJvb3QzX2FtNjR4X3Ny
Mi1ocy1mcy1ldm0uYmluCj4gPiA+Pj4KPiA+ID4+PiBUaGUgcGF0Y2ggYWxsb3dzIHlvdSB0byBp
ZGVudGlmeSB0aGUgY29ycmVjdCBmaWxlIGJhc2VkIG9uIHRoZSBTRUNfVFlQRQo+ID4gPj4+IG9w
dGlvbi4KPiA+ID4+Cj4gPiA+PiBJdCBzZWVtcyB0aGlzIHBhdGNoIHNob3VsZCBiZSBtZXJnZWQg
d2l0aCB0aGUgQU02NHggdS1ib290IHZlcnNpb24gYnVtcCBzaW5jZQo+ID4gPj4gdGktazMtcjUg
KGFrYSB1LWJvb3QpIG5vdyBwcm92aWRlIHRpYm9vdDMuYmluLgo+ID4gPgo+ID4gPiBJIHdpbGwg
c3F1YXNoIGl0IHRvIFtQQVRDSCAyMS8yM10gY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWc6
IGJ1bXAKPiA+ID4gVS1Cb290IHZlcnNpb24gdG8gMjAyNC4wMQo+ID4KPiA+IE9rCj4gPgo+ID4g
Pgo+ID4gPj4KPiA+ID4+IEFsc28gb3RoZXIgVEkgSzMgU29DIHZhcmlhbnQgbGlrZSBBTTY1IHBy
b3ZpZGUgYSBzcjIgYmluYXJ5Ogo+ID4gPj4KPiA+ID4+IHRpYm9vdDMtYW02MmF4LWhzLWZzLWV2
bS5iaW4KPiA+ID4+IHRpYm9vdDMtYW02MmF4LWdwLWV2bS5iaW4KPiA+ID4+IHRpYm9vdDMtYW02
MmF4LWhzLWV2bS5iaW4KPiA+ID4+Cj4gPiA+PiB0aWJvb3QzLWFtNjJweC1ocy1mcy1ldm0uYmlu
Cj4gPiA+Pgo+ID4gPj4gdGlib290My1hbTYyeC1ocy1mcy1ldm0uYmluCj4gPiA+PiB0aWJvb3Qz
LWFtNjJ4LWdwLWV2bS5iaW4KPiA+ID4+IHRpYm9vdDMtYW02MngtaHMtZXZtLmJpbgo+ID4gPj4K
PiA+ID4+IHRpYm9vdDMtYW02NHhfc3IyLWhzLWZzLWV2bS5iaW4KPiA+ID4+IHRpYm9vdDMtYW02
NHgtZ3AtZXZtLmJpbgo+ID4gPj4gdGlib290My1hbTY0eF9zcjItaHMtZXZtLmJpbgo+ID4gPj4K
PiA+ID4+IHRpYm9vdDMtYW02NXhfc3IyLWdwLWV2bS5iaW4KPiA+ID4+IHRpYm9vdDMtYW02NXhf
c3IyLWhzLWV2bS5iaW4KPiA+ID4+Cj4gPiA+PiB0aWJvb3QzLWo3MjAwLWdwLWV2bS5iaW4KPiA+
ID4+IHRpYm9vdDMtajcyMDBfc3IyLWhzLWZzLWV2bS5iaW4KPiA+ID4+IHRpYm9vdDMtajcyMDBf
c3IyLWhzLWV2bS5iaW4KPiA+ID4+Cj4gPiA+PiB0aWJvb3QzLWo3MjFlLWdwLWV2bS5iaW4KPiA+
ID4+IHRpYm9vdDMtajcyMWVfc3IyLWhzLWZzLWV2bS5iaW4KPiA+ID4+IHRpYm9vdDMtajcyMWVf
c3IxXzEtaHMtZXZtLmJpbgo+ID4gPj4KPiA+ID4+IHRpYm9vdDMtajcyMXMyLWdwLWV2bS5iaW4K
PiA+ID4+IHRpYm9vdDMtajcyMXMyLWhzLWZzLWV2bS5iaW4KPiA+ID4+Cj4gPiA+PiB0aWJvb3Qz
LWo3MjJzLWhzLWZzLWV2bS5iaW4KPiA+ID4+Cj4gPiA+PiB0aWJvb3QzLWo3ODRzNC1ncC1ldm0u
YmluCj4gPiA+PiB0aWJvb3QzLWo3ODRzNC1ocy1mcy1ldm0uYmluCj4gPiA+Pgo+ID4gPj4gTWF5
YmUgd2UgbmVlZCB0byBpbnRyb2R1Y2UgVElfSzNfUjVfTE9BREVSX1NPQ19TVUZGSVggdG8gaGFu
ZGxlIHNyMiwgc3IxXzEgb3IgIiIgPwo+ID4gPj4KPiA+ID4gQXQgZmlyc3QsIEkgYWxzbyB0aG91
Z2h0IGFib3V0IGEgbmV3IGNvbmZpZ3VyYXRpb24gdG8gc3BlY2lmeSBhbgo+ID4gPiBhZGRpdGlv
bmFsIHN1ZmZpeCwgYnV0IGFmdGVyIHZlcmlmeWluZwo+ID4gPiB0aGF0IEJSMl9QQUNLQUdFX1RJ
X0szX1NPQyBpcyBvbmx5IHVzZWQgaW4KPiA+ID4gYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMt
cjUtbG9hZGVyLm1rLCB0aGUKPiA+ID4gYWRvcHRlZCBzb2x1dGlvbjoKPiA+ID4KPiA+ID4gLSAg
ICAgICBkZWZhdWx0ICJhbTY0eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WAo+ID4g
PiArICAgICAgIGRlZmF1bHQgImFtNjR4IiAgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjRY
ICYmCj4gPiA+IEJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEVfR1AKPiA+ID4gKyAgICAgICBkZWZh
dWx0ICJhbTY0eF9zcjIiICBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02NFggJiYKPiA+ID4g
IUJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEVfR1AKPiA+ID4KPiA+ID4gc2VlbWVkIHRoZSBzaW1w
bGVzdCB0byBtZS4KPiA+ID4KPiA+ID4gQW5kIEkgdGhpbmsgdGhpcyBhcHByb2FjaCBjYW4gYWxz
byBiZSB1c2VkIGZvciB0aGUgdmFyaWFudHMgeW91Cj4gPiA+IGxpc3RlZCwgc2luY2UgZm9yIGVh
Y2gge1NPQyxTRUNfVFlQRX0gcGFpcgo+ID4gPiB0aGVyZSBleGlzdHMgb25lIGFuZCBvbmx5IG9u
ZSB0aWJvb3QzLmJpbi4KPiA+Cj4gPiBXaGF0IGFib3V0IHJlbW92aW5nIEJSMl9QQUNLQUdFX1RJ
X0szX1NPQyBhbmQgQlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRQo+ID4gKGluaGVyaXRlZCBmcm9t
IHRpLWszLWltYWdlLWdlbiwgc28gd2UgbmVlZCB0aGVtIHVudGlsIHdlIGNhbiByZW1vdmUgdGhp
cwo+ID4gcGFja2FnZSkgd2UganVzdCBuZWVkIHRvIGtub3cgdGhlIG5hbWUgb2YgdGhlIGZpbGUg
d2Ugc2hvdWxkIGNvcHkgYmFzZWQgb24gVEkgSzMKPiA+IFNvQyBhbmQgU2VjdXJpdHkgdHlwZSBz
ZWxlY3Rpb24uCj4gPgo+ID4gY29uZmlnIEJSMl9QQUNLQUdFX1RJX0szX1RJQk9PVDNfQklOCj4g
PiAgICAgICAgIHN0cmluZwo+ID4gICAgICAgICBkZWZhdWx0ICJ0aWJvb3QzLWFtNjJheC1ncC1l
dm0uYmluIiBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02MkFYICYmCj4gPiBCUjJfUEFDS0FH
RV9USV9LM19TRUNUWVBFX0dQCj4gPiAgICAgICAgIGRlZmF1bHQgInRpYm9vdDMtYW02MmF4LWhz
LWV2bS5iaW4iIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTYyQVggJiYKPiA+IEJSMl9QQUNL
QUdFX1RJX0szX1NFQ1RZUEVfSFMKPiA+ICAgICAgICAgZGVmYXVsdCAidGlib290My1hbTYyYXgt
aHMtZnMtZXZtLmJpbiIgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjJBWCAmJgo+ID4gQlIy
X1BBQ0tBR0VfVElfSzNfU0VDVFlQRV9IU19GUwo+ID4gLi4uCj4gPgo+ID4gIGRlZmluZSBUSV9L
M19SNV9MT0FERVJfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ID4gICAgICAgICBjcCAkKEBEKS9zcGwv
dS1ib290LXNwbC5iaW4gJChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluCj4gPiAgICAg
ICAgIGNwICQoQEQpLyQoQlIyX1BBQ0tBR0VfVElfSzNfVElCT09UM19CSU4pICQoQklOQVJJRVNf
RElSKS90aWJvb3QzLmJpbgo+ID4gIGVuZGVmCj4gPgo+ID4gU28gd2UgY2FuIGF2b2lkIHVzaW5n
IGNvbXBsZXggZmluZCAtcmVnZXggLWV4ZWMgLWNwIGNvbW1hbmQgOikKPiA+Cj4gPiBCUjJfUEFD
S0FHRV9USV9LM19USUJPT1QzX0JJTiBjYW4gYmUgZGVmaW5lZCBpbiB0aS1rMy1yNS1sb2FkZXIg
cGFja2FnZS4KPiAKPiBTdXJlLCBmb3IgbWUgaXQncyBmaW5lLgo+IAo+IEhvd2V2ZXIsIHRoaXMg
aXMgYW4gYWRkaXRpb25hbCBwYXRjaCB0byBhZGQgdGhhdCBpc24ndCBuZWNlc3NhcnkgYXQgdGhp
cyBtb21lbnQuCj4gQ2FuIHdlIGNvbnNpZGVyIGFkZGluZyBpdCBhZnRlciB0aGlzIHNlcmllcyBo
YXMgYmVlbiBtZXJnZWQ/IEkgcmVjYWxsCj4gdGhhdCBjdXJyZW50bHkgdGhlIGNvbXBpbGF0aW9u
IG9mCj4gdGhlIEhzIGFuZCBIUy1GUyB2YXJpYW50cyBmb3IgYW02MnggYXJlIGJyb2tlbi4gVGhl
cmVmb3JlLCBoYXZpbmcKPiB2ZXJpZmllZCB3aXRoIEFuZHJlYXMgdGVzdHMgdGhhdCB0aGUKPiBj
aGFuZ2VzIG1hZGUgaW4gdGhpcyBzZXJpZXMgYXJlIG9rYXkgZm9yIGFtNjJ4X3NrX2RlZmNvbmZp
ZyBhbmQKPiBhbTY0eF9za19kZWZjb25maWcsIEkgd291bGQgbWVyZ2UKPiB0aGUgc2VyaWVzIGFz
IHNvb24gYXMgcG9zc2libGUgYW5kIHRoZW4gcHJvY2VlZCB3aXRoIGltcGxlbWVudGluZwo+IGZ1
cnRoZXIgaW1wcm92ZW1lbnRzLgoKSSdkIGFncmVlIGhlcmUsIEkgdGhpbmsgd2hhdCB3ZSBoYXZl
IG5vdyBhbmQgd2hhdCBoYXMgYWxyZWFkeSBiZWVuCnBvc3RlZCBhcyB2OSBpcyBtb3JlIHRoYW4g
Z29vZCBlbm91Z2ggdG8gbWFrZSBhIGN1dCBhbmQgaG9wZWZ1bGx5IGhhdmUKYW4gaW5pdGlhbCBz
b2x1dGlvbiB0aGF0J3MgYWNjZXB0YWJsZSB0byBvdGhlcnMgaGVyZSBhcyB3ZWxsLCBhbmQgc2Vy
dmUKYXMgYSBiYXNlIGZvciBmdXR1cmUgYWRkaXRpb25zL2ltcHJvdmVtZW50cy4gU29mdHdhcmUg
ZGV2ZWxvcG1lbnQgaXMKaXRlcmF0aXZlIElNSE8gYW55d2F5cy4KClRoYW5rcywgQW5kcmVhcwoK
Cj4gCj4gU28sIG15IGludGVudGlvbiBpcyB0byBzdWJtaXQgdmVyc2lvbiA5IHdpdGggdGhlIG9u
bHkgY2hhbmdlIGJlaW5nIHRoZQo+IHNxdWFzaCBvZiB0aGlzIHBhdGNoIHRvIFtQQVRDSCAyMS8y
M10KPiAiY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWc6IGJ1bXAgVS1Cb290IHZlcnNpb24g
dG8gMjAyNC4wMSIuCj4gCj4gRG8geW91IGFncmVlPwo+IAo+IFRoYW5rcyBhbmQgcmVnYXJkcywK
PiBEYXJpbwo+IAo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IFJvbWFpbgo+ID4KPiA+Cj4gPiA+
Cj4gPiA+IEZ1cnRoZXJtb3JlLCBpZiBJJ20gbm90IG1pc3NpbmcgYW55dGhpbmcsIHRoaXMgcmVt
YWlucyB0aGUgb25seQo+ID4gPiBhZGp1c3RtZW50IHdlIG5lZWQgdG8gbWFrZSBzaW5jZSB0aGVy
ZSBhcmUgbm8KPiA+ID4gb3RoZXIgY29uZmlndXJhdGlvbnMgaW4gYnVpbGRyb290IGFtb25nIHRo
b3NlIHlvdSBsaXN0ZWQuIFNvLCBpbiBteQo+ID4gPiBodW1ibGUgb3BpbmlvbiwgZm9yIG5vdywg
dGhpcyBzaG91bGQgYmUgZmluZS4KPiA+ID4KPiA+ID4gU28sIHBsZWFzZSBsZXQgbWUga25vdyBp
ZiwgaW4gYWRkaXRpb24gdG8gc3F1YXNoaW5nIHRoaXMgcGF0Y2ggaW50bwo+ID4gPiAiWzIxLzIz
XSBjb25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZzoKPiA+ID4gYnVtcCBVLUJvb3QgdmVyc2lv
biB0byAyMDI0LjAxIiwgSSBuZWVkIHRvIG1ha2UgYW55IG90aGVyIGFkanVzdG1lbnRzCj4gPiA+
IGZvciB2ZXJzaW9uIDkuCj4gPiA+Cj4gPiA+IFRoYW5rcyBhbmQgcmVnYXJkcywKPiA+ID4gRGFy
aW8KPiA+ID4KPiA+ID4+IEJlc3QgcmVnYXJkcywKPiA+ID4+IFJvbWFpbgo+ID4gPj4KPiA+ID4+
Cj4gPiA+Pj4KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmlu
YWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+Pj4KPiA+ID4+PiAtLS0KPiA+ID4+Pgo+
ID4gPj4+IEFkZGVkIGluIHY4Cj4gPiA+Pj4KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBC
aW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+Pj4gLS0t
Cj4gPiA+Pj4gIHBhY2thZ2UvdGktazMvQ29uZmlnLmluIHwgMyArKy0KPiA+ID4+PiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPj4+Cj4gPiA+Pj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGktazMvQ29uZmlnLmluIGIvcGFja2FnZS90aS1rMy9Db25m
aWcuaW4KPiA+ID4+PiBpbmRleCBiODU0NWI3YmNhNjIuLjljNjFmODg4MGExNSAxMDA2NDQKPiA+
ID4+PiAtLS0gYS9wYWNrYWdlL3RpLWszL0NvbmZpZy5pbgo+ID4gPj4+ICsrKyBiL3BhY2thZ2Uv
dGktazMvQ29uZmlnLmluCj4gPiA+Pj4gQEAgLTQzLDcgKzQzLDggQEAgY29uZmlnIEJSMl9QQUNL
QUdFX1RJX0szX1NPQwo+ID4gPj4+ICAgICAgIHN0cmluZwo+ID4gPj4+ICAgICAgIGRlZmF1bHQg
ImFtNjJheCIgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjJBWAo+ID4gPj4+ICAgICAgIGRl
ZmF1bHQgImFtNjJ4IiAgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjJYCj4gPiA+Pj4gLSAg
ICAgZGVmYXVsdCAiYW02NHgiICBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02NFgKPiA+ID4+
PiArICAgICBkZWZhdWx0ICJhbTY0eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WCAm
JiBCUjJfUEFDS0FHRV9USV9LM19TRUNUWVBFX0dQCj4gPiA+Pj4gKyAgICAgZGVmYXVsdCAiYW02
NHhfc3IyIiAgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjRYICYmICFCUjJfUEFDS0FHRV9U
SV9LM19TRUNUWVBFX0dQCj4gPiA+Pj4gICAgICAgZGVmYXVsdCAiYW02NXgiICBpZiBCUjJfUEFD
S0FHRV9USV9LM19TT0NfQU02NVgKPiA+ID4+Pgo+ID4gPj4+ICBjb25maWcgQlIyX1BBQ0tBR0Vf
VElfSzNfU0VDVFlQRQo+ID4gPj4KPiA+ID4KPiA+ID4KPiA+Cj4gCj4gCj4gLS0KPiAKPiBEYXJp
byBCaW5hY2NoaQo+IAo+IFNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKPiAKPiBkYXJp
by5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiAKPiAKPiBBbWFydWxhIFNvbHV0aW9ucyBTUkwKPiAKPiBWaWEgTGUg
Q2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKPiAKPiBULiArMzkgMDQyIDI0
MyA1MzEwCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IAo+IHd3dy5hbWFydWxhc29sdXRp
b25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
