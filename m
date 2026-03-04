Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B47DEFCE37
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 089888146C;
	Wed,  4 Mar 2026 19:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzUKACJJ0Bnz; Wed,  4 Mar 2026 19:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 162D58146D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772653777;
	bh=Jj+3qrAwRHV08EckPL7SrLSmUjXSLJYkY3u0hgPSPws=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CscacW49C/4s9UTYn3Y9paVDuEW1GoSbP9dQ7PicjI2+tqeOGg4Iiu4XX9HYBMBav
	 ktjd38MvVl2pxAyy8WTvFuXaOvfCEOULTJw9j/A5MG4n6dhLalvNvX06kMlVl9RgOK
	 crvKgtCMmQWNie8cCQ6XN+aMQswJC+E5Ia3eMdnv3kyocbmUjbjCpOaOO/A9d5qbyq
	 VROUA0QoCmokTtbodB9tcp8f58y7tzZjJ3smmX2S3QZwpnlaRkFmLcHMeJW7SvrGRf
	 kgoqGSDlQn4yYbgaRYQT29emAVX3+v9EuBffZmv2wNXPqGvECy0iYiqQQUkKQ1sMdK
	 HHRz+sXakH8xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162D58146D;
	Wed,  4 Mar 2026 19:49:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EBD4223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7494B404B0
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXaZQLmJkOA2 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9242F40070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9242F40070
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9242F40070
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:49:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6ED191A2CB8
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:49:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E49E5FF5C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:49:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 554EA103696B2; Wed,  4 Mar 2026 20:49:30 +0100 (CET)
Date: Wed, 04 Mar 2026 20:47:02 +0100
MIME-Version: 1.0
Message-Id: <20260304-openscap_nptl_threads-v2-1-9ed3efd98e9b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQrDIBBFrxJmXYtRm5Kueo8SgjFjM5CqqISW4
 N1rc4Eu34P//g4JI2GCW7NDxI0SeVdBnBowi3ZPZDRXBsFFxyVXzAd0yegwupDXMS8R9ZyYkla
 rCZW8dB3UbYho6X10H0PlhVL28XPcbO3P/ituLeOsn63thTHyivw+eZ9XcmfjXzCUUr4PPYmOv
 AAAAA==
X-Change-ID: 20260304-openscap_nptl_threads-43fa4be43566
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772653770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=ItK3a0XefcK7ECic4liQInLEtM4x7hGusfiOnHNQo7E=;
 b=P+GZTuvxgexnHXEXw3qhU/qBoFobuB6s7FqxmYzkv2fbHzLHfHaugQRf6xTcxg4I2Uh8Ak
 yysiyzEgXgaVPk+vv8SI/VO7hbEI2Hh4nPKjP5H+AaSQCHVKSUseivbKc78sA5yASSFZxP
 3LRSivBruR0VqEY56QGtq3YVrbMigZW7DfI2RtFvtSWh07wmNZRX1adnm8QJAUuNEi85S6
 rFTi1mexjWHZn+PDJ7oy/i9E9neNaYKufq2RTpnnbMbNlw3fXJwNXgo+yCbczi24EGrPA6
 pVX115TQ8Zbssw8XGorsxunNFMHSneTdfkcqMOWas4yT0Pwj7fya4BjXtZbiBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=P+GZTuvx
Subject: [Buildroot] [PATCH v2] package/openscap: add dependency on NPTL
 threads
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T3BlbnNjYXAgY29kZSBpcyBjYWxsaW5nIE5QVEwgZnVuY3Rpb25zIHN1Y2ggYXMgcHRocmVhZF9i
YXJyaWVyX3dhaXQsCndoaWNoIGFyZSBub3QgcHJvdmlkZWQgYnkgcHRocmVhZHMuCgpNYWtlIHRo
ZSByZXF1aXJlbWVudCBvbiBOUFRMIHRocmVhZHMgZXhwbGljaXQgYnkgYWRkaW5nIHRoZQpjb3Jy
ZXNwb25kaW5nICBkZXBlbmRlbmN5IGluIG9wZW5zY2FwIENvbmZpZy5pbi4KCkZpeGVzOiBodHRw
czovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMmQ5NDc1YjdjZDJkNDEzYzk5ZDYy
MzNlYmIyMTNiYzkzMmYxZTM5OC8KU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4
aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gZHJvcCBib2d1cyBw
YXRjaCAxLzIsIGFzIG9yaWdpbmFsIENvbmZpZy5pbiB3YXMgZmluZQotIHJlZm9ybWF0IG1pc3Np
bmcgZGVwZW5kZW5jeSBjb21tZW50Ci0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI2MDMwNC1vcGVuc2NhcF9ucHRsX3RocmVhZHMtdjEtMC05ZGZmOTJjYzM3ZTBAYm9v
dGxpbi5jb20KLS0tCiBwYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiB8IDUgKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9vcGVuc2NhcC9Db25maWcuaW4gYi9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgpp
bmRleCAzMTcwNTVjNzUzMjcuLjI1YzM4NWQxNjNjZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcGVu
c2NhcC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9vcGVuc2NhcC9Db25maWcuaW4KQEAgLTIsNiAr
Miw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9PUEVOU0NBUAogCWJvb2wgIm9wZW5zY2FwIgogCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCR1BHX0VSUk9SX0FSQ0hfU1VQUE9SVFMgICMgbGliZ2Ny
eXB0CiAJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgZGxmY24uaAorCWRlcGVuZHMgb24g
QlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEU19OUFRMCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkNV
UkwKIAkjIEluIHRoZW9yeSBzaG91bGQgYnVpbGQgd2l0aG91dCBjcnlwdG8sIGJ1dCBpbiBwcmFj
dGljZSBpdAogCSMgZG9lc24ndDogaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQ0FQL29wZW5zY2Fw
L2lzc3Vlcy8yMzEwCkBAIC0xOSw2ICsyMCw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9PUEVOU0NB
UAogCSAgaHR0cHM6Ly93d3cub3Blbi1zY2FwLm9yZy8KIAkgIGh0dHBzOi8vZ2l0aHViLmNvbS9P
cGVuU0NBUC9vcGVuc2NhcAogCi1jb21tZW50ICJvcGVuc2NhcCBuZWVkcyBhIHRvb2xjaGFpbiB3
LyBkeW5hbWljIGxpYnJhcnkiCitjb21tZW50ICJvcGVuc2NhcCBuZWVkcyBhIHRvb2xjaGFpbiB3
LyBkeW5hbWljIGxpYnJhcnksIE5QVEwiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJHUEdf
RVJST1JfQVJDSF9TVVBQT1JUUwotCWRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJTCisJZGVwZW5k
cyBvbiBCUjJfU1RBVElDX0xJQlMgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTAoK
LS0tCmJhc2UtY29tbWl0OiAzNDZkNjY2N2ZlYmRiZWM5YTNjNTdlNDcwMDlhYjIxZTEyMWI1YjFk
CmNoYW5nZS1pZDogMjAyNjAzMDQtb3BlbnNjYXBfbnB0bF90aHJlYWRzLTQzZmE0YmU0MzU2NgoK
QmVzdCByZWdhcmRzLAotLSAKQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGlu
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
