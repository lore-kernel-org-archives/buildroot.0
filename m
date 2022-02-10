Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07816C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 20:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EEC8408D8;
	Thu, 10 Feb 2022 20:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVRsPb8AwN0b; Thu, 10 Feb 2022 20:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 791F7404E7;
	Thu, 10 Feb 2022 20:01:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E19D71BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC80860E9C
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5i8vil2QJdr for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 20:01:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39EF760A84
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 20:01:04 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IFclnZ4ZINVvLIFclnNmlB; Thu, 10 Feb 2022 21:01:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644523263; bh=wl3jwH2FHcwaXQai0c7GB8MJmQZRbVHbKgC+QPGr/1g=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=OxP/biFx5jYPFPu5T+bmRVLBIa6uYCKvWoWkt0QIRbLSj8ksekrmq7JzVX7YP/SFN
 W6itvrgx8fvsI3axynnnm/NECmOhLn8vIODntMSDgj7P3SoATG8FC6dAZeVJsWMjPn
 6ZOw5U2pImw2IhnzM24Spa57MRD7oBbbryb8ZMc6szNlazmW4Fy67heDynRgnH0FtK
 22q5/YA1iVyZedruzupSnWUtl/L0AuU+DyD4CxKyGtMTsbP/BrF7bNNgt9sfs3jt4/
 9ppIMtlHodVvF/hq6sOOfcBx8RBCl3SzPkHI0J57s5Iy+7PSIJpy3cmhN5iCIWTA+p
 OugVg7/8FxHXA==
Message-ID: <d82d35f5-426f-e0ce-7765-b7995f7abd1c@benettiengineering.com>
Date: Thu, 10 Feb 2022 21:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Michal Simek <michal.simek@xilinx.com>,
 Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220210081932.3114763-1-neal.frager@xilinx.com>
 <7ed72b26-0729-93c7-e1c7-c429e2a5fb87@benettiengineering.com>
 <20cfc8a7-9e51-8e16-3db6-775658503a75@xilinx.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20cfc8a7-9e51-8e16-3db6-775658503a75@xilinx.com>
X-CMAE-Envelope: MS4wfMcn0go16JFeFgz+YI+AKkiI+jwIOYzZffRW88DCWwj1qZGg1YEPhXACNiSj4lgKFa9udH631bUYwQkuFMVO65+AY7oOyy3D7zaMjhILEiI05XHtsRmj
 7X6flFA+60ly8xnZxB89tZEjZKuULyZ317ZquKqfHb3aBbicAipb0fRL/AEHvr/hH28bA473WVHnza7Y7avU1tzRZ5tDhyY05GvVEIxvC6q3EcgfEoTUCWA6
 BodJV9hW9Rufa+FVbFr6XgBGRyY7208pPwuMczRB79orNSht/AedHxmBpuKCBIquJm6ZpJTqxN3qfqgzcd8WJQ==
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: luca@lucaceresoli.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFsLAoKT24gMTAvMDIvMjIgMTk6NDEsIE1pY2hhbCBTaW1layB3cm90ZToKPiAKPiAK
PiBPbiAyLzEwLzIyIDE3OjM5LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4gSGkgTmVhbCwKPj4K
Pj4gT24gMTAvMDIvMjIgMDk6MTksIE5lYWwgRnJhZ2VyIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaDoK
Pj4+IC0gYnVtcHMgQVRGIHRvIFhpbGlueCB2Mi42OiBtYWlubGluZSB2Mi42IHJlcXVpcmVzIHBh
dGNoIHRvIGJ1aWxkCj4+PiAtIGJ1bXBzIFUtQm9vdCB0byBYaWxpbnggMjAyMi4wMTogaW1wb3J0
YW50IGRyaXZlcnMgbm90IGluIG1haW5saW5lCj4+PiAtIGJ1bXBzIExpbnV4IHRvIFhpbGlueCA1
LjE1OiBpbXBvcnRhbnQgZHJpdmVycyBub3QgaW4gbWFpbmxpbmUKPj4+IC0gZGVsZXRlcyBib2Fy
ZC96eW5xbXAvcGF0Y2hlcyBkaXJlY3Rvcnk6IHBhdGNoZXMgYWxyZWFkeSBpbiBtYWlubGluZQo+
Pj4gLSBtb2RpZmllcyBib2FyZC96eW5xbXAvZ2VuaW1hZ2UuY2ZnOiBVLUJvb3QgMjAyMi4wMSB1
c2VzIHUtYm9vdC5pdGIgZm9ybWF0Cj4+PiAtIGFkZHMgZXh0bGludXguY29uZiB0byB2ZmF0IGJv
b3Rmcwo+Pj4gLSBtb2RpZmllcyBVLUJvb3QgdG8gdW5pZmllZCB4aWxpbnhfenlucW1wX3ZpcnRf
ZGVmY29uZmlnIChzdXBwb3J0cyBhbGwgYm9hcmRzKQo+Pj4gLSBhZGRzIHN1cHBvcnQgZm9yIFNQ
TCBwbV9jZmdfb2JqLmMgbG9hZGluZyB0byBQTVUgZmlybXdhcmUKPj4+IC0gZW5hYmxlcyBzdXBw
b3J0IGZvciBob3N0IG1hY2hpbmVzIHdpdGhvdXQgT3BlblNTTCByZXF1aXJlZCBieSBVLUJvb3Qg
YW5kIExpbnV4Cj4+Pgo+Pgo+PiBJZiB5b3UgcHV0IHRoZSAzIGRhc2hlcyBiZWxvdywgZXZlcnl0
aGluZyBhZnRlciB0aGVtIHdpbGwgYmUgaWdub3JlZCwgc28geW91Cj4+IG5lZWQgdG8gcHV0IGhl
cmUuLi4KPj4KPj4+IC0tLQo+Pj4gVjEtPlYyOgo+Pj4gKiBmaXhlZCBnZW5lcmFsIGJ1aWxkIGlz
c3Vlcwo+Pj4gKiBhZGRlZCBleHRsaW51eC5jb25mIGZvciBydW4tdGltZSBib290IGlzc3VlCj4+
PiBWMi0+VjM6Cj4+PiAqIGVuYWJsZWQgc3VwcG9ydCBmb3IgaG9zdCBtYWNoaW5lcyB3aXRob3V0
IE9wZW5TU0wgcmVxdWlyZWQgYnkgVS1Cb290IGFuZCBMaW51eAo+Pj4gKiBtb3ZlZCByZWFkbWUu
dHh0IHVwZGF0ZSB0byB6eW5xbXBfemN1MTAyX2RlZmNvbmZpZyBwYXRjaCAyLzIKPj4+IFYzLT5W
NDoKPj4+ICogY2xlYW5lZCB1cCBjb21taXQgbG9nIG1lc3NhZ2VzCj4+PiAqIGFkZGVkIHZlcnNp
b24gaGlzdG9yeQo+Pj4gLS0tCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5l
YWwuZnJhZ2VyQHhpbGlueC5jb20+Cj4+PiBSZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdp
dWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+PiBUZXN0ZWQtYnk6IEdpdWxp
byBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4gW0dp
dWxpbzogb25seSBidWlsZCB0ZXN0ZWRdCj4+Cj4+IFRoZXNlIF5eXgo+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQHhpbGlueC5jb20+Cj4+Cj4+IEFuZCBkcm9w
IHRoaXMgXl5eIHRoYXQgaXMgYWxyZWFkeSBwYXJ0IG9mIHRoZSBwYXRjaC4KPj4KPj4gU2FtZSBn
b2VzIGZvciBwYXRjaCAyLzIKPj4KPj4gQW5kIEkgd291bGQgc2hyaW5rIHBtX2NmZ19vYmouYyBk
b3duIHRvIHdoYXQgYm9hcmRzIHJlYWxseSBzcG9ydCB3aXRob3V0Cj4+IHRoaW5raW5nIHRvbyBt
dWNoIGFib3V0IGV2ZW50dWFsIGN1c3RvbSBib2FyZHMgYXMgZGlzY3Vzc2VkIGhlcmU6Cj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjItRmVicnVh
cnkvNjM2NTEzLmh0bWwKPj4KPj4+IC0tLQo+Pj4gIMKgIGJvYXJkL3p5bnFtcC9leHRsaW51eC5j
b25mwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArCj4+PiAg
wqAgYm9hcmQvenlucW1wL2dlbmltYWdlLmNmZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgNiArLQo+Pj4gIMKgIC4uLi1maXgtUmVtb3ZlLUdHQy1pZ25vcmUt
V2FycmF5LWJvdW5kcy5wYXRjaCB8wqAgNjggLS0KPj4+ICDCoCAuLi42NC16eW5xbXAtemN1MTA2
LWZpeC1TUEwtTU1DLWJvb3RpbmcucGF0Y2ggfMKgIDUyIC0tCj4+PiAgwqAgLi4uMi1hcm02NC16
eW5xbXAtRW5hYmxlLWJvb3RpbmctdG8tQVRGLnBhdGNoIHwgMTE0IC0tLS0KPj4+ICDCoCAuLi5l
cHQtYW4tYWJzb2x1dGUtcGF0aC1mb3ItUE1VRldfSU5JVF8ucGF0Y2ggfMKgIDY4IC0tCj4+PiAg
wqAgLi4ueW5xbXAtcGFzcy10aGUtUFMtaW5pdC1maWxlLWFzLWEta2NvLnBhdGNoIHwgMTc1IC0t
LS0tCj4+PiAgwqAgYm9hcmQvenlucW1wL3BtX2NmZ19vYmouY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2MTQgKysrKysrKysrKysrKysrKysrCj4+Cj4+IEJ1dCBo
ZXJlIEkgc2VlIHlvdSBvbmx5IGhhdmUgb25lIHBtX2NmZ19vYmouYyBmb3IgYm90aCB6MTAyIGFu
ZCB6MTA2LCBpcyB0aGF0Cj4+IHN1ZmZpY2llbnQ/IEkgbWVhbiwgaGF2ZSB0aGV5IHNvIGNvbW1v
biBwZXJpcGhlcmFscz8KPj4KPj4gSSBzZWUgd2UgaGF2ZSB0byBkZWFsIHdpdGg6Cj4+IFp5bnEg
VWx0cmFTY2FsZSsgWENaVTdFVi0yRkZWQzExNTYgTVBTb0MgZm9yIHoxMDYKPj4gYW5kCj4+IFp5
bnEgVWx0cmFTY2FsZSsgWENaVTlFRy0yRkZWQjExNTYgTVBTb0MgZm9yIHoxMDIKPj4KPj4gc28g
SSBkb24ndCBrbm93IGlmIGhhdmluZyBhIGNvbW1vbiBwbV9jZmdfb2JqLmMgc2hvdWxkIGJlIGEg
Z29vZCBpZGVhLgo+Pgo+PiBJIGtub3cgZmV3IGFib3V0IEZQR0FzLCBidXQgSSBkb24ndCBrbm93
IGlmIHRoZXkgYXJlIHJlYWxseSBjb21wYXRpYmxlLgo+IAo+IFRoZXNlIGJvYXJkcyBjYW4gdXNl
IHRoZSBzYW1lIGNvbmZpZyBvYmplY3QuIEJ1dCBpdCBhbGwgdGhlIHRpbWUgZGVwZW5kcyBvbgo+
IGNvbmZpZ3VyYXRpb25zIHlvdSB3YW50LiBCdXQgZGVmYXVsdCBldmVyeSBib2FyZC9jb25maWcv
Yml0c3RyZWFtIGNhbiByZXF1aXJlCj4gZGlmZmVyZW50IGNvbmZpZyBvYmplY3QuCgpZZXMsIHNv
IGl0J3MgYmV0dGVyIHVzaW5nIGRpZmZlcmVudCBwbV9jZmdfb2JqLmMgaW4gZGlmZmVyZW50IApk
aXJlY3Rvcmllcy4gVGhpcyB3YXkgaWYgeW91IHdpbGwgYWRkIGFub3RoZXIgRlBHQSBpdCB3aWxs
IGhhdmUgaXRzIG93bgpiaXN0cmVhbShwbV9jZmdfb2JqLmMgQUZBSUNVKS4KClRoYW5rIHlvdSEK
QmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
