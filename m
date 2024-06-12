Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7ECC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 06:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAEA281678;
	Wed, 12 Jun 2024 06:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnRZri06xmDM; Wed, 12 Jun 2024 06:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE5DA81FCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE5DA81FCB;
	Wed, 12 Jun 2024 06:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37C1C1BF37A
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 06:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24AA140185
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 06:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNzvffcI6v-0 for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 06:21:58 +0000 (UTC)
X-Greylist: delayed 4202 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 12 Jun 2024 06:21:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DF2440136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DF2440136
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DF2440136
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 06:21:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45C5BopC076071;
 Wed, 12 Jun 2024 00:11:50 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45C5BoJt005056
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Jun 2024 00:11:50 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jun 2024 00:11:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Jun 2024 00:11:50 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45C5Bo3Y058001;
 Wed, 12 Jun 2024 00:11:50 -0500
Date: Wed, 12 Jun 2024 00:11:50 -0500
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240612051150.mrkzhj33wlcmniwb@dasso>
References: <20240610190816.vq3vmlpzeaomecvk@bryanbrattlof.com>
 <4B8DB477-14EB-45DC-B282-1EDDE76D4AA0@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B8DB477-14EB-45DC-B282-1EDDE76D4AA0@benettiengineering.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1718169110;
 bh=fa394Gzg70dK0pt3vomgkXWe6zPQAXYzM1TnSPKa6EE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fDzL0F2yEdYccnGSZlg/Lt7KS031vkdsIqHQLh8JOYt20+5aV0nZ47hrcHhb83JWS
 UdePNdKpfU3kv21v67rEhtlEl3EATasfgtRtONFuvVoRWkPoof/moco8XSPG0mUChq
 xKdYextmbvJUWr4g2+M3dtvvcL7kMkc/G2X0ymNY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fDzL0F2y
Subject: Re: [Buildroot] [PATCH -next 0/2] configs/ti_am6*: move to mainline
 Linux
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
Cc: Bryan Brattlof <bb@ti.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgMDk6MTg6MjhQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gCj4gPiBJbCBnaW9ybm8gMTAgZ2l1IDIwMjQsIGFsbGUgb3JlIDIxOjA4LCBCcnlh
biBCcmF0dGxvZiA8YmJAdGkuY29tPiBoYSBzY3JpdHRvOgo+ID4gCj4gPiDvu79PbiBKdW5lIDEw
LCAyMDI0IHRodXMgc2F5ZXRoIEdpdWxpbyBCZW5ldHRpOgo+ID4+IEhlbGxvIEJyeWFuLAo+ID4+
IAo+ID4+PiBPbiAxMC8wNi8yNCAyMDoyMCwgQnJ5YW4gQnJhdHRsb2YgdmlhIGJ1aWxkcm9vdCB3
cm90ZToKPiA+Pj4gSGVsbG8gZXZlcnlvbmUsCj4gPj4+IAo+ID4+PiBUSSBoZWF2aWx5IGVuY291
cmFnZXMgZGV2ZWxvcGVycyBpbnRlcm5hbGx5IHRvIHdvcmsgd2l0aCB0aGUgb3BlbiBzb3VyY2UK
PiA+Pj4gY29tbXVuaXR5IHRvIGVuYWJsZSBhbGwgb3VyIFNvQ3MgdGhlcmUgcmF0aGVyIHRoYW4g
ZGV2ZWxvcCB0aGVzZQo+ID4+PiBmZWF0dXJlcyBvbiBvdXIgdmVuZG9yIHRyZWVzLiBCZWNhdXNl
IG9mIHRoaXMgdGhlcmUgYXJlIHZlcnkgZmV3Cj4gPj4+IGZlYXR1cmVzIG9yIGJ1ZyBmaXhlcyBp
biBvdXIgdmVuZG9yIHRyZWVzIHRoYXQgaGF2ZW4ndCBiZWVuIHNlbnQgdG8gdGhlCj4gPj4+IHBy
b2plY3QncyBzb3VyY2UuCj4gPj4+IAo+ID4+PiBTbyBmb3IgdGhlIG5leHQgQnVpbGRyb290IHJl
bGVhc2UgSSB3b3VsZCBsaWtlIHRvIG1pZ3JhdGUgVEkncyByZWZlcmVuY2UKPiA+Pj4gYm9hcmRz
IHRvIHRyYWNrIHRoZSBsYXRlc3QgTGludXggcmVsZWFzZSB0byBlbnN1cmUgd2Ugd2lsbCBhbHdh
eXMgaGF2ZQo+ID4+PiB0aGUgbGF0ZXN0IGZlYXR1cmVzIGFuZCBidWcgZml4ZXMgZm9yIHRoZSBy
ZWZlcmVuY2UgYm9hcmRzIGFuZCBTb0NzLgo+ID4+PiAKPiA+Pj4gVGhpcyBzbWFsbCBzZXJpZXMg
bW92ZXMgdGhlIEFNNjJ4IGFuZCBBTTY0eCB0byB0aGUgbGF0ZXN0IExpbnV4IHJlbGVhc2UuCj4g
Pj4gCj4gPj4gWW91IGNhbid0IGtlZXAgZGVmY29uZmlncyB3aXRob3V0IHByZWRldGVybWluZWQg
bGludXggdmVyc2lvbnMuIFRoZSAyIFRJCj4gPj4gZGVmY29uZmlncyBhbHJlYWR5IHBvaW50IHRv
IG1haW5saW5lIExpbnV4LiBUaGlzIGlzIGRvbmUgZm9yCj4gPj4gcmVwcm9kdWNpYmlsaXR5LiBJ
IGRvbid0IGtub3cgaG93ICB5b3UgY2FuIGFjaGlldmUgd2hhdCB5b3UgbWVhbiB0byBiZQo+ID4+
IGhvbmVzdC4KPiA+IAo+ID4gQWggdGhhdCBtYWtlcyBzZW5zZS4gSSBndWVzcyBpZiB3ZSBuZWVk
IHRvIGtlZXAgYSB2ZXJzaW9uIHBpbm5lZCwKPiA+IGRvIHlvdSB0aGluayBzb21lIHR5cGUgb2Yg
c2NyaXB0aW5nIGluIHV0aWxzLyB0byB1cGRhdGUgdGhlIHZhcmlvdXMKPiA+IGJhc2Vwb3J0IHBh
Y2thZ2VzIGJlIHdlbGNvbWU/Cj4gCj4gVGhlIG1haW4gcHJvYmxlbSBJIHNlZSBpcyBydW50aW1l
IHRlc3Rpbmcgb24gdGhlIGJvYXJkLiBTbyBldmVuIGlmIHdlIGF1dG9tYXRlIHRoZSB1cGRhdGUg
cHJvY2VzcyB0aGF0IGlzIHByZXR0eSB0cml2aWFsLCBJIGRvbuKAmXQgdGhpbmsgd2UgY2FuIGVh
c2lseSBhdXRvbWF0ZSB0aGUgcnVudGltZSB0ZXN0aW5nIHBlciB2ZXJzaW9ucyh1Ym9vdCwgTGlu
dXggZXRjLikuCgpJJ20gc3RhcnRpbmcgdG8gcmVzdXJyZWN0L3VwZGF0ZSBvdXIgQU02eCBJTUcg
Z3JhcGhpY3MgZHJpdmVyIGFnYWluIGZvcgppbmNsdXNpb24gaW50byBCdWlsZHJvb3Q7IEFGQUlL
IHRoYXQgZHJpdmVyIGlzIHZlcnkgcGlja3kgYWJvdXQgdGhlCktlcm5lbCB2ZXJzaW9uIHRvIGJ1
aWxkIGFnYWluc3QgYW5kIHRoaXMgbWF5IGFscmVhZHkgYmUgYW4gaXNzdWUgd2l0aAp0aGUgY3Vy
cmVudCBLZXJuZWwgdmVyc2lvbiBwaW5uZWQgYXQgNi44IGFuZCB0aGUgbGF0ZXN0IGRyaXZlciB3
ZSBoYXZlCmJlaW5nIHRhcmdldGVkIGZvciA2LjYgYnV0IGhvcGVmdWxseSBpdCdzIHN0aWxsIG9r
LiBNaWQvbG9uZy10ZXJtIHdlJ2xsCmhvcGVmdWxseSBzd2l0Y2ggdG8gdGhlIGluLXRyZWUgSU1H
IGdyYXBoaWNzIGRyaXZlciBzbyB0aGF0IHdvbid0IGJlCm11Y2ggb2YgYW4gaXNzdWU7IGJ1dCBJ
IGp1c3Qgd2FudGVkIHRvIHBvaW50IG91dCB0aGF0IHRoaXMgYXQgbGVhc3Qgb25lCmRlcGVuZGVu
Y3kgdG8gY29uc2lkZXIgd2hlbiB0cnlpbmcgdG8gc3dpdGNoIHRvIHRyYWNraW5nIHVwc3RyZWFt
LgoKLS0KQW5kcmVhcyBEYW5uZW5iZXJnClRleGFzIEluc3RydW1lbnRzIEluYwoKCgo+IAo+IEJ1
dCBsZXTigJlzIHdhaXQgZm9yIHNvbWUgbWFpbnRhaW5lciB0byBjb21tZW50LCBtYXliZSB0aGVy
ZeKAmXMgYSBzb2x1dGlvbi4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBHaXVsaW8KPiAKPiA+IAo+ID4g
fkJyeWFuCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
