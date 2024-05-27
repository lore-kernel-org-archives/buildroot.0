Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D75C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 09:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E5B818E8;
	Mon, 27 May 2024 09:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOiNB96liLel; Mon, 27 May 2024 09:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C8F81911
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C8F81911;
	Mon, 27 May 2024 09:01:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE9BE1D1A29
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 09:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 990BD81911
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 09:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2EmUPLRsJxY for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 09:01:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.56.136;
 helo=1.mo582.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7175818E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7175818E8
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net
 [46.105.56.136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7175818E8
 for <buildroot@buildroot.org>; Mon, 27 May 2024 09:01:43 +0000 (UTC)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.140.28])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4VnqDw5mz6z17DY
 for <buildroot@buildroot.org>; Mon, 27 May 2024 08:53:36 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9fm6z (unknown [10.110.96.84])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 71AE81FEF9;
 Mon, 27 May 2024 08:53:36 +0000 (UTC)
Received: from armadeus.com ([37.59.142.107])
 by ghost-submission-6684bf9d7b-9fm6z with ESMTPSA
 id 10kVGBBKVGayPQAAm6AGhQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 27 May 2024 08:53:36 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 10:53:28 +0200
Message-ID: <20240527085328.11981-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5336765560068303851
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeujefhkeetleeuleffhfelveejueeutdeiteeltedvvdehvdejieevffeghfettdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0019f40f3e1-c22f-448f-8ed7-829bafd47fdc,
 1B12FB4183F93DF2C3E31E42115ACB7416ED0CB3)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.7
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
eCAwMTc0NDdiY2U2NjUuLjk2ODJmZGU0MDYxNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9ydC10ZXN0
cy9ydC10ZXN0cy5oYXNoCisrKyBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaApAQCAt
MSw0ICsxLDQgQEAKICMgRnJvbSBodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC91dGlscy9ydC10ZXN0cy9zaGEyNTZzdW1zLmFzYwotc2hhMjU2ICA3NjFkMTBjNGI3ZjVi
Mjg0MDBmMGMzMDFmZTAxNzFlYWE3NGYzNDdkZjY0Y2IzNTkyMTAyNTRiOGU2YWZmMTlmICBydC10
ZXN0cy0yLjYudGFyLnh6CitzaGEyNTYgIDBlNWIyZmJjOThjZWI3ODZiZDExM2M5YTMwZjAzODhk
ODg0YjJkOGM0YmQ2YzU2OWQ5NGFlOGIwMGE3MDJiYmIgIHJ0LXRlc3RzLTIuNy50YXIueHoKICMg
bG9jYWxseSBjb21wdXRlZCBoYXNoCiBzaGEyNTYgIGFiMTVmZDUyNmJkOGRkMThhOWU3N2ViYzEz
OTY1NmJmNGQzM2U5N2ZjNzIzOGNkMTFiZjYwZTJiOWI4NjY2YzYgIENPUFlJTkcKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMubWsgYi9wYWNrYWdlL3J0LXRlc3RzL3J0LXRl
c3RzLm1rCmluZGV4IDRiMWFhMzE3OTY0Ny4uNDE5MjYwZGIzYzhkIDEwMDY0NAotLS0gYS9wYWNr
YWdlL3J0LXRlc3RzL3J0LXRlc3RzLm1rCisrKyBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMu
bWsKQEAgLTYsNyArNiw3IEBACiAKIFJUX1RFU1RTX1NJVEUgPSAkKEJSMl9LRVJORUxfTUlSUk9S
KS9saW51eC91dGlscy9ydC10ZXN0cwogUlRfVEVTVFNfU09VUkNFID0gcnQtdGVzdHMtJChSVF9U
RVNUU19WRVJTSU9OKS50YXIueHoKLVJUX1RFU1RTX1ZFUlNJT04gPSAyLjYKK1JUX1RFU1RTX1ZF
UlNJT04gPSAyLjcKIFJUX1RFU1RTX0xJQ0VOU0UgPSBHUEwtMi4wKwogUlRfVEVTVFNfTElDRU5T
RV9GSUxFUyA9IENPUFlJTkcKIAotLSAKMi40NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
