Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9ECE7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 16:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16E08413C6;
	Fri, 13 Dec 2024 16:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTDP8OejXEMR; Fri, 13 Dec 2024 16:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 721B4413CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 721B4413CA;
	Fri, 13 Dec 2024 16:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51CB475
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 16:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25D0B8201E
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 16:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeHbJ3dITSLz for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 16:09:43 +0000 (UTC)
X-Greylist: delayed 353 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 13 Dec 2024 16:09:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C207981ED4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C207981ED4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.234;
 helo=lelvem-ot01.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C207981ED4
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 16:09:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDG3jjS3428923
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 13 Dec 2024 10:03:45 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDG3j09065574;
 Fri, 13 Dec 2024 10:03:45 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 10:03:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 10:03:45 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDG3jPL109595;
 Fri, 13 Dec 2024 10:03:45 -0600
Date: Fri, 13 Dec 2024 10:03:45 -0600
From: Bryan Brattlof <bb@ti.com>
To: Romain Naour <romain.naour@smile.fr>
CC: Paresh Bhagat <p-bhagat@ti.com>, <buildroot@buildroot.org>, Chirag
 Shilwant <c-shilwant@ti.com>, Gyan Gupta <g-gupta@ti.com>, Xuanhao Shi
 <X15000177@gmail.com>, Syed Mohammed Khasim <khasim@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>, Sai
 Sree Kartheek Adivi <s-adivi@ti.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Message-ID: <20241213160345.j2z4topau2hprxqr@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240722133804.2794134-1-p-bhagat@ti.com>
 <c627b3d7-5f98-48c5-8053-e2b740549271@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c627b3d7-5f98-48c5-8053-e2b740549271@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1734105825;
 bh=FI1wI3fJzPKw8SV4IuuVN6Akp6p+GWANySkY6gsJbtQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PwZfhhoGzvGw3P8wRG6ir2nE8NgzGNMuWzuIcQqJQth2zdd6cPjUHdkjxxB8ACot5
 BR701Kf6lJ0ytwCgDHl5tVL9X7qr4TZ7N24lW1Ez8awsyyBogM9gtUvDaKAsP9Tx3A
 MyUy8vsPVssKYe4+4uyofCZXHJFzzdn9if73ukyo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PwZfhhoG
Subject: Re: [Buildroot] [PATCH v5] boot/ti-k3-boot-firmware: Add config
 option to specify version
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRGVjZW1iZXIgMTEsIDIwMjQgdGh1cyBzYXlldGggUm9tYWluIE5hb3VyIHZpYSBidWlsZHJv
b3Q6Cj4gSGVsbG8gUGFyZXNoLCBBbGwsCj4gCj4gTGUgMjIvMDcvMjAyNCDDoCAxNTozOCwgUGFy
ZXNoIEJoYWdhdCB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gPiBQcmV2aW91c2x5IHRoZSB2
ZXJzaW9uIG9mIHRpLWszLWJvb3QtZmlybXdhcmUgKFRJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lP
Tikgd2FzCj4gPiBmaXhlZCBpbiBtayBmaWxlLiBJbnRyb2R1Y2UgYSBuZXcgY29uZmlnIG9wdGlv
biAKPiA+IEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTiBzbyB0
aGF0IHVzZXIgY2FuIGNoYW5nZSB0aGUgdmVyc2lvbiAKPiA+IGZvciB0aS1rMy1ib290LWZpcm13
YXJlIHVzaW5nIG1lbnVjb25maWcuCj4gPiAKPiA+IFRoaXMgcHJvdmlkZXMgZ3JlYXRlciBmbGV4
aWJpbGl0eSBmb3IgdXNlcnMgdG8gc2VsZWN0IGRpZmZlcmVudCB2ZXJzaW9ucyBvZgo+ID4gdGkt
azMtYm9vdC1maXJtd2FyZSB3aXRob3V0IG1vZGlmeWluZyB0aGUgYnVpbGQgc2NyaXB0IGRpcmVj
dGx5LiBOb3RlIHRoYXQKPiA+IHRoZXJlIG1pZ2h0IGJlIHZlcnNpb24gZGlmZmVyZW5jZSBiZXR3
ZWVuIHRpLWszLWJvb3QtZmlybXdhcmUgYW5kIHUtYm9vdCBvcgo+ID4ga2ktazMtcjUtYm9vdGxv
YWRlciwgdGhleSBzaG91bGQgc3RpbGwgd29yayB0b2dldGhlciBkdWUgdG8gVEktU0NJIHByb3Rv
Y29sCj4gPiBiZWluZyBiYWNrd2FyZCBjb21wYXRpYmxlLiBIb3dldmVyLCB0byBhdm9pZCBhbnkg
cG90ZW50aWFsIGlzc3VlcyAoIGUuZy4gaW4KPiA+IGNhc2Ugb2YgVElGUy1ETSApLCBpdCBpcyBy
ZWNvbW1lbmRlZCB0byBzeW5jaHJvbml6ZSB0aGVzZSBjb21wb25lbnRzCj4gPiB3aGVuIHVzaW5n
IGN1c3RvbSB2ZXJzaW9uIG9yIHNvdXJjZXMgZm9yIHRoZSBidWlsZC4gRm9yIHN0cmljdGVyIHZl
cnNpb24gCj4gPiBjaGVjaywgaGFzaCBjaGVja2luZyBpcyBub3QgZGlzYWJsZWQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFBhcmVzaCBCaGFnYXQgPHAtYmhhZ2F0QHRpLmNvbT4KPiAKPiBJIHJl
bWVtYmVyZWQgcHJldmlvdXMgZGlzY3Vzc2lvbnMgYWJvdXQgdGktazMtYm9vdC1maXJtd2FyZSBw
YWNrYWdlIGFuZCByZXRyaWV2ZQo+IHRoZSBmaXJzdCBjb21tZW50IGZyb20gQnJ5YW4gQnJhdHRs
b2YgWzFdOgo+IAo+ICJMb29rcyBncmVhdCB0byBtZSEgSSB3aWxsIHNheSB0aGUgcHJvY2VzcyBp
cyBzdGFydGluZyBpbnRlcm5hbGx5IHRvIG1vdmUKPiBhd2F5IGZyb20gdGhpcyBsaW51eC1maXJt
d2FyZSBmb3JrIGluIGZhdm9yIGZvciBzZW5kaW5nIHRoaW5ncyB0bwo+IGxpbnV4LWZpcm13YXJl
IGRpcmVjdGx5LiBNeSBob3BlIGlzIHdlIGNhbiBiZWdpbiBkZXByZWNhdGluZyB0aGlzCj4gcGFj
a2FnZSBpbiBhIGZldyBtb250aHMgZGVwZW5kaW5nIG9uIGhvdyB0aGluZ3MgZ28uIgo+IAo+IEZv
ciBub3cgd2UgYXJlIGZpbmUgdXNpbmcgdGhlIHZlcnNpb24gcHJvdmlkZWQgYnkgdGhlIC5tayBm
aWxlIGFuZCBzaW5jZSB0aGUKPiBnb2FsIGlzIHRvIGRlcHJlY2F0ZSB0aS1rMy1ib290LWZpcm13
YXJlIGFuZCByZXBsYWNlIGJ5IGxpbnV4LWZpcm13YXJlLCBJJ20gbm90Cj4gc3VyZSBpdCB3b3J0
aCB0aGUgZWZmb3J0Pwo+IAo+IElmIHJlYWxseSBuZWVkZWQsIHVzZXJzIGNhbiBzdGlsbCB1c2Ug
T1ZFUlJJREVfU1JDRElSIHRvIHJlcGxhY2UKPiB0aS1rMy1ib290LWZpcm13YXJlIHNvdXJjZXMg
WzJdLgo+IAo+IFRob3VnaHRzPwo+IAoKWWVhaCB0aGlzIGVmZm9ydCBzZWVtcyB0byBoYXZlIHN0
YWxsZWQuIEknbGwgcG9rZSBzb21lIHBlb3BsZSAKaW50ZXJuYWxseS4gQnV0IEkgYWdyZWUgd2Ug
c2hvdWxkIGp1c3QgdXBkYXRlIHRoZSB2ZXJzaW9ucyBldmVyeSB0aW1lIGEgCm5ldyBidWlsZCBv
ZiBmaXJtd2FyZSBpcyByZWFkeS4gCgp+QnJ5YW4KCj4gWzFdCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYnVpbGRyb290LzIwMjQwNjA1MTcwMjA1LmFjNGNtbTdxNW9uZHFnaXFAYnJ5YW5icmF0
dGxvZi5jb20vCj4gWzJdIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21h
bnVhbC5odG1sI19hZHZhbmNlZF91c2FnZQo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAK
PiAKPiA+IAo+ID4gLS0tCj4gPiBDaGFuZ2VzIHY0IC0+IHY1Ogo+ID4gCS0gSW5jbHVkZSByZWNv
bW1lbmRhdGlvbiByZWdhcmRpbmcgdmVyc2lvbiBtaXNtYXRjaCBpbiBjb21taXQgbXNnCj4gPiAJ
ICAoU3VnZ2VzdGVkIGJ5IEJyeWFuIGFuZCBSb21haW4pCj4gPiAKPiA+IENoYW5nZXMgdjMgLT4g
djQ6Cj4gPiAJLSBUaSBrMyAtPiBUSSBLMyAoU3VnZ2VzdGVkIGJ5IEFuZHJlYXMgRGFubmVuYmVy
ZykKPiA+IAktIGdpdC50aS5vcmcgLT4gZ2l0LnRpLmNvbSAoU3VnZ2VzdGVkIGJ5IEFuZHJlYXMg
RGFubmVuYmVyZykKPiA+IAo+ID4gQ2hhbmdlcyB2MiAtPiB2MzoKPiA+IAktIGZsZXhpYmlsdHkg
LT4gZmxleGliaWxpdHkgKFN1Z2dlc3RlZCBieSBDaGlyYWcgU2hpbHdhbnQpCj4gPiAKPiA+IENo
YW5nZXMgdjEgLT4gdjI6Cj4gPiAJLSBGaXggd2hpdGVzcGFjZXMvaW5kZW50YXRpb24gaW4gQ29u
ZmlnLmluIGZpbGUgKFN1Z2dlc3RlZCBieSBCcnlhbiBCcmF0dGxvZikKPiA+IAo+ID4gLS0tCj4g
PiAgYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbiAgICAgICAgICAgIHwgMzAgKysr
KysrKysrKysrKysrKysrKwo+ID4gIC4uLi90aS1rMy1ib290LWZpcm13YXJlLm1rICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWJvb3QtZmly
bXdhcmUvQ29uZmlnLmluIGIvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+ID4g
aW5kZXggZDgwYmI0YmRiMy4uNTgxZWMwYzNiOSAxMDA2NDQKPiA+IC0tLSBhL2Jvb3QvdGktazMt
Ym9vdC1maXJtd2FyZS9Db25maWcuaW4KPiA+ICsrKyBiL2Jvb3QvdGktazMtYm9vdC1maXJtd2Fy
ZS9Db25maWcuaW4KPiA+IEBAIC01LDMgKzUsMzMgQEAgY29uZmlnIEJSMl9UQVJHRVRfVElfSzNf
Qk9PVF9GSVJNV0FSRQo+ID4gIAkgIFRoaXMgcGFja2FnZSBkb3dubG9hZHMgYW5kIGluc3RhbGxz
IHRoZSBUSS1zcGVjaWZpYyB0aS1zeXNmdwo+ID4gIAkgIGFuZCB0aS1kbSBmaXJtd2FyZSBuZWVk
ZWQgdG8gYm9vdCBUSSBLMyBwbGF0Zm9ybXMgKHdoaWNoCj4gPiAgCSAgaW5jbHVkZSBBTTYyeCwg
QU02NHgsIEFNNjV4IGFuZCBtb3JlKS4KPiA+ICsKPiA+ICtpZiBCUjJfVEFSR0VUX1RJX0szX0JP
T1RfRklSTVdBUkUKPiA+ICtjaG9pY2UKPiA+ICsJcHJvbXB0ICJ0aS1rMy1ib290LWZpcm13YXJl
IHZlcnNpb24iCj4gPiArCWRlZmF1bHQgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0xB
VEVTVF9WRVJTSU9OCj4gPiArCWhlbHAKPiA+ICsJICBTZWxlY3QgdGhlIHZlcnNpb24gb2YgVEkg
SzMgYm9vdCBmaXJtd2FyZSB5b3Ugd2FudCB0byB1c2UuCj4gPiArCj4gPiArY29uZmlnIEJSMl9U
QVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9MQVRFU1RfVkVSU0lPTgo+ID4gKwlib29sICIwOS4w
Mi4wMC4wMDkiCj4gPiArCj4gPiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FS
RV9DVVNUT01fVkVSU0lPTgo+ID4gKwlib29sICJDdXN0b20gdmVyc2lvbiIKPiA+ICsJaGVscAo+
ID4gKwkgIFRoaXMgb3B0aW9uIGFsbG93cyB0byB1c2UgYSBzcGVjaWZpYyBvZmZpY2lhbCB2ZXJz
aW9uIGZyb20KPiA+ICsJICBnaXQudGkuY29tLgo+ID4gKwo+ID4gK2VuZGNob2ljZQo+ID4gKwo+
ID4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05f
VkFMVUUKPiA+ICsJc3RyaW5nICJDdXN0b20gdGktazMtYm9vdC1maXJtd2FyZSB2ZXJzaW9uIgo+
ID4gKwlkZXBlbmRzIG9uIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVS
U0lPTgo+ID4gKwo+ID4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfVkVS
U0lPTgo+ID4gKwlzdHJpbmcKPiA+ICsJZGVmYXVsdCAiMDkuMDIuMDAuMDA5IiAgICAgaWYgQlIy
X1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCj4gPiArCWRlZmF1bHQg
QlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIFwKPiA+
ICsJCQkJaWYgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OCj4g
PiArCj4gPiArZW5kaWYKPiA+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUv
dGktazMtYm9vdC1maXJtd2FyZS5tayBiL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1i
b290LWZpcm13YXJlLm1rCj4gPiBpbmRleCA5MzMyNzMyYWQ0Li4zNTAzODFlYmJlIDEwMDY0NAo+
ID4gLS0tIGEvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL3RpLWszLWJvb3QtZmlybXdhcmUubWsK
PiA+ICsrKyBiL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLm1r
Cj4gPiBAQCAtNCw3ICs0LDcgQEAKPiA+ICAjCj4gPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiA+ICAKPiA+IC1USV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04gPSAwOS4wMi4wMC4wMDkKPiA+
ICtUSV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04gPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdF
VF9USV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04pKQo+ID4gIFRJX0szX0JPT1RfRklSTVdBUkVf
U0lURSA9IGh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L3Byb2Nlc3Nvci1maXJtd2FyZS90aS1saW51
eC1maXJtd2FyZS9zbmFwc2hvdAo+ID4gIFRJX0szX0JPT1RfRklSTVdBUkVfU09VUkNFID0gdGkt
bGludXgtZmlybXdhcmUtJChUSV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04pLnRhci54ego+ID4g
IFRJX0szX0JPT1RfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVMgPSBZRVMKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
