Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5B9CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 11:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A146F4AB;
	Tue, 16 Jun 2026 11:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HC-L1W_08Du8; Tue, 16 Jun 2026 11:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1286F4A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781609738;
	bh=VtDrs9mRsCd7qsDiXz0HkYINWRrSCIKUIeqhZEm/k+U=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=P9cMp8/TmutnulcpGmDqKRszrEhJCS8RED5B41e0GdHDKXHGsjgW+aNVfJ6nrjzOx
	 z9MdlFtip3yByEPbR7gJ6A7kdVZuT2+bOXK81Ctvn2nbarYS3dCil1ikQ8YOyDwxgo
	 HyofM8d/ZybM3ROok4T2PiEctU3GLfs2njhbGq7qTchTORiB3zSc6+mKGjSznBHvE5
	 uHoHMO8sBVqcq61YbQub4jrw1M9hHBCWt5j5kU9GktTPwyI5Eco7A2j8tTZb0JWUU0
	 IaWtawpO9qLET3M7Ayci0tU8FNlUsgwkKQG6gngnU40zg6rCHoAfMJLtj4/bQTFnQj
	 HM60r7Wug6Dtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1286F4A5;
	Tue, 16 Jun 2026 11:35:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3CB52B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 11:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3AB6F4AB
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 11:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2fC7Qlrx_6z for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 11:35:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8BE06F4A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8BE06F4A1
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8BE06F4A1
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 11:35:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2F98B1A394E
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 11:35:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EA0AE601A9
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 11:35:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A955B106C9CC8; 
 Tue, 16 Jun 2026 13:35:29 +0200 (CEST)
Date: Tue, 16 Jun 2026 13:35:20 +0200
MIME-Version: 1.0
Message-Id: <20260616-fix_openscap-v1-1-e02d43887309@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Mz3bTMivj8gtS84uTEAl0TQ4NUY0vzNHMjU3MloJaColSgPNi46Fg
 Iv7g0KSs1uQRkhlJtLQAVyWnAcAAAAA==
X-Change-ID: 20260616-fix_openscap-410e397f7257
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1781609731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=+lu1UQadLzwFZq7HhS/7lmWbcwXKa1VIYWm5LvV8bp8=;
 b=yJ8Cb5hHtP3e+jbhMsMRNOPI8NcN0Bsi4+6aW5fqI87MPnXwhc2tiNZ/GOmrTENpSnTvxZ
 rdVUmVTh0OX0RjpOBsXnf/SmtP1saTWj41lmpz18MMcw7k6FdqjLp6fIOrkyIFmoQBNOnG
 YJIcm7imP6C/+CuNhhQf6tr9HJAsJJePlMK2pMD5aQjeYiZsCCryGbGv2gbD8iyiQrzas6
 FtOj2qt00ptTf93xMBEhwLTKcD54QIIyJ1WeIBPKsDKGNNbZCD8fDHAECrijOn8TlnqS7r
 yueXuhdHPfzeMDHDhxcc/uKlzn55XTkC/8FvKn0+oL5KdBzCxhk6FrH3QO4+3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yJ8Cb5hH
Subject: [Buildroot] [PATCH] package: openscap: fix build failure when
 crypto backend is not gcrypt
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

V2hlbiBlbmFibGluZyB0aGUgb3BlbnNjYXAgcGFja2FnZSBhbmQgdGhlIGxpYm5zcyBsaWJyYXJ5
IF9idXQgbm90XwpsaWJnY3J5cHQsIHRoZSBidWlsZCBjYW4gZmFpbCBvbiB0aGUgZm9sbG93aW5n
IGVycm9yOgoKICAuLi9zcmMvbGlib3BlbnNjYXAuc28uMzMuMS4zOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBjcmFwaV9pbml0JwoKVGhlIGlzc3VlIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IHRo
ZSBjb3JyZXNwb25kaW5nIE1ha2VmaWxlCnN5c3RlbWF0aWNhbGx5IGZvcmNlcyAtRFdJVEhfQ1JZ
UFRPPWdjcnlwdDogb3BlbnNjYXAgQ01ha2UKaW5zdHJ1bWVudGF0aW9uIHRoZW4gc2VhcmNoZXMg
b25seSB0aGlzIGJhY2tlbmQsIGZhaWxzIHRvIGZpbmQgaXQsCmFzc3VtZXMgdGhhdCBubyBjcnlw
dG8gYmFja2VuZCBpcyBhdmFpbGFibGUsIGFuZCBzbyBkb2VzIG5vdCBpbmNsdWRlIHRoZQpjcmFw
aV9vYmplY3QgaW4gdGhlIGZpbmFsIGxpbmsgc3RlcC4KCkNvbW1pdCA3Yzg1ZjNhZGY0YTggKCJw
YWNrYWdlL29wZW5zY2FwOiBuZXcgcGFja2FnZSIpIHRvb2sgaW50byBhY2NvdW50CnRoZSBmYWN0
IHRoYXQgb3BlbnNjYXAgaXNuJ3QgYWN0dWFsbHkgYWJsZSB0byBidWlsZCBpZiBubyBjcnlwdG8g
YmFja2VuZAppcyBwcm92aWRlZCAoc2VlIFswXSksIGFuZCBzbyBtYWRlIHN1cmUgdG8gZm9yY2Ug
bGliZ2NyeXB0IGluY2x1c2lvbiBpZgpsaWJuc3MgaXMgbm90IGluY2x1ZGVkLgoKUmVwbGljYXRl
IHRoaXMgZmFsbGJhY2sgbWVjaGFuaXNtIGluIHRoZSBtYWtlZmlsZSB0byBtYWtlIHN1cmUgdGhh
dCB0aGUKY29ycmVjdCBiYWNrZW5kIGlzIHNlbGVjdGVkLgoKWzBdIGh0dHBzOi8vZ2l0aHViLmNv
bS9PcGVuU0NBUC9vcGVuc2NhcC9pc3N1ZXMvMjMxMAoKRml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zMWQyNmQ5NDY5YzBkMDJjNThiMzIwODVmMzcwNDNlNzUy
YjdkY2E0LwpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJv
b3RsaW4uY29tPgotLS0KIHBhY2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAubWsgfCA5ICsrKystLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL29wZW5zY2FwL29wZW5zY2FwLm1rIGIvcGFja2FnZS9vcGVuc2NhcC9v
cGVuc2NhcC5tawppbmRleCA3ZGEzOGRmMzQ1YjQuLjE2ZTM2NzgyNzFiNSAxMDA2NDQKLS0tIGEv
cGFja2FnZS9vcGVuc2NhcC9vcGVuc2NhcC5taworKysgYi9wYWNrYWdlL29wZW5zY2FwL29wZW5z
Y2FwLm1rCkBAIC0zNiw3ICszNiw2IEBAIE9QRU5TQ0FQX0NPTkZfT1BUUyA9IFwKIAktREVOQUJM
RV9PU0NBUF9VVElMX1ZNPU9GRiBcCiAJLURFTkFCTEVfUFJPQkVTX1dJTkRPV1M9T0ZGIFwKIAkt
REVOQUJMRV9URVNUUz1PRkYgXAotCS1EV0lUSF9DUllQVE89Z2NyeXB0IFwKIAktREVOQUJMRV9Q
WVRIT04zPU9GRgogCiBIT1NUX09QRU5TQ0FQX0NPTkZfT1BUUyA9IFwKQEAgLTU4LDEyICs1Nywx
MiBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQkNBUCkseSkKIE9QRU5TQ0FQX0RFUEVOREVOQ0lF
UyArPSBsaWJjYXAKIGVuZGlmCiAKLWlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCR0NSWVBUKSx5KQot
T1BFTlNDQVBfREVQRU5ERU5DSUVTICs9IGxpYmdjcnlwdAotZW5kaWYKLQogaWZlcSAoJChCUjJf
UEFDS0FHRV9MSUJOU1MpLHkpCiBPUEVOU0NBUF9ERVBFTkRFTkNJRVMgKz0gbGlibnNzCitPUEVO
U0NBUF9DT05GX09QVFMgKz0gLURXSVRIX0NSWVBUTz1uc3MKK2Vsc2UKK09QRU5TQ0FQX0RFUEVO
REVOQ0lFUyArPSBsaWJnY3J5cHQKK09QRU5TQ0FQX0NPTkZfT1BUUyArPSAtRFdJVEhfQ1JZUFRP
PWdjcnlwdAogZW5kaWYKIAogaWZuZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDKSx5KQoK
LS0tCmJhc2UtY29tbWl0OiBjYmU4NjdiODk1ZDE5ODYxY2Q4MDljOTUzZjg4YzU3NmYyMDczMjIz
CmNoYW5nZS1pZDogMjAyNjA2MTYtZml4X29wZW5zY2FwLTQxMGUzOTdmNzI1NwoKQmVzdCByZWdh
cmRzLAotLSAgCkFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
