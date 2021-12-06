Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A9EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 19:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FBDE60D75;
	Mon,  6 Dec 2021 19:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42NkR6RxJXWO; Mon,  6 Dec 2021 19:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BACDF60D6F;
	Mon,  6 Dec 2021 19:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0821BF29A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48B1F60D66
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9INVVLEGA_bu for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 19:27:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 718F760D6F
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 19:27:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211206192740euoutp02f9d9eda39d3cf17582affe05b4520501~_QRIgePa61763617636euoutp02I
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 19:27:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211206192740euoutp02f9d9eda39d3cf17582affe05b4520501~_QRIgePa61763617636euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1638818860;
 bh=BuQi6h+7Ey7W0FVLrNPG+Pog8SBkYq7EIHARZeyvNM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fWYHJmt07LyOSTgtHOZ71lEExBThX9UALyQEGnXNp0WmMu/Ux5D4wm9ksO5XH05K3
 hrZOpGcxsMupKmzsBr16+5UCpxEMGldEBgdBWlGOJ3OjMeV37UpDQYYVkhG2W9syNl
 WBcReQ6nR0QAOS6idJg0go9W7byXnP4XyzvyiqQg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211206192739eucas1p2bf6f61835f2f3b59fc4d485e4f468552~_QRHh08RD2247722477eucas1p2A;
 Mon,  6 Dec 2021 19:27:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 72.EE.10009.A246EA16; Mon,  6
 Dec 2021 19:27:38 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211206192737eucas1p2bd1a7c8856aab0cb669a834f9b7ab60a~_QRGGggIH2973729737eucas1p2h;
 Mon,  6 Dec 2021 19:27:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211206192737eusmtrp2cca241ed3e7cd5eea51014a2b4195efc~_QRGFvCgR2209222092eusmtrp2s;
 Mon,  6 Dec 2021 19:27:37 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-8a-61ae642a2636
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 95.73.09522.9246EA16; Mon,  6
 Dec 2021 19:27:37 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20211206192737eusmtip2a3af7e17125931454fc166e1f9632bca~_QRF2nbuU0575705757eusmtip2Q;
 Mon,  6 Dec 2021 19:27:37 +0000 (GMT)
From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 20:27:32 +0100
Message-Id: <20211206192732.373740-3-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206192732.373740-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djP87paKesSDbYesbR4efQls8Xzhq2s
 FkcXNbFZtE3exG5x89AKRou1R+6yW3T+2cVkMePdElaLzjfv2C3evLjIaLFg10s2B26P1a87
 2T3mran2uPx+LrtH/7rPrB47Z91l97h76xKTx7frnYwefVtWMXps2f+Z0WPR4sIArigum5TU
 nMyy1CJ9uwSujAtP7rEUtIhXbLi3kqmBsUmki5GTQ0LARKLl/yv2LkYuDiGBFYwSMw8fY4Vw
 vjBKvN3RzAhSJSTwmVHiyZ40mI6ZjXPYIIqWM0o0HtrGAuE8Z5Ro+XWaBaSKTcBRon/pCVYQ
 W0RAWuL7vbNgY5kFvjBLNG/ZzQ6SEBbwkNi4+zwbiM0ioCrxqecKM4jNK2AjceLaK3aIdfIS
 bdeng53BKWArsXPbJSaIGkGJkzOfgC3jF9CSWNN0HcxmBqpv3jqbGWSZhMB8TokPvZOYIAa5
 SNy/Oo8RwhaWeHV8C9QCGYn/O+cD1XAA2fUSkyeZQfT2MEpsm/ODBaLGWuLOuV9sIDXMApoS
 63fpQ4QdJRa3PGKDaOWTuPFWEOIEPolJ26YzQ4R5JTrahCCqVSTW9e+BGigl0ftqBeMERqVZ
 SJ6ZheSBWQi7FjAyr2IUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMYaf/Hf+0g3Huq496
 hxiZOBgPMUpwMCuJ8Ko9XJsoxJuSWFmVWpQfX1Sak1p8iFGag0VJnFfkT0OikEB6Yklqdmpq
 QWoRTJaJg1OqgUn5RozIjW2Gstc6Mg5PuqujHBmu4rG2gsvU5o/ahOS011/6m7b+0Vtun8V+
 VrJ3VnjKf9Ut+sG/4ybYiHzMjMz3WnLumuTrF/Y1CXz5luVP21wTXZ5m72VQjekw4Mx22Sn4
 bPqHVwszWo5Uf7x585qLvJHQSs23rNpO/lw/dho61gt2rvAQX/zl3csYpnV8CQsXChsG3N+c
 96nR6Mft6frn8qNXOeRu/HjMU03g9vyYjBKFaTr/Sp/MTUyvuxjmsLuqpkdK+x+D5AumqRdn
 b5/ycF2CYz6rcOxpqQ2xkpoa02+FZK346x3zRfrSD/WsC1LvpFvDH/c77t3vbxDzjrHt9Lcy
 nk+3mj07pYX6lFiKMxINtZiLihMBc9YjNdADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7qaKesSDW7tkbB4efQls8Xzhq2s
 FkcXNbFZtE3exG5x89AKRou1R+6yW3T+2cVkMePdElaLzjfv2C3evLjIaLFg10s2B26P1a87
 2T3mran2uPx+LrtH/7rPrB47Z91l97h76xKTx7frnYwefVtWMXps2f+Z0WPR4sIArig9m6L8
 0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jAtP7rEUtIhX
 bLi3kqmBsUmki5GTQ0LARGJm4xy2LkYuDiGBpYwSr5sPMXYxcgAlpCRWzk2HqBGW+HOtC6rm
 KaNES9dddpAEm4CjRP/SE6wgtoiAtMT3e2dZQYqYBX4wSyy6NI0FJCEs4CGxcfd5NhCbRUBV
 4lPPFWYQm1fARuLEtVfsEBvkJdquT2cEsTkFbCV2brvEBHKEEFDNh20BEOWCEidnPmEBCTML
 qEusnycEEuYX0JJY03QdbBMz0JTmrbOZJzAKzULSMQuhYxaSqgWMzKsYRVJLi3PTc4sN9YoT
 c4tL89L1kvNzNzEC43XbsZ+bdzDOe/VR7xAjEwfjIUYJDmYlEV61h2sThXhTEiurUovy44tK
 c1KLDzGaAj02kVlKNDkfmDDySuINzQxMDU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6
 mDg4pRqYpoe9mGZ0dK+3u9Mbtqv+H88/V7Sfwbxxw7X3Mw3qSi/+qGDsnR163vP4QX9j+wn/
 L0TZz4sOcjfbZlJvEno5NCOv51GLeqXk/slfCnIEXiy7y/RkzeyqpqNbOyv3Bm6vW3n1quVD
 Rl3b8rxX7rrTZLb2qnR0LP0vs7/p+GYuk7+FWcfkbhmaXQu+lpLWoab+XV5x1qEfBtda09mb
 7qgvuZ4j+exo3BpvLnnWT9GXPPbyFjYUiE/Z27lZ1uDoak7PlGVXS6c/DJq8632yUa7E25lu
 SYt2/mG+sc9Qv+XMJZ45pyRcpK2MOFy73n3iFH6zuffqfM3HT64yvzM2Y6p8EPs6eoohX6T1
 k4x/Uj/3KbEUZyQaajEXFScCAMp6Y7BgAwAA
X-CMS-MailID: 20211206192737eucas1p2bd1a7c8856aab0cb669a834f9b7ab60a
X-Msg-Generator: CA
X-RootMTR: 20211206192737eucas1p2bd1a7c8856aab0cb669a834f9b7ab60a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211206192737eucas1p2bd1a7c8856aab0cb669a834f9b7ab60a
References: <20211206192732.373740-1-l.stelmach@samsung.com>
 <CGME20211206192737eucas1p2bd1a7c8856aab0cb669a834f9b7ab60a@eucas1p2.samsung.com>
Subject: [Buildroot] [PATCH v2 2/2] arch/arm: Make page size configurable on
 Aarch64
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2VsZWN0IEJSMl9BUkNIX0hBU19NTVVfUEFHRV9TSVpFX3s0LDE2LDY0fUsgZnJvbSBCUjJfYWFy
Y2g2NHssX2JlfS4KClNpZ25lZC1vZmYtYnk6IMWBdWthc3ogU3RlbG1hY2ggPGwuc3RlbG1hY2hA
c2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9Db25maWcuaW4gfCAgNiArKysrKysKIGxpbnV4L2xpbnV4
Lm1rIHwgMTMgKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4gYi9hcmNoL0NvbmZpZy5pbgppbmRleCA1NjFk
NTk5NTYxLi4yZjIwY2ZiMjY4IDEwMDY0NAotLS0gYS9hcmNoL0NvbmZpZy5pbgorKysgYi9hcmNo
L0NvbmZpZy5pbgpAQCAtNjcsNiArNjcsOSBAQCBjb25maWcgQlIyX2FhcmNoNjQKIAlib29sICJB
QXJjaDY0IChsaXR0bGUgZW5kaWFuKSIKIAlzZWxlY3QgQlIyX0FSQ0hfSVNfNjQKIAlzZWxlY3Qg
QlIyX0FSQ0hfSEFTX01NVV9NQU5EQVRPUlkKKwlzZWxlY3QgQlIyX0FSQ0hfSEFTX01NVV9QQUdF
X1NJWkVfNEsKKwlzZWxlY3QgQlIyX0FSQ0hfSEFTX01NVV9QQUdFX1NJWkVfMTZLCisJc2VsZWN0
IEJSMl9BUkNIX0hBU19NTVVfUEFHRV9TSVpFXzY0SwogCWhlbHAKIAkgIEFhcmNoNjQgaXMgYSA2
NC1iaXQgYXJjaGl0ZWN0dXJlIGRldmVsb3BlZCBieSBBUk0gSG9sZGluZ3MuCiAJICBodHRwOi8v
d3d3LmFybS5jb20vcHJvZHVjdHMvcHJvY2Vzc29ycy9pbnN0cnVjdGlvbi1zZXQtYXJjaGl0ZWN0
dXJlcy9hcm12OC1hcmNoaXRlY3R1cmUucGhwCkBAIC03Niw2ICs3OSw5IEBAIGNvbmZpZyBCUjJf
YWFyY2g2NF9iZQogCWJvb2wgIkFBcmNoNjQgKGJpZyBlbmRpYW4pIgogCXNlbGVjdCBCUjJfQVJD
SF9JU182NAogCXNlbGVjdCBCUjJfQVJDSF9IQVNfTU1VX01BTkRBVE9SWQorCXNlbGVjdCBCUjJf
QVJDSF9IQVNfTU1VX1BBR0VfU0laRV80SworCXNlbGVjdCBCUjJfQVJDSF9IQVNfTU1VX1BBR0Vf
U0laRV8xNksKKwlzZWxlY3QgQlIyX0FSQ0hfSEFTX01NVV9QQUdFX1NJWkVfNjRLCiAJaGVscAog
CSAgQWFyY2g2NCBpcyBhIDY0LWJpdCBhcmNoaXRlY3R1cmUgZGV2ZWxvcGVkIGJ5IEFSTSBIb2xk
aW5ncy4KIAkgIGh0dHA6Ly93d3cuYXJtLmNvbS9wcm9kdWN0cy9wcm9jZXNzb3JzL2luc3RydWN0
aW9uLXNldC1hcmNoaXRlY3R1cmVzL2FybXY4LWFyY2hpdGVjdHVyZS5waHAKZGlmZiAtLWdpdCBh
L2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKaW5kZXggZTY2ZTBkYjUyZi4uMjBiMWJl
M2JlNSAxMDA2NDQKLS0tIGEvbGludXgvbGludXgubWsKKysrIGIvbGludXgvbGludXgubWsKQEAg
LTMyOSw2ICszMjksMTAgQEAgZGVmaW5lIExJTlVYX0tDT05GSUdfRklYVVBfQ01EUwogCSQoaWYg
JChCUjJfcG93ZXJwYykkKEJSMl9wb3dlcnBjNjQpJChCUjJfcG93ZXJwYzY0bGUpLAogCQkkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19QUENfRElTQUJMRV9XRVJST1IpKQogCSQoaWYg
JChCUjJfQVJDSF9NTVVfUEFHRV9TSVpFXzRLKSwKKwkJJChpZiAkKEJSMl9hYXJjaDY0KSQoQlIy
X2FhcmNoNjRfYmUpLAorCQkJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQVJNNjRf
NEtfUEFHRVMpCisJCQkkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfQVJNNjRfMTZL
X1BBR0VTKQorCQkJJChjYWxsIEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX0FSTTY0XzY0S19Q
QUdFUykpCiAJCSQoaWYgJChCUjJfYXJjbGUpJChCUjJfYXJjYmUpLAogCQkJJChjYWxsIEtDT05G
SUdfRU5BQkxFX09QVCxDT05GSUdfQVJDX1BBR0VfU0laRV80SykKIAkJCSQoY2FsbCBLQ09ORklH
X0RJU0FCTEVfT1BULENPTkZJR19BUkNfUEFHRV9TSVpFXzhLKQpAQCAtMzM5LDEwICszNDMsMTkg
QEAgZGVmaW5lIExJTlVYX0tDT05GSUdfRklYVVBfQ01EUwogCQkJJChjYWxsIEtDT05GSUdfRU5B
QkxFX09QVCxDT05GSUdfQVJDX1BBR0VfU0laRV84SykKIAkJCSQoY2FsbCBLQ09ORklHX0RJU0FC
TEVfT1BULENPTkZJR19BUkNfUEFHRV9TSVpFXzE2SykpKQogCSQoaWYgJChCUjJfQVJDSF9NTVVf
UEFHRV9TSVpFXzE2SyksCisJCSQoaWYgJChCUjJfYWFyY2g2NCkkKEJSMl9hYXJjaDY0X2JlKSwK
KwkJCSQoY2FsbCBLQ09ORklHX0RJU0FCTEVPUFQsQ09ORklHX0FSTTY0XzRLX1BBR0VTKQorCQkJ
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQVJNNjRfMTZLX1BBR0VTKSkKKwkJCSQo
Y2FsbCBLQ09ORklHX0RJU0FCTEVfT1BULENPTkZJR19BUk02NF82NEtfUEFHRVMpCiAJCSQoaWYg
JChCUjJfYXJjbGUpJChCUjJfYXJjYmUpLAogCQkJJChjYWxsIEtDT05GSUdfRElTQUJMRV9PUFQs
Q09ORklHX0FSQ19QQUdFX1NJWkVfNEspCiAJCQkkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxD
T05GSUdfQVJDX1BBR0VfU0laRV84SykKIAkJCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09O
RklHX0FSQ19QQUdFX1NJWkVfMTZLKSkpCisJJChpZiAkKEJSMl9BUkNIX01NVV9QQUdFX1NJWkVf
NjRLKSwKKwkJJChpZiAkKEJSMl9hYXJjaDY0KSQoQlIyX2FhcmNoNjRfYmUpLAorCQkJJChjYWxs
IEtDT05GSUdfRElTQUJMRU9QVCxDT05GSUdfQVJNNjRfNEtfUEFHRVMpCisJCQkkKGNhbGwgS0NP
TkZJR19ESVNBQkxFX09QVCxDT05GSUdfQVJNNjRfMTZLX1BBR0VTKSkKKwkJCSQoY2FsbCBLQ09O
RklHX0VOQUJMRV9PUFQsQ09ORklHX0FSTTY0XzY0S19QQUdFUykpCiAJJChpZiAkKEJSMl9UQVJH
RVRfUk9PVEZTX0NQSU8pLAogCQkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19CTEtf
REVWX0lOSVRSRCkpCiAJIyBBcyB0aGUga2VybmVsIGdldHMgY29tcGlsZWQgYmVmb3JlIHJvb3Qg
ZmlsZXN5c3RlbXMgYXJlCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
