Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2775CC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE874811C2;
	Sun, 18 May 2025 17:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrONZtiLzhER; Sun, 18 May 2025 17:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76D35810D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76D35810D1;
	Sun, 18 May 2025 17:47:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D95D1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EF236073E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBsATf9CybnN for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:47:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33B27606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33B27606D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33B27606D9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:47:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7326FA4C21A9;
 Sun, 18 May 2025 19:46:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38314)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi5m-000000003tB-2Y9F;
 Sun, 18 May 2025 17:46:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
 Joachim Wiberg <troglobit@gmail.com>, Steve Kenton <skenton@ou.edu>,
 Wade Berrier <wberrier@gmail.com>
Date: Sun, 18 May 2025 19:46:30 +0200
Message-Id: <20250518174630.2149476-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518174630.2149476-1-bernd@kuhls.net>
References: <20250518174630.2149476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590391;
 bh=IIsurjUMIllbTgWSlyPkoYnfpG+4lLH/2nwIIqorBWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jWZARtZSAJxksv6wqvg/LKClTCRytvm5Vky1VVETg+MiLJYNcUZ7NBStL7d7i1Gmb
 kgVLaTx0t6Oa9kAhKFkSqipOGNvaPZij47d63NQwRgE1jCw5xxghxZ7M4qaCPs/27z
 xi5kOqSVQAp7uPgBOUzQNjhg6Y+tf7EGUN5AV0h6NS/FWlB6yk+c3b3hpZbZl35MEA
 9Rmp51bF3Gy6KY2/cPHyDvQX4RObDUVLkmorDenQwpi+8G1pO11ll9TgkawqTBwAR5
 xoiir9F9ZCHw9BkGeJUWboGoAlENRe45kPaUbCYbXp+BUk7KQa6i20cpspkOqcPQ2t
 5p6O7KtPGDVhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=jWZARtZS
Subject: [Buildroot] [PATCH 5/5] package/pppd: fix build with gcc-15.x
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5kLUZp
eC1idWlsZGluZy1zZXNzaW9uLmMtd2l0aC1HQ0MtMTUucGF0Y2ggfCAzNiArKysrKysrKysKIC4u
LjMtcHBwZHVtcC1GaXhlZC1idWlsZGluZy13aXRoLUdDQy0xNS5wYXRjaCB8IDc2ICsrKysrKysr
KysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3BwcGQvMDAwMi1wcHBkLUZpeC1idWlsZGluZy1zZXNzaW9uLmMt
d2l0aC1HQ0MtMTUucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BwcGQvMDAwMy1w
cHBkdW1wLUZpeGVkLWJ1aWxkaW5nLXdpdGgtR0NDLTE1LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9wcHBkLzAwMDItcHBwZC1GaXgtYnVpbGRpbmctc2Vzc2lvbi5jLXdpdGgtR0NDLTE1LnBh
dGNoIGIvcGFja2FnZS9wcHBkLzAwMDItcHBwZC1GaXgtYnVpbGRpbmctc2Vzc2lvbi5jLXdpdGgt
R0NDLTE1LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjRmY2Q0
OTI1NjIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3BwcGQvMDAwMi1wcHBkLUZpeC1idWls
ZGluZy1zZXNzaW9uLmMtd2l0aC1HQ0MtMTUucGF0Y2gKQEAgLTAsMCArMSwzNiBAQAorRnJvbSBm
Yjc2OWMzODBlZWFjZjIzYjY0Y2IzYmY3ODYwYmE0OWEwZTBlZWQ1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KK0RhdGU6IFR1ZSwg
OCBBcHIgMjAyNSAwMDoxNTo1NyAtMDcwMAorU3ViamVjdDogW1BBVENIXSBwcHBkOiBGaXggYnVp
bGRpbmcgc2Vzc2lvbi5jIHdpdGggR0NDIDE1ICgjNTUzKQorCitGaXhlZCBidWlsZGluZyB3aXRo
IEdDQyAxNSB3aGljaCBkZWZhdWx0cyB0byBDMjMKK2FuZCBmaW5kIGNvbmZsaWN0aW5nIGRlY2xy
YXRpb24gb2YgZ2V0c3BuYW0oKSBoZXJlCit3aXRoIHRoZSBvbmUgcHJvdmlkZWQgYnkgc2hhZG93
LmggKGV4dGVybiBzdHJ1Y3Qgc3B3ZCAqZ2V0c3BuYW0gKGNvbnN0IGNoYXIgKl9fbmFtZSk7KQor
CitGaXhlcworLi4vLi4vcHBwLTIuNS4yL3BwcGQvc2Vzc2lvbi5jOiBJbiBmdW5jdGlvbiAnc2Vz
c2lvbl9zdGFydCc6CisuLi8uLi9wcHAtMi41LjIvcHBwZC9zZXNzaW9uLmM6MTg1OjE4OiBlcnJv
cjogY29uZmxpY3RpbmcgdHlwZXMgZm9yICdnZXRzcG5hbSc7IGhhdmUgJ3N0cnVjdCBzcHdkICoo
dm9pZCknCisgIDE4NSB8ICAgICBzdHJ1Y3Qgc3B3ZCAqZ2V0c3BuYW0oKTsKKyAgICAgIHwgICAg
ICAgICAgICAgICAgICBefn5+fn5+fgorCitTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3BwcC1wcm9qZWN0
L3BwcC9jb21taXQvZmI3NjljMzgwZWVhY2YyM2I2NGNiM2JmNzg2MGJhNDlhMGUwZWVkNQorCitT
aWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgorLS0tCisgcHBwZC9z
ZXNzaW9uLmMgfCAxIC0KKyAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQorCitkaWZmIC0t
Z2l0IGEvcHBwZC9zZXNzaW9uLmMgYi9wcHBkL3Nlc3Npb24uYworaW5kZXggZjA4ZDhlMTkuLjlj
Yzc1Mzg5IDEwMDY0NAorLS0tIGEvcHBwZC9zZXNzaW9uLmMKKysrKyBiL3BwcGQvc2Vzc2lvbi5j
CitAQCAtMTgyLDcgKzE4Miw2IEBAIHNlc3Npb25fc3RhcnQoY29uc3QgaW50IGZsYWdzLCBjb25z
dCBjaGFyICp1c2VyLCBjb25zdCBjaGFyICpwYXNzd2QsIGNvbnN0IGNoYXIKKyAgICAgY2hhciAq
Y2J1ZjsKKyAjaWZkZWYgSEFWRV9TSEFET1dfSAorICAgICBzdHJ1Y3Qgc3B3ZCAqc3B3ZDsKKy0g
ICAgc3RydWN0IHNwd2QgKmdldHNwbmFtKCk7CisgICAgIGxvbmcgbm93ID0gMDsKKyAjZW5kaWYg
LyogI2lmZGVmIEhBVkVfU0hBRE9XX0ggKi8KKyAjZW5kaWYgLyogI2lmZGVmIFBQUF9XSVRIX1BB
TSAqLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wcHBkLzAwMDMtcHBwZHVtcC1GaXhlZC1idWlsZGlu
Zy13aXRoLUdDQy0xNS5wYXRjaCBiL3BhY2thZ2UvcHBwZC8wMDAzLXBwcGR1bXAtRml4ZWQtYnVp
bGRpbmctd2l0aC1HQ0MtMTUucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uYWI3Yzk0ZTUwNgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHBwZC8wMDAzLXBw
cGR1bXAtRml4ZWQtYnVpbGRpbmctd2l0aC1HQ0MtMTUucGF0Y2gKQEAgLTAsMCArMSw3NiBAQAor
RnJvbSAwNTM2MTY5MmVlN2Q2MjYwY2U1YzA0YzlmYTBlNWExYWE3NTY1MzIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP0phcm9zbGF2PTIwPUM1PUEwa2FydmFkYT89
IDxqc2thcnZhZEByZWRoYXQuY29tPgorRGF0ZTogVGh1LCAyNyBGZWIgMjAyNSAyMzowMDoxNiAr
MDEwMAorU3ViamVjdDogW1BBVENIXSBwcHBkdW1wOiBGaXhlZCBidWlsZGluZyB3aXRoIEdDQyAx
NSAoIzU0OCkKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNo
YXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworR0NDIDE1IGRl
ZmF1bHRzIHRvIEMyMyB3aGljaCBkb2VzIG5vdCBhbGxvdyBLJlIgZGVjbGFyYXRpb25zLgorCitD
cmVkaXQgWWFha292IFNlbGtvd2l0eiBpbjoKK2h0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3Jn
L3JwbXMvcHBwL3B1bGwtcmVxdWVzdC8xMgorCitTaWduZWQtb2ZmLWJ5OiBKYXJvc2xhdiDFoGth
cnZhZGEgPGpza2FydmFkQHJlZGhhdC5jb20+CisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5j
b20vcHBwLXByb2plY3QvcHBwL2NvbW1pdC8wNTM2MTY5MmVlN2Q2MjYwY2U1YzA0YzlmYTBlNWEx
YWE3NTY1MzIzCisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+
CistLS0KKyBwcHBkdW1wL3BwcGR1bXAuYyB8IDIwICsrKysrKystLS0tLS0tLS0tLS0tCisgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1n
aXQgYS9wcHBkdW1wL3BwcGR1bXAuYyBiL3BwcGR1bXAvcHBwZHVtcC5jCitpbmRleCBjMjQyMDhh
Zi4uMTUzNDAzNmMgMTAwNjQ0CistLS0gYS9wcHBkdW1wL3BwcGR1bXAuYworKysrIGIvcHBwZHVt
cC9wcHBkdW1wLmMKK0BAIC00MiwxNCArNDIsMTIgQEAgaW50IHRvdF9zZW50LCB0b3RfcmN2ZDsK
KyBleHRlcm4gaW50IG9wdGluZDsKKyBleHRlcm4gY2hhciAqb3B0YXJnOworIAorLXZvaWQgZHVt
cGxvZygpOworLXZvaWQgZHVtcHBwcCgpOworLXZvaWQgc2hvd190aW1lKCk7Cisrdm9pZCBkdW1w
bG9nKEZJTEUgKik7Cisrdm9pZCBkdW1wcHBwKEZJTEUgKik7Cisrdm9pZCBzaG93X3RpbWUoRklM
RSAqLCBpbnQpOworIAorIGludAorLW1haW4oYWMsIGF2KQorLSAgICBpbnQgYWM7CistICAgIGNo
YXIgKiphdjsKKyttYWluKGludCBhYywgY2hhciAqKmF2KQorIHsKKyAgICAgaW50IGk7CisgICAg
IGNoYXIgKnA7CitAQCAtOTcsOCArOTUsNyBAQCBtYWluKGFjLCBhdikKKyB9CisgCisgdm9pZAor
LWR1bXBsb2coZikKKy0gICAgRklMRSAqZjsKKytkdW1wbG9nKEZJTEUgKmYpCisgeworICAgICBp
bnQgYywgbiwgaywgY29sOworICAgICBpbnQgbmIsIGMyOworQEAgLTI0MSw4ICsyMzgsNyBAQCBz
dHJ1Y3QgcGt0IHsKKyB1bnNpZ25lZCBjaGFyIGRidWZbODE5Ml07CisgCisgdm9pZAorLWR1bXBw
cHAoZikKKy0gICAgRklMRSAqZjsKKytkdW1wcHBwKEZJTEUgKmYpCisgeworICAgICBpbnQgYywg
biwgazsKKyAgICAgaW50IG5iLCBubCwgZG4sIHByb3RvLCBydjsKK0BAIC0zNzUsOSArMzcxLDcg
QEAgZHVtcHBwcChmKQorIH0KKyAKKyB2b2lkCistc2hvd190aW1lKGYsIGMpCistICAgIEZJTEUg
KmY7CistICAgIGludCBjOworK3Nob3dfdGltZShGSUxFICpmLCBpbnQgYykKKyB7CisgICAgIHRp
bWVfdCB0OworICAgICBpbnQgbjsKLS0gCjIuMzkuNQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
