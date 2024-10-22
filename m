Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA82CDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB5F60604;
	Tue, 22 Oct 2024 19:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCuXumPX4Nh0; Tue, 22 Oct 2024 19:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693DD60671
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693DD60671;
	Tue, 22 Oct 2024 19:04:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB8BE59F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C13260671
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADeE82-vO2lP for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:04:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE60B60604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE60B60604
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE60B60604
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:04:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1D31F2003D0;
 Tue, 22 Oct 2024 21:04:48 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40464])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Oct 2024 21:04:48 +0200
MIME-Version: 1.0
Date: Tue, 22 Oct 2024 21:04:48 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
In-Reply-To: <20241002112334.3193139-1-vincent.stehle@arm.com>
References: <20241002112334.3193139-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b8555ee6c2ecc4ac13b139ce08e03dcd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729623892;
 bh=8Uj5OaRmNgiMW9nlqliHFQ1GUx2uy92704vBABn9YOo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M9fv+bQ7s/Sssc+UJTGSRippYlUPOPYXh5q0vVxPuoKgdEcx0auVYFvI7ANEl1+J6
 PwubMuHelF7aaoont7SxaK8mFEr3RCantCt73AvPGxWw6UEgqxcrMbAfD0vZ59ib/6
 tA8lmCB2MTckX3d0mzzVk0uOAab3l809I0HIBckRoJtWaoKOzevabwC72YJwpiaemB
 IxNFfoG3ik6/hvcrK+GsbVzrZMoyELD/sZswhyvqSfz8+xs76J0oqg9R1dYOXcT1EF
 sa/A6K78fAhsYIBmegZc8ctV4yCEfTBWIYP92OKvD6Zm2k1i7o2ANWF0mfRDbVxWh7
 4fGQkth5UFi3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M9fv+bQ7
Subject: Re: [Buildroot] [PATCH v2] configs/aarch64_efi: bump Linux to
 6.10.12
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwgQWxsLAoKT24gMDIvMTAvMjAyNCAxMzoyMiwgVmluY2VudCBTdGVobMOpIHdy
b3RlOgo+IFdoaWxlIGF0IGl0Ogo+IC0gVHVybiBvbiBoYXNoZXMgdmVyaWZpY2F0aW9uIGFuZCBh
ZGQgYSBoYXNoIGZvciB0aGUgTGludXgga2VybmVsLgo+IC0gTGludXgga2VybmVsIG5lZWRzIGhv
c3QtcHl0aG9uMzsgYWRkIGl0Lgo+IC0gQ29udmVydCB0byBgbWFrZSBzYXZlZGVmY29uZmlnJyBm
b3JtYXQuCj4gLSBGaXggc2hlbGxjaGVjayB3YXJuaW5ncyBpbiBvdXIgcG9zdC1pbWFnZSBzY3Jp
cHQgYW5kIHVwZGF0ZQo+ICAgLmNoZWNrcGFja2FnZWlnbm9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IEVyaWNvIE51
bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+Cj4gQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxs
YS5pbz4KPiBDYzogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KClRoYW5rcyBmb3IgdGhl
IHBhdGNoIQoKSSBhbSBoYXBweSB0byB0ZWxsIHlvdSB0aGF0IEkgYXBwbGllZCB0aGlzIHBhdGNo
IHRvIG1hc3RlciwgYXMgbXkKZmlyc3QgQnVpbGRyb290IG1haW50ZW5hbmNlIGNvbnRyaWJ1dGlv
biEKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KCgo+IC0tLQo+IAo+IAo+IENoYW5nZXMgdjEgLT4g
djI6Cj4gICAtIENvbnZlcnQgdG8gYG1ha2Ugc2F2ZWRlZmNvbmZpZycgZm9ybWF0ICAoc3VnZ2Vz
dGVkIGJ5IEp1bGllbikKPiAgIC0gQWRkIGhvc3QtcHl0aG9uMyBmb3IgTGludXgga2VybmVsICAo
c3VnZ2VzdGVkIGJ5IEp1bGllbikKPiAKPiAKPiAgLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgLS0KPiAgLi4uL3BhdGNoZXMvbGludXgtaGVhZGVycy9s
aW51eC1oZWFkZXJzLmhhc2ggIHwgIDEgKwo+ICBib2FyZC9hYXJjaDY0LWVmaS9wYXRjaGVzL2xp
bnV4L2xpbnV4Lmhhc2ggICAgfCAgMiArKwo+ICBib2FyZC9hYXJjaDY0LWVmaS9wb3N0LWltYWdl
LnNoICAgICAgICAgICAgICAgfCAgNCArLS0KPiAgY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25m
aWcgICAgICAgICAgICAgICAgIHwgMzUgKysrKysrLS0tLS0tLS0tLS0tLQo+ICA1IGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAx
MjAwMDAgCj4gYm9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhl
YWRlcnMuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hl
cy9saW51eC9saW51eC5oYXNoCj4gCj4gZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUg
Yi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggMGNjNzQyYmYwOS4uZmVkOGE1YzJiNiAxMDA2
NDQKPiAtLS0gYS8uY2hlY2twYWNrYWdlaWdub3JlCj4gKysrIGIvLmNoZWNrcGFja2FnZWlnbm9y
ZQo+IEBAIC0xLDQgKzEsMyBAQAo+IC1ib2FyZC9hYXJjaDY0LWVmaS9wb3N0LWltYWdlLnNoIFNo
ZWxsY2hlY2sKPiAgYm9hcmQvYW1hcnVsYS92eWFzYS9wb3N0LWJ1aWxkLnNoIFNoZWxsY2hlY2sK
PiAgCj4gYm9hcmQvYW5kZXMvYWUzNTAvcGF0Y2hlcy91Ym9vdC8wMDAxLW1tYy1mdHNkYzAxMF9t
Y2ktU3VwcG9ydC1EVFMtb2YtZnRzZGMwMTAtZHJpdmVyLWZvci0ucGF0Y2ggCj4gbGliX3BhdGNo
LlVwc3RyZWFtCj4gIAo+IGJvYXJkL2FuZGVzL2FlMzUwL3BhdGNoZXMvdWJvb3QvMDAwMi1zcGwt
QWxpZ24tZGV2aWNlLXRyZWUtYmxvYi1hZGRyZXNzLWF0LTgtYnl0ZS1ib3VuZGFyLnBhdGNoIAo+
IGxpYl9wYXRjaC5VcHN0cmVhbQo+IEBAIC0xMDYsNyArMTA1LDYgQEAgCj4gYm9vdC9zeXNsaW51
eC8wMDEzLUZpeC1idWlsZC13aXRoLWdudS1lZmktdmVyc2lvbi0zLjAuOS5wYXRjaCAKPiBsaWJf
cGF0Y2guVXBzdHJlYW0KPiAgCj4gYm9vdC9zeXNsaW51eC8wMDE0LUZpeC1idWlsZC13aXRoLWJp
bnV0aWxzLW5vdGUtZ251LXByb3BlcnR5LXNlY3Rpb24ucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3Ry
ZWFtCj4gIAo+IGJvb3Qvc3lzbGludXgvMDAxNi1Xb3JrYXJvdW5kLW11bHRpcGxlLWRlZmluaXRp
b24tb2Ytc3ltYm9sLWVycm9ycy5wYXRjaCAKPiBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgCj4gYm9v
dC9zeXNsaW51eC8wMDE3LVJlcGxhY2UtYnVpbHRpbi1zdHJsZW4tdGhhdC1hcHBlYXJzLXRvLWdl
dC1vcHRpbWl6ZWQucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFtCj4gLWNvbmZpZ3MvYWFyY2g2
NF9lZmlfZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hhc2gKPiAgY29uZmlncy9h
bTU3NHhfaWRrX2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCj4gIGNvbmZp
Z3MvYW5kZXNfYWUzNTBfNDVfZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hhc2gK
PiAgY29uZmlncy9hcmN0dXJ1c191Y2xzMTAxMmFfZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9y
Y2VDaGVja0hhc2gKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51
eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaCAKPiBiL2JvYXJkL2FhcmNoNjQtZWZpL3BhdGNo
ZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEyMDAw
MAo+IGluZGV4IDAwMDAwMDAwMDAuLjU4MDhkOTJhZmUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
Ym9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFz
aAo+IEBAIC0wLDAgKzEgQEAKPiArLi4vbGludXgvbGludXguaGFzaAo+IFwgTm8gbmV3bGluZSBh
dCBlbmQgb2YgZmlsZQo+IGRpZmYgLS1naXQgYS9ib2FyZC9hYXJjaDY0LWVmaS9wYXRjaGVzL2xp
bnV4L2xpbnV4Lmhhc2ggCj4gYi9ib2FyZC9hYXJjaDY0LWVmaS9wYXRjaGVzL2xpbnV4L2xpbnV4
Lmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjIwOTQxYTI2
OWIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51
eC9saW51eC5oYXNoCj4gQEAgLTAsMCArMSwyIEBACj4gKyMgRnJvbSBodHRwczovL3d3dy5rZXJu
ZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9zaGEyNTZzdW1zLmFzYwo+ICtzaGEyNTYgIAo+
IDUyNDg1ODg1MmY1ODY5YTllZjE3ZGU4YjFlNmU3ZmFmMDViY2IyYzQ2MmJjOTZiM2MyNGRiZjgy
ZWRlMzczY2YgIAo+IGxpbnV4LTYuMTAuMTIudGFyLnh6Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL2Fh
cmNoNjQtZWZpL3Bvc3QtaW1hZ2Uuc2ggCj4gYi9ib2FyZC9hYXJjaDY0LWVmaS9wb3N0LWltYWdl
LnNoCj4gaW5kZXggZjAyMTRkYzg2Ni4uMWFlZjE1ZWY2ZiAxMDA3NTUKPiAtLS0gYS9ib2FyZC9h
YXJjaDY0LWVmaS9wb3N0LWltYWdlLnNoCj4gKysrIGIvYm9hcmQvYWFyY2g2NC1lZmkvcG9zdC1p
bWFnZS5zaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIS9iaW4vc2gKPiAKPiAtQk9BUkRfRElSPSIk
KGRpcm5hbWUgJDApIgo+ICtCT0FSRF9ESVI9JChkaXJuYW1lICIkMCIpCj4gCj4gLWNwIC1mICR7
Qk9BUkRfRElSfS9ncnViLmNmZyAke0JJTkFSSUVTX0RJUn0vZWZpLXBhcnQvRUZJL0JPT1QvZ3J1
Yi5jZmcKPiArY3AgLWYgIiR7Qk9BUkRfRElSfS9ncnViLmNmZyIgCj4gIiR7QklOQVJJRVNfRElS
fS9lZmktcGFydC9FRkkvQk9PVC9ncnViLmNmZyIKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hYXJj
aDY0X2VmaV9kZWZjb25maWcgCj4gYi9jb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZwo+IGlu
ZGV4IDQ0MzExM2U0N2IuLjlmMjg0ZmY3NGIgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9hYXJjaDY0
X2VmaV9kZWZjb25maWcKPiArKysgYi9jb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZwo+IEBA
IC0xLDM0ICsxLDIxIEBACj4gLSMgQXJjaGl0ZWN0dXJlCj4gIEJSMl9hYXJjaDY0PXkKPiAtCj4g
LSMgU3lzdGVtCj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xMD15
Cj4gK0JSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9hYXJjaDY0LWVmaS9wYXRjaGVzIgo+ICtC
UjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKPiAgQlIyX1JPT1RGU19ERVZJQ0VfQ1JF
QVRJT05fRFlOQU1JQ19FVURFVj15Cj4gLQo+IC0jIyBSZXF1aXJlZCB0b29scyB0byBjcmVhdGUg
Ym9vdGFibGUgbWVkaWEKPiAtQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gLQo+IC0jIEJv
b3Rsb2FkZXIKPiAtQlIyX1RBUkdFVF9HUlVCMj15Cj4gLUJSMl9UQVJHRVRfR1JVQjJfQVJNNjRf
RUZJPXkKPiAtCj4gLSMgRmlsZXN5c3RlbSAvIGltYWdlCj4gLUJSMl9UQVJHRVRfUk9PVEZTX0VY
VDI9eQo+IC1CUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQo+IC1CUjJfVEFSR0VUX1JPT1RGU19F
WFQyX1NJWkU9IjIwME0iCj4gLSMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiAg
QlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvYWFyY2g2NC1lZmkvcG9zdC1pbWFn
ZS5zaCAKPiBzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCj4gIEJSMl9ST09URlNfUE9TVF9T
Q1JJUFRfQVJHUz0iLWMgYm9hcmQvYWFyY2g2NC1lZmkvZ2VuaW1hZ2UtZWZpLmNmZyIKPiAtCj4g
LSMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA1LjE1IHNlcmllcwo+IC1CUjJfUEFD
S0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTU9eQo+IC0KPiAtIyBLZXJuZWwKPiAg
QlIyX0xJTlVYX0tFUk5FTD15Cj4gIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+
IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjQiCj4gK0JSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTAuMTIiCj4gIEJSMl9MSU5VWF9L
RVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ICBCUjJfTElOVVhfS0VSTkVMX05FRURT
X0hPU1RfT1BFTlNTTD15Cj4gLQo+IC0jIEhvc3QgdG9vbHMgZm9yIGdlbmltYWdlCj4gK0JSMl9M
SU5VWF9LRVJORUxfTkVFRFNfSE9TVF9QWVRIT04zPXkKPiArQlIyX1RBUkdFVF9ST09URlNfRVhU
Mj15Cj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VY
VDJfU0laRT0iMjAwTSIKPiArIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+ICtC
UjJfVEFSR0VUX0dSVUIyPXkKPiAgQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKPiArQlIy
X1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gIEJSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKPiAt
LQo+IDIuNDUuMgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
