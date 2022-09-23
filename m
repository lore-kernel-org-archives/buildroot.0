Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E718BC07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F6426118E;
	Fri, 23 Sep 2022 21:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F6426118E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyZbI2dMmbeX; Fri, 23 Sep 2022 21:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72C4D6117D;
	Fri, 23 Sep 2022 21:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72C4D6117D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D17B1BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08AC860B2C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08AC860B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BOWRoL96oPhh for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:36:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBF8608D8
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBBF8608D8
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:36:32 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28NKthWI110967;
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28NKthZK015662
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 23
 Sep 2022 15:55:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 23 Sep 2022 15:55:43 -0500
Received: from uda0393673 (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28NKthfa006674;
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1obpi3-006N7A-5S;
 Fri, 23 Sep 2022 15:55:43 -0500
From: Anand Gadiyar <gadiyar@ti.com>
To: <buildroot@buildroot.org>
Date: Fri, 23 Sep 2022 15:55:43 -0500
Message-ID: <20220923205543.1518798-4-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923205543.1518798-1-gadiyar@ti.com>
References: <20220923205543.1518798-1-gadiyar@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1663966543;
 bh=JpORhMpPKuzu5l3RBO/kaQcoIBt33G4Xa9e6Y/GMSoo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GsPrVn6Dxlk2T6pU3dvX8sFKZs5iyZu23o8VSGo/CLvmQslT7dM/Xc6DIDf9ADGEf
 83fk1WtoAPQezCWrrGFjpKUL3U0NoCSeTv5asMVQ54QLWsEtvfZJQXq8ec8DAUs/+a
 4/DKGiitSo7czYECNf1LSpqMkig72w7SPERlIcCE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=GsPrVn6D
Subject: [Buildroot] [PATCH v5 3/3] board/ti/am64x_sk: add new board
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

RnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KCkFkZHMgc3VwcG9ydCBmb3IgdGkncyBh
bTY0eF9zayBib2FyZC4KQWRkcyB0aGUgY29uZmlncyBmb3IgZ2VuZXJhdGluZyBvdXRwdXQgc2Rj
YXJkIGltYWdlLgpBZGRzIHRoZSBkZWZjb25maWdzIGZvciBhbTY0eF9zay4KClRoZSBBTTY0eF9z
ayBib2FyZCBpcyBkZXNpZ25lZCBmb3IgdGhlIEFNNjQyIFNvQyB3aXRoCnR3byBBUk0gQ29ydGV4
LUE1MyBhbmQgZm91ciBBUk0gQ29ydGV4LVI1LiBJdCBhbHNvCnN1cHBvcnRzIFJKIDQ1IEV0aGVy
bmV0LCBXaS1GaSwgYW5kIEJsdWV0b290aC4KCk1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGJv
YXJkIGNhbiBiZSBmb3VuZCBhdDoKaHR0cHM6Ly93d3cudGkuY29tL3Rvb2wvU0stQU02NAoKU2ln
bmVkLW9mZi1ieTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5h
bmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+ClJldmlld2VkLWJ5OiBHaXVsaW8gQmVuZXR0aSA8
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KLS0tCiBERVZFTE9QRVJTICAg
ICAgICAgICAgICAgICAgICAgfCAgNCArKysKIGJvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNm
ZyB8IDI3ICsrKysrKysrKysrKysrKysrKysKIGJvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQg
ICB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGNvbmZpZ3MvYW02NHhf
c2tfZGVmY29uZmlnICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDQg
ZmlsZXMgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2Fy
ZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC90aS9h
bTY0eF9zay9yZWFkbWUudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9hbTY0eF9za19k
ZWZjb25maWcKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA4MWYw
OTVmNzk5Li4xMjE5NTIzNjljIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BF
UlMKQEAgLTEyOSw4ICsxMjksMTAgQEAgRjoJcGFja2FnZS9saWJ4bWxycGMvCiBGOglwYWNrYWdl
L3B5dGhvbi1kb2NvcHQvCiAKIE46CUFuYW5kIEdhZGl5YXIgPGdhZGl5YXJAdGkuY29tPgorRjoJ
Ym9hcmQvdGkvYW02NHhfc2svCiBGOglib290L3RpLWszLWltYWdlLWdlbi8KIEY6CWJvb3QvdGkt
azMtcjUtbG9hZGVyLworRjoJY29uZmlncy9hbTY0eF9za19kZWZjb25maWcKIAogTjoJQW5kcsOp
IFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgogRjoJcGFja2FnZS9saWJrcmI1LwpAQCAtMzA2OCw4
ICszMDcwLDEwIEBAIE46CVdvamNpZWNoIE5pemnFhHNraSA8bml6aWFrQHNwb3gub3JnPgogRjoJ
cGFja2FnZS9md3VwLwogCiBOOglYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNvbT4KK0Y6
CWJvYXJkL3RpL2FtNjR4X3NrLwogRjoJYm9vdC90aS1rMy1pbWFnZS1nZW4vCiBGOglib290L3Rp
LWszLXI1LWxvYWRlci8KK0Y6CWNvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCiAKIE46CVlhaXIg
QmVuIEF2cmFoYW0gPHlhaXJiYUBwcm90b25tYWlsLmNvbT4KIEY6CXBhY2thZ2UvY2FzeW5jLwpk
aWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQvdGkvYW02
NHhfc2svZ2VuaW1hZ2UuY2ZnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjI2MzA0ZmU5OGYKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC90aS9hbTY0eF9zay9nZW5pbWFn
ZS5jZmcKQEAgLTAsMCArMSwyNyBAQAoraW1hZ2UgYm9vdC52ZmF0IHsKKwl2ZmF0IHsKKwkJZmls
ZXMgPSB7CisJCQkidGlib290My5iaW4iLAorCQkJInRpc3BsLmJpbiIsCisJCQkidS1ib290Lmlt
ZyIsCisJCX0KKwl9CisKKwlzaXplID0gMTZNCit9CisKK2ltYWdlIHNkY2FyZC5pbWcgeworCWhk
aW1hZ2UgeworCX0KKworCXBhcnRpdGlvbiB1LWJvb3QgeworCQlwYXJ0aXRpb24tdHlwZSA9IDB4
QworCQlib290YWJsZSA9ICJ0cnVlIgorCQlpbWFnZSA9ICJib290LnZmYXQiCisJfQorCisJcGFy
dGl0aW9uIHJvb3RmcyB7CisJCXBhcnRpdGlvbi10eXBlID0gMHg4MworCQlpbWFnZSA9ICJyb290
ZnMuZXh0NCIKKwl9Cit9CmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0
IGIvYm9hcmQvdGkvYW02NHhfc2svcmVhZG1lLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi44MDk2ZmNiMmQ0Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvdGkvYW02
NHhfc2svcmVhZG1lLnR4dApAQCAtMCwwICsxLDQ5IEBACitUZXhhcyBJbnN0dW1lbnRzIEFNNjR4
IFNLIFRlc3QgYW5kIERldmVsb3BtZW50IEJvYXJkCisKK0Rlc2NyaXB0aW9uCis9PT09PT09PT09
PQorCitUaGVzZSBjb25maWd1cmF0aW9ucyB3aWxsIGJ1aWxkIGEgY29tcGxldGUgaW1hZ2UgYW5k
CitkZXZpY2UgdHJlZSBibG9icyBmb3IgdGhlIHRoZSBUSSBBTTY0eF9zayBib2FyZC4KKworSG93
IHRvIGJ1aWxkIGl0Cis9PT09PT09PT09PT09PT0KKworU2VsZWN0IHRoZSBkZWZhdWx0IGNvbmZp
Z3VyYXRpb24gZm9yIHRoZSB0YXJnZXQ6CiskIG1ha2UgYW02NHhfc2tfZGVmY29uZmlnCisKK09w
dGlvbmFsOiBtb2RpZnkgdGhlIGNvbmZpZ3VyYXRpb246CiskIG1ha2UgbWVudWNvbmZpZworCitC
dWlsZDoKKyQgbWFrZQorCitSZXN1bHQgb2YgdGhlIGJ1aWxkOgorPT09PT09PT09PT09PT09PT09
PQorb3V0cHV0L2ltYWdlcy8KKystLSBzb2MKKystLSB0aS1jb25uZWN0aXZpdHkKKystLSBibDMx
LmJpbgorKy0tIGJvb3QudmZhdAorKy0tIEltYWdlCisrLS0gazMtYW02NDItc2suZHRiCisrLS0g
cjUtdS1ib290LXNwbC5iaW4KKystLSByb290ZnMuZXh0MgorKy0tIHJvb3Rmcy5leHQ0CisrLS0g
cm9vdGZzLnRhcgorKy0tIHNkY2FyZC5pbWcKKystLSB0ZWUuYmluCisrLS0gdGVlLWhlYWRlcl92
Mi5iaW4KKystLSB0ZWUtcGFnZWFibGVfdjIuYmluCisrLS0gdGVlLXBhZ2VyX3YyLmJpbgorKy0t
IHRpYm9vdDMuYmluCisrLS0gdGlzcGwuYmluCisrLS0gdS1ib290LmltZworCitUbyBjb3B5IHRo
ZSBpbWFnZSBmaWxlIHRvIHRoZSBzZGNhcmQgdXNlIGRkOgorJCBkZCBpZj1vdXRwdXQvaW1hZ2Vz
L3NkY2FyZC5pbWcgb2Y9L2Rldi9zZFgKKworSW5zZXJ0IHRoZSBTRGNhcmQgaW50byB0aGUgQU02
NHhfc2sgYm9hcmQsIGFuZCBwb3dlciBpdCB1cCB3aXRoCithIFVTQiBUeXBlLUMgY29ubmVjdG9y
LiBUaGUgc3lzdGVtIHNob3VsZCBjb21lIHVwLiBZb3UgY2FuIHVzZQorYSBtaWNyby1VU0IgdG8g
Y29ubmVjdCB0byB0aGUgY29ubmVjdG9yIGxhYmxlZCBNQUlOX1VBUlQwIHRvCitjb21tdW5pY2F0
ZSB3aXRoIHRoZSBib2FyZC4KZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmln
IGIvY29uZmlncy9hbTY0eF9za19kZWZjb25maWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uMWQzN2I0MTFiMwotLS0gL2Rldi9udWxsCisrKyBiL2NvbmZpZ3MvYW02NHhf
c2tfZGVmY29uZmlnCkBAIC0wLDAgKzEsNDUgQEAKK0JSMl9hYXJjaDY0PXkKK0JSMl9ST09URlNf
UE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKK0JSMl9ST09U
RlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnIgor
QlIyX0xJTlVYX0tFUk5FTD15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKK0JS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTkiCitCUjJfTElOVVhfS0VS
TkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKK0JSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBP
UlQ9eQorQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InRpL2szLWFtNjQyLXNrIgor
QlIyX0xJTlVYX0tFUk5FTF9JTlNUQUxMX1RBUkdFVD15CitCUjJfUEFDS0FHRV9MSU5VWF9GSVJN
V0FSRT15CitCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9USV9XTDE4WFg9eQorQlIyX1RBUkdF
VF9ST09URlNfRVhUMj15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQorQlIyX1RBUkdFVF9S
T09URlNfRVhUMl9TSVpFPSIxMjBNIgorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15
CitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OPXkKK0JSMl9U
QVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjcuMCIK
K0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExBVEZPUk09ImszIgorQlIyX1RBUkdF
VF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9UQVJHRVRfQk9BUkQ9ImxpdGUiCitCUjJfVEFSR0VUX0FS
TV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzJfT1BURUU9eQorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9G
SVJNV0FSRV9BRERJVElPTkFMX1ZBUklBQkxFUz0iU1BEPW9wdGVlZCIKK0JSMl9UQVJHRVRfT1BU
RUVfT1M9eQorQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZPXkK
K0JSMl9UQVJHRVRfT1BURUVfT1NfUExBVEZPUk09ImszIgorQlIyX1RBUkdFVF9USV9LM19JTUFH
RV9HRU49eQorQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU09DPSJhbTY0eCIKK0JSMl9UQVJH
RVRfVElfSzNfSU1BR0VfR0VOX0NPTkZJRz0iZXZtIgorQlIyX1RBUkdFVF9USV9LM19SNV9MT0FE
RVJfQk9BUkQ9ImFtNjR4X2V2bSIKK0JSMl9UQVJHRVRfVUJPT1Q9eQorQlIyX1RBUkdFVF9VQk9P
VF9CVUlMRF9TWVNURU1fS0NPTkZJRz15CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9O
PXkKK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjIuMTAtcmMxIgor
QlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImFtNjR4X2V2bV9hNTMiCitCUjJfVEFS
R0VUX1VCT09UX05FRURTX0RUQz15CitCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQor
QlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMT15CisjIEJSMl9UQVJHRVRfVUJPT1RfRk9S
TUFUX0JJTiBpcyBub3Qgc2V0CitCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQorQlIyX1RB
UkdFVF9VQk9PVF9TUEw9eQorQlIyX1RBUkdFVF9VQk9PVF9TUExfTkFNRT0idGlzcGwuYmluIgor
QlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fTUFLRU9QVFM9IlRFRT0kKEJJTkFSSUVTX0RJUikvdGVl
LXBhZ2VyX3YyLmJpbiIKK0JSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15CitCUjJfUEFDS0FH
RV9IT1NUX0dFTklNQUdFPXkKK0JSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKLS0gCjIuMzQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
