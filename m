Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4842BC04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF49A60F1B;
	Fri, 23 Sep 2022 21:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF49A60F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIPVTJ2d4vTv; Fri, 23 Sep 2022 21:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F1F760A6B;
	Fri, 23 Sep 2022 21:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F1F760A6B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C71DD1BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A363B60E7B
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A363B60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FO9M97TbjQ8 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:36:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9140C60B2C
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9140C60B2C
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:36:32 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28NKthaT110973;
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28NKthGv025739
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 23
 Sep 2022 15:55:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 23 Sep 2022 15:55:43 -0500
Received: from uda0393673 (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28NKthum067139;
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1obpi3-006N77-4c;
 Fri, 23 Sep 2022 15:55:43 -0500
From: Anand Gadiyar <gadiyar@ti.com>
To: <buildroot@buildroot.org>
Date: Fri, 23 Sep 2022 15:55:42 -0500
Message-ID: <20220923205543.1518798-3-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923205543.1518798-1-gadiyar@ti.com>
References: <20220923205543.1518798-1-gadiyar@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1663966543;
 bh=5SOk0O6lHO+cm1TMRvMRM3qCQpE4l9qE7jH3b1uqMl0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=hFLom+USQY03/Ry33UxV0JfMuNTyetLWNmY3OnBD0er8FYx9/LdrOvPeknibImwIp
 zK8I3c1i1trIqXLEyvxd2yR643TpMcNTiGj9urJzvaIiUVV3FCL0CxvRyYPqh/GciX
 14tx2b8gwOtKwmsK2ofcYnheWqJnFaIiaxsgdCl0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=hFLom+US
Subject: [Buildroot] [PATCH v5 2/3] boot/ti-k3-image-gen: add new package
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Xuanhao Shi <x-shi@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KClRoaXMgaXMgdGhlIGltYWdlIGdlbmVy
YXRvciB0aGF0IGJ1aWxkcyB0aGUgZnVsbCBib290IGJpbmFyeSwKdGlib290My5iaW4sIGZvciB0
aGUgUjUgY29yZSBvbiBUSSdzIGszIGRldmljZXMuClRoaXMgcmVxdWlyZXMgdGhlIFI1IHNwbCBv
dXRwdXQgZnJvbSB0aGUgdGktazMtcjUtbG9hZGVyIHBhY2thZ2UuCgpodHRwczovL2dpdC50aS5j
b20vY2dpdC9rMy1pbWFnZS1nZW4vazMtaW1hZ2UtZ2VuCgpTaWduZWQtb2ZmLWJ5OiBYdWFuaGFv
IFNoaSA8eC1zaGlAdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmFuZCBHYWRpeWFyIDxnYWRpeWFy
QHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5l
dHRpZW5naW5lZXJpbmcuY29tPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKysKIGJvb3QvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluICAgICAgICAgICAgfCAy
NCArKysrKysrKysrKysrKysrKwogYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2Vu
Lmhhc2ggfCAgMiArKwogYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rICAg
fCAzMyArKysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmlu
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2Vu
Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFn
ZS1nZW4ubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA1ZjM2
Y2JmNTM1Li44MWYwOTVmNzk5IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BF
UlMKQEAgLTEyOSw2ICsxMjksNyBAQCBGOglwYWNrYWdlL2xpYnhtbHJwYy8KIEY6CXBhY2thZ2Uv
cHl0aG9uLWRvY29wdC8KIAogTjoJQW5hbmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+CitGOgli
b290L3RpLWszLWltYWdlLWdlbi8KIEY6CWJvb3QvdGktazMtcjUtbG9hZGVyLwogCiBOOglBbmRy
w6kgWndpbmcgPG5lcnZAZGF3bmNyb3cuZGU+CkBAIC0zMDY3LDYgKzMwNjgsNyBAQCBOOglXb2pj
aWVjaCBOaXppxYRza2kgPG5pemlha0BzcG94Lm9yZz4KIEY6CXBhY2thZ2UvZnd1cC8KIAogTjoJ
WHVhbmhhbyBTaGkgPFgxNTAwMDE3N0BnbWFpbC5jb20+CitGOglib290L3RpLWszLWltYWdlLWdl
bi8KIEY6CWJvb3QvdGktazMtcjUtbG9hZGVyLwogCiBOOglZYWlyIEJlbiBBdnJhaGFtIDx5YWly
YmFAcHJvdG9ubWFpbC5jb20+CmRpZmYgLS1naXQgYS9ib290L0NvbmZpZy5pbiBiL2Jvb3QvQ29u
ZmlnLmluCmluZGV4IGNlMTdiMmRmNmIuLjFiMjViYWNmZWUgMTAwNjQ0Ci0tLSBhL2Jvb3QvQ29u
ZmlnLmluCisrKyBiL2Jvb3QvQ29uZmlnLmluCkBAIC0yMiw2ICsyMiw3IEBAIHNvdXJjZSAiYm9v
dC9zNTAwLWJvb3Rsb2FkZXIvQ29uZmlnLmluIgogc291cmNlICJib290L3NoaW0vQ29uZmlnLmlu
Igogc291cmNlICJib290L3N1bjIwaS1kMS1zcGwvQ29uZmlnLmluIgogc291cmNlICJib290L3N5
c2xpbnV4L0NvbmZpZy5pbiIKK3NvdXJjZSAiYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmlu
Igogc291cmNlICJib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4iCiBzb3VyY2UgImJvb3Qv
dWJvb3QvQ29uZmlnLmluIgogc291cmNlICJib290L3ZleHByZXNzLWZpcm13YXJlL0NvbmZpZy5p
biIKZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbiBiL2Jvb3QvdGkt
azMtaW1hZ2UtZ2VuL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi4wMDQxNmRjZWZjCi0tLSAvZGV2L251bGwKKysrIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4v
Q29uZmlnLmluCkBAIC0wLDAgKzEsMjQgQEAKK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdF
X0dFTgorCWJvb2wgInRpLWszLWltYWdlLWdlbiIKKwlzZWxlY3QgQlIyX1RBUkdFVF9USV9LM19S
NV9MT0FERVIKKwloZWxwCisJICBVc2UgVEkncyBrMy1pbWFnZS1nZW4gdG8gYnVpbGQgYSBzZXBh
cmF0ZSBiYXJlIG1ldGFsCisJICBib290IGJpbmFyeSBmcm9tIGEgc2VwYXJhdGUgc3BsLiBDdXJy
ZW50bHkgc3VwcG9ydHMKKwkgIHZlcnNpb24gMDguMDQuMDAuMDA1IGFzIGRlZmF1bHQuCisKKwkg
IGh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L2szLWltYWdlLWdlbi9rMy1pbWFnZS1nZW4vCisKK2Nv
bmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0MKKwlzdHJpbmcgIlNPQyB0eXBlIGZv
ciBpbWFnZSBnZW4iCisJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTgorCWhl
bHAKKwkgIFRoZSB0YXJnZXQgU29DIG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLgorCSAgRm9yIGV4YW1w
bGUsICJhbTY0eCIgZm9yIEFNNjRYIGJvYXJkcy4KKworY29uZmlnIEJSMl9UQVJHRVRfVElfSzNf
SU1BR0VfR0VOX0NPTkZJRworCXN0cmluZyAiQ09ORklHIHR5cGUgZm9yIGltYWdlIGdlbiIKKwlk
ZXBlbmRzIG9uIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOCisJaGVscAorCSAgVGhlIGJvYXJk
IGNvbmZpZyBvcHRpb24gZm9yIGltYWdlIGdlbi4KKwkgIFVzdWFsbHkgInNrIiBvciAiZXZtIi4K
KwpkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2gg
Yi9ib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5lMzA3YTAyYTY3Ci0tLSAvZGV2L251bGwKKysrIGIv
Ym9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2gKQEAgLTAsMCArMSwyIEBA
CisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICBlNTg1ZGM4NjhhZGEyMWVmMzM4OTE1OTU0
MWQ2NjliODhiYzQwNmI0NTM0NzBlOTJkYTg1ZDkyMjJkMjcxYzk2ICBrMy1pbWFnZS1nZW4tMDgu
MDQuMDAuMDA1LnRhci5negpkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMt
aW1hZ2UtZ2VuLm1rIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFmOTc0OTAzOTIKLS0tIC9kZXYv
bnVsbAorKysgYi9ib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWsKQEAgLTAs
MCArMSwzMyBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgdGktazMtaW1hZ2UtZ2Vu
CisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitUSV9LM19JTUFHRV9HRU5fVkVSU0lPTiA9
IDA4LjA0LjAwLjAwNQorVElfSzNfSU1BR0VfR0VOX1NJVEUgPSBodHRwczovL2dpdC50aS5jb20v
Y2dpdC9rMy1pbWFnZS1nZW4vazMtaW1hZ2UtZ2VuL3NuYXBzaG90CitUSV9LM19JTUFHRV9HRU5f
U09VUkNFID0gazMtaW1hZ2UtZ2VuLSQoVElfSzNfSU1BR0VfR0VOX1ZFUlNJT04pLnRhci5negor
VElfSzNfSU1BR0VfR0VOX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKK1RJX0szX0lNQUdFX0dFTl9M
SUNFTlNFX0ZJTEVTID0gc3lzdGVtLWZpcm13YXJlLWltYWdlLWdlbi0xLjAtbWFuaWZlc3QuaHRt
bAorVElfSzNfSU1BR0VfR0VOX0lOU1RBTExfSU1BR0VTID0gWUVTCitUSV9LM19JTUFHRV9HRU5f
REVQRU5ERU5DSUVTID0gaG9zdC1hcm0tZ251LXRvb2xjaGFpbiB0aS1rMy1yNS1sb2FkZXIKK1RJ
X0szX0lNQUdFX0dFTl9NQUtFID0gJChCUjJfTUFLRSkKK1RJX0szX0lNQUdFX0dFTl9TT0MgPSAk
KGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU09DKSkKK1RJX0szX0lN
QUdFX0dFTl9DT05GSUcgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9H
RU5fQ09ORklHKSkKK1RJX0szX0lNQUdFX0dFTl9NQUtFX09QVFMgPSBcCisJU09DPSQoVElfSzNf
SU1BR0VfR0VOX1NPQykgXAorCUNPTkZJRz0kKFRJX0szX0lNQUdFX0dFTl9DT05GSUcpIFwKKwlD
Uk9TU19DT01QSUxFPSQoSE9TVF9BUk1fR05VX1RPT0xDSEFJTl9JTlNUQUxMX0RJUikvYmluL2Fy
bS1ub25lLWVhYmktIFwKKwlTQkw9JChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluIFwK
KwlPPSQoQklOQVJJRVNfRElSKSBcCisJQklOX0RJUj0kKEJJTkFSSUVTX0RJUikKKworZGVmaW5l
IFRJX0szX0lNQUdFX0dFTl9CVUlMRF9DTURTCisJJChUSV9LM19JTUFHRV9HRU5fTUFLRSkgLUMg
JChARCkgJChUSV9LM19JTUFHRV9HRU5fTUFLRV9PUFRTKQorZW5kZWYKKworZGVmaW5lIFRJX0sz
X0lNQUdFX0dFTl9JTlNUQUxMX0lNQUdFU19DTURTCisJY3AgJChARCkvdGlib290My5iaW4gJChC
SU5BUklFU19ESVIpCitlbmRlZgorCiskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQotLSAKMi4z
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
