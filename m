Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0996C04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4F784101;
	Fri, 23 Sep 2022 21:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4F784101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBCwIUszCaZI; Fri, 23 Sep 2022 21:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C96C84107;
	Fri, 23 Sep 2022 21:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C96C84107
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 304C71BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F27E660D65
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F27E660D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1b0ElPwTqrrP for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:04:26 +0000 (UTC)
X-Greylist: delayed 00:08:40 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE0360EA7
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DE0360EA7
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:04:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28NKtheM104173;
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28NKthjF025732
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 23
 Sep 2022 15:55:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 23 Sep 2022 15:55:43 -0500
Received: from uda0393673 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28NKtgh1045258;
 Fri, 23 Sep 2022 15:55:42 -0500
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1obpi3-006N74-3m;
 Fri, 23 Sep 2022 15:55:43 -0500
To: <buildroot@buildroot.org>
Date: Fri, 23 Sep 2022 15:55:41 -0500
Message-ID: <20220923205543.1518798-2-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923205543.1518798-1-gadiyar@ti.com>
References: <20220923205543.1518798-1-gadiyar@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1663966543;
 bh=IWdpKmhgbUcZBz01bjP3HAQM1GUgTXhUch5iOQomu40=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TPnBXJxejt1tHvLbsCY5TYwtxgUOsITtb0+XujQNIgRe4T5n3DppITv3yXwKvdcMH
 wJd+92QZSECWLzTNPh9Fmd3FSOrVAeUClrPG94VUppBWmN4Ug1zWODQzq60GltUMAf
 nUMPScjBMuErETSQl4z4Kl/t07gIwjIsVpTExzUM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=TPnBXJxe
Subject: [Buildroot] [PATCH v5 1/3] boot/ti-k3-r5-loader: add new package
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
From: Anand Gadiyar via buildroot <buildroot@buildroot.org>
Reply-To: Anand Gadiyar <gadiyar@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Xuanhao Shi <x-shi@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KClRoaXMgaXMgYSBzZXBhcmF0ZSBVLUJv
b3QgcGFja2FnZSB0aGF0IHdvdWxkIGJ1aWxkCnRoZSBpbnRlcm1lZGlhdGUgc3BsIGJpbmFyeSBm
b3IgdGhlIFI1IGNvcmUgb24gVEkncyBrMyBib2FyZHMuClVzdWFsbHksIHRoZSByZXN1bHRpbmcg
c3BsIHdpbGwgYmUgdXNlZCBmb3IgazMtaW1hZ2UtZ2VuCnRvIGJ1aWxkIHRoZSBmdWxsIFI1IGJv
b3QgYmluYXJ5IHRpYm9vdDMuYmluLgoKU2lnbmVkLW9mZi1ieTogWHVhbmhhbyBTaGkgPHgtc2hp
QHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5hbmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+ClJl
dmlld2VkLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA2ICsrKwogYm9vdC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
CiBib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gICAgICAgICAgICB8IDEzICsrKysrKysK
IGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoIHwgIDIgKwogYm9vdC90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rICAgfCA0NSArKysrKysrKysrKysrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2gKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKCmRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAzZGU2M2VhNzJmLi41ZjM2Y2JmNTM1IDEw
MDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTEyOCw2ICsxMjgsOSBA
QCBGOglwYWNrYWdlL2Rjcm9uLwogRjoJcGFja2FnZS9saWJ4bWxycGMvCiBGOglwYWNrYWdlL3B5
dGhvbi1kb2NvcHQvCiAKK046CUFuYW5kIEdhZGl5YXIgPGdhZGl5YXJAdGkuY29tPgorRjoJYm9v
dC90aS1rMy1yNS1sb2FkZXIvCisKIE46CUFuZHLDqSBad2luZyA8bmVydkBkYXduY3Jvdy5kZT4K
IEY6CXBhY2thZ2UvbGlia3JiNS8KIEY6CXBhY2thZ2Uvb3BlbmFsLwpAQCAtMzA2Myw2ICszMDY2
LDkgQEAgRjoJcGFja2FnZS9weXRob24tcHl1c2IvCiBOOglXb2pjaWVjaCBOaXppxYRza2kgPG5p
emlha0BzcG94Lm9yZz4KIEY6CXBhY2thZ2UvZnd1cC8KIAorTjoJWHVhbmhhbyBTaGkgPFgxNTAw
MDE3N0BnbWFpbC5jb20+CitGOglib290L3RpLWszLXI1LWxvYWRlci8KKwogTjoJWWFpciBCZW4g
QXZyYWhhbSA8eWFpcmJhQHByb3Rvbm1haWwuY29tPgogRjoJcGFja2FnZS9jYXN5bmMvCiBGOglw
YWNrYWdlL2dsb294LwpkaWZmIC0tZ2l0IGEvYm9vdC9Db25maWcuaW4gYi9ib290L0NvbmZpZy5p
bgppbmRleCA0MDQ3MmFlMDdkLi5jZTE3YjJkZjZiIDEwMDY0NAotLS0gYS9ib290L0NvbmZpZy5p
bgorKysgYi9ib290L0NvbmZpZy5pbgpAQCAtMjIsNiArMjIsNyBAQCBzb3VyY2UgImJvb3QvczUw
MC1ib290bG9hZGVyL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC9zaGltL0NvbmZpZy5pbiIKIHNv
dXJjZSAiYm9vdC9zdW4yMGktZDEtc3BsL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC9zeXNsaW51
eC9Db25maWcuaW4iCitzb3VyY2UgImJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiIKIHNv
dXJjZSAiYm9vdC91Ym9vdC9Db25maWcuaW4iCiBzb3VyY2UgImJvb3QvdmV4cHJlc3MtZmlybXdh
cmUvQ29uZmlnLmluIgogCmRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcu
aW4gYi9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uN2Y1ZmEwYjRjOAotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvdGkt
azMtcjUtbG9hZGVyL0NvbmZpZy5pbgpAQCAtMCwwICsxLDEzIEBACitjb25maWcgQlIyX1RBUkdF
VF9USV9LM19SNV9MT0FERVIKKwlib29sICJ0aS1rMy1yNS1sb2FkZXIiCisJaGVscAorCSAgU2Vw
YXJhdGUgVS1Cb290IGJ1aWxkIGZvciBSNSBjb3JlcyBvbiBUSSdzIGszIGJvYXJkcy4KKwkgIFVz
dWFsbHkgdXNlZCB0byBidWlsZCB0aWJvb3QzLmJpbiB3aXRoIGszLWltYWdlLWdlbi4KKworY29u
ZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0JPQVJECisJc3RyaW5nICJCb2FyZCB0byBj
b25maWd1cmUgZm9yIgorCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVIKKwlo
ZWxwCisJICBTcGVjaWZ5IHRoZSBib2FyZCB0byBjb25maWd1cmUgdGhlIGJvb3Rsb2FkZXIgZm9y
LgorCSAgVGhpcyBzaG91bGQgYmUgdGhlIG5hbWUgb2YgYSBib2FyZCB1bmRlciBib2FyZC90aQor
CSAgRm9yIGV4YW1wbGUsICJhbTY0eF9ldm0iLgpkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1s
b2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2ggYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1y
NS1sb2FkZXIuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mYjZj
ZTdjMmE2Ci0tLSAvZGV2L251bGwKKysrIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUt
bG9hZGVyLmhhc2gKQEAgLTAsMCArMSwyIEBACisjIExvY2FsbHkgY29tcHV0ZWQ6CitzaGEyNTYg
IDZkNjlkNWU0NjM1Y2IzZmE3ODUyYmYxNWY4OGNhMzQyZWY3NzQwMTk2ZTcxOTYxZDM1NzJkZWI1
OGJhNDRiZWEgIHUtYm9vdC0yMDIyLjEwLXJjMS50YXIuYnoyCmRpZmYgLS1naXQgYS9ib290L3Rp
LWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90
aS1rMy1yNS1sb2FkZXIubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
MWUwOWZhZDlmNQotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWsz
LXI1LWxvYWRlci5tawpAQCAtMCwwICsxLDQ1IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwor
IworIyB0aS1rMy1yNS1sb2FkZXIubWsKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1RJ
X0szX1I1X0xPQURFUl9WRVJTSU9OID0gMjAyMi4xMC1yYzEKK1RJX0szX1I1X0xPQURFUl9TSVRF
ID0gaHR0cHM6Ly9mdHAuZGVueC5kZS9wdWIvdS1ib290CitUSV9LM19SNV9MT0FERVJfU09VUkNF
ID0gdS1ib290LSQoVElfSzNfUjVfTE9BREVSX1ZFUlNJT04pLnRhci5iejIKK1RJX0szX1I1X0xP
QURFUl9MSUNFTlNFID0gR1BMLTIuMCsKK1RJX0szX1I1X0xPQURFUl9MSUNFTlNFX0ZJTEVTID0g
TGljZW5zZXMvZ3BsLTIuMC50eHQKK1RJX0szX1I1X0xPQURFUl9DUEVfSURfVkVORE9SID0gZGVu
eAorVElfSzNfUjVfTE9BREVSX0NQRV9JRF9QUk9EVUNUID0gdS1ib290CitUSV9LM19SNV9MT0FE
RVJfSU5TVEFMTF9JTUFHRVMgPSBZRVMKK1RJX0szX1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgPSBc
CisJaG9zdC1wa2djb25mIFwKKwkkKEJSMl9NQUtFX0hPU1RfREVQRU5ERU5DWSkgXAorCWhvc3Qt
YXJtLWdudS10b29sY2hhaW4gXAorCWhvc3Qtb3BlbnNzbAorCitUSV9LM19SNV9MT0FERVJfTUFL
RSA9ICQoQlIyX01BS0UpCitUSV9LM19SNV9MT0FERVJfTUFLRV9FTlYgPSAkKFRBUkdFVF9NQUtF
X0VOVikKK1RJX0szX1I1X0xPQURFUl9LQ09ORklHX0RFUEVOREVOQ0lFUyA9IFwKKwlob3N0LWFy
bS1nbnUtdG9vbGNoYWluIFwKKwkkKEJSMl9NQUtFX0hPU1RfREVQRU5ERU5DWSkgXAorCSQoQlIy
X0JJU09OX0hPU1RfREVQRU5ERU5DWSkgXAorCSQoQlIyX0ZMRVhfSE9TVF9ERVBFTkRFTkNZKQor
CitUSV9LM19SNV9MT0FERVJfQk9BUkQgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9L
M19SNV9MT0FERVJfQk9BUkQpKQorVElfSzNfUjVfTE9BREVSX0tDT05GSUdfREVGQ09ORklHID0g
JChUSV9LM19SNV9MT0FERVJfQk9BUkQpX3I1X2RlZmNvbmZpZworVElfSzNfUjVfTE9BREVSX01B
S0VfT1BUUyArPSBcCisJQ1JPU1NfQ09NUElMRT0kKEhPU1RfQVJNX0dOVV9UT09MQ0hBSU5fSU5T
VEFMTF9ESVIpL2Jpbi9hcm0tbm9uZS1lYWJpLSBcCisJQVJDSD1hcm0gXAorCUhPU1RDQz0iJChI
T1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChzdWJzdCAtSSAvLC1pc3lzdGVtIC8sJChI
T1NUX0NGTEFHUykpKSIgXAorCUhPU1RMREZMQUdTPSIkKEhPU1RfTERGTEFHUykiCisKK2RlZmlu
ZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUworCSQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAk
KFRJX0szX1I1X0xPQURFUl9NQUtFKSAtQyAkKEBEKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFX09Q
VFMpCitlbmRlZgorCitkZWZpbmUgVElfSzNfUjVfTE9BREVSX0lOU1RBTExfSU1BR0VTX0NNRFMK
KwljcCAkKEBEKS9zcGwvdS1ib290LXNwbC5iaW4gJChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1z
cGwuYmluCitlbmRlZgorCiskKGV2YWwgJChrY29uZmlnLXBhY2thZ2UpKQotLSAKMi4zNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
