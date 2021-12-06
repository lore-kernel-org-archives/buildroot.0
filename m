Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1125C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 19:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B8984B3C;
	Mon,  6 Dec 2021 19:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeQNRh0l00N6; Mon,  6 Dec 2021 19:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAD3B82A28;
	Mon,  6 Dec 2021 19:27:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 099D71BF29A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9C9F60D71
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=samsung.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npsh1WHmfvrf for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 19:27:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA6D960D66
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 19:27:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211206192738euoutp02b1a2707435500d9be3b5ba89594a8bd1~_QRGOYrH20911709117euoutp021
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 19:27:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211206192738euoutp02b1a2707435500d9be3b5ba89594a8bd1~_QRGOYrH20911709117euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1638818858;
 bh=M8rjW3MZEvmv78x0bIF6FPy9RsuTDsl0itYPjtmvz/Q=;
 h=From:To:Cc:Subject:Date:References:From;
 b=bUd2G2pleKTqUiXudoFihRpAY4PUa/MRFjVoKPqfMF2SWQpxzDYO0v/E3pe3jEhmJ
 uqItqMv6Yz/8d4CKO4JP9FLuefY2U+U3D5Dosy6H40+I3iYqmcoYoT9tnDA0ghHk7u
 hvvg3onglZa83+cimsXH5mXP3KC2YWpTlba+p9SA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211206192737eucas1p2106cf7f2defb1745df6596c1909bdddf~_QRGACj6O2970429704eucas1p2Z;
 Mon,  6 Dec 2021 19:27:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 91.EE.10009.9246EA16; Mon,  6
 Dec 2021 19:27:37 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211206192737eucas1p2f5cd4b11833868a8a965d39dbd3bf70a~_QRFZmq082248122481eucas1p2K;
 Mon,  6 Dec 2021 19:27:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211206192737eusmtrp1930206d9d6885ff434296b29bc7eafb9~_QRFY7J963014930149eusmtrp1V;
 Mon,  6 Dec 2021 19:27:37 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-87-61ae642924a8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DF.1E.09404.8246EA16; Mon,  6
 Dec 2021 19:27:36 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20211206192736eusmtip22415b00ce9f6fd9897b6f02a2eeecc7b~_QRFObc4d2375823758eusmtip25;
 Mon,  6 Dec 2021 19:27:36 +0000 (GMT)
From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 20:27:30 +0100
Message-Id: <20211206192732.373740-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djP87qaKesSDR7/ELN4efQls8Xzhq2s
 FkcXNbFZtE3exG5x89AKRou1R+6yW3T+2cVkMePdElaLzjfv2C3evLjIaLFg10s2B26P1a87
 2T3mran2uPx+LrtH/7rPrB47Z91l97h76xKTx7frnYwefVtWMXps2f+Z0WPR4sIArigum5TU
 nMyy1CJ9uwSujMPNT9kKHnJU/Lp4i6WB8RZbFyMnh4SAicSche1ANheHkMAKRok7f9dAOV8Y
 JeY96WOFcD4zSqyb/osFpmXL7AVMILaQwHJGiW3PXSCKnjNK3D28hxkkwSbgKNG/9AQriC0i
 IC3x/d5ZsEnMAl+YJZq37GYHSQgLmEssXNLICGKzCKhKnN87FczmFbCROHjlOyvENnmJtuvT
 oeKCEidnPgG7gl9AS2JN03UwmxmopnnrbGaQBRICzZwSk/5/Z4JodpH439HKDmELS7w6vgXK
 lpE4PbkHqJkDyK6XmDzJDKK3B+ibOT+g3rSWuHPuFxtIDbOApsT6XfoQYUeJn9c/sUK08knc
 eCsIcQKfxKRt05khwrwSHW1CENUqEuv690ANlJLofbWCEcL2kPj+dQfjBEbFWUgem4XkmVkI
 excwMq9iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITGGn/x3/tINx7quPeocYmTgYDzFK
 cDArifCqPVybKMSbklhZlVqUH19UmpNafIhRmoNFSZxX5E9DopBAemJJanZqakFqEUyWiYNT
 qoHJvWi9pWbUjf3riz3uy4Tcm7vy1uKJHfNmv4jdGu1kdvMhpyvTkwrdy3p91560vdJXvHjF
 Yz/jtV99143ULFqmeM3Z3q7YkMX+7+6qVt3g/L/HxVpZJMv2+sSKWkfO+m9wJL7558wrKyNL
 z2za+DZuHff7yH7FywanJe1cbkQEr3mUsumod42Gwv9/mXuT3XdvjUhduH8py+JnPL4WQes5
 tv883+h99xg365ymf25XizSduA1Vrf3tpiuF5O+PO7I58pprW1Olq+dhic91LzZMfB7anNQ8
 x85az+ri/Aka21oCVrnXn91mUce+Z9usCRfjGx7vlWGqfpfg+sjKYfI9r2u13E0lknJcF770
 VF5UYinOSDTUYi4qTgQAN0oZrNADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7oaKesSDSZM0rB4efQls8Xzhq2s
 FkcXNbFZtE3exG5x89AKRou1R+6yW3T+2cVkMePdElaLzjfv2C3evLjIaLFg10s2B26P1a87
 2T3mran2uPx+LrtH/7rPrB47Z91l97h76xKTx7frnYwefVtWMXps2f+Z0WPR4sIArig9m6L8
 0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jMPNT9kKHnJU
 /Lp4i6WB8RZbFyMnh4SAicSW2QuYuhi5OIQEljJKvJw+laWLkQMoISWxcm46RI2wxJ9rXWwQ
 NU8ZJXYeWcgIkmATcJToX3qCFcQWEZCW+H7vLCtIEbPAD2aJRZemsYAkhAXMJRYuaQRrYBFQ
 lTi/dyqYzStgI3HwyndWiA3yEm3Xp0PFBSVOznwCdgSzgLrE+nlCIGF+AS2JNU3XwUYyA5U3
 b53NPIFRYBaSjlkIHbOQVC1gZF7FKJJaWpybnltspFecmFtcmpeul5yfu4kRGIHbjv3csoNx
 5auPeocYmTgYDzFKcDArifCqPVybKMSbklhZlVqUH19UmpNafIjRFOiDicxSosn5wBSQVxJv
 aGZgamhiZmlgamlmrCTO61nQkSgkkJ5YkpqdmlqQWgTTx8TBKdXAVM014b/WAZOIVz9sPY/8
 +/9L1OHipoVBt2ZmSdj90lxrLX22Y0sWV0DuWplzHiZVcyOOX1zNz7LyqzXT9svLfD4XFqW6
 /3v6X+bH37q0l7nvKuVlbD5zfJshZ91qw/xP5GB4oeeHv3+D/y33f63qHPDs4v+W2jCPF3Vx
 m+eXuLtVtZQncnPdmbJQpiRUXC6ogMnVqDmcc9WnhNOHbk8xOei14vNE9SXv3xvwpLfOu8r6
 SnG6kAPPKvP8X1NvZ7ZHO39dXMw4eQnPwkeP+0typkY+ClnWpSf+/VPULce+ayqizxp97+lF
 3Nlw72XClG1pD/cmn35nxZTid+bapvUVSzpnrlrWfvf/zn9VfSllMUosxRmJhlrMRcWJAOLS
 GXdJAwAA
X-CMS-MailID: 20211206192737eucas1p2f5cd4b11833868a8a965d39dbd3bf70a
X-Msg-Generator: CA
X-RootMTR: 20211206192737eucas1p2f5cd4b11833868a8a965d39dbd3bf70a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211206192737eucas1p2f5cd4b11833868a8a965d39dbd3bf70a
References: <CGME20211206192737eucas1p2f5cd4b11833868a8a965d39dbd3bf70a@eucas1p2.samsung.com>
Subject: [Buildroot] [PATCH v2 0/2] Generic MMU page size selection
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

T24gc29tZSBzeXN0ZW1zIE1NVXMgc3VwcG9ydCBtb3JlIHRoYW4gb25lIHBhZ2Ugc2l6ZS4gSXQg
aXMgT1Mga2VybmVsJ3MKdGFzayB0byBjaG9vc2UgdGhlIGNvbmZpZ3VyYXRpb24gZHVyaW5nIGJv
b3QuIExpbnV4IGtlcm5lbCBjYW4gYmUgY29tcGlsZWQKdG8gc3VwcG9ydCBkaWZmZXJlbnQgcGFn
ZSBzaXplLiAgVG8gcnVuIG9uIGEgc3lzdGVtIHdpdGggcGFnZXMgbGFyZ2VyIHRoYW4KNCBrQiB1
c2VybGFuZCBiaW5hcmllcyBuZWVkIHRvIGJlIHByb3Blcmx5IGFsaWduZWQgZHVyaW5nIHRoZSBs
aW5raW5nCnByb2Nlc3MuIEhvd2V2ZXIsIGJpbmFyaWVzIHByZXBhcmVkIGZvciBzeXN0ZW1zIHdp
dGggbGFyZ2VyIHBhZ2VzIGNhbgpydW4gb24gc3lzdGVtcyB3aXRoIHNtYWxsZXIgcGFnZXMuCgpD
aGFuZ2VzIHYxIC0+IHYyOgogIC0gbWFrZSBwYWdlIHNpemUgc2VsZWN0aW9uIGFyY2hpdGVjdHVy
ZS1pbmRlcGVuZGVudCAobmVlZHMgYXJjaGl0ZWN0dXJlCiAgICBzdXBwb3J0IHRvIGJlIGRlY2xh
cmVkKQogIC0gYWRkIHBhZ2Ugc2l6ZSBzbGVjdGlvbiBmb3IgQWFyY2g2NCBpbiBhIHNlcGFyYXRl
IHBhdGNoCgrFgXVrYXN6IFN0ZWxtYWNoICgyKToKICBhcmNoOiBNYWtlIHBhZ2Ugc2l6ZSBjb25m
aWd1cmF0aW9uIGFyY2hpdGVjdHVyZS1pbmRlcGVuZGVudC4KICBhcmNoL2FybTogTWFrZSBwYWdl
IHNpemUgY29uZmlndXJhYmxlIG9uIEFhcmNoNjQKCiBhcmNoL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL0NvbmZp
Zy5pbi5hcmMgICAgICAgICAgICAgfCAzOCAtLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJjaC5t
ay5hcmMgICAgICAgICAgICAgICB8ICA5IC0tLS0tCiBsaW51eC9saW51eC5tayAgICAgICAgICAg
ICAgICAgfCA0MCArKysrKysrKysrKysrLS0tLS0tCiBwYWNrYWdlL3VjbGliYy91Y2xpYmMubWsg
ICAgICAgfCAgMiArLQogdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVyLm1rIHwgMTMgKysrKysr
KwogNiBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pCgot
LSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
