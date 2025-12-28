Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98ABD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8689E80B1A;
	Sun, 28 Dec 2025 21:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUNzGzUbD6bp; Sun, 28 Dec 2025 21:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B0880B37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766956263;
	bh=idKIksYAqLnU8GychJW1qJaOXtBPX3Bgo+RK+vqSPDg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J230MSL2niK7aaKsMyeZZ2c7DTL/CGcpfJfCTN4uU2yKCFpOHn1oKqAX1SxREUXZz
	 YKtAb3p6bzbllqlxfjphVgg9chJ1DEakfkAslXvFNwfO6KOosdDEFxHuZotHJA3f+E
	 k2XxKwtt1iJJeOpdxPqQY1s5WdjkWfiaIxM+E89x2m4SFHFS0op0KFZS83bEwpYe91
	 0zuSR475OfpZZ7MFXNMlikjQC4mXO7/1DODaDp/4b79V2skhuAMZ4qU/TTwzgubStq
	 xAS7bUvR0i9o6gVST1cq9ozYbYRohPhyxx3myMXoKMHRC0Sd4OnJVcWn/q8+R3Dyv0
	 Nz0ADHLpMBVuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82B0880B37;
	Sun, 28 Dec 2025 21:11:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B835D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 029C94040A
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cd2zmtikEZ27 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1538040376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1538040376
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1538040376
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7786DC1D70D;
 Sun, 28 Dec 2025 21:10:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7A9560725;
 Sun, 28 Dec 2025 21:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57AD6119792C6; Sun, 28 Dec 2025 22:10:58 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 28 Dec 2025 22:10:40 +0100
Message-ID: <20251228211045.3059593-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766956258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tqE9CP0IAARqtnT2guAPhVgvGZtvYbH4Hu4t/FCcekw=;
 b=MF7GCYxyrzUqWHeq/Tg0SNaWge/MZKRZKn3Q4v6P0MZ+wFV3YajR7ZZ+psQGtkd+vWe9T+
 mb6fkc2Iss39ZcM34ArRvkaq1tmFcfZaJExBFyyHHLbjHgE9wZRjo9GRlCb9CqqWCxckh7
 ZSvXdN9D6cZtumgCoZVxSxIDsrlKt9/KxsWLGRg1R3/60D/CEw4JyBLrTy1LOH6IAJqHeg
 WY7FmcmSlaYkKTvLNOJedbdiCT/GxGYRssjKAIkaF0WG8dNm5bg/xsDCfl12RvfYsEjUjo
 qlG03XKUUe3C5Mp8XFSOFrDcGmk42A+ZXt6RTSzTWVZh+XFeuZZquh3pplZHiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=MF7GCYxy
Subject: [Buildroot] [PATCH 2/5] package/qt5/qt5webkit: fix build with ICU
 >= 76
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

U2luY2UgdGhlIGJ1bXAgb2YgSUNVIGZyb20gSUNVIDczIHRvIElDVSA3NyBpbiBjb21taXQKZGNl
ZTk5NTA3YzY3NjcyMzBmZDFmYWVlZWZlOTVmNTY2MmViMDNhMywgdGhlIGJ1aWxkIG9mIHF0NXdl
YmtpdCBmYWlscwp3aXRoOgoKL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9ici9vdXRwdXQtYWxsL2hv
c3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvdW5pY29k
ZS9jaGFyMTZwdHIuaDoyNzE6Mzg6IGVycm9yOiDigJhlbmFibGVfaWZfdOKAmSBpbiBuYW1lc3Bh
Y2Ug4oCYc3Rk4oCZIGRvZXMgbm90IG5hbWUgYSB0ZW1wbGF0ZSB0eXBlCiAgMjcxIHwgdGVtcGxh
dGU8dHlwZW5hbWUgVCwgdHlwZW5hbWUgPSBzdGQ6OmVuYWJsZV9pZl90PHN0ZDo6aXNfc2FtZV92
PFQsIFVDaGFyPj4+CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+CgpXZSB0YWtlbiB0d28gcGF0Y2hlcyBmcm9tIEFyY2ggTGludXgsIG9uZSB3
aGljaCBpcyBhIHBhcnRpYWwgdXBzdHJlYW0KYmFja3BvcnQsIGFuZCBhbm90aGVyIHdoaWNoIHdh
cyBzdWJtaXR0ZWQgdXBzdHJlYW0sIHRvIGFkZHJlc3MgdGhpcwpidWlsZCBpc3N1ZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
Ci0tLQogLi4ubGF0Zm9ybS5oLWZpeC1idWlsZC13aXRoLW5ld2VyLXZlcnNpLnBhdGNoIHwgNDAg
KysrKysrKysrKysrKysrKysrKwogLi4uZWFkZXItb25seS1BUElzLWludHJvZHVjZWQtaW4tSUNV
LTc2LnBhdGNoIHwgMjggKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2OCBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMTAtU291
cmNlLVdURi13dGYtUGxhdGZvcm0uaC1maXgtYnVpbGQtd2l0aC1uZXdlci12ZXJzaS5wYXRjaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NXdlYmtpdC8wMDExLURpc2FibGUtSUNV
LUMtaGVhZGVyLW9ubHktQVBJcy1pbnRyb2R1Y2VkLWluLUlDVS03Ni5wYXRjaAoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC8wMDEwLVNvdXJjZS1XVEYtd3RmLVBsYXRmb3JtLmgt
Zml4LWJ1aWxkLXdpdGgtbmV3ZXItdmVyc2kucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDV3ZWJraXQv
MDAxMC1Tb3VyY2UtV1RGLXd0Zi1QbGF0Zm9ybS5oLWZpeC1idWlsZC13aXRoLW5ld2VyLXZlcnNp
LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ2NTYyODk4NzAK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAxMC1Tb3VyY2UtV1RG
LXd0Zi1QbGF0Zm9ybS5oLWZpeC1idWlsZC13aXRoLW5ld2VyLXZlcnNpLnBhdGNoCkBAIC0wLDAg
KzEsNDAgQEAKK0Zyb20gMzBhOTI3MGEzZmU5MTU3YTUzMmU1MjQ1OGVlNDdiMGYzZmNjMmY5NyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEtvbnN0YW50aW4gVG9rYXJldiA8YW5udWxl
bkB5YW5kZXgucnU+CitEYXRlOiBNb24sIDI3IE1heSAyMDI0IDIzOjIzOjExICswMzAwCitTdWJq
ZWN0OiBbUEFUQ0hdIFNvdXJjZS9XVEYvd3RmL1BsYXRmb3JtLmg6IGZpeCBidWlsZCB3aXRoIG5l
d2VyCisgdmVyc2lvbnMgb2YgSUNVCisKK1BhcnRpYWwgYmFja3BvcnQgb2YgcjI2MDU1NCAoNzlm
ZTE5Y2FmKQorCitJbiBwYXJ0aWN1bGFyLCB3ZSBuZWVkIC1EVV9TSE9XX0NQTFVTUExVU19BUEk9
MCB0byBhdm9pZCBjb21waWxhdGlvbgorZXJyb3JzIGluIEMrKyBwYXJ0cyBvZiBJQ1UgaGVhZGVy
cyB3aGljaCB3ZSBhcmUgbm90IHVzaW5nIGFueXdheS4KKworQ2hhbmdlLUlkOiBJYjQ1Yzc0ZTNj
YWFkMTQ4ZmJkNzc4ZDBjMDczMzAxMjdmN2RhYjVlYworVGFrZW4gZnJvbTogaHR0cHM6Ly9naXRo
dWIuY29tL2FyY2hsaW51eC9hdXIvYmxvYi9xdDUtd2Via2l0L3F0NS13ZWJraXQtaWN1NzUucGF0
Y2gKK1Vwc3RyZWFtOiBwYXJ0IG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9xdHdlYmtpdC9xdHdlYmtp
dC9jb21taXQvNzlmZTE5Y2FmCitTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgorLS0tCisgU291cmNlL1dURi93dGYvUGxhdGZvcm0u
aCB8IDcgKysrKysrKworIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKKworZGlmZiAt
LWdpdCBhL1NvdXJjZS9XVEYvd3RmL1BsYXRmb3JtLmggYi9Tb3VyY2UvV1RGL3d0Zi9QbGF0Zm9y
bS5oCitpbmRleCA1NzE3ZjNlYTE2NjQuLmRmZWQ0YTEzZGQyYiAxMDA2NDQKKy0tLSBhL1NvdXJj
ZS9XVEYvd3RmL1BsYXRmb3JtLmgKKysrKyBiL1NvdXJjZS9XVEYvd3RmL1BsYXRmb3JtLmgKK0BA
IC0xMTI1LDYgKzExMjUsMTMgQEAKKyAjZGVmaW5lIEVOQUJMRV9QTEFURk9STV9GT05UX0xPT0tV
UCAxCisgI2VuZGlmCisgCisrLyogRklYTUU6IFRoaXMgZG9lcyBub3QgYmVsb25nIGluIFBsYXRm
b3JtLmggYW5kIHNob3VsZCBpbnN0ZWFkIGJlIGluY2x1ZGVkIGluIGFub3RoZXIgbWVjaGFuaXNt
IChjb21waWxlciBvcHRpb24sIHByZWZpeCBoZWFkZXIsIGNvbmZpZy5oLCBldGMpICovCisrLyog
SUNVIGNvbmZpZ3VyYXRpb24uIFNvbWUgb2YgdGhlc2UgbWF0Y2ggSUNVIGRlZmF1bHRzIG9uIHNv
bWUgcGxhdGZvcm1zLCBidXQgd2Ugd291bGQgbGlrZSB0aGVtIGNvbnNpc3RlbnRseSBzZXQgZXZl
cnl3aGVyZSB3ZSBidWlsZCBXZWJLaXQuICovCisrI2RlZmluZSBVX1NIT1dfQ1BMVVNQTFVTX0FQ
SSAwCisrI2lmZGVmIF9fY3BsdXNwbHVzCisrI2RlZmluZSBVQ0hBUl9UWVBFIGNoYXIxNl90Cisr
I2VuZGlmCisrCisgI2lmIENPTVBJTEVSKE1TVkMpCisgI3VuZGVmIF9fU1REQ19MSU1JVF9NQUNS
T1MKKyAjZGVmaW5lIF9fU1REQ19MSU1JVF9NQUNST1MKKy0tIAorMi41Mi4wCisKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC8wMDExLURpc2FibGUtSUNVLUMtaGVhZGVyLW9ubHkt
QVBJcy1pbnRyb2R1Y2VkLWluLUlDVS03Ni5wYXRjaCBiL3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC8w
MDExLURpc2FibGUtSUNVLUMtaGVhZGVyLW9ubHktQVBJcy1pbnRyb2R1Y2VkLWluLUlDVS03Ni5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xN2RmYzdlN2UwCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMTEtRGlzYWJsZS1JQ1Ut
Qy1oZWFkZXItb25seS1BUElzLWludHJvZHVjZWQtaW4tSUNVLTc2LnBhdGNoCkBAIC0wLDAgKzEs
MjggQEAKK0Zyb20gYmYyNTNiMzdlYmYzZmQ5OWZhM2NjNDZiZDczN2E4OGRlZmE4OTE0ZSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IERtaXRyeSBTaGFjaG5ldiA8bWl0eWE1N0BnbWFp
bC5jb20+CitEYXRlOiBUaHUsIDkgSmFuIDIwMjUgMTQ6MTg6MzEgKzAzMDAKK1N1YmplY3Q6IFtQ
QVRDSF0gRGlzYWJsZSBJQ1UgQysrIGhlYWRlci1vbmx5IEFQSXMsIGludHJvZHVjZWQgaW4gSUNV
IDc2CisKK1RoZXkgcmVxdWlyZSBDKysxNyB3aGljaCB3ZSBkbyBub3QgaGF2ZSwgYnV0IHdlIGRv
IG5vdCBuZWVkIHRoZW0gYW55d2F5LgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3F0
d2Via2l0L3F0d2Via2l0L3B1bGwvMTEwNworU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KKy0tLQorIFNvdXJjZS9XVEYvd3RmL1Bs
YXRmb3JtLmggfCAxICsKKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKKworZGlmZiAt
LWdpdCBhL1NvdXJjZS9XVEYvd3RmL1BsYXRmb3JtLmggYi9Tb3VyY2UvV1RGL3d0Zi9QbGF0Zm9y
bS5oCitpbmRleCBkZmVkNGExM2RkMmIuLjZiYTZjMzk3MmFlZSAxMDA2NDQKKy0tLSBhL1NvdXJj
ZS9XVEYvd3RmL1BsYXRmb3JtLmgKKysrKyBiL1NvdXJjZS9XVEYvd3RmL1BsYXRmb3JtLmgKK0BA
IC0xMTI4LDYgKzExMjgsNyBAQAorIC8qIEZJWE1FOiBUaGlzIGRvZXMgbm90IGJlbG9uZyBpbiBQ
bGF0Zm9ybS5oIGFuZCBzaG91bGQgaW5zdGVhZCBiZSBpbmNsdWRlZCBpbiBhbm90aGVyIG1lY2hh
bmlzbSAoY29tcGlsZXIgb3B0aW9uLCBwcmVmaXggaGVhZGVyLCBjb25maWcuaCwgZXRjKSAqLwor
IC8qIElDVSBjb25maWd1cmF0aW9uLiBTb21lIG9mIHRoZXNlIG1hdGNoIElDVSBkZWZhdWx0cyBv
biBzb21lIHBsYXRmb3JtcywgYnV0IHdlIHdvdWxkIGxpa2UgdGhlbSBjb25zaXN0ZW50bHkgc2V0
IGV2ZXJ5d2hlcmUgd2UgYnVpbGQgV2ViS2l0LiAqLworICNkZWZpbmUgVV9TSE9XX0NQTFVTUExV
U19BUEkgMAorKyNkZWZpbmUgVV9TSE9XX0NQTFVTUExVU19IRUFERVJfQVBJIDAKKyAjaWZkZWYg
X19jcGx1c3BsdXMKKyAjZGVmaW5lIFVDSEFSX1RZUEUgY2hhcjE2X3QKKyAjZW5kaWYKKy0tIAor
Mi41Mi4wCisKLS0gCjIuNTIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
