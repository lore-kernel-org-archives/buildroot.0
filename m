Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F515C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 13:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6996810F4;
	Fri, 16 May 2025 13:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3Jhhe8dnS0B; Fri, 16 May 2025 13:41:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9EA2811E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9EA2811E7;
	Fri, 16 May 2025 13:41:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 737F0185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5975F61047
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XerEsiS0Tx2 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 13:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 546A260B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 546A260B49
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 546A260B49
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:41:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 37987438F5;
 Fri, 16 May 2025 13:41:52 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 May 2025 15:41:49 +0200
Message-ID: <20250516134151.203697-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteeigfeiffelueejtdffueevtdfghffhfeduvdekvdehgfeftdekudfhffeijeelnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747402912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OV/Mam2zekYlVdOolwPoAMOqlJjrSFTaMYF6f3enaUk=;
 b=g4L5DVeM9Pv5gelpP/ei0H4mKMNnGHasNEDT0wDzLqsQGn2MaPcczXX8BCkbi7N36XywWM
 DdA3nfrK/ngITIhw2c9fqgcW0PRJqfxKT15k+F7h9DesQ4jtW9q20f1GONRRiwbDcPn3x1
 mTF9itlMXrUTVmhTgckBsbEW5IK9DBxJ/+c6YZ6z+VgL51WoOY4Q7z522jY1jfSq1zmeam
 FwrFYEq8aUcSPbPFsLX+UEvhUIuFbpayBS570zj0WrppizvG5ua3fBeg+nNQHphccaRZe7
 LAk0poZXBl/iG9UkUd7cxEV5cesbAGgcLm5qDBVo2tI26L90mTfZxaY7+2OMvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g4L5DVeM
Subject: [Buildroot] [PATCH] package/android-tools: add patch to fix GCC
 15.x build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aG9zdC1hbmRyb2lkLXRvb2xzIGZhaWxzIHRvIGJ1aWxkIHdoZW4gdGhlIGhvc3QgZ2NjIHZlcnNp
b24gaXMgPj0KMTUueC4gQSBzaW1wbGUgcGF0Y2ggYWxsb3dzIHRvIGZpeCB0aGUgaXNzdWUgYnkg
YWRqdXN0aW5nIGhvdwphbGxvY2F0ZV9pbm9kZSgpIGdldHMgY2FsbGVkLgoKRml4ZXM6CgogIGh0
dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lODE1MjQ5MDU0MGVlMTk2ODE4
MmY0ZWI3ODEzZTVlOTQwZjNlOWIzLwoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiAuLi5zLWNvbnRlbnRzLmMtYWxsb2Nh
dGVfaW5vZGUtZG9lc24tdC0ucGF0Y2ggfCA1NyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYW5k
cm9pZC10b29scy8wMDE3LWV4dHJhcy1leHQ0X3V0aWxzLWNvbnRlbnRzLmMtYWxsb2NhdGVfaW5v
ZGUtZG9lc24tdC0ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2FuZHJvaWQtdG9vbHMvMDAx
Ny1leHRyYXMtZXh0NF91dGlscy1jb250ZW50cy5jLWFsbG9jYXRlX2lub2RlLWRvZXNuLXQtLnBh
dGNoIGIvcGFja2FnZS9hbmRyb2lkLXRvb2xzLzAwMTctZXh0cmFzLWV4dDRfdXRpbHMtY29udGVu
dHMuYy1hbGxvY2F0ZV9pbm9kZS1kb2Vzbi10LS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi5hOWJhZjRkYzI5Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9h
bmRyb2lkLXRvb2xzLzAwMTctZXh0cmFzLWV4dDRfdXRpbHMtY29udGVudHMuYy1hbGxvY2F0ZV9p
bm9kZS1kb2Vzbi10LS5wYXRjaApAQCAtMCwwICsxLDU3IEBACitGcm9tIGI4MjJjOGUyZjM4MGJh
NjE1ODYwMWU2MjFhMTI5MjdhNDI2NGZmNjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgorRGF0ZTog
RnJpLCAxNiBNYXkgMjAyNSAxNTozMjowMCArMDIwMAorU3ViamVjdDogW1BBVENIXSBleHRyYXMv
ZXh0NF91dGlscy9jb250ZW50cy5jOiBhbGxvY2F0ZV9pbm9kZSgpIGRvZXNuJ3QgdGFrZQorIGFu
eSBhcmd1bWVudAorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsg
Y2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitGaXhlczoK
KworL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LWFuZHJv
aWQtdG9vbHMtNC4yLjIrZ2l0MjAxMzAyMTgvZXh0cmFzL2V4dDRfdXRpbHMvY29udGVudHMuYzog
SW4gZnVuY3Rpb24g4oCYbWFrZV9kaXJlY3RvcnnigJk6CisvaG9tZS90aG9tYXMvcHJvamV0cy9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtYW5kcm9pZC10b29scy00LjIuMitnaXQyMDEzMDIx
OC9leHRyYXMvZXh0NF91dGlscy9jb250ZW50cy5jOjEwMjoyOTogZXJyb3I6IHRvbyBtYW55IGFy
Z3VtZW50cyB0byBmdW5jdGlvbiDigJhhbGxvY2F0ZV9pbm9kZeKAmTsgZXhwZWN0ZWQgMCwgaGF2
ZSAxCisgIDEwMiB8ICAgICAgICAgICAgICAgICBpbm9kZV9udW0gPSBhbGxvY2F0ZV9pbm9kZShp
bmZvKTsKKworYW5kIHNpbWlsYXIgYnVpbGQgZmFpbHVyZXMgdGhhdCBvY2N1ciB3aXRoIEdDQyAx
NS54LgorCitVcHN0cmVhbTogTi9BLCB3ZSdyZSB0b28gZmFyIGZyb20gdXBzdHJlYW0KK1NpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
CistLS0KKyBleHRyYXMvZXh0NF91dGlscy9jb250ZW50cy5jIHwgNiArKystLS0KKyAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEv
ZXh0cmFzL2V4dDRfdXRpbHMvY29udGVudHMuYyBiL2V4dHJhcy9leHQ0X3V0aWxzL2NvbnRlbnRz
LmMKK2luZGV4IDYzMDA2ODAuLmIwMzM2YTQgMTAwNjQ0CistLS0gYS9leHRyYXMvZXh0NF91dGls
cy9jb250ZW50cy5jCisrKysgYi9leHRyYXMvZXh0NF91dGlscy9jb250ZW50cy5jCitAQCAtOTks
NyArOTksNyBAQCB1MzIgbWFrZV9kaXJlY3RvcnkodTMyIGRpcl9pbm9kZV9udW0sIHUzMiBlbnRy
aWVzLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cmllcywKKyAJbGVuID0gYmxvY2tzICogaW5mby5ibG9j
a19zaXplOworIAorIAlpZiAoZGlyX2lub2RlX251bSkgeworLQkJaW5vZGVfbnVtID0gYWxsb2Nh
dGVfaW5vZGUoaW5mbyk7CisrCQlpbm9kZV9udW0gPSBhbGxvY2F0ZV9pbm9kZSgpOworIAl9IGVs
c2UgeworIAkJZGlyX2lub2RlX251bSA9IEVYVDRfUk9PVF9JTk87CisgCQlpbm9kZV9udW0gPSBF
WFQ0X1JPT1RfSU5POworQEAgLTE2Nyw3ICsxNjcsNyBAQCB1MzIgbWFrZV9maWxlKGNvbnN0IGNo
YXIgKmZpbGVuYW1lLCB1NjQgbGVuKQorIAlzdHJ1Y3QgZXh0NF9pbm9kZSAqaW5vZGU7CisgCXUz
MiBpbm9kZV9udW07CisgCistCWlub2RlX251bSA9IGFsbG9jYXRlX2lub2RlKGluZm8pOworKwlp
bm9kZV9udW0gPSBhbGxvY2F0ZV9pbm9kZSgpOworIAlpZiAoaW5vZGVfbnVtID09IEVYVDRfQUxM
T0NBVEVfRkFJTEVEKSB7CisgCQllcnJvcigiZmFpbGVkIHRvIGFsbG9jYXRlIGlub2RlXG4iKTsK
KyAJCXJldHVybiBFWFQ0X0FMTE9DQVRFX0ZBSUxFRDsKK0BAIC0xOTYsNyArMTk2LDcgQEAgdTMy
IG1ha2VfbGluayhjb25zdCBjaGFyICpmaWxlbmFtZSwgY29uc3QgY2hhciAqbGluaykKKyAJdTMy
IGlub2RlX251bTsKKyAJdTMyIGxlbiA9IHN0cmxlbihsaW5rKTsKKyAKKy0JaW5vZGVfbnVtID0g
YWxsb2NhdGVfaW5vZGUoaW5mbyk7CisrCWlub2RlX251bSA9IGFsbG9jYXRlX2lub2RlKCk7Cisg
CWlmIChpbm9kZV9udW0gPT0gRVhUNF9BTExPQ0FURV9GQUlMRUQpIHsKKyAJCWVycm9yKCJmYWls
ZWQgdG8gYWxsb2NhdGUgaW5vZGVcbiIpOworIAkJcmV0dXJuIEVYVDRfQUxMT0NBVEVfRkFJTEVE
OworLS0gCisyLjQ5LjAKKwotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
