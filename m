Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973C3C64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 14:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 194914115C;
	Thu, 23 Feb 2023 14:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 194914115C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2vVFvepx6QH; Thu, 23 Feb 2023 14:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6235E41167;
	Thu, 23 Feb 2023 14:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6235E41167
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2A11BF4E3
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 14:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12D4041BDD
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 14:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12D4041BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFDvIOVe3zvX for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 14:58:32 +0000 (UTC)
X-Greylist: delayed 02:20:23 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37BB41BD8
Received: from 9.mo582.mail-out.ovh.net (9.mo582.mail-out.ovh.net
 [87.98.171.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B37BB41BD8
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 14:58:32 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.16.216])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 528CC250E6
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 08:59:34 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8ph44 (unknown [10.109.156.10])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D7A451FEC0;
 Thu, 23 Feb 2023 08:59:33 +0000 (UTC)
Received: from armadeus.com ([37.59.142.95])
 by ghost-submission-6684bf9d7b-8ph44 with ESMTPSA
 id EB6/MPUq92MZFQAAfUANkA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 23 Feb 2023 08:59:33 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 09:56:04 +0100
Message-Id: <20230223085604.28572-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3095661796698876907
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudektddguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepueejhfekteelueelfffhleevjeeuuedtieetleetvddvhedvjeeiveffgefhtedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0012d665b7d-aba2-443f-b30c-5a83fc863e65,
 9977713F7EEEBEE8FEE614800350E34FDDCBF291)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaCB8IDIgKy0K
IHBhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnQt
dGVzdHMvcnQtdGVzdHMuaGFzaCBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaAppbmRl
eCA0OWRmODMxM2Y5Li5lYjI4ZjRkNDQxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3J0LXRlc3RzL3J0
LXRlc3RzLmhhc2gKKysrIGIvcGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5oYXNoCkBAIC0xLDQg
KzEsNCBAQAogIyBGcm9tIGh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4
L3V0aWxzL3J0LXRlc3RzL3NoYTI1NnN1bXMuYXNjCi1zaGEyNTYgIDM5MzQ1N2YwYzkxY2NlNTdl
ODJiODc2ZWNiOWI2NzI4NzFmODk4ZTZjZWNhZmM3NTE1NDgwNzk1MTJiY2M4MDggIHJ0LXRlc3Rz
LTIuNC50YXIueHoKK3NoYTI1NiAgMmVkMmU0Yzk2NWM3ZjMzNmExNWQzMzU0ZGVjMDkwZTI3YTBi
MWU5YWRhOTFhZTBiOWVmMThiYmNiOTkzODc0ZSAgcnQtdGVzdHMtMi41LnRhci54egogIyBsb2Nh
bGx5IGNvbXB1dGVkIGhhc2gKIHNoYTI1NiAgYWIxNWZkNTI2YmQ4ZGQxOGE5ZTc3ZWJjMTM5NjU2
YmY0ZDMzZTk3ZmM3MjM4Y2QxMWJmNjBlMmI5Yjg2NjZjNiAgQ09QWUlORwpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5tayBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMu
bWsKaW5kZXggNzQyOTAyMTFjZS4uOGFkNDIxNWVlMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9ydC10
ZXN0cy9ydC10ZXN0cy5taworKysgYi9wYWNrYWdlL3J0LXRlc3RzL3J0LXRlc3RzLm1rCkBAIC02
LDcgKzYsNyBAQAogCiBSVF9URVNUU19TSVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvbGludXgv
dXRpbHMvcnQtdGVzdHMKIFJUX1RFU1RTX1NPVVJDRSA9IHJ0LXRlc3RzLSQoUlRfVEVTVFNfVkVS
U0lPTikudGFyLnh6Ci1SVF9URVNUU19WRVJTSU9OID0gMi40CitSVF9URVNUU19WRVJTSU9OID0g
Mi41CiBSVF9URVNUU19MSUNFTlNFID0gR1BMLTIuMCsKIFJUX1RFU1RTX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HCiAKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
