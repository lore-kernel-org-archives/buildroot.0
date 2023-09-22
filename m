Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40FCE6FE28
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 13:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83AFF82FA5;
	Fri, 22 Sep 2023 13:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83AFF82FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xj3XWK0f54o; Fri, 22 Sep 2023 13:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61D882CF1;
	Fri, 22 Sep 2023 13:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B61D882CF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 804651BF301
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56248418B1
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56248418B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxLC8DZkrd6j for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 13:15:06 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83D23418D6
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 13:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D23418D6
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 1AB59CECCC
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 12:56:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 552CA20012;
 Fri, 22 Sep 2023 12:56:00 +0000 (UTC)
Date: Fri, 22 Sep 2023 14:55:59 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230922145559.49b4ad96@booty>
In-Reply-To: <20230904100443.1613306-4-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230904100443.1613306-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695387403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yg2SayAyoFxB5xdCuqqgSD5HkuPoALgfoSGUwW4GZUo=;
 b=CTY4GHmOILDKQ9cVkkRjmoRFWNNBvjseRO/uBdgixEeFsGXDC+ReITr/2itdqkOQ8J9jhO
 FOxKbk/nIeB0czrE1c8n4t1gu/tdrAUSE8Bdp+aadqGvlrq5slP0vNHdcRxCEiDz49Fvq5
 HjLR70RnbvdumNDWPZ9ITBgf3fYvCYSYpy61qFy5XPVkXmJrHdrrJv55QAlgkGaV8WxTlt
 o1Lh20NHxmdoaSwq4o0H7s9vgSH+P3/dhf+ZGv2LOLZztZaDH+VdlURaVBhUEOWRBSa/Kn
 RSeDaWpNu+MzAuZ5aquLG16+eDs4CR2S/MIsCZB7Yzu+H5KvQiNuJKQvy2nEJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CTY4GHmO
Subject: Re: [Buildroot] [PATCH v3 4/6] package/toolchain-bare-metal: new
 package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBNb24sIDQgU2VwIDIwMjMgMTE6MDQ6NDEgKzAxMDAKTmVhbCBGcmFnZXIgPG5l
YWwuZnJhZ2VyQGFtZC5jb20+IHdyb3RlOgoKPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgdmlydHVh
bCBwYWNrYWdlIGZvciBhZGRpbmcgYSBiYXJlLW1ldGFsIHRvb2xjaGFpbiB0bwo+IGJ1aWxkcm9v
dC4gIEJ5IGRlZmF1bHQsIHRoaXMgcGFja2FnZSB3aWxsIGNvbmZpZ3VyZSBhIGJhcmUtbWV0YWwg
dG9vbGNoYWluCj4gZm9yIHRoZSBYaWxpbnggbWljcm9ibGF6ZSBsaXR0bGUgZW5kaWFuIGFyY2hp
dGVjdHVyZS4gIFdoZW4gY29uZmlndXJlZCBmb3IKPiB0aGUgWGlsaW54IG1pY3JvYmxhemUgYXJj
aGl0ZWN0dXJlLCB0aGlzIHRvb2xjaGFpbiBjYW4gYmUgdXNlZCB0byBidWlsZCB0aGUKPiBtaWNy
b2JsYXplIGZpcm13YXJlIGFwcGxpY2F0aW9ucyBmb3IgenlucW1wIGFuZCB2ZXJzYWwuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSWJhaSBFcmtpYWdhLUVsb3J6YSA8aWJhaS5lcmtpYWdhLWVsb3J6YUBh
bWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29t
Pgo+IC0tLQo+IFYxLT5WMjoKPiAgLSBhZGRzIHNlbGVjdCBvcHRpb24gdG8gYnJpbmcgaW4gYWxs
IHBhY2thZ2VzIG5lZWRlZCBmb3IgdG9vbGNoYWluLWJhcmUtbWV0YWwKPiBWMi0+VjM6Cj4gIC0g
bm8gY2hhbmdlcy8KPiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKysKPiAgcGFja2FnZS9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL0NvbmZpZy5p
bi5ob3N0ICAgfCAyMSArKysrKysrKysrKysrKysrKysrCj4gIC4uLi90b29sY2hhaW4tYmFyZS1t
ZXRhbC5tayAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysKCkkgd29uZGVyIHdoZXRoZXIg
dGhpcyBzaG91bGQgYmUgaW4gdG9vbGNoYWluLyBpbnN0ZWFkIG9mIHBhY2thZ2UvLgoKPiAgNCBm
aWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0Cj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLm1r
Cj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggYjhkYWE5
MTgzYS4uNTk3OGQ3OWEwNiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxP
UEVSUwo+IEBAIC0xMzMxLDYgKzEzMzEsNyBAQCBOOglJYmFpIEVya2lhZ2EtRWxvcnphIDxpYmFp
LmVya2lhZ2EtZWxvcnphQGFtZC5jb20+Cj4gIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRh
bC8KPiAgRjoJcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8KPiAgRjoJcGFja2FnZS9uZXdsaWItYmFy
ZS1tZXRhbC8KPiArRjoJcGFja2FnZS90b29sY2hhaW4tYmFyZS1tZXRhbC8KPiAgCj4gIE46CUln
bmFjeSBHYXfEmWR6a2kgPGlnbmFjeS5nYXdlZHpraUBncmVlbi1jb21tdW5pY2F0aW9ucy5mcj4K
PiAgRjoJcGFja2FnZS9hbmd1bGFyanMvCj4gQEAgLTIyMDAsNiArMjIwMSw3IEBAIEY6CXBhY2th
Z2UvYmludXRpbHMtYmFyZS1tZXRhbC8KPiAgRjoJcGFja2FnZS9ib290Z2VuLwo+ICBGOglwYWNr
YWdlL2djYy1iYXJlLW1ldGFsLwo+ICBGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsLwo+ICtG
OglwYWNrYWdlL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLwo+ICBGOglwYWNrYWdlL3ZlcnNhbC1maXJt
d2FyZS8KPiAgCj4gIE46CU5pY29sYSBEaSBMaWV0byA8bmljb2xhLmRpbGlldG9AZ21haWwuY29t
Pgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9Db25maWcu
aW4uaG9zdAo+IGluZGV4IGFhMWYxNWUzYWMuLjEwM2Q0NjFhN2YgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9Db25maWcuaW4uaG9zdAo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKPiBAQCAt
MTA2LDYgKzEwNiw3IEBAIG1lbnUgIkhvc3QgdXRpbGl0aWVzIgo+ICAJc291cmNlICJwYWNrYWdl
L3N5c3RlbWQvQ29uZmlnLmluLmhvc3QiCj4gIAlzb3VyY2UgInBhY2thZ2UvdGVncmFyY20vQ29u
ZmlnLmluLmhvc3QiCj4gIAlzb3VyY2UgInBhY2thZ2UvdGktY2d0LXBydS9Db25maWcuaW4uaG9z
dCIKPiArCXNvdXJjZSAicGFja2FnZS90b29sY2hhaW4tYmFyZS1tZXRhbC9Db25maWcuaW4uaG9z
dCIKPiAgCXNvdXJjZSAicGFja2FnZS91Ym9vdC10b29scy9Db25maWcuaW4uaG9zdCIKPiAgCXNv
dXJjZSAicGFja2FnZS91dGlsLWxpbnV4L0NvbmZpZy5pbi5ob3N0Igo+ICAJc291cmNlICJwYWNr
YWdlL3V0cF9jb20vQ29uZmlnLmluLmhvc3QiCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdG9vbGNo
YWluLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL3Rvb2xjaGFpbi1iYXJlLW1l
dGFsL0NvbmZpZy5pbi5ob3N0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi42MjliNThkOWM1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvdG9vbGNoYWlu
LWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QKPiBAQCAtMCwwICsxLDIxIEBACj4gK2NvbmZpZyBC
UjJfUEFDS0FHRV9IT1NUX1RPT0xDSEFJTl9CQVJFX01FVEFMCj4gKwlib29sICJob3N0IHRvb2xj
aGFpbi1iYXJlLW1ldGFsIgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfQklOVVRJTFNfQkFS
RV9NRVRBTAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfR0NDX0JBUkVfTUVUQUwKPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9IT1NUX05FV0xJQl9CQVJFX01FVEFMCj4gKwloZWxwCj4gKwkgIHRv
b2xjaGFpbi1iYXJlLW1ldGFsIGlzIGEgaG9zdCB1dGlsaXR5IGZvciBhIGJhcmUtbWV0YWwgdG9v
bGNoYWluCgoiQnVpbGQgYSBiYXJlLW1ldGFsIHRvb2xjaGFpbiBpbiBhZGRpdGlvbiB0byB0aGUg
bWFpbiBMaW51eCB0b29sY2hhaW4iCm9yIHNvbWV0aGluZyBzaW1pbGFyPwoKPiArCj4gK2lmIEJS
Ml9QQUNLQUdFX0hPU1RfVE9PTENIQUlOX0JBUkVfTUVUQUwKPiArCj4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9IT1NUX1RPT0xDSEFJTl9CQVJFX01FVEFMX0FSQ0gKPiArCXN0cmluZwo+ICsJZGVmYXVs
dCAibWljcm9ibGF6ZWVsLXhpbGlueCIKPiArCWhlbHAKPiArCSAgc2VsZWN0IGFyY2hpdGVjdHVy
ZSBmb3IgYmFyZS1tZXRhbCB0b29sY2hhaW4KPiArCj4gK3NvdXJjZSAicGFja2FnZS9iaW51dGls
cy1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0Igo+ICtzb3VyY2UgInBhY2thZ2UvZ2NjLWJhcmUt
bWV0YWwvQ29uZmlnLmluLmhvc3QiCj4gK3NvdXJjZSAicGFja2FnZS9uZXdsaWItYmFyZS1tZXRh
bC9Db25maWcuaW4uaG9zdCIKPiArCj4gK2VuZGlmICNCUjJfUEFDS0FHRV9IT1NUX1RPT0xDSEFJ
Tl9CQVJFX01FVEFMCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdG9vbGNoYWluLWJhcmUtbWV0YWwv
dG9vbGNoYWluLWJhcmUtbWV0YWwubWsgYi9wYWNrYWdlL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL3Rv
b2xjaGFpbi1iYXJlLW1ldGFsLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi40MDdhZDRlYTMzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvdG9vbGNo
YWluLWJhcmUtbWV0YWwvdG9vbGNoYWluLWJhcmUtbWV0YWwubWsKPiBAQCAtMCwwICsxLDcgQEAK
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHRvb2xjaGFpbi1iYXJlLW1ldGFs
Cj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gKyhldmFsICQoaG9zdC12aXJ0
dWFsLXBhY2thZ2UpKQoKCgotLSAKTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
