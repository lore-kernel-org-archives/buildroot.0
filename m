Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49249C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF8E460A63;
	Mon,  3 Jun 2024 16:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IMIy_rg9hOW; Mon,  3 Jun 2024 16:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEDAF60A52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEDAF60A52;
	Mon,  3 Jun 2024 16:46:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 290081BF397
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13CBC820CB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIF7Lpys4QY3 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:46:33 +0000 (UTC)
X-Greylist: delayed 1800 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Jun 2024 16:46:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DA58820B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA58820B0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.56.217;
 helo=16.mo561.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 16.mo561.mail-out.ovh.net (16.mo561.mail-out.ovh.net
 [188.165.56.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA58820B0
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:46:31 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.140.194])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4VtJZv2PKfz1P1G
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:09:43 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lq7t4 (unknown [10.108.42.86])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E7D611FE9D;
 Mon,  3 Jun 2024 16:09:42 +0000 (UTC)
Received: from armadeus.com ([37.59.142.108])
 by ghost-submission-6684bf9d7b-lq7t4 with ESMTPSA
 id x4mDNMbqXWZ+MAEAaU+okA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 03 Jun 2024 16:09:42 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 18:09:35 +0200
Message-ID: <20240603160935.26618-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16917490525253004267
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdelvddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepueefhfffkeffleefffdttddufeelhfdtteetieduiefgffdviefhieehueffheehnecuffhomhgrihhnpegsuhhshigsohigrdhnvghtnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002e8150b51-8dce-454d-9571-bb1c80afdc47,
 E3E398E6AD9729369AB4DFE8A60F7EA96D5EA23B)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1]
 board/freescale/common/imx/imx8-bootloader-prepare.sh: fix FIT external
 position
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
Cc: Martin Whitaker <buildroot@martin-whitaker.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTWFydGluIFdoaXRha2VyIDxidWlsZHJvb3RAbWFydGluLXdoaXRha2VyLm1lLnVrPgoK
V2hlbiB1c2luZyBpbXgtbWtpbWFnZSA2LjEuMzZfMi4xLjAgb3IgbGF0ZXIsIGFuIGFkZGl0aW9u
YWwgZGF0YSBzdHJ1Y3R1cmUKaXMgaW5zZXJ0ZWQgaW4gdGhlIGdlbmVyYXRlZCBpbWFnZS4gVGhl
IEZJVCBleHRlcm5hbCBkYXRhIHBvc2l0aW9uIHBhc3NlZAp0byB0aGUgdWJvb3QgbWtpbWFnZSBw
cm9ncmFtIG5lZWRzIHRvIGJlIGFkanVzdGVkIGFjY29yZGluZ2x5LgoKRml4ZXM6IGh0dHBzOi8v
YnVncy5idXN5Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/aWQ9MTU5NzMKRml4ZXM6IDcyZGU3ODkwMjMz
MCAoInBhY2thZ2UvaW14LW1raW1hZ2U6IGJ1bXAgdmVyc2lvbiB0byBsZi02LjEuMzYtMi4xLjAi
KQpUZXN0ZWQtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFy
bWFkZXVzLmNvbT4KW1PDqWJhc3RpZW46IFRlc3RlZCBvbiBpLk1YOE1NIEVWSyBhbmQgaS5NWDhN
UCBFVktdCltTw6liYXN0aWVuOgogLSBmaXggc3ViamVjdAogLSBhZGQgVGVzdGVkLWJ5IHRhZwog
LSBmaXggRml4ZXMgdGFncwpdClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxz
ZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCgpUaGUgcGF0aCBjb21lcyBmcm9t
IGh0dHBzOi8vYnVncy5idXN5Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/aWQ9MTU5NzMgYW5kCml0cyBh
dXRob3IgaXMgTWFydGluIFdoaXRha2VyIDxidWlsZHJvb3RAbWFydGluLXdoaXRha2VyLm1lLnVr
Pi4KSSB3YXNuJ3Qgc3VyZSBpZiBJIHNob3VsZCBoYXZlIGFkZCBoaXMgU2lnbmVkLW9mZi1ieSB0
YWcuCgogYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvaW14OC1ib290bG9hZGVyLXByZXBhcmUu
c2ggfCAxMCArKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL2ZyZWVzY2FsZS9jb21tb24vaW14L2lteDgt
Ym9vdGxvYWRlci1wcmVwYXJlLnNoIGIvYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvaW14OC1i
b290bG9hZGVyLXByZXBhcmUuc2gKaW5kZXggYTllZTE1NGU5YzRjLi5iMzUzZDUwNmZlNDQgMTAw
NzU1Ci0tLSBhL2JvYXJkL2ZyZWVzY2FsZS9jb21tb24vaW14L2lteDgtYm9vdGxvYWRlci1wcmVw
YXJlLnNoCisrKyBiL2JvYXJkL2ZyZWVzY2FsZS9jb21tb24vaW14L2lteDgtYm9vdGxvYWRlci1w
cmVwYXJlLnNoCkBAIC04LDYgKzgsOCBAQCBtYWluICgpCiAJCWV4aXQgMQogCWZpCiAKKwlGSVRf
RVhURVJOQUxfUE9TSVRJT049MHg1MDAwCisKIAlpZiBncmVwIC1FcSAiXkJSMl9QQUNLQUdFX0ZS
RUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOE09eSQiICR7QlIyX0NPTkZJR307IHRoZW4KIAkJZGQg
aWY9JHtCSU5BUklFU19ESVJ9L3UtYm9vdC1zcGwuYmluIG9mPSR7QklOQVJJRVNfRElSfS91LWJv
b3Qtc3BsLXBhZGRlZC5iaW4gYnM9NCBjb252PXN5bmMKIAkJY2F0ICR7QklOQVJJRVNfRElSfS91
LWJvb3Qtc3BsLXBhZGRlZC5iaW4gJHtCSU5BUklFU19ESVJ9L2Rkcl9mdy5iaW4gPiAke0JJTkFS
SUVTX0RJUn0vdS1ib290LXNwbC1kZHIuYmluCkBAIC0xNiw3ICsxOCw3IEBAIG1haW4gKCkKIAkJ
ZWxzZQogCQkJQkwzMT0ke0JJTkFSSUVTX0RJUn0vYmwzMS5iaW4gQkwzMz0ke0JJTkFSSUVTX0RJ
Un0vdS1ib290LW5vZHRiLmJpbiBBVEZfTE9BRF9BRERSPTB4MDA5MTAwMDAgJHtIT1NUX0RJUn0v
YmluL21raW1hZ2VfZml0X2F0Zi5zaCAke1VCT09UX0RUQn0gPiAke0JJTkFSSUVTX0RJUn0vdS1i
b290Lml0cwogCQlmaQotCQkke0hPU1RfRElSfS9iaW4vbWtpbWFnZSAtRSAtcCAweDMwMDAgLWYg
JHtCSU5BUklFU19ESVJ9L3UtYm9vdC5pdHMgJHtCSU5BUklFU19ESVJ9L3UtYm9vdC5pdGIKKwkJ
JHtIT1NUX0RJUn0vYmluL21raW1hZ2UgLUUgLXAgJHtGSVRfRVhURVJOQUxfUE9TSVRJT059IC1m
ICR7QklOQVJJRVNfRElSfS91LWJvb3QuaXRzICR7QklOQVJJRVNfRElSfS91LWJvb3QuaXRiCiAJ
CXJtIC1mICR7QklOQVJJRVNfRElSfS91LWJvb3QuaXRzCiAKIAkJJHtIT1NUX0RJUn0vYmluL21r
aW1hZ2VfaW14OCAtZml0IC1zaWduZWRfaGRtaSAke0JJTkFSSUVTX0RJUn0vc2lnbmVkX2hkbWlf
aW14OG0uYmluIC1sb2FkZXIgJHtCSU5BUklFU19ESVJ9L3UtYm9vdC1zcGwtZGRyLmJpbiAweDdF
MTAwMCAtc2Vjb25kX2xvYWRlciAke0JJTkFSSUVTX0RJUn0vdS1ib290Lml0YiAweDQwMjAwMDAw
IDB4NjAwMDAgLW91dCAke0JJTkFSSUVTX0RJUn0vaW14OC1ib290LXNkLmJpbgpAQCAtMjgsNyAr
MzAsNyBAQCBtYWluICgpCiAJCWVsc2UKIAkJCUJMMzE9JHtCSU5BUklFU19ESVJ9L2JsMzEuYmlu
IEJMMzM9JHtCSU5BUklFU19ESVJ9L3UtYm9vdC1ub2R0Yi5iaW4gQVRGX0xPQURfQUREUj0weDAw
OTIwMDAwICR7SE9TVF9ESVJ9L2Jpbi9ta2ltYWdlX2ZpdF9hdGYuc2ggJHtVQk9PVF9EVEJ9ID4g
JHtCSU5BUklFU19ESVJ9L3UtYm9vdC5pdHMKIAkJZmkKLQkJJHtIT1NUX0RJUn0vYmluL21raW1h
Z2UgLUUgLXAgMHgzMDAwIC1mICR7QklOQVJJRVNfRElSfS91LWJvb3QuaXRzICR7QklOQVJJRVNf
RElSfS91LWJvb3QuaXRiCisJCSR7SE9TVF9ESVJ9L2Jpbi9ta2ltYWdlIC1FIC1wICR7RklUX0VY
VEVSTkFMX1BPU0lUSU9OfSAtZiAke0JJTkFSSUVTX0RJUn0vdS1ib290Lml0cyAke0JJTkFSSUVT
X0RJUn0vdS1ib290Lml0YgogCQlybSAtZiAke0JJTkFSSUVTX0RJUn0vdS1ib290Lml0cwogCiAJ
CSR7SE9TVF9ESVJ9L2Jpbi9ta2ltYWdlX2lteDggLWZpdCAtbG9hZGVyICR7QklOQVJJRVNfRElS
fS91LWJvb3Qtc3BsLWRkci5iaW4gMHg3RTEwMDAgLXNlY29uZF9sb2FkZXIgJHtCSU5BUklFU19E
SVJ9L3UtYm9vdC5pdGIgMHg0MDIwMDAwMCAweDYwMDAwIC1vdXQgJHtCSU5BUklFU19ESVJ9L2lt
eDgtYm9vdC1zZC5iaW4KQEAgLTQwLDcgKzQyLDcgQEAgbWFpbiAoKQogCQllbHNlCiAJCQlCTDMx
PSR7QklOQVJJRVNfRElSfS9ibDMxLmJpbiBCTDMzPSR7QklOQVJJRVNfRElSfS91LWJvb3Qtbm9k
dGIuYmluIEFURl9MT0FEX0FERFI9MHgwMDk2MDAwMCAke0hPU1RfRElSfS9iaW4vbWtpbWFnZV9m
aXRfYXRmLnNoICR7VUJPT1RfRFRCfSA+ICR7QklOQVJJRVNfRElSfS91LWJvb3QuaXRzCiAJCWZp
Ci0JCSR7SE9TVF9ESVJ9L2Jpbi9ta2ltYWdlIC1FIC1wIDB4MzAwMCAtZiAke0JJTkFSSUVTX0RJ
Un0vdS1ib290Lml0cyAke0JJTkFSSUVTX0RJUn0vdS1ib290Lml0YgorCQkke0hPU1RfRElSfS9i
aW4vbWtpbWFnZSAtRSAtcCAke0ZJVF9FWFRFUk5BTF9QT1NJVElPTn0gLWYgJHtCSU5BUklFU19E
SVJ9L3UtYm9vdC5pdHMgJHtCSU5BUklFU19ESVJ9L3UtYm9vdC5pdGIKIAkJcm0gLWYgJHtCSU5B
UklFU19ESVJ9L3UtYm9vdC5pdHMKIAogCQkke0hPU1RfRElSfS9iaW4vbWtpbWFnZV9pbXg4IC12
IHYyIC1maXQgLWxvYWRlciAke0JJTkFSSUVTX0RJUn0vdS1ib290LXNwbC1kZHIuYmluIDB4OTEy
MDAwIC1zZWNvbmRfbG9hZGVyICR7QklOQVJJRVNfRElSfS91LWJvb3QuaXRiIDB4NDAyMDAwMDAg
MHg2MDAwMCAtb3V0ICR7QklOQVJJRVNfRElSfS9pbXg4LWJvb3Qtc2QuYmluCkBAIC01Miw3ICs1
NCw3IEBAIG1haW4gKCkKIAkJZWxzZQogCQkJQkwzMT0ke0JJTkFSSUVTX0RJUn0vYmwzMS5iaW4g
QkwzMz0ke0JJTkFSSUVTX0RJUn0vdS1ib290LW5vZHRiLmJpbiBBVEZfTE9BRF9BRERSPTB4MDA5
NzAwMDAgJHtIT1NUX0RJUn0vYmluL21raW1hZ2VfZml0X2F0Zi5zaCAke1VCT09UX0RUQn0gPiAk
e0JJTkFSSUVTX0RJUn0vdS1ib290Lml0cwogCQlmaQotCQkke0hPU1RfRElSfS9iaW4vbWtpbWFn
ZSAtRSAtcCAweDMwMDAgLWYgJHtCSU5BUklFU19ESVJ9L3UtYm9vdC5pdHMgJHtCSU5BUklFU19E
SVJ9L3UtYm9vdC5pdGIKKwkJJHtIT1NUX0RJUn0vYmluL21raW1hZ2UgLUUgLXAgJHtGSVRfRVhU
RVJOQUxfUE9TSVRJT059IC1mICR7QklOQVJJRVNfRElSfS91LWJvb3QuaXRzICR7QklOQVJJRVNf
RElSfS91LWJvb3QuaXRiCiAJCXJtIC1mICR7QklOQVJJRVNfRElSfS91LWJvb3QuaXRzCiAKIAkJ
JHtIT1NUX0RJUn0vYmluL21raW1hZ2VfaW14OCAtdiB2MiAtZml0IC1sb2FkZXIgJHtCSU5BUklF
U19ESVJ9L3UtYm9vdC1zcGwtZGRyLmJpbiAweDkyMDAwMCAtc2Vjb25kX2xvYWRlciAke0JJTkFS
SUVTX0RJUn0vdS1ib290Lml0YiAweDQwMjAwMDAwIDB4NjAwMDAgLW91dCAke0JJTkFSSUVTX0RJ
Un0vaW14OC1ib290LXNkLmJpbgotLSAKMi40NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
