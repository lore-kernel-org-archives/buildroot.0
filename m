Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D88DCF11FA
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 15:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B497E60A3E;
	Thu, 10 Oct 2024 15:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MKIXZtsMmix; Thu, 10 Oct 2024 15:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E4560B43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E4560B43;
	Thu, 10 Oct 2024 15:05:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B908E1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 15:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A479F40CEF
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 15:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0NqAKtuiM2s for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 15:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 336C340C97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 336C340C97
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 336C340C97
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 15:04:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49AF4uCU024608;
 Thu, 10 Oct 2024 10:04:56 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49AF4u7p005049
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2024 10:04:56 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 10:04:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 10:04:56 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49AF4usv029726;
 Thu, 10 Oct 2024 10:04:56 -0500
Date: Thu, 10 Oct 2024 10:04:56 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241010150456.u2jj5oikowm4ar7r@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241009062631.895124-1-dario.binacchi@amarulasolutions.com>
 <20241009150040.mxnktvztmjzwasyw@bryanbrattlof.com>
 <CABGWkvqAVxoYRPm3=LJsM6QhGF_BOFP=FXiKYtuF4R-RgEyavg@mail.gmail.com>
 <20241009190945.r6ye6anm2cxj7jsv@bryanbrattlof.com>
 <CABGWkvo88Ce6GxPb5ZsFi5ZEwGaCLuURCO=MurCb0MKoDesQ1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvo88Ce6GxPb5ZsFi5ZEwGaCLuURCO=MurCb0MKoDesQ1Q@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728572696;
 bh=NaMsxgQAkVyVYhxuh0EIHLydBws5LQNicxCFEMd4Itw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=P7Hbs6BfjfYzP/BATMnUC2BrV7UAyf1185EEnDIKiSBFpKKkpNams5ZsjS+KnFV1C
 Fhjmi+PobEmEBGSmEDx1APW/LsU5JKwDMA4+iq8Md+ZRhp0/eepX6v17FvJGqIExHw
 KEocDfN8F1tDTUtFErF1TUrgyAS+Cd7mhkQGos6A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=P7Hbs6Bf
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump Linux to
 6.10.13 and U-Boot to 2024.10
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gT2N0b2JlciAxMCwgMjAyNCB0aHVzIHNheWV0aCBEYXJpbyBCaW5hY2NoaToKPiBIaSBCcnlh
bgo+IAo+IE9uIFdlZCwgT2N0IDksIDIwMjQgYXQgOTowOeKAr1BNIEJyeWFuIEJyYXR0bG9mIDxi
YkB0aS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE9jdG9iZXIgIDksIDIwMjQgdGh1cyBzYXlldGgg
RGFyaW8gQmluYWNjaGk6Cj4gPiA+IEhpIEJyeWFuLAo+ID4gPgo+ID4gPiBPbiBXZWQsIE9jdCA5
LCAyMDI0IGF0IDU6MDDigK9QTSBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPiB3cm90ZToKPiA+
ID4gPgo+ID4gPiA+IEhpIERhcmlvIQo+ID4gPiA+Cj4gPiA+ID4gT24gT2N0b2JlciAgOSwgMjAy
NCB0aHVzIHNheWV0aCBEYXJpbyBCaW5hY2NoaToKPiA+ID4gPiA+IFRoZSBwYXRjaCBidW1wcyB0
aGUgTGludXgga2VybmVsIHRvIHZlcnNpb24gNi4xMC4xMyBhbmQgVS1Cb290IHRvCj4gPiA+ID4g
PiB2ZXJzaW9uIDIwMjQuMTAuIEFybSB0cnVzdGVkIGZpcm13YXJlIGlzIGFscmVhZHkgdXAgdG8g
ZGF0ZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4g
PiA+ICBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggfCAyICstCj4g
PiA+ID4gPiAgYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoIHwgMiAr
LQo+ID4gPiA+ID4gIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnICAgICAgICAgICAgICB8
IDYgKysrLS0tCj4gPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2Ft
NjJ4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaCBiL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNo
ZXMvbGludXgvbGludXguaGFzaAo+ID4gPiA+ID4gaW5kZXggNTNlYjE0Mzg5NDViLi43MDZkZGI4
ZGJiZDQgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2xp
bnV4L2xpbnV4Lmhhc2gKPiA+ID4gPiA+ICsrKyBiL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMv
bGludXgvbGludXguaGFzaAo+ID4gPiA+ID4gQEAgLTEsMiArMSwyIEBACj4gPiA+ID4gPiAgIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKPiA+ID4gPiA+IC1zaGEyNTYgIDc3NDY5ODQyMmVlNTRjNWYxZTcw
NDQ1NmYzN2M2NWMwNmI1MWI0ZTlhOGIwODY2ZjM0NTgwZDg2ZmVmOGUyMjYgIGxpbnV4LTYuMTAu
dGFyLnh6Cj4gPiA+ID4gPiArc2hhMjU2ICA1ZmZjZWIyMzUwZGIxNTQ3ZTY5MjMxYTYzZGYyZDNi
ZWVkMDE1YTMxM2Q3ZDdhZGY4YjVjYjcxZGVkYWViMTZhICBsaW51eC02LjEwLjEzLnRhci54ego+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJv
b3QuaGFzaCBiL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+ID4g
PiA+ID4gaW5kZXggZmU5YjRmNTNkYzYzLi45MDRmYTU2YzAyYTMgMTAwNjQ0Cj4gPiA+ID4gPiAt
LS0gYS9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKPiA+ID4gPiA+
ICsrKyBiL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+ID4gPiA+
ID4gQEAgLTEsMiArMSwyIEBACj4gPiA+ID4gPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiA+ID4g
PiA+IC1zaGEyNTYgIGY1OTFkYTlhYjkwZWYzZDZiM2QxNzM3NjZkMGRkZmY5MGM0ZWQ3MzMwNjgw
ODk3NDg2MTE3ZGYzOTBkODNjOGYgIHUtYm9vdC0yMDI0LjA3LnRhci5iejIKPiA+ID4gPiA+ICtz
aGEyNTYgIGIyOGRhZjRhYzE3ZTQzMTU2MzYzMDc4YmY1MTAyOTc1ODQxMzdmNmRmNTBmY2VkOWIx
MmRmMzRmNjFhOTJmYjAgIHUtYm9vdC0yMDI0LjEwLnRhci5iejIKPiA+ID4gPiA+IGRpZmYgLS1n
aXQgYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tf
ZGVmY29uZmlnCj4gPiA+ID4gPiBpbmRleCBlMTFiODAzYjczZTQuLjZkMDcxYjRjYzE0OCAxMDA2
NDQKPiA+ID4gPiA+IC0tLSBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPiA+ID4g
PiArKysgYi9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+ID4gPiA+ID4gQEAgLTgsNyAr
OCw3IEBAIEJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFRfQVJHUz0iLWMgdHR5UzIsMTE1MjAw
bjggLWQgazMtYW02MjUtc2suZHRiIC1sIGFtNjJ4Cj4gPiA+ID4gPiAgQlIyX1JPT1RGU19QT1NU
X0lNQUdFX1NDUklQVF9BUkdTPSItYyBib2FyZC90aS9hbTYyeC1zay9nZW5pbWFnZS5jZmciCj4g
PiA+ID4gPiAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gPiA+ID4gPiAgQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTj15Cj4gPiA+ID4gPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tl9WQUxVRT0iNi4xMCIKPiA+ID4gPiA+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSI2LjEwLjEzIgo+ID4gPiA+Cj4gPiA+ID4gSSd2ZSBub3RpY2VkIHlvdSd2ZSBiZWVu
IHBpY2tpbmcgc3RhYmxlIHRhZ3MgYW5kIHdhcyBjdXJpb3VzIGlmIHlvdQo+ID4gPiA+IHByZWZl
ciB0byBzdGF5IG9uIHN0YWJsZSB0YWdzPwo+ID4gPgo+ID4gPiBBcyBmYXIgYXMgSSBrbm93LCBp
dCBpcyBnb29kIHByYWN0aWNlLgo+ID4gPgo+ID4KPiA+IEFsbCBnb29kLiBJdCdzIGp1c3QgcHJl
ZmVyZW5jZS4gSSB0cnkgdG8gcnVuIHRoZSBsYXRlc3Qga2VybmVsIHRvIHRyeSBvdXQKPiA+IGFs
bCB0aGUgbGF0ZXN0IGZlYXR1cmVzIGFuZCBmaXhlcyBiZWZvcmUgdGhleSBuZWVkIHRvIGJlIGJh
Y2stcG9ydGVkIGFueXdoZXJlCj4gPgo+ID4gPgo+ID4gPiA+IEkgaGF2ZSBwbGFucyB0byBtb3Zl
IGV2ZXJ5dGhpbmcgdG8gdjYuMTEKPiA+ID4gPiBidXQgSSBjb3VsZCBjaG9vc2UgdGhlIHN0YWJs
ZSB2ZXJzaW9uICh2Ni4xMS4yKSBpZiB0aGF0IGhlbHBzIHlvdS4KPiA+ID4KPiA+ID4gPgo+ID4g
PiA+ID4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ID4gPiA+
ID4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+ID4gPiA+ID4gIEJSMl9MSU5VWF9L
RVJORUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9rMy1hbTYyNS1zayIKPiA+ID4gPiA+IEBAIC0yNywx
MiArMjcsMTIgQEAgQlIyX1RBUkdFVF9PUFRFRV9PUz15Cj4gPiA+ID4gPiAgQlIyX1RBUkdFVF9P
UFRFRV9PU19QTEFURk9STT0iazMtYW02MngiCj4gPiA+ID4gPiAgQlIyX1RBUkdFVF9USV9LM19S
NV9MT0FERVI9eQo+ID4gPiA+ID4gIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9W
RVJTSU9OPXkKPiA+ID4gPiA+IC1CUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iMjAyNC4wNyIKPiA+ID4gPiA+ICtCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURF
Ul9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4xMCIKPiA+ID4gPiA+ICBCUjJfVEFSR0VUX1RJ
X0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9yNSIKPiA+ID4gPiA+ICBC
UjJfVEFSR0VUX1VCT09UPXkKPiA+ID4gPiA+ICBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RF
TV9LQ09ORklHPXkKPiA+ID4gPiA+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkK
PiA+ID4gPiA+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI0LjA3
Igo+ID4gPiA+ID4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQu
MTAiCj4gPiA+ID4KPiA+ID4gPiBPbmUgb2YgdGhlIG1vcmUgaW50ZXJlc3RpbmcgdGhpbmdzIHdl
J3ZlIGJlZW4gd29ya2luZyBvbiBsYXRlbHkgaXMgRUZJCj4gPiA+ID4gQ2Fwc3VsZSBzdXBwb3J0
IHdoaWNoIGRlcGVuZHMgb24gR251VExTLiBXZSdsbCBuZWVkIHRvIGNoZWNrCj4gPiA+ID4gQlIy
X1RBUkdFVF9VQk9PVF9ORUVEU19HTlVUTFMgd2hlbiBtb3ZpbmcgdG8gdGhpcyB2ZXJzaW9uLiA6
KQo+ID4gPgo+ID4gPiBEbyBJIGhhdmUgdG8gZW5hYmxlIHRoaXMgb3B0aW9uPyBXaGVuIEkgdGVz
dGVkLCBJIGRpZG4ndCBub3RpY2UgYW55dGhpbmcgdW51c3VhbAo+ID4gPiBPciBpcyB0aGVyZSBz
b21ldGhpbmcgSSdtIG1pc3Npbmc/Cj4gPiA+Cj4gPgo+ID4gSXQncyBvbiBteSB0b2RvIGxpc3Qg
dG8gc3RhcnQgYnJlYWtpbmcgdXAgdGhlIFUtQm9vdCBkZWZjb25maWcgaW50bwo+ID4gdmFyaW91
cyBmZWF0dXJlIGZyYWdtZW50cyB0byBzdWl0IGEgbnVtYmVyIG9mIHVzZWNhc2VzIG91ciBTSyBi
b2FyZHMKPiA+IGhhdmUuIFNhZGx5IHRoaXMgb25lWzBdIGlzIG1hbmRhdG9yeSBpZiB3ZSBtb3Zl
IHRvIHRoZSB2MjAyNC4xMCB0YWcgb3IKPiA+IHRoZSBidWlsZCB3aWxsIGNvbXBsYWluIGFib3V0
IG1pc3NpbmcgbGlicmFyaWVzLgo+ID4KPiA+ICAgICB0b29scy9ta2VmaWNhcHN1bGUuYzoyMTox
MDogZmF0YWwgZXJyb3I6IGdudXRscy9nbnV0bHMuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQo+ID4gICAgICAgIDIxIHwgI2luY2x1ZGUgPGdudXRscy9nbnV0bHMuaD4KPiA+ICAgICAgICAg
ICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAgICAgY29tcGlsYXRpb24gdGVybWlu
YXRlZC4KPiA+ICAgICBtYWtlWzNdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuaG9zdDo5NTogdG9v
bHMvbWtlZmljYXBzdWxlXSBFcnJvciAxCj4gPiAgICAgbWFrZVszXTogKioqIFdhaXRpbmcgZm9y
IHVuZmluaXNoZWQgam9icy4uLi4KPiA+ICAgICBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjE4OTU6
IHRvb2xzXSBFcnJvciAyCj4gPiAgICAgbWFrZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmlj
Lm1rOjI4OTogL2hvbWUvbWUvc3JjL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvdWJvb3QtMjAyNC4x
MC8uc3RhbXBfYnVpbHRdIEVycm9yIDIKPiA+ICAgICBtYWtlOiAqKiogW01ha2VmaWxlOjgzOiBf
YWxsXSBFcnJvciAyCj4gCj4gSSBkaWRuJ3QgZ2V0IHRoZSBlcnJvciBiZWNhdXNlIG15IGxhcHRv
cCAvdXNyL2luY2x1ZGUvZ251dGxzL2dudXRscy5oCj4gaXMgaW5zdGFsbGVkLiBCdXQgYWZ0ZXIg
dGVtcG9yYXJpbHkgcmVuYW1pbmcgaXQgZm9yCj4gdGVzdGluZyB0aGUgcGF0Y2ggSSBnb3QgdGhl
IGNvbXBpbGluZyBlcnJvci4gU28gdGhhbmsgeW91IGZvciB0aGUgaW5mby4KPiBEbyBJIG5lZWQg
aW4gdmVyc2lvbiAyIG1vdmUgdGhlIExpbnV4IGJ1bXAgdG8gdjYuMTEgdG9vLCBvciBvbmx5Cj4g
ZW5hYmxlIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfR05VVExTCj4gZm9yIFUtQm9vdD8KCmlmIHlv
dSBkb24ndCBtaW5kLiBJJ2xsIGhhdmUgc29tZSBwYXRjaGVzIHRvIGJ1bXAgYWxsIHRoZSB2ZXJz
aW9ucyBvZiAKVEkncyByZWZlcmVuY2UgYm9hcmRzIGFuZCBhIGZldyBiZWFnbGUgYm9hcmRzIGJ5
IHRoZSBlbmQgb2YgdGhlIGRheS4gClRoYXQgd2F5IGV2ZXJ5b25lIHN0YXlzIG9uIHRoZSBzYW1l
IGJhc2VsaW5lIGZvciBteSBzYW5pdHkgOykKCn5CcnlhbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
