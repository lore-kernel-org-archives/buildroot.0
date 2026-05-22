Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4814CD5BB3
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 07:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 886034258C;
	Fri, 22 May 2026 07:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOD2uZg7xWAz; Fri, 22 May 2026 07:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97CF4258D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779433841;
	bh=Jj+3qrAwRHV08EckPL7SrLSmUjXSLJYkY3u0hgPSPws=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LSJtL8nZ3Q/V+vlTVy7mm64Ezo7N/OPIzfBWK02ye8UlGOpnN+oIr9rCQpAJ2PWuK
	 8skd89E8/u04angowywijOvewj1P3ogwy34acwSUyRABEOX9M/MXv4sPAdezLacPwy
	 fk2VaZl79RQyH1if3PhqBUuokrwyvoL6ERrLB5Yf4FKsjhEyWXZMLi4OChY6WJ1A0l
	 EHeO7wYTtP1FyKO6BqRLYpO/ZTPp6ZKS8a/Jfn9Ixw+wzSxX9z+BjdWztjevhQRns1
	 lojCKSex87hRlUa4DRZZyf+IJxW3TX8jhvDzg/j3OQtwaPHBsCTMfopf5BshOquv56
	 IUWUUmNN8MuwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B97CF4258D;
	Fri, 22 May 2026 07:10:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F913B9
 for <buildroot@buildroot.org>; Fri, 22 May 2026 07:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E887041DAB
 for <buildroot@buildroot.org>; Fri, 22 May 2026 07:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2_YtfBbRQnL for <buildroot@buildroot.org>;
 Fri, 22 May 2026 07:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1697140457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1697140457
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1697140457
 for <buildroot@buildroot.org>; Fri, 22 May 2026 07:10:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B40974E42D29
 for <buildroot@buildroot.org>; Fri, 22 May 2026 07:10:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8553860732
 for <buildroot@buildroot.org>; Fri, 22 May 2026 07:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A7205107E8C9C; 
 Fri, 22 May 2026 09:10:32 +0200 (CEST)
Date: Fri, 22 May 2026 09:10:24 +0200
MIME-Version: 1.0
Message-Id: <20260522-openscap_nptl_threads-v2-1-cb06d4d208da@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1779433835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=ItK3a0XefcK7ECic4liQInLEtM4x7hGusfiOnHNQo7E=;
 b=gws9WgxmlCjey5G2aCD68MWldbPQIsVTs4PucHabzExaUy0+6nCW9C8Uu4xns9SKslMF5Q
 yE+Tll0KDUw4bPdEpD6d+51tmwwIjffHDtZs+Wjj0aXVi/DQQAYc7uR1/qCKcPvac17EWl
 jESkSV8qCd2oHF+lVYU2iOLBp592jpJflpcw/0CEH4/T/6HNvZ2AF6drBBv2QiQxjRIVDt
 S9gLoXEpF3xA8HvWsWErO5sQWkpqZDa+bky7xnhMEQkSxocYDU5s1wnBXRLrzv226TInyk
 n90w3UUeQ9zy/I560bYZ1wu/XZGG6wQD0YUG+CPJEg03F8iKjMMUvJ6EAILR1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gws9Wgxm
Subject: [Buildroot] [PATCH RESEND v2] package/openscap: add dependency on
 NPTL threads
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
