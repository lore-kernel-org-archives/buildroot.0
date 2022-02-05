Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D5FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D40813BA;
	Sat,  5 Feb 2022 23:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsCJaOWKuhKR; Sat,  5 Feb 2022 23:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD609813AD;
	Sat,  5 Feb 2022 23:14:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42D341BF863
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AA386079D
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rYMHTfS8_ZM for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:13:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FF1660625
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:13:58 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GUFgnCJeQX0z7GUFhnHh8I; Sun, 06 Feb 2022 00:13:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644102837; bh=gSv1nmGiXVg1rCHbMgesG+90rsI8ApYyDjdFmM0J+z4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=eiU+9Fz+uc4AW4QeI7otIQyCuU50/05ZZ/IPVXbZ9FxWpHlbDDSUGsXuFQ0DKiAW/
 6GCdhODwEOHN1AZwF1Ns1O4Euo2bGjCJWnQfzsRZ9xhDtW6PTKi8FrDvifHdBd/nDs
 xT0SUX0q4h1Yj6s7H43TFjIPu6nZfQ6tO26s+nV2qNQhFQ9TiO1SjF+9/zVWOrA98N
 ERoxDonZ+IZTXLH4Do6+mBA+jxJcJkTBnHvDG9EQT0h4pfW/aBGO9ksu61hBJSv32m
 H4jill4uiZ9f/AHzcvVg93m6DfAnKulRl2LS6tKzmVlIN63TwWyro9i8f6SC7YS6jn
 pRwWnkcaN+sdg==
Message-ID: <ad2e127a-4662-b535-f32d-73aeee583280@benettiengineering.com>
Date: Sun, 6 Feb 2022 00:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
References: <20220205215558.30751-1-kuzminov.sergey81@gmail.com>
 <033373DF-6707-4295-8A12-D4ABE072608F@benettiengineering.com>
 <4b114bca-d4ee-9ff9-931c-bd7501eb2e32@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <4b114bca-d4ee-9ff9-931c-bd7501eb2e32@gmail.com>
X-CMAE-Envelope: MS4wfJUs1HPruZgbhTDp+2SRt9XPu2QwLcy7uOLIiehATsz/RDDzNsA+Joxq85kC56WevdR5SSCCstoEJbNbXoCbE9tCtjfnwypU1eBHfYNoBdjb4ByinXkz
 IO5KSc6qSLIfkZk/1gmy2TR++JMwCF0/vdyUgk1ABeQehTt68ALcs9rBvU4MdS8Eef1xXrBTtWMDtE2ijt5BoOmWxiSrh9XAADYFPqM643p9qf0uWdC8zoPG
 kYLXqidAcQOgbQOr4p/gIw==
Subject: Re: [Buildroot] [PATCH v2] configs/orangepi_zero_defconfig: switch
 to extlinux
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU2VyZ2V5LAoKT24gMDYvMDIvMjIgMDA6MDQsIFNlcmdleSBLdXptaW5vdiB3cm90ZToKPiBI
aSBHaXVsaW8sCj4gCj4gMDYuMDIuMjAyMiAwMToxOCwgR2l1bGlvIEJlbmV0dGk6Cj4+IEhpIFNl
cmdleSwKPj4KPj4gYmVsb3cgSSBnaXZlIHlvdSBhIGJldHRlciBleGFtcGxlIG9mIGNvbW1pdCBs
b2csCj4+IGFuZCB0aGUgZGVhbGluZyB3aXRoIFYxLT5WMiBzZXJpZXMuCj4+Cj4+PiBJbCBnaW9y
bm8gNSBmZWIgMjAyMiwgYWxsZSBvcmUgMjI6NTYsIFNlcmdleSBLdXptaW5vdiA8a3V6bWlub3Yu
c2VyZ2V5ODFAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+Pj4KPj4+IO+7v0NoYW5nZXM6Cj4+PiB2
MToKPj4KPj4gUGxlYXNlIFJlbW92ZSB0aGlzIGxpbmUgXl5eCj4+Cj4+PiAtIEV4Y2x1ZGUgRkFU
IHBhcnRpdGlvbiwgaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZCBmb3IgVS1Cb290Lgo+Pj4gLSBTd2l0
Y2ggdGhlIHJvb3RmcyBwYXJ0aXRpb24gZnJvbSBNQlIgdG8gR1BUIGZvciBwYXJ0aXRpb24tdXVp
ZCB0byB3b3JrLgo+Pj4gLSBTd2l0Y2ggdG8gZXh0bGludXgsIHRoaXMgaXMgY29udmVuaWVudCBm
b3IgZGVidWdnaW5nLgo+Pj4gLSBDcmVhdGUgY29tbW9uIHNjZW5hcmlvcyBmb3IgbXVsdGlwbGUg
Ym9hcmRzIHRvIGNyZWF0ZSBhbiBTRCBpbWFnZTogYm9hcmQvb3JhbmdlcGkvY29tbW9uLgo+Pj4K
Pj4+IHYyOgo+PiBSZW1vdmUgdGhpcyBeXl4gbGluZQo+Pj4gLSBGaXggdHlwbyBpbiBmaXJzdCBs
aW5lIG9mIGNoYW5nZXMgKHMvaGUvaXQpLgo+PiBUaGlzIHRvbyBeXl4KPj4+IC0gQWRkIEJSMl9U
QVJHRVRfR0VORVJJQ19SRU1PVU5UX1JPT1RGU19SVz15Lgo+PiBIZXJlIHdlIG5lZWQgYW4gZXhw
bGFuYXRpb24gb2YgdGhlIHJlYXNvbiB3aHksIHdoYXQgdGhpcyBpbXBsaWVzLgo+Pj4gLSBFeGNs
dWRlIG9uZSBib290IG9wdGlvbiBmcm9tIGV4dGxpbnV4LmNvbmYuCj4+IFRoaXMgXl5eIHRvbwo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBLdXptaW5vdiA8a3V6bWlub3Yuc2VyZ2V5ODFA
Z21haWwuY29tPgo+PiDigJQtCj4+IFYxLT5WMjoKPj4gKiBpbXByb3ZlZCBjb21taXQgbG9nCj4+
ICogcmVtb3ZlZCBjb21tZW50ZWQgbGluZSBpbiBleHRsaW51eC5jb25mCj4+ICogcmVtb3ZlZCBv
bmUgYm9vdCBvcHRpb24gZnJvbSBleHRsaW51eC5jb25mCj4+PiAtLS0KPj4KPj4gU28gYXMgeW91
IGNhbiBzZWUsIGNvbW1pdCBsb2cgZG9lc27igJl0IG1lbnRpb24gdGhlIHBhdGNoIHZlcnNpb24s
IHdoaWxlIGFmdGVyIHRoZSAzIGRhc2hlcyB5b3UKPj4gY2FuIHdyaXRlIGluIGdlbmVyYWwgd2hh
dGV2ZXIgeW91IHdhbnQgYmVjYXVzZSBpdCB3b27igJl0IGJlIHBhcnQgb2YgY29tbWl0IGxvZyBh
bmQgaXTigJlzIHVzdWFsbHkgdXNlZAo+PiB0byByZXBvcnQgVjEtPlYyIHZlcnNpb24gZXRjLgo+
IAo+IENoYW5nZXM6Cj4gKiBFeGNsdWRlIEZBVCBwYXJ0aXRpb24sIGl0IGlzIG5vIGxvbmdlciBu
ZWVkZWQgZm9yIFUtQm9vdC4KPiAqIFN3aXRjaCB0aGUgcm9vdGZzIHBhcnRpdGlvbiBmcm9tIE1C
UiB0byBHUFQgZm9yIHBhcnRpdGlvbi11dWlkIHRvIHdvcmsuCj4gKiBTd2l0Y2ggdG8gZXh0bGlu
dXgsIHRoaXMgaXMgY29udmVuaWVudCBmb3IgZGVidWdnaW5nLgo+ICogQ3JlYXRlIGNvbW1vbiBz
Y2VuYXJpb3MgZm9yIG11bHRpcGxlIGJvYXJkcyB0byBjcmVhdGUgYW4gU0QgaW1hZ2U6Cj4gYm9h
cmQvb3JhbmdlcGkvY29tbW9uLgo+ICogQWRkIEJSMl9UQVJHRVRfR0VORVJJQ19SRU1PVU5UX1JP
T1RGU19SVz15LCByZW1vdW50IHJvb3QgZmlsZXN5c3RlbQo+IHJlYWQtd3JpdGUgZHVyaW5nIGJv
b3QuCj4gCj4gLS0tCj4gVjEtPlYyOgo+ICogaW1wcm92ZWQgY29tbWl0IGxvZwo+ICogcmVtb3Zl
ZCBjb21tZW50ZWQgbGluZSBpbiBleHRsaW51eC5jb25mCj4gKiByZW1vdmVkIG9uZSBib290IG9w
dGlvbiBmcm9tIGV4dGxpbnV4LmNvbmYKPiAKPiBWMi0+VjM6Cj4gKiBpbXByb3ZlZCBjb21taXQg
bG9nCj4gCj4gVGhhdCdzIHJpZ2h0PwoKWWVzLCB0aGlzIHdvcmtzIGZvciBtZSBub3cKCj4gCj4+
PiArKysgYi9ib2FyZC9vcmFuZ2VwaS9jb21tb24vZ2VuaW1hZ2UuY2ZnCj4+PiBAQCAtMCwwICsx
LDIzIEBACj4+PiAraW1hZ2Ugc2RjYXJkLmltZyB7Cj4+PiArICAgIHBhcnRpdGlvbiB1LWJvb3Qg
ewo+Pj4gKyAgICAgICAgaW4tcGFydGl0aW9uLXRhYmxlID0gZmFsc2UKPj4+ICsgICAgICAgIGlt
YWdlID0gInUtYm9vdC1zdW54aS13aXRoLXNwbC5iaW4iCj4+PiArICAgICAgICBvZmZzZXQgPSA4
Swo+Pj4gKyAgICAgICAgc2l6ZSA9IDEwMDBLICMgMU1CIC0gOEtCKG9mZnNldCkgLSAxNktCKEdQ
VCkKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBoZGltYWdlIHsKPj4+ICsgICAgICAgIHBhcnRp
dGlvbi10YWJsZS10eXBlID0gZ3B0Cj4+PiArICAgICAgICBncHQtbG9jYXRpb24gPSAxMDA4SyAj
IDFNQiAtIDE2S0IoR1BUKQo+Pj4gKyAgICAgICAgZ3B0LW5vLWJhY2t1cCA9IHRydWUKPj4+ICsg
ICAgICAgICMgQWZ0ZXIgd3JpdGluZyB0aGUgaW1hZ2UgdG8gdGhlIFNEIGNhcmQsCj4+PiArICAg
ICAgICAjIGJhY2t1cCBHUFQgZGF0YSBzdHJ1Y3R1cmVzIGF0IHRoZSBlbmQgb2YgdGhlIGRpc2s6
Cj4+PiArICAgICAgICAjIGdkaXNrIC9kZXYvbW1jYmxrMCB0aGVuIHByZXNzIHRoZSBidXR0b25z
OiB4LCBlLCB3LCB5Cj4+Cj4+IFdoeSBkb27igJl0IHlvdSBtYWtlIHRoaXMgcGFydCBeXl4gYXV0
b21hdGljIHdpdGggYSBzY3JpcHQgb3IgeW91IHNpbXBseSB1c2UgZ2VuaW1hZ2UgaXRzZWxmPwo+
Pgo+PiBXaGF0IGl04oCZcyBleHBlY3RlZCBhcyBib2FyZCBkZWZjb25maWcgaXMgc29tZXRoaW5n
IHRoYXQgeW91IGJ1cm4gYSBzZGNhcmQgd2l0aCB0aGUgc2RjYXJkLmltZyBmaWxlIGFuZCB0aGF0
4oCZcyBpdC4gU28gaGVyZSB5b3UgbmVlZCB0byBtYWtlIGl0IGF1dG9tYXRpYy4KPj4KPj4gU28g
d2Ugd2FpdCBmb3IgVjMgd2l0aCB0aGUgY29tbWl0IGxvZyBmb3JtIHlvdSByZWFkIGFib3ZlIGFu
ZCByZXF1ZXN0ZWQgY2hhbmdlcy4KPiAKPiBUaGUgcHJvYmxlbSBpcyB0aGF0IGl0IGlzIG5vdCBw
b3NzaWJsZSB0byBjcmVhdGUgYW4gc2RjYXJkLmltZyBpbWFnZQo+IHdpdGggdGhlIGNvcnJlY3Qg
R1BUIHN0cnVjdHVyZS4gVGhlIHNlY29uZCBjb3B5IG9mIHRoZSBHUFQgbXVzdCBiZSBhdAo+IHRo
ZSBlbmQgb2YgdGhlIGRpc2ssIGFuZCB0aGUgc2l6ZSBvZiBzZGNhcmQuaW1nIHdpbGwgbm90IG1h
dGNoIHRoZSBTRAo+IGNhcmQuIFdpbGwgd29yayBhbmQgc28sIHdpdGggb25lIGNvcHkgb2YgR1BU
LiBCdXQgdGhlIGRpc2sgdXRpbGl0aWVzIG1heQo+IGlzc3VlIGEgd2FybmluZyBhYm91dCB0aGUg
YWJzZW5jZSBvZiBhIHNlY29uZCBjb3B5IG9mIHRoZSBHUFQuIFlvdSBjYW4KPiBjb3JyZWN0IHRo
ZSBzaXR1YXRpb24gb25seSBhZnRlciB3cml0aW5nIHNkY2FyZC5pbWcgdG8gdGhlIFNEIGNhcmQs
IG9yCj4gZHVyaW5nIHRoZSBmaXJzdCBsb2FkaW5nIG9mIHRoZSBib2FyZCBpbiBhIHNlcGFyYXRl
IHNjcmlwdC4gVGhpcyBpcyBvdXQKPiBvZiBzY29wZSBmb3IgdGhpcyBwYXRjaC4KCk9rLCBzbyBw
bGVhc2UgcmVtb3ZlIHRob3NlIDMgY29tbWVudGVkIGxpbmVzIHNpbmNlIEkgdGhpbmsgdGhlIGJv
YXJkIAphY3R1YWxseSB3b3JrcyB3aXRob3V0IHRob3NlIGFkZGl0aW9uYWwgY29tbWFuZHMsIGNv
cnJlY3Q/CgpPdGhlcndpc2UsIGl0IHRoaXMgZG9lc24ndCB3b3JrIG9uIHRhcmdldCB3aXRob3V0
IGdkaXNrIGNvbW1hbmRzLCB5b3UgCm5lZWQgdG8gYWRkIGEgcG9zdC1pbWFnZS5zaCBzY3JpcHQg
dG8gbGF1bmNoIHRob3NlIGNvbW1hbmRzLgoKVGhhbmsgeW91IQpCZXN0IHJlZ2FyZHMKLS0gCkdp
dWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
