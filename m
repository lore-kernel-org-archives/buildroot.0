Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D66AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 00:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C254188C;
	Thu, 17 Nov 2022 00:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C254188C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQU3FijnozLB; Thu, 17 Nov 2022 00:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FC74189E;
	Thu, 17 Nov 2022 00:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56FC74189E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0728D1BF954
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 00:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D223441883
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 00:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D223441883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqsCxdeOQ4qC for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 00:15:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1A5441899
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1A5441899
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 00:15:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AH0FBp5071551;
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AH0FBlT011498
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 16
 Nov 2022 18:15:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 16 Nov 2022 18:15:11 -0600
Received: from uda0393673 (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AH0FBxD098056;
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1ovSYh-007MC4-FS;
 Wed, 16 Nov 2022 18:15:11 -0600
To: <buildroot@buildroot.org>
Date: Wed, 16 Nov 2022 18:15:09 -0600
Message-ID: <20221117001511.1753592-2-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117001511.1753592-1-gadiyar@ti.com>
References: <20221117001511.1753592-1-gadiyar@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1668644111;
 bh=G+xg7ymzXtWNYcmsez+zgQOqIlWeCjmqzDcPYl/YeGk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=p6JNbFD/4PIvHTZGQKTYC2PjX0ehkYXBD2SF6QrkLxhZTy6wPv3UvzmlsLYkC8XXn
 MZhdwfmFI5CaexmVs0Ivj8vdH3pfoNxFjFjuJTGwAN4FFDnNmHGIpJQgLPquH0hbJj
 eQKbnRu1oHiebyGNwfJj39njY+0FIfz3eR4czUQY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=p6JNbFD/
Subject: [Buildroot] [PATCH v6 1/3] boot/ti-k3-r5-loader: add new package
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
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Andrew Davis <afd@ti.com>
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
aW5nLmNvbT4KQWNrZWQtYnk6IEFuZHJldyBEYXZpcyA8YWZkQHRpLmNvbT4KQ2M6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KQ2M6IEJyeWFuIEJyYXR0bG9mIDxiYkB0aS5j
b20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiAr
KysKIGJvb3QvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogYm9v
dC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluICAgICAgICAgICAgfCAzMiArKysrKysrKysrKysr
KysKIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoIHwgIDIgKwogYm9v
dC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rICAgfCA0OSArKysrKysrKysrKysr
KysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2
NDQgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKCmRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBiYzAyNmRhNGFhLi5jZjFjYjg4MDhi
IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTEyOCw2ICsxMjgs
OSBAQCBGOglwYWNrYWdlL2Rjcm9uLwogRjoJcGFja2FnZS9saWJ4bWxycGMvCiBGOglwYWNrYWdl
L3B5dGhvbi1kb2NvcHQvCiAKK046CUFuYW5kIEdhZGl5YXIgPGdhZGl5YXJAdGkuY29tPgorRjoJ
Ym9vdC90aS1rMy1yNS1sb2FkZXIvCisKIE46CUFuZHLDqSBad2luZyA8bmVydkBkYXduY3Jvdy5k
ZT4KIEY6CXBhY2thZ2UvbGlia3JiNS8KIEY6CXBhY2thZ2Uvb3BlbmFsLwpAQCAtMzA0NSw2ICsz
MDQ4LDkgQEAgRjoJcGFja2FnZS9weXRob24tcHl1c2IvCiBOOglXb2pjaWVjaCBOaXppxYRza2kg
PG5pemlha0BzcG94Lm9yZz4KIEY6CXBhY2thZ2UvZnd1cC8KIAorTjoJWHVhbmhhbyBTaGkgPFgx
NTAwMDE3N0BnbWFpbC5jb20+CitGOglib290L3RpLWszLXI1LWxvYWRlci8KKwogTjoJWWFpciBC
ZW4gQXZyYWhhbSA8eWFpcmJhQHByb3Rvbm1haWwuY29tPgogRjoJcGFja2FnZS9jYXN5bmMvCiBG
OglwYWNrYWdlL2dsb294LwpkaWZmIC0tZ2l0IGEvYm9vdC9Db25maWcuaW4gYi9ib290L0NvbmZp
Zy5pbgppbmRleCA0MDQ3MmFlMDdkLi5jZTE3YjJkZjZiIDEwMDY0NAotLS0gYS9ib290L0NvbmZp
Zy5pbgorKysgYi9ib290L0NvbmZpZy5pbgpAQCAtMjIsNiArMjIsNyBAQCBzb3VyY2UgImJvb3Qv
czUwMC1ib290bG9hZGVyL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC9zaGltL0NvbmZpZy5pbiIK
IHNvdXJjZSAiYm9vdC9zdW4yMGktZDEtc3BsL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC9zeXNs
aW51eC9Db25maWcuaW4iCitzb3VyY2UgImJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiIK
IHNvdXJjZSAiYm9vdC91Ym9vdC9Db25maWcuaW4iCiBzb3VyY2UgImJvb3QvdmV4cHJlc3MtZmly
bXdhcmUvQ29uZmlnLmluIgogCmRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25m
aWcuaW4gYi9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uYmI2MTQwZjhhNgotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3Qv
dGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgpAQCAtMCwwICsxLDMyIEBACitjb25maWcgQlIyX1RB
UkdFVF9USV9LM19SNV9MT0FERVIKKwlib29sICJ0aS1rMy1yNS1sb2FkZXIiCisJaGVscAorCSAg
U2VwYXJhdGUgVS1Cb290IGJ1aWxkIGZvciBSNSBjb3JlcyBvbiBUSSdzIGszIGJvYXJkcy4KKwkg
IFVzdWFsbHkgdXNlZCB0byBidWlsZCB0aWJvb3QzLmJpbiB3aXRoIGszLWltYWdlLWdlbi4KKwor
aWYgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVIKK2Nob2ljZQorCXByb21wdCAiSzMgUjUgTG9h
ZGVyIGNvbmZpZ3VyYXRpb24iCisJZGVmYXVsdCBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9V
U0VfREVGQ09ORklHCisKK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfREVG
Q09ORklHCisJYm9vbCAiVXNpbmcgYW4gaW4tdHJlZSBib2FyZCBkZWZjb25maWcgZmlsZSIKKwor
Y29uZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9DVVNUT01fQ09ORklHCisJYm9v
bCAiVXNpbmcgYSBjdXN0b20gYm9hcmQgKGRlZiljb25maWcgZmlsZSIKKworZW5kY2hvaWNlCisK
K2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUcKKwlzdHJp
bmcgIkJvYXJkIGRlZmNvbmZpZyIKKwlkZXBlbmRzIG9uIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9B
REVSX1VTRV9ERUZDT05GSUcKKwloZWxwCisJICBOYW1lIG9mIHRoZSBib2FyZCBmb3Igd2hpY2gg
VEkgSzMgUjUgTG9hZGVyIHNob3VsZCBiZQorCSAgYnVpbHQsIHdpdGhvdXQgdGhlIF9kZWZjb25m
aWcgc3VmZml4LgorCitjb25maWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX0NP
TkZJR19GSUxFCisJc3RyaW5nICJDb25maWd1cmF0aW9uIGZpbGUgcGF0aCIKKwlkZXBlbmRzIG9u
IEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9DVVNUT01fQ09ORklHCisJaGVscAorCSAg
UGF0aCB0byB0aGUgVEkgSzMgUjUgTG9hZGVyIGNvbmZpZ3VyYXRpb24gZmlsZS4KK2VuZGlmCmRp
ZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBiL2Jv
b3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZiNmNlN2MyYTYKLS0tIC9kZXYvbnVsbAorKysgYi9ib290
L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaApAQCAtMCwwICsxLDIgQEAKKyMg
TG9jYWxseSBjb21wdXRlZDoKK3NoYTI1NiAgNmQ2OWQ1ZTQ2MzVjYjNmYTc4NTJiZjE1Zjg4Y2Ez
NDJlZjc3NDAxOTZlNzE5NjFkMzU3MmRlYjU4YmE0NGJlYSAgdS1ib290LTIwMjIuMTAtcmMxLnRh
ci5iejIKZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5t
ayBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41MzVjOWI5OTliCi0tLSAvZGV2L251bGwKKysrIGIv
Ym9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCkBAIC0wLDAgKzEsNDkgQEAK
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHRpLWszLXI1LWxvYWRlci5taworIworIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKKworVElfSzNfUjVfTE9BREVSX1ZFUlNJT04gPSAyMDIyLjEw
CitUSV9LM19SNV9MT0FERVJfU0lURSA9IGh0dHBzOi8vZnRwLmRlbnguZGUvcHViL3UtYm9vdAor
VElfSzNfUjVfTE9BREVSX1NPVVJDRSA9IHUtYm9vdC0kKFRJX0szX1I1X0xPQURFUl9WRVJTSU9O
KS50YXIuYnoyCitUSV9LM19SNV9MT0FERVJfTElDRU5TRSA9IEdQTC0yLjArCitUSV9LM19SNV9M
T0FERVJfTElDRU5TRV9GSUxFUyA9IExpY2Vuc2VzL2dwbC0yLjAudHh0CitUSV9LM19SNV9MT0FE
RVJfQ1BFX0lEX1ZFTkRPUiA9IGRlbngKK1RJX0szX1I1X0xPQURFUl9DUEVfSURfUFJPRFVDVCA9
IHUtYm9vdAorVElfSzNfUjVfTE9BREVSX0lOU1RBTExfSU1BR0VTID0gWUVTCitUSV9LM19SNV9M
T0FERVJfREVQRU5ERU5DSUVTID0gXAorCWhvc3QtcGtnY29uZiBcCisJJChCUjJfTUFLRV9IT1NU
X0RFUEVOREVOQ1kpIFwKKwlob3N0LWFybS1nbnUtdG9vbGNoYWluIFwKKwlob3N0LW9wZW5zc2wK
KworVElfSzNfUjVfTE9BREVSX01BS0UgPSAkKEJSMl9NQUtFKQorVElfSzNfUjVfTE9BREVSX01B
S0VfRU5WID0gJChUQVJHRVRfTUFLRV9FTlYpCitUSV9LM19SNV9MT0FERVJfS0NPTkZJR19ERVBF
TkRFTkNJRVMgPSBcCisJaG9zdC1hcm0tZ251LXRvb2xjaGFpbiBcCisJJChCUjJfTUFLRV9IT1NU
X0RFUEVOREVOQ1kpIFwKKwkkKEJSMl9CSVNPTl9IT1NUX0RFUEVOREVOQ1kpIFwKKwkkKEJSMl9G
TEVYX0hPU1RfREVQRU5ERU5DWSkKKworVElfSzNfUjVfTE9BREVSX0JPQVJEID0gJChjYWxsIHFz
dHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0JPQVJEKSkKK2lmZXEgKCQoQlIyX1RB
UkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0RFRkNPTkZJRykseSkKK1RJX0szX1I1X0xPQURFUl9L
Q09ORklHX0RFRkNPTkZJRyA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9CT0FSRF9ERUZDT05GSUcpKV9kZWZjb25maWcKK2Vsc2UgaWZlcSAoJChCUjJfVEFSR0VU
X1RJX0szX1I1X0xPQURFUl9VU0VfQ1VTVE9NX0NPTkZJRykseSkKK1RJX0szX1I1X0xPQURFUl9L
Q09ORklHX0ZJTEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJf
Q1VTVE9NX0NPTkZJR19GSUxFKSkKK2VuZGlmICMgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJf
VVNFX0RFRkNPTkZJRworVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUyArPSBcCisJQ1JPU1NfQ09N
UElMRT0kKEhPU1RfRElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAorCUFSQ0g9YXJtIFwKKwlIT1NU
Q0M9IiQoSE9TVENDKSAkKHN1YnN0IC1JLywtaXN5c3RlbSAvLCQoc3Vic3QgLUkgLywtaXN5c3Rl
bSAvLCQoSE9TVF9DRkxBR1MpKSkiIFwKKwlIT1NUTERGTEFHUz0iJChIT1NUX0xERkxBR1MpIgor
CitkZWZpbmUgVElfSzNfUjVfTE9BREVSX0JVSUxEX0NNRFMKKwkkKFRBUkdFVF9DT05GSUdVUkVf
T1BUUykgJChUSV9LM19SNV9MT0FERVJfTUFLRSkgLUMgJChARCkgJChUSV9LM19SNV9MT0FERVJf
TUFLRV9PUFRTKQorZW5kZWYKKworZGVmaW5lIFRJX0szX1I1X0xPQURFUl9JTlNUQUxMX0lNQUdF
U19DTURTCisJY3AgJChARCkvc3BsL3UtYm9vdC1zcGwuYmluICQoQklOQVJJRVNfRElSKS9yNS11
LWJvb3Qtc3BsLmJpbgorZW5kZWYKKworJChldmFsICQoa2NvbmZpZy1wYWNrYWdlKSkKLS0gCjIu
MzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
