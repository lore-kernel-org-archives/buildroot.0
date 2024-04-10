Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AC2CD1296
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 09:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF12481F11;
	Wed, 10 Apr 2024 09:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypkbY-i7mDON; Wed, 10 Apr 2024 09:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7419F81F60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7419F81F60;
	Wed, 10 Apr 2024 09:23:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 264171BF2F9
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 09:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D7F81F60
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 09:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEEjmz07xlfR for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 09:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FBA381F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FBA381F11
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FBA381F11
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 09:23:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43A9N78R004836;
 Wed, 10 Apr 2024 04:23:07 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43A9N7kp045262
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Apr 2024 04:23:07 -0500
Received: from lewvowa01.ent.ti.com (10.180.75.79) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Apr 2024 04:23:06 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by lewvowa01.ent.ti.com
 (10.180.75.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 10 Apr
 2024 04:23:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Apr 2024 04:23:06 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43A9N6pv093601;
 Wed, 10 Apr 2024 04:23:06 -0500
Date: Wed, 10 Apr 2024 04:23:06 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <buildroot@buildroot.org>
Message-ID: <20240410092306.ilqplcdyvqn5gd64@dasso>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
 <1ec8e03b-f5b7-41cf-bfe4-17f99a871e93@mind.be>
 <0ea49f2c-fe1e-4a44-aaf8-90120ef6f9fd@smile.fr>
 <CABGWkvrVr-AY-huV-tijtt48eYtB4nSQ==gZ1VvnWy4SSyYXyQ@mail.gmail.com>
 <20240410080006.GA1545957@theia>
 <20240410082429.r2qhdb7uaqbr2ukk@dasso>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410082429.r2qhdb7uaqbr2ukk@dasso>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712740987;
 bh=/KVovrycLWP8ZOe9H/Qdu7+2T0o1G28+ZMpybYOTsNU=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=wCbnRaIJLucPWG2TQ/ZokUvblzNQm26Vqp+JcgjfW3LKGoxZPsNWRrJ6xDipAPnqz
 94u0fI4k7xhOlV5tvKsU2A7OANaLVUkm9r3Kz/pxHjyYnRgfQBYhOgGAkU3Ecw8no7
 5IECxab4Jyz9pzoN+FgxMMifgeP3xIlIakTy5F9w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=wCbnRaIJ
Subject: Re: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS
 devices
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2VybywgRGFyaW8sIEFsbCwKCk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDAzOjI0OjI5QU0gLTA1
MDAsIEFuZHJlYXMgRGFubmVuYmVyZyB2aWEgYnVpbGRyb290IHdyb3RlOgo+IEdlcm8sIERhcmlv
LAo+IAo+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDEwOjAwOjA2QU0gKzAyMDAsIEdlcm8gU2No
d8Okcmlja2UgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiA+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0
IDA5OjM0OjE2QU0gKzAyMDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4gPiBIaSBSb21haW4s
IEFsbAo+ID4gPiAKPiA+ID4gT24gVHVlLCBBcHIgOSwgMjAyNCBhdCAxMToxN+KAr1BNIFJvbWFp
biBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhl
bGxvIEFybm91dCwgQWxsLAo+ID4gWy4uLl0KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcywgdGhlIHNl
cmllcyBpcyBtZXJnZWQuCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MgdG8gRGFyaW8gYW5kIE1pY2hh
ZWwgZm9yIHRoZSBpbml0aWFsIHdvcmsgb24gdGhlIEhTLUZTIHRvcGljIQo+ID4gPiA+Cj4gPiA+
ID4gVGhlIGluaXRpYWwgc2VyaWVzIHNob3dlZCB0aGF0IGl0IHdhcyBuZWNlc3NhcnkgdG8gcmV3
b3JrIGhlYXZpbHkgdGhlIFRJIEszIFNvQwo+ID4gPiA+IHJlbGF0ZWQgcGFja2FnZXMgaW4gQnVp
bGRyb290LiBUaGlzIHdhcyB0aGUgb3Bwb3J0aW5pdHkgdG8gYW50aWNpcGF0ZSBvbiB0aGUKPiA+
ID4gPiBhZGRpdGlvbiBvZiBuZXcgVEkgSzMgU29DIHN1cHBvcnQuCj4gPiA+ID4KPiA+ID4gPiBU
aGFua3MgdG8gQW5kcmVhcyBhbmQgQnJ5YW4gZnJvbSBUSSBmb3IgdGhlIHJldmlldyBhbmQgZmlu
ZSBkZXRhaWxzIGFib3V0IFRJIEszCj4gPiA+ID4gU29DIGZhbWlsbHkgYW5kIHRoZSBydW50aW1l
IHRlc3RpbmcuCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MgdG8gYWxsIHRlc3RlcnMgYW5kIHJldmll
d2Vycy4KPiA+ID4gCj4gPiA+IEkgdGhpbmsgbXkgdHdvIHBhdGNoZXMgZm9yIHZlcnNpb24gMTAg
d2VyZSB1bHRpbWF0ZWx5IGxvc3Q6Cj4gPiA+IAo+ID4gPiBbdjEwLDA1LzEyXSBwYWNrYWdlL3Rp
LWszOiBkaXNhYmxlIEhTLUZTIGZvciBBTTY1IFNPQwo+ID4gPiBbdjEwLDA0LzEyXSBwYWNrYWdl
L3RpLWszOiBtb3ZlIFRJX0szX3tTRUNUWVBFLCBTT0N9IG91dCBvZiB0aGUgaW1hZ2UtZ2VuIHNj
b3BlCj4gPiA+IAo+ID4gPiBTcGVjaWZpY2FsbHksIHBhdGNoIDQgaXMgbmVjZXNzYXJ5IGZvciB0
aGUgcHJvcGVyIGNyZWF0aW9uIG9mIHRoZQo+ID4gPiBpbWFnZS4gSGFzIHZlcnNpb24gMTIgYWN0
dWFsbHkgYmVlbiB0ZXN0ZWQgYnkgYW55b25lPwo+ID4gPiBJIGNhbiBhc3N1cmUgeW91IHZlcnNp
b24gMTAgaGFzIGJlZW4uCj4gPiA+IAo+ID4gPiBBZGRpdGlvbmFsbHksIGl0IHNlZW1zIHRoYXQg
cGF0Y2gKPiA+ID4gW3YxMCwwMi8xMl0gYm9vdC90aS1rMy1yNS1sb2FkZXI6IHNldCBiaW5tYW4g
ZW52aXJvbm1lbnQKPiA+ID4gaGFzIGJlZW4gaW5jb3Jwb3JhdGVkIGludG8geW91ciBwYXRjaCAi
Ym9vdC90aS1rMy1yNS1sb2FkZXI6IHJlbW92ZQo+ID4gPiBCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9VU0VfQklOTUFOIgo+ID4gPiBhbmQgSSBkb24ndCB1bmRlcnN0YW5kIHdoeS4KPiA+ID4g
Cj4gPiA+IFRoYW5rcyBhbmQgcmVnYXJkcywKPiA+ID4gRGFyaW8KPiA+IAo+ID4gSGkgRGFyaW8s
Cj4gPiAKPiA+IEkgY2FuIGNvbmZpcm0gdGhhdCBzb21ldGhpbmcgaXMgYW1pc3MsIG1heWJlIGl0
IHdvdWxkIGhhdmUgYmVlbiBiZXR0ZXIKPiA+IHRvIGF3YWl0IG1vcmUgdGVzdHMgd2l0aCBwYXRj
aCBWMTIuCj4gCj4gSSBqdXN0IHRlc3RlZCB0b3Atb2YtbWFzdGVyIHcvbyBhbnkgYWRkaXRpb25h
bCBwYXRjaGVzIG9uIFNLLUFNNjIgKHdpdGgKPiBHUCBzaWxpY29uKSBhbmQgU0stQU02MkIgKHBy
b2R1Y3Rpb24gYm9hcmQsIHdpdGggSFMtRlMgc2lsaWNvbikgYW5kIGl0Cj4gd29ya2VkIGxpa2Ug
YSBjaGFtcC4gSGVyZSdzIHRoZSBiZWdpbm5pbmcgb2YgdGhlIGJvb3QgdXNpbmcgU0stQU02Mi4u
LgoKSSBhbHNvIGp1c3QgdGVzdGVkIHRvcC1vZi1tYXN0ZXIgd2l0aCBTSy1BTTY0ICh3aXRoIEdQ
IHNpbGljb24pIGFuZApTSy1BTTY0QiAocHJvZHVjdGlvbiBib2FyZCwgd2l0aCBIUy1GUyBzaWxp
Y29uKSBzdWNjZXNzZnVsbHkuIFdpdGggdGhpcwpJIGNhbiBib290IG9uIGFsbCA0IGJvYXJkL3Np
bGljb24gdmFyaWFudHMgd2l0aG91dCBhbnkgaXNzdWVzLiBUaGlzIHdhcwpkb25lIHVzaW5nIGNv
bW1pdC4uLgoKZDAxZTEzYzRkNCAoInBhY2thZ2UvcHl0aG9uMzogZml4IGNyb3NzIGJ1aWxkcyB3
aGVuIGhvc3QgYW5kIHRhcmdldCB1c2UgdGhlIHNhbWUgU09BQkkiKQoKU28gZnJvbSBteSBQT1Yg
dGhlcmUgaXMgbm8gaXNzdWUgd2l0aCBtaXNzaW5nIHBhdGNoZXMuCgotLQpBbmRyZWFzIERhbm5l
bmJlcmcKVGV4YXMgSW5zdHJ1bWVudHMgSW5jCgoKPiAKPiA8Li4uc25pcC4uLj4KPiBVLUJvb3Qg
U1BMIDIwMjQuMDEgKEFwciAwOSAyMDI0IC0gMjA6MTE6MzAgLTA1MDApCj4gU1lTRlcgQUJJOiAz
LjEgKGZpcm13YXJlIHJldiAweDAwMDggJzguNi40LS12MDguMDYuMDQgKENoaWxsIENhcHliYXIn
KQo+IFNQTCBpbml0aWFsIHN0YWNrIHVzYWdlOiAxMzM2OCBieXRlcwo+IFRyeWluZyB0byBib290
IGZyb20gTU1DMgo+IEF1dGhlbnRpY2F0aW9uIHBhc3NlZAo+IEF1dGhlbnRpY2F0aW9uIHBhc3Nl
ZAo+IEF1dGhlbnRpY2F0aW9uIHBhc3NlZAo+IEF1dGhlbnRpY2F0aW9uIHBhc3NlZAo+IEF1dGhl
bnRpY2F0aW9uIHBhc3NlZAo+IFN0YXJ0aW5nIEFURiBvbiBBUk02NCBjb3JlLi4uCj4gCj4gTk9U
SUNFOiAgQkwzMTogdjIuNyhyZWxlYXNlKTp2Mi43Cj4gTk9USUNFOiAgQkwzMTogQnVpbHQgOiAy
MDowODoxNiwgQXByICA5IDIwMjQKPiBJL1RDOgo+IEkvVEM6IE9QLVRFRSB2ZXJzaW9uOiBVbmtu
b3duXzQuMCAoZ2NjIHZlcnNpb24gMTIuMy4wIChCdWlsZHJvb3QKPiAyMDI0LjAyLTQxNi1nZDAx
ZTEzYzRkNCkpICMxIFdlZCBBcHIgMTAgMDE6MDg6MTQgVVRDIDIwMjQgYWFyY2g2NAo+IEkvVEM6
IFdBUk5JTkc6IFRoaXMgT1AtVEVFIGNvbmZpZ3VyYXRpb24gbWlnaHQgYmUgaW5zZWN1cmUhCj4g
SS9UQzogV0FSTklORzogUGxlYXNlIGNoZWNrCj4gaHR0cHM6Ly9vcHRlZS5yZWFkdGhlZG9jcy5p
by9lbi9sYXRlc3QvYXJjaGl0ZWN0dXJlL3BvcnRpbmdfZ3VpZGVsaW5lcy5odG1sCj4gSS9UQzog
UHJpbWFyeSBDUFUgaW5pdGlhbGl6aW5nCj4gSS9UQzogU1lTRlcgQUJJOiAzLjEgKGZpcm13YXJl
IHJldiAweDAwMDggJzguNi40LS12MDguMDYuMDQgKENoaWxsCj4gQ2FweWJhcicpCj4gSS9UQzog
SFVLIEluaXRpYWxpemVkCj4gSS9UQzogQWN0aXZhdGVkIFNBMlVMIGRldmljZQo+IEkvVEM6IEVu
YWJsZWQgZmlyZXdhbGxzIGZvciBTQTJVTCBUUk5HIGRldmljZQo+IEkvVEM6IFNBMlVMIFRSTkcg
aW5pdGlhbGl6ZWQKPiBJL1RDOiBTQTJVTCBEcml2ZXJzIGluaXRpYWxpemVkCj4gSS9UQzogUHJp
bWFyeSBDUFUgc3dpdGNoaW5nIHRvIG5vcm1hbCB3b3JsZCBib290Cj4gCj4gVS1Cb290IFNQTCAy
MDI0LjAxIChBcHIgMDkgMjAyNCAtIDIwOjExOjQ4IC0wNTAwKQo+IFNZU0ZXIEFCSTogMy4xIChm
aXJtd2FyZSByZXYgMHgwMDA4ICc4LjYuNC0tdjA4LjA2LjA0IChDaGlsbCBDYXB5YmFyJykKPiBT
UEwgaW5pdGlhbCBzdGFjayB1c2FnZTogMTg3MiBieXRlcwo+IFRyeWluZyB0byBib290IGZyb20g
TU1DMgo+IEF1dGhlbnRpY2F0aW9uIHBhc3NlZAo+IEF1dGhlbnRpY2F0aW9uIHBhc3NlZAo+IAo+
IAo+IFUtQm9vdCAyMDI0LjAxIChBcHIgMDkgMjAyNCAtIDIwOjExOjQ4IC0wNTAwKQo+IAo+IFNv
QzogICBBTTYyWCBTUjEuMCBIUy1GUwo+IE1vZGVsOiBUZXhhcyBJbnN0cnVtZW50cyBBTTYyNSBT
Swo+IERSQU06ICAyIEdpQgo+IENvcmU6ICA1NiBkZXZpY2VzLCAyMyB1Y2xhc3NlcywgZGV2aWNl
dHJlZTogc2VwYXJhdGUKPiBNTUM6ICAgbW1jQGZhMTAwMDA6IDAsIG1tY0BmYTAwMDAwOiAxCj4g
TG9hZGluZyBFbnZpcm9ubWVudCBmcm9tIG5vd2hlcmUuLi4gT0sKPiBJbjogICAgc2VyaWFsQDI4
MDAwMDAKPiBPdXQ6ICAgc2VyaWFsQDI4MDAwMDAKPiBFcnI6ICAgc2VyaWFsQDI4MDAwMDAKPiBO
ZXQ6ICAgZXRoMDogZXRoZXJuZXRAODAwMDAwMHBvcnRAMQo+IEhpdCBhbnkga2V5IHRvIHN0b3Ag
YXV0b2Jvb3Q6ICAwCj4gPC4uLnNuaXAuLi4+Cj4gCj4gCj4gPiBBdCBsZWFzdCBteSBjdXJyZW50
IHRlc3Qgb2YgdGlfYW02Mnhfc2tfZGVmY29uZmlnIG9uIG1hc3RlciBmYWlsZWQgdG8gYm9vdDoK
PiA+IAo+ID4gICBVLUJvb3QgU1BMIDIwMjQuMDEgKEFwciAxMCAyMDI0IC0gMDk6MzI6MTcgKzAy
MDApCj4gPiAgIGszX3N5c3RlbV9jb250cm9sbGVyIHN5c2N0cmxlcjogazNfc3lzY3RybGVyX3N0
YXJ0OiBCb290IE5vdGlmaWNhdGlvbiByZXNwb25zZSBmYWlsZWQuIHJldCA9IC0xMTAKPiA+ICAg
RmlybXdhcmUgaW5pdCBmYWlsZWQgb24gcnByb2MgKC0xMTApCj4gPiAKPiA+ICAgcmVzZXR0aW5n
IC4uLgo+ID4gCj4gPiBJIHRlc3RlZCB3aXRoIEFNNjJ4IFNLIEVWTSBFMy4gSSdsbCB0cnkgdG8g
YXBwbHkgeW91ciB0d28gbWlzc2luZwo+ID4gcGF0Y2hlcyBhbmQgdGVzdCBhZ2Fpbi4KPiAKPiBB
cmUgeW91IHVzaW5nIGEgYm9hcmQgd2l0aCBQQ0IgcmV2aXNpb24gJ1BST0MxMTRFMyc/IElmIHNv
IHRoaXMgYm9hcmQgaXMKPiBrbm93biBhcyAnVGhpcmQgcHJvdG90eXBlLCBlYXJseSByZWxlYXNl
IHJldmlzaW9uIG9mIHRoZSBBTTYyeCBTSyBFVk0nCj4gYW5kIHNob3VsZCBoYXZlIEdQIHNpbGlj
b24uIFdoaWNoIG1lYW5zIHlvdSBtdXN0IGhhdmUgcmUtYWRkZWQuLi4KPiAKPiBCUjJfVEFSR0VU
X1RJX0szX1I1X0xPQURFUl9USUJPT1QzX0JJTj0idGlib290My1hbTYyeC1ncC1ldm0uYmluCj4g
Cj4gLi4udG8geW91ciAuY29uZmlnPwo+IAo+IEkgZG9uJ3QgaGF2ZSBhIFBST0MxMTRFMyBib2Fy
ZCBidXQgdGhlIGJvYXJkIEkgdXNlZCB0byB0ZXN0IHRoZSBHUAo+IHZhcmlhbnQgdG9kYXkgaXMg
YSBQUk9DMTE0RTIsIGFuZCBpdCB3b3JrZWQuIEJ1dCBuZWl0aGVyIG9mIHRob3NlIGJvYXJkcwo+
IGlzIGNvbnNpZGVyZWQgInByb2R1Y3Rpb24iLgo+IAo+IEFsc28ganVzdCBmb3IgcmVmZXJuY2Us
IGFuIFNLLUFNNjIgUENCIHJldmlzaW9uIGhpc3RvcnkgY2FuIGJlIGZvdW5kIGluCj4gVGFibGUg
MS0xIGluIHRoZSBBTTYyeCBTSyBFVk0gVXNlcidzIEd1aWRlIFsxXS4KPiAKPiAKPiAtLQo+IEFu
ZHJlYXMgRGFubmVuYmVyZwo+IFRleGFzIEluc3RydW1lbnRzIEluYwo+IAo+IAo+IFsxXSBodHRw
czovL3d3dy50aS5jb20vbGl0L3BkZi9zcHJ1ajQwIAo+IAo+IAo+IAo+IAo+ID4gQmVzdCwKPiA+
IEdlcm8KPiA+IAo+ID4gPiA+IEJlc3QgcmVnYXJkcywKPiA+ID4gPiBSb21haW4KPiA+ID4gPgo+
ID4gWy4uLl0KPiA+IAo+ID4gLS0gCj4gPiAKPiA+IAo+ID4gCj4gPiDigJPigJPigJMKPiA+IAo+
ID4gCj4gPiBncmFuZGNlbnRyaXggR21iSCB8IEEgVm9kYWZvbmUgQ29tcGFuecKgwrfCoEhvbHpt
YXJrdCAxwqDCt8KgNTA2NzYgCj4gPiAqQ29sb2duZSrCoHzCoFBob2VuaXhzZWVzdHJhc3NlIDE4
wqDCt8KgNDQyNjMgKkRvcnRtdW5kKsKgwrfCoEdlcm1hbnkKPiA+IHzCoGluIAo+ID4gPGh0dHBz
Oi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L2dyYW5kY2VudHJpeD4gfCBwaG9uZTogKzQ5LTIy
MS02NzctODYwLTAgCj4gPiB8wqBlbWFpbDogaGVsbG9AZ3JhbmRjZW50cml4Lm5ldCA8bWFpbHRv
OmhlbGxvQGdyYW5kY2VudHJpeC5uZXQ+Cj4gPiAKPiA+IAo+ID4gZ3JhbmRjZW50cml4IGNhcmVz
IGFib3V0wqBwcml2YWN5IAo+ID4gPGh0dHBzOi8vZ3JhbmRjZW50cml4Lm5ldC9kZS9wYWdlcy9w
cml2YWN5bWFpbC8+Cj4gPiAKPiA+IEFtdHNnZXJpY2h0IEvDtmxuIHwgSFJCIMKgCj4gPiA3MDEx
OSB8IEdlc2Now6RmdHNmw7xocmVyOiBNLiBLcsO2bWVyLMKgIFIuIEjDpG5lbCB8IFVTdC4tSWRO
ci46IERFMjY2MzMzOTY5Cj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
