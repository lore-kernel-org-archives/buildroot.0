Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04465C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 15:16:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749E860F6C
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 15:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 749E860F6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2559A40761;
	Wed,  8 Sep 2021 15:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78k-zsrNWUTO; Wed,  8 Sep 2021 15:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B5B4074A;
	Wed,  8 Sep 2021 15:16:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6256B1BF376
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 15:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52303605F0
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 15:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAqBKvmVr4jE for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 15:16:05 +0000 (UTC)
X-Greylist: delayed 00:12:06 by SQLgrey-1.8.0
Received: from 6.mo179.mail-out.ovh.net (6.mo179.mail-out.ovh.net
 [46.105.56.76])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67C75605D7
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 15:16:05 +0000 (UTC)
Received: from player773.ha.ovh.net (unknown [10.109.138.21])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 55E2C19FB49
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 16:56:46 +0200 (CEST)
Received: from armadeus.com (lfbn-str-1-556-12.w90-126.abo.wanadoo.fr
 [90.126.252.12])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 1248922009D56;
 Wed,  8 Sep 2021 14:56:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003cc73c68d-5479-4d73-83f8-905c7557991a,
 EADA98BCC20AC2D5A098198FB2BDB57DCEC53566)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 90.126.252.12
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 16:55:25 +0200
Message-Id: <20210908145526.3543-4-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
References: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14928869818160442347
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefjedgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnheptefftdfhveelvedtjeejhefgteduiefgleetvdelhfelvedvtdfgffehhfelgeevnecuffhomhgrihhnpehphhihthgvtgdruggvpdhsihhgmhgrqdgthhgvmhhnihhtiidruggvnecukfhppedtrddtrddtrddtpdeltddruddviedrvdehvddruddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH 4/5] package/gst1-plugins-bayer2rgb-neon: bump
 to 0.6.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

VXBkYXRlIFNJVEUgdG8gYmUgc3luY2VkIHdpdGggYmF5ZXIycmdiLW5lb24uClVzZSBnaXQgYXMg
TUVUSE9EIGJlY2F1c2Ugbm8gdGFyYmFsbCBpcyBhdmFpbGFibGUgZm9yIHRoaXMgdmVyc2lvbi4K
ClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJheWVy
MnJnYi1uZW9uL0NvbmZpZy5pbiAgICB8IDIgKy0KIC4uLi9nc3QxLXBsdWdpbnMtYmF5ZXIycmdi
LW5lb24uaGFzaCAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiAuLi4vZ3N0MS1wbHVn
aW5zLWJheWVyMnJnYi1uZW9uLm1rICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKysrLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24v
Q29uZmlnLmluCmluZGV4IGI3Y2FjMDhkN2QuLmQzZWVjMzBjN2EgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vQ29uZmlnLmluCisrKyBi
L3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vQ29uZmlnLmlu
CkBAIC0xMiw3ICsxMiw3IEBAIG1lbnVjb25maWcgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JB
WUVSMlJHQl9ORU9OCiAJICBkZWNvZGUgcmF3IGNhbWVyYSBiYXllciB0byBSR0IgdXNpbmcKIAkg
IE5FT04gaGFyZHdhcmUgYWNjZWxlcmF0aW9uLgogCi0JICBodHRwczovL2dpdC5waHl0ZWMuZGUv
Z3N0LWJheWVyMnJnYi1uZW9uCisJICBodHRwczovL2dpdGxhYi1leHQuc2lnbWEtY2hlbW5pdHou
ZGUvZW5zYy9nc3QtYmF5ZXIycmdiLW5lb24KIAogY29tbWVudCAiZ3N0MS1wbHVnaW5zLWJheWVy
MnJnYi1uZW9uIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgZHluYW1pYyBsaWJyYXJ5LCBnY2Mg
Pj0gNC45IgogCWRlcGVuZHMgb24gQlIyX2FybSAmJiBCUjJfQVJNX0NQVV9IQVNfTkVPTgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVvbi9n
c3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24uaGFzaCBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3Qx
LXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uLmhhc2gK
aW5kZXggY2ZiNjJiMDYyYS4uZTYyNmQwYmE4ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9nc3RyZWFt
ZXIxL2dzdDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVvbi9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5l
b24uaGFzaAorKysgYi9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1u
ZW9uL2dzdDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVvbi5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAzMDc3MjU2NDAyMDMwODNkZjdkZmI3ZjljMmI4YmI5
NTgzYWNjZjdiOGMwNjIzOGRkOTJkNjE1MGE5ZmQ4YjA0IGdzdC1iYXllcjJyZ2ItbmVvbi0wLjQu
dGFyLmJ6Mgotc2hhMjU2IDhjZWI0YjllZTVhZGVkZGU0N2IzMWU5NzVjMWQ5MGM3M2FkMjdiNmIx
NjVhMWRjZDgwYzdjNTQ1ZWI2NWI5MDMgQ09QWUlORworc2hhMjU2ICA3NmIyMTM1YTIzZjQ2NWY3
ODljY2I4NmJkM2E4MTkwYTFlMzBmODZjZGIyOGFiZmFjNGQ5YTJjZGVjZTYzZmEyICBnc3QxLXBs
dWdpbnMtYmF5ZXIycmdiLW5lb24tYjYzMDc5OGVmY2Q2MTE4NzllN2NiMWMyNDYwNTJlNWJhMWFj
YzQxZC1icjEudGFyLmd6CitzaGEyNTYgIDhjZWI0YjllZTVhZGVkZGU0N2IzMWU5NzVjMWQ5MGM3
M2FkMjdiNmIxNjVhMWRjZDgwYzdjNTQ1ZWI2NWI5MDMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vZ3N0MS1wbHVnaW5z
LWJheWVyMnJnYi1uZW9uLm1rIGIvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXll
cjJyZ2ItbmVvbi9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24ubWsKaW5kZXggNTEzOTQ2M2Nh
MS4uODE1MDk5ZTMxNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lu
cy1iYXllcjJyZ2ItbmVvbi9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24ubWsKKysrIGIvcGFj
a2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVvbi9nc3QxLXBsdWdpbnMt
YmF5ZXIycmdiLW5lb24ubWsKQEAgLTQsOSArNCw5IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1HU1QxX1BMVUdJTlNfQkFZRVIyUkdCX05FT05fVkVSU0lPTiA9IDAuNAotR1NUMV9Q
TFVHSU5TX0JBWUVSMlJHQl9ORU9OX1NPVVJDRSA9IGdzdC1iYXllcjJyZ2ItbmVvbi0kKEdTVDFf
UExVR0lOU19CQVlFUjJSR0JfTkVPTl9WRVJTSU9OKS50YXIuYnoyCi1HU1QxX1BMVUdJTlNfQkFZ
RVIyUkdCX05FT05fU0lURSA9IGh0dHBzOi8vZ2l0LnBoeXRlYy5kZS9nc3QtYmF5ZXIycmdiLW5l
b24vc25hcHNob3QKK0dTVDFfUExVR0lOU19CQVlFUjJSR0JfTkVPTl9WRVJTSU9OID0gYjYzMDc5
OGVmY2Q2MTE4NzllN2NiMWMyNDYwNTJlNWJhMWFjYzQxZAorR1NUMV9QTFVHSU5TX0JBWUVSMlJH
Ql9ORU9OX1NJVEUgPSBodHRwczovL2dpdGxhYi1leHQuc2lnbWEtY2hlbW5pdHouZGUvZW5zYy9n
c3QtYmF5ZXIycmdiLW5lb24uZ2l0CitHU1QxX1BMVUdJTlNfQkFZRVIyUkdCX05FT05fU0lURV9N
RVRIT0QgPSBnaXQKIEdTVDFfUExVR0lOU19CQVlFUjJSR0JfTkVPTl9MSUNFTlNFID0gR1BMLTMu
MAogR1NUMV9QTFVHSU5TX0JBWUVSMlJHQl9ORU9OX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCiAK
LS0gCjIuMzIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
