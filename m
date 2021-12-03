Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BAFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7604180F1E;
	Fri,  3 Dec 2021 20:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hzaym8-DrbCt; Fri,  3 Dec 2021 20:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B6383123;
	Fri,  3 Dec 2021 20:26:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10BB01BF378
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3B3460B9D
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 20:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=samsung.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqOmWvqJw-Wa for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 20:26:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8B0A60AB0
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 20:26:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211203202607euoutp012e206ad6caccd62a40bc26e63b8f4178~9WIUNtfI90770207702euoutp01j
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 20:26:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211203202607euoutp012e206ad6caccd62a40bc26e63b8f4178~9WIUNtfI90770207702euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1638563167;
 bh=iV1cADU8J3uxNgRr1dBvLo5PtZKk6SRZDfSyLICI2Ow=;
 h=From:To:Cc:Subject:Date:References:From;
 b=uNZNmsErmsWMvmaG+VrrwGQuGh1rg0uWx9T2+yIZgKvMMSc7uYaQklXGTF20jyAUw
 EK1UTaRw7zYFXAUWMVm7GgBRCq0zUyjWy3Q2ybCCGIZDRmjs9r6szqFQSIzfDAH9J1
 Gk1PD/7Bx9rURiEp0et4jg1GCxQtQLvVG2VjwEco=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211203202606eucas1p2157a38c42f85c450b042c29deef073cb~9WITMeO9-1234112341eucas1p2M;
 Fri,  3 Dec 2021 20:26:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 30.66.10260.E5D7AA16; Fri,  3
 Dec 2021 20:26:06 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211203202606eucas1p1c5fd10ed5661e22dfea6199a69b7414b~9WIS2ypsq0641406414eucas1p1Q;
 Fri,  3 Dec 2021 20:26:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211203202606eusmtrp24f0de318cd940750c13104540290ce3e~9WIS2L1Z91627916279eusmtrp2z;
 Fri,  3 Dec 2021 20:26:06 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-3e-61aa7d5e8b96
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.A1.09404.E5D7AA16; Fri,  3
 Dec 2021 20:26:06 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20211203202606eusmtip28913d9fbb849bbdcf5b897f793e0b712~9WISp_xzR0790307903eusmtip2-;
 Fri,  3 Dec 2021 20:26:06 +0000 (GMT)
From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 21:25:59 +0100
Message-Id: <20211203202559.253726-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRmVeSWpSXmKPExsWy7djPc7pxtasSDXa/NbZ43rCV1eLmoRWM
 FmuP3GW36Hzzjt2BxWPemmqPy+/nsnv0bVnFGMAcxWWTkpqTWZZapG+XwJVx4rBSwVaBivaJ
 E9kbGO/ydjFyckgImEj8ujCPvYuRi0NIYAWjxJGtF1kgnC+MEq/2nIdyPjNKdE9+wwrTMmf6
 T3YQW0hgOaPE6pvZEEXPGSUae+azgCTYBBwl+peeAGsQEZCW+H7vLCtIEbPAQkaJP0+es4Ek
 hAWsJd4uagKbxCKgKvFh/0GwOK+AjcTe5i9MENvkJdquT2eEiAtKnJz5BGwBv4CWxJqm62A2
 M1BN89bZzCALJATmckhsPLSaHaLZRWLjsyXMELawxKvjW6DiMhL/d84HWsABZNdLTJ5kBtHb
 wyixbc4PFogaa4k7536xgdQwC2hKrN+lDxF2lLiy9CgrRCufxI23ghAn8ElM2jadGSLMK9HR
 JgRRrSKxrn8P1EApid5XKxghSjwkHl+3m8CoOAvJX7OQ/DILYe0CRuZVjOKppcW56anFxnmp
 5XrFibnFpXnpesn5uZsYgUnj9L/jX3cwrnj1Ue8QIxMH4yFGCQ5mJRFek8pViUK8KYmVValF
 +fFFpTmpxYcYpTlYlMR5Rf40JAoJpCeWpGanphakFsFkmTg4pRqYeiSCRMtk1FNn/z6qel1x
 wecV/9dxPmYreVftFF7Tzesrv0Bvrs209G8WRmb2EgcUzE87fYtyDDxv2vHYbWbB2S0939Zo
 O7s15kzvsbFtUy6PupQZuVVbqPbD9mivjOfpaXdmabQfNVp47rbQ74A/cmXKc08Wu230sy8/
 U1d4c57DAZ4doTOfrpa7Nc93+/WyWUEXb2k8XrphZ86CTxLV2d93fw6sXtahMLGVf0m346lZ
 xjcblQw8Trewn3waEhURMGeT1HWu+K25PdfXFXv2vu0tbT2y71KWcU0TtwJjKV9X8med9MMd
 zDc2Hzr38pDxtddXpz3c0nJYu3xlyuvb6T71S+UW/hE2Onz0UoGvEktxRqKhFnNRcSIAablp
 W4kDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsVy+t/xe7pxtasSDQ4dkrR43rCV1eLmoRWM
 FmuP3GW36Hzzjt2BxWPemmqPy+/nsnv0bVnFGMAcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdx4rBSwVaBivaJE9kbGO/ydjFyckgImEjMmf6T
 vYuRi0NIYCmjxNn+btYuRg6ghJTEyrnpEDXCEn+udbFB1DxllHjauYINJMEm4CjRv/QEK4gt
 IiAt8f3eWVaQImaBhYwSm/afBysSFrCWeLuoiR3EZhFQlfiw/yBYnFfARmJv8xcmiA3yEm3X
 pzNCxAUlTs58wgJyBLOAusT6eUIgYX4BLYk1TddZQGxmoPLmrbOZJzAKzELSMQuhYxaSqgWM
 zKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECg37bsZ9bdjCufPVR7xAjEwfjIUYJDmYlEV6T
 ylWJQrwpiZVVqUX58UWlOanFhxhNgT6YyCwlmpwPjLu8knhDMwNTQxMzSwNTSzNjJXFez4KO
 RCGB9MSS1OzU1ILUIpg+Jg5OqQamPZ7n1nn8dN7xXneP3GQVOc7fN/ed6nQIzVl879QvT5vW
 NYlz5Bzyu83ZEwP61NrVEnYGrUxY3Don5tiBfVFBuzqPaWp8skn7/CT/uu47/4mH/Gffei9y
 jP3nJ5XP93qCV/MedpBQW8nDxvj2rLN1pVW7x4apCpPqo93qFRuiOSNea73snK+38c5a03TW
 B+qOZpXBOtmN/2vz/RR2WyndiU46GtvIFs6vNjdQYtOciEUVMeuesJ47eZpRdtmceUHr5Ys9
 L99dWd/roieoMm2+f/7uxkNcf66Khz8MbWLR87oT8rA2YEvcipf7JQ9yePYefeuqddjw1uZq
 bhv7XWeSn9bLTt/8a03rhtCNFQ+VWIozEg21mIuKEwGnfiwXAwMAAA==
X-CMS-MailID: 20211203202606eucas1p1c5fd10ed5661e22dfea6199a69b7414b
X-Msg-Generator: CA
X-RootMTR: 20211203202606eucas1p1c5fd10ed5661e22dfea6199a69b7414b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211203202606eucas1p1c5fd10ed5661e22dfea6199a69b7414b
References: <CGME20211203202606eucas1p1c5fd10ed5661e22dfea6199a69b7414b@eucas1p1.samsung.com>
Subject: [Buildroot] [PATCH 1/1] arch/arm: Choose page size for AArch64
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
Cc: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TU1VcyBvbiBBQXJjaDY0IHN1cHBvcnQgdGhyZWUgZGlmZmVyZW50IHBhZ2Ugc2l6ZXM6IDQga0Is
IDE2IGtCLAphbmQgNjQga0IuIEl0IGlzIE9TIGtlcm5lbCdzIHRhc2sgdG8gY2hvb3NlIHRoZSBj
b25maWd1cmF0aW9uIGR1cmluZwpib290LiBMaW51eCBrZXJuZWwgY2FuIGJlIGNvbXBpbGVkIHRv
IHN1cHBvcnQgZGlmZmVyZW50IHBhZ2Ugc2l6ZS4KVG8gcnVuIG9uIGEgc3lzdGVtIHdpdGggcGFn
ZXMgbGFyZ2VyIHRoYW4gNCBrQiB1c2VybGFuZCBiaW5hcmllcyBuZWVkCnRvIGJlIHByb3Blcmx5
IGFsaWduZWQgZHVyaW5nIHRoZSBsaW5raW5nIHByb2Nlc3MuIEhvd2V2ZXIsIGJpbmFyaWVzCnBy
ZXBhcmVkIGZvciBzeXN0ZW1zIHdpdGggbGFyZ2VyIHBhZ2VzIGNhbiBydW4gb24gc3lzdGVtcyB3
aXRoIHNtYWxsZXIKcGFnZXMuCgpTaWduZWQtb2ZmLWJ5OiDFgXVrYXN6IFN0ZWxtYWNoIDxsLnN0
ZWxtYWNoQHNhbXN1bmcuY29tPgotLS0KIGFyY2gvQ29uZmlnLmluLmFybSB8IDI0ICsrKysrKysr
KysrKysrKysrKysrKysrKwogYXJjaC9hcmNoLm1rLmFybSAgIHwgMTIgKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FyY2gubWsuYXJtCgpkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4uYXJtIGIvYXJjaC9Db25m
aWcuaW4uYXJtCmluZGV4IDRjMDkxMGU0ZjguLmJjNjQ1Mjg3OGQgMTAwNjQ0Ci0tLSBhL2FyY2gv
Q29uZmlnLmluLmFybQorKysgYi9hcmNoL0NvbmZpZy5pbi5hcm0KQEAgLTkzMCw1ICs5MzAsMjkg
QEAgY29uZmlnIEJSMl9SRUFERUxGX0FSQ0hfTkFNRQogCWRlZmF1bHQgIkFSTSIJCWlmIEJSMl9h
cm0gfHwgQlIyX2FybWViCiAJZGVmYXVsdCAiQUFyY2g2NCIJaWYgQlIyX2FhcmNoNjQgfHwgQlIy
X2FhcmNoNjRfYmUKIAorY2hvaWNlCisJcHJvbXB0ICJBYXJjaDY0IE1NVSBQYWdlIFNpemUiCisJ
ZGVmYXVsdCBCUjJfQVJNX1BBR0VfU0laRV80SworCWRlcGVuZHMgb24gQlIyX2FhcmNoNjQgfHwg
QlIyX2FhcmNoNjRfYmUKKwloZWxwCisJICBDaG9vc2UgTU1VIHBhZ2Ugc2l6ZQorCitjb25maWcg
QlIyX0FSTV9QQUdFX1NJWkVfNEsKKwlib29sICI0S0IiCisKK2NvbmZpZyBCUjJfQVJNX1BBR0Vf
U0laRV8xNksKKwlib29sICIxNktCIgorCitjb25maWcgQlIyX0FSTV9QQUdFX1NJWkVfNjRLCisJ
Ym9vbCAiNjRLQiIKKworZW5kY2hvaWNlCisKK2NvbmZpZyBCUjJfQVJNX1BBR0VfU0laRQorCXN0
cmluZworCWRlZmF1bHQgIjRLIiBpZiBCUjJfQVJNX1BBR0VfU0laRV80SworCWRlZmF1bHQgIjE2
SyIgaWYgQlIyX0FSTV9QQUdFX1NJWkVfMTZLCisJZGVmYXVsdCAiNjRLIiBpZiBCUjJfQVJNX1BB
R0VfU0laRV82NEsKKwogIyB2aW06IGZ0PWtjb25maWcKICMgLSotIG1vZGU6a2NvbmZpZzsgLSot
CmRpZmYgLS1naXQgYS9hcmNoL2FyY2gubWsuYXJtIGIvYXJjaC9hcmNoLm1rLmFybQpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5lZjY1YzYwZjZjCi0tLSAvZGV2L251bGwK
KysrIGIvYXJjaC9hcmNoLm1rLmFybQpAQCAtMCwwICsxLDEyIEBACitpZmVxICgkKGZpbHRlciB5
LCAkKEJSMl9hYXJjaDY0KSAkKEJSMl9hYXJjaDY0X2JlKSksIHkpCisKKyMgRXhwbGljaXRseSBz
ZXQgTEQncyAibWF4LXBhZ2Utc2l6ZSIgaW5zdGVhZCBvZiByZWx5aW5nIG9uIHNvbWUgZGVmYXVs
dHMKK2lmZXEgKCQoQlIyX0FSTV9QQUdFX1NJWkVfNEspLHkpCitBUkNIX1RPT0xDSEFJTl9XUkFQ
UEVSX09QVFMgKz0gLVdsLC16LG1heC1wYWdlLXNpemU9NDA5NgorZWxzZSBpZmVxICgkKEJSMl9B
Uk1fUEFHRV9TSVpFXzE2SykseSkKK0FSQ0hfVE9PTENIQUlOX1dSQVBQRVJfT1BUUyArPSAtV2ws
LXosbWF4LXBhZ2Utc2l6ZT0zMjc2OAorZWxzZSBpZmVxICgkKEJSMl9BUk1fUEFHRV9TSVpFXzY0
SykseSkKK0FSQ0hfVE9PTENIQUlOX1dSQVBQRVJfT1BUUyArPSAtV2wsLXosbWF4LXBhZ2Utc2l6
ZT02NTUzNgorZW5kaWYKKworZW5kaWYKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
