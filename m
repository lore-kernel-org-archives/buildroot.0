Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4CCCF3189
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A41E6111E;
	Wed,  2 Oct 2024 19:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_7M_MNKGiiV; Wed,  2 Oct 2024 19:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D74B61113
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D74B61113;
	Wed,  2 Oct 2024 19:10:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 667E61BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55A6381F71
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKZzVZjpEhxN for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1849E81F70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1849E81F70
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1849E81F70
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:10:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E8D77780502;
 Wed,  2 Oct 2024 21:10:11 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56604])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Oct 2024 21:10:11 +0200
MIME-Version: 1.0
Date: Wed, 02 Oct 2024 21:10:11 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
In-Reply-To: <20241002112334.3193139-1-vincent.stehle@arm.com>
References: <20241002112334.3193139-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <52206e50e14b42e631e4be26e42a23dc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727896215;
 bh=okYU8IBshhQpGjV1U81Tt2KBkw2vCYq5DVPvNwgyn4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NWr/lDqgR8dAzirby+bOWsY/IH/eHaPblsuFxuzcU3REOzDUekpRnZy3UO6Nbz9dw
 lopa3iJGrQDnwbPFfEvWsHQVaUj3szwIPFYhZIHnWpXvAjENotwjeni851YZFuMxgx
 D+deqwiy1dCxMf1KqreoDSeP857Ih0PQ2GDaQhXFoSv9k6q4v93Ho44jqyG8euYrCk
 ES63uGlIcIFHVjxnfhJ2mszkm7/2MdUA4ppAVVuTDHNxaefKxngl1evwVBdc4cQcta
 FG9+PnVCGGQprQZpGm491vOeejGJ+6QpCqwdZC2DUeOyhjrbzKNfSFy7CjceZAK6dC
 mkWQ3U2uL/kbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NWr/lDqg
Subject: Re: [Buildroot] [PATCH v2] configs/aarch64_efi: bump Linux to
 6.10.12
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

SGkgVmluY2VudCwgQWxsLAoKVGhhbmsgeW91IGZvciB0aGUgdXBkYXRlIQoKT24gMDIvMTAvMjAy
NCAxMzoyMiwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFdoaWxlIGF0IGl0Ogo+IC0gVHVybiBv
biBoYXNoZXMgdmVyaWZpY2F0aW9uIGFuZCBhZGQgYSBoYXNoIGZvciB0aGUgTGludXgga2VybmVs
Lgo+IC0gTGludXgga2VybmVsIG5lZWRzIGhvc3QtcHl0aG9uMzsgYWRkIGl0Lgo+IC0gQ29udmVy
dCB0byBgbWFrZSBzYXZlZGVmY29uZmlnJyBmb3JtYXQuCj4gLSBGaXggc2hlbGxjaGVjayB3YXJu
aW5ncyBpbiBvdXIgcG9zdC1pbWFnZSBzY3JpcHQgYW5kIHVwZGF0ZQo+ICAgLmNoZWNrcGFja2Fn
ZWlnbm9yZS4KPiAKClJldmlld2VkLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoK
PiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+
Cj4gQ2M6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+Cj4gQ2M6IERpY2sgT2xz
c29uIDxoaUBzZW56aWxsYS5pbz4KPiBDYzogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4K
PiAtLS0KPiAKPiAKPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBDb252ZXJ0IHRvIGBtYWtlIHNh
dmVkZWZjb25maWcnIGZvcm1hdCAgKHN1Z2dlc3RlZCBieSBKdWxpZW4pCj4gICAtIEFkZCBob3N0
LXB5dGhvbjMgZm9yIExpbnV4IGtlcm5lbCAgKHN1Z2dlc3RlZCBieSBKdWxpZW4pCj4gCj4gCj4g
IC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyIC0tCj4g
IC4uLi9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNoICB8ICAxICsKPiAg
Ym9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAgIHwgIDIgKysKPiAg
Ym9hcmQvYWFyY2g2NC1lZmkvcG9zdC1pbWFnZS5zaCAgICAgICAgICAgICAgIHwgIDQgKy0tCj4g
IGNvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnICAgICAgICAgICAgICAgICB8IDM1ICsrKysr
Ky0tLS0tLS0tLS0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyOCBk
ZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTIwMDAwIAo+IGJvYXJkL2FhcmNoNjQtZWZpL3Bh
dGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGJvYXJkL2FhcmNoNjQtZWZpL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+IAo+IGRpZmYg
LS1naXQgYS8uY2hlY2twYWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+IGluZGV4
IDBjYzc0MmJmMDkuLmZlZDhhNWMyYjYgMTAwNjQ0Cj4gLS0tIGEvLmNoZWNrcGFja2FnZWlnbm9y
ZQo+ICsrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiBAQCAtMSw0ICsxLDMgQEAKPiAtYm9hcmQv
YWFyY2g2NC1lZmkvcG9zdC1pbWFnZS5zaCBTaGVsbGNoZWNrCj4gIGJvYXJkL2FtYXJ1bGEvdnlh
c2EvcG9zdC1idWlsZC5zaCBTaGVsbGNoZWNrCj4gIAo+IGJvYXJkL2FuZGVzL2FlMzUwL3BhdGNo
ZXMvdWJvb3QvMDAwMS1tbWMtZnRzZGMwMTBfbWNpLVN1cHBvcnQtRFRTLW9mLWZ0c2RjMDEwLWRy
aXZlci1mb3ItLnBhdGNoIAo+IGxpYl9wYXRjaC5VcHN0cmVhbQo+ICAKPiBib2FyZC9hbmRlcy9h
ZTM1MC9wYXRjaGVzL3Vib290LzAwMDItc3BsLUFsaWduLWRldmljZS10cmVlLWJsb2ItYWRkcmVz
cy1hdC04LWJ5dGUtYm91bmRhci5wYXRjaCAKPiBsaWJfcGF0Y2guVXBzdHJlYW0KPiBAQCAtMTA2
LDcgKzEwNSw2IEBAIAo+IGJvb3Qvc3lzbGludXgvMDAxMy1GaXgtYnVpbGQtd2l0aC1nbnUtZWZp
LXZlcnNpb24tMy4wLjkucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFtCj4gIAo+IGJvb3Qvc3lz
bGludXgvMDAxNC1GaXgtYnVpbGQtd2l0aC1iaW51dGlscy1ub3RlLWdudS1wcm9wZXJ0eS1zZWN0
aW9uLnBhdGNoIAo+IGxpYl9wYXRjaC5VcHN0cmVhbQo+ICAKPiBib290L3N5c2xpbnV4LzAwMTYt
V29ya2Fyb3VuZC1tdWx0aXBsZS1kZWZpbml0aW9uLW9mLXN5bWJvbC1lcnJvcnMucGF0Y2ggCj4g
bGliX3BhdGNoLlVwc3RyZWFtCj4gIAo+IGJvb3Qvc3lzbGludXgvMDAxNy1SZXBsYWNlLWJ1aWx0
aW4tc3RybGVuLXRoYXQtYXBwZWFycy10by1nZXQtb3B0aW1pemVkLnBhdGNoIAo+IGxpYl9wYXRj
aC5VcHN0cmVhbQo+IC1jb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZyBsaWJfZGVmY29uZmln
LkZvcmNlQ2hlY2tIYXNoCj4gIGNvbmZpZ3MvYW01NzR4X2lka19kZWZjb25maWcgbGliX2RlZmNv
bmZpZy5Gb3JjZUNoZWNrSGFzaAo+ICBjb25maWdzL2FuZGVzX2FlMzUwXzQ1X2RlZmNvbmZpZyBs
aWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCj4gIGNvbmZpZ3MvYXJjdHVydXNfdWNsczEwMTJh
X2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCj4gZGlmZiAtLWdpdCBhL2Jv
YXJkL2FhcmNoNjQtZWZpL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gg
Cj4gYi9ib2FyZC9hYXJjaDY0LWVmaS9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgtaGVhZGVy
cy5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMjAwMDAKPiBpbmRleCAwMDAwMDAwMDAwLi41ODA4ZDky
YWZlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2JvYXJkL2FhcmNoNjQtZWZpL3BhdGNoZXMvbGlu
dXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gKPiBAQCAtMCwwICsxIEBACj4gKy4uL2xpbnV4
L2xpbnV4Lmhhc2gKPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPiBkaWZmIC0tZ2l0IGEv
Ym9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoIAo+IGIvYm9hcmQvYWFy
Y2g2NC1lZmkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi4yMDk0MWEyNjliCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Jv
YXJkL2FhcmNoNjQtZWZpL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+IEBAIC0wLDAgKzEsMiBA
QAo+ICsjIEZyb20gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y2Lngv
c2hhMjU2c3Vtcy5hc2MKPiArc2hhMjU2ICAKPiA1MjQ4NTg4NTJmNTg2OWE5ZWYxN2RlOGIxZTZl
N2ZhZjA1YmNiMmM0NjJiYzk2YjNjMjRkYmY4MmVkZTM3M2NmICAKPiBsaW51eC02LjEwLjEyLnRh
ci54ego+IGRpZmYgLS1naXQgYS9ib2FyZC9hYXJjaDY0LWVmaS9wb3N0LWltYWdlLnNoIAo+IGIv
Ym9hcmQvYWFyY2g2NC1lZmkvcG9zdC1pbWFnZS5zaAo+IGluZGV4IGYwMjE0ZGM4NjYuLjFhZWYx
NWVmNmYgMTAwNzU1Cj4gLS0tIGEvYm9hcmQvYWFyY2g2NC1lZmkvcG9zdC1pbWFnZS5zaAo+ICsr
KyBiL2JvYXJkL2FhcmNoNjQtZWZpL3Bvc3QtaW1hZ2Uuc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAg
IyEvYmluL3NoCj4gCj4gLUJPQVJEX0RJUj0iJChkaXJuYW1lICQwKSIKPiArQk9BUkRfRElSPSQo
ZGlybmFtZSAiJDAiKQo+IAo+IC1jcCAtZiAke0JPQVJEX0RJUn0vZ3J1Yi5jZmcgJHtCSU5BUklF
U19ESVJ9L2VmaS1wYXJ0L0VGSS9CT09UL2dydWIuY2ZnCj4gK2NwIC1mICIke0JPQVJEX0RJUn0v
Z3J1Yi5jZmciIAo+ICIke0JJTkFSSUVTX0RJUn0vZWZpLXBhcnQvRUZJL0JPT1QvZ3J1Yi5jZmci
Cj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnIAo+IGIvY29uZmln
cy9hYXJjaDY0X2VmaV9kZWZjb25maWcKPiBpbmRleCA0NDMxMTNlNDdiLi45ZjI4NGZmNzRiIDEw
MDY0NAo+IC0tLSBhL2NvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnCj4gKysrIGIvY29uZmln
cy9hYXJjaDY0X2VmaV9kZWZjb25maWcKPiBAQCAtMSwzNCArMSwyMSBAQAo+IC0jIEFyY2hpdGVj
dHVyZQo+ICBCUjJfYWFyY2g2ND15Cj4gLQo+IC0jIFN5c3RlbQo+ICtCUjJfUEFDS0FHRV9IT1NU
X0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMTA9eQo+ICtCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9h
cmQvYWFyY2g2NC1lZmkvcGF0Y2hlcyIKPiArQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hF
Uz15Cj4gIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVERVY9eQo+IC0KPiAt
IyMgUmVxdWlyZWQgdG9vbHMgdG8gY3JlYXRlIGJvb3RhYmxlIG1lZGlhCj4gLUJSMl9QQUNLQUdF
X0hPU1RfR0VOSU1BR0U9eQo+IC0KPiAtIyBCb290bG9hZGVyCj4gLUJSMl9UQVJHRVRfR1JVQjI9
eQo+IC1CUjJfVEFSR0VUX0dSVUIyX0FSTTY0X0VGST15Cj4gLQo+IC0jIEZpbGVzeXN0ZW0gLyBp
bWFnZQo+IC1CUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPiAtQlIyX1RBUkdFVF9ST09URlNfRVhU
Ml80PXkKPiAtQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIyMDBNIgo+IC0jIEJSMl9UQVJH
RVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9
ImJvYXJkL2FhcmNoNjQtZWZpL3Bvc3QtaW1hZ2Uuc2ggCj4gc3VwcG9ydC9zY3JpcHRzL2dlbmlt
YWdlLnNoIgo+ICBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL2FhcmNoNjQt
ZWZpL2dlbmltYWdlLWVmaS5jZmciCj4gLQo+IC0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJu
ZWwsIGEgNS4xNSBzZXJpZXMKPiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RP
TV81XzE1PXkKPiAtCj4gLSMgS2VybmVsCj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+ICBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iNS4xNS40Igo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI2LjEwLjEyIgo+ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklH
PXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+IC0KPiAtIyBIb3N0
IHRvb2xzIGZvciBnZW5pbWFnZQo+ICtCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfUFlUSE9O
Mz15Cj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQy
XzQ9eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjIwME0iCj4gKyMgQlIyX1RBUkdF
VF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiArQlIyX1RBUkdFVF9HUlVCMj15Cj4gIEJSMl9QQUNL
QUdFX0hPU1RfRE9TRlNUT09MUz15Cj4gK0JSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQo+ICBC
UjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cj4gLS0KPiAyLjQ1LjIKCkJlc3QgcmVnYXJkcywKCkp1
bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
