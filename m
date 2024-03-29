Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880BEC6FD1F
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 14:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB2741716;
	Fri, 29 Mar 2024 14:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_i28RRYNNbR; Fri, 29 Mar 2024 14:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B9241731
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B9241731;
	Fri, 29 Mar 2024 14:39:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A54961BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 14:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A055040391
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwFImRgWVpus for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 14:39:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1F4F40167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1F4F40167
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1F4F40167
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 14:39:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 17CA3C3E89
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 14:33:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A197240002;
 Fri, 29 Mar 2024 14:33:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Mar 2024 15:31:36 +0100
Message-ID: <20240329143138.214780-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240329143138.214780-1-alexis.lothore@bootlin.com>
References: <20240329143138.214780-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711722781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fn6NrU+BB5k8IwxYy/oGMyKEGt6CAu8M62HVK+mRxcA=;
 b=ZLAYL0BM/Vl2ZMycV1+888y8X5lWx+N6NtDWENdF4TRrL4v/sGVt2ERzlxh7YtHPt0o8Y6
 wsWyHXdv/8H6vYXx0nzKvl/E1FtkSHM/1pQMzktPOemc3Wby2byDMzsou27shbTLYpz3og
 KD++aLNMFQX8DRsSv1YO5r1h1m88J9zCVer7EaicZq82uCmdSHfWvHQ3UT6E47HvwEQ6uH
 FoC05GzUbNYnUxGLLuvpABxyT/zVWm6SXGHGaXCtlGIg7t6EiVMXsQdZ0Gi92jBhMpiGeP
 SGCelcD7wtNtZ4l1b9VsOyB54p3a5yKrOtaD2C8cwD06hn0SweNeJgdbwKmYvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZLAYL0BM
Subject: [Buildroot] [PATCH 1/3] package/pppd: revert lock path
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCnBwcGQg
ZmFpbHMgdG8gc3RhcnQgb24gYnVpbGRyb290IDIwMjQuMDIsIGJlY2F1c2Ugb2Ygbm9uLWV4aXN0
aW5nIGRpcmVjdG9yeQpwcHBkIGluIC92YXIvcnVuCgpVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIu
Y29tL3BwcC1wcm9qZWN0L3BwcC9jb21taXQvOTljYmY1ZTI2OTk5NDQ4MmVkYWY2NDYyNGJlOGIx
YzgwNmY5NTg3YwpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3Jl
QGJvb3RsaW4uY29tPgotLS0KQmFja3BvcnQgdG86IDIwMjQuMDIueAotLS0KIC4uLjAwNS1SZXZl
cnQtbG9jay1wYXRoLXRvLXZhci1sb2NrLTQzNS5wYXRjaCB8IDY0ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9wcHBkLzAwMDUtUmV2ZXJ0LWxvY2stcGF0aC10by12YXItbG9jay00MzUucGF0Y2gK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3BwcGQvMDAwNS1SZXZlcnQtbG9jay1wYXRoLXRvLXZhci1s
b2NrLTQzNS5wYXRjaCBiL3BhY2thZ2UvcHBwZC8wMDA1LVJldmVydC1sb2NrLXBhdGgtdG8tdmFy
LWxvY2stNDM1LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
YmJmZjg4NGYyMTEzCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9wcHBkLzAwMDUtUmV2ZXJ0
LWxvY2stcGF0aC10by12YXItbG9jay00MzUucGF0Y2gKQEAgLTAsMCArMSw2NCBAQAorRnJvbSA5
OWNiZjVlMjY5OTk0NDgyZWRhZjY0NjI0YmU4YjFjODA2Zjk1ODdjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP0FsZXhpcz0yMExvdGhvcj1DMz1BOT89IDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4KK0RhdGU6IFR1ZSwgMTAgT2N0IDIwMjMgMTA6MDU6NTAgKzA5
MDAKK1N1YmplY3Q6IFtQQVRDSCAxLzNdIFJldmVydCBsb2NrIHBhdGggdG8gL3Zhci9sb2NrICgj
NDM1KQorCitGcm9tOiBEb21pbmlxdWUgTWFydGluZXQgPGFzbWFkZXVzQGNvZGV3cmVjay5vcmc+
CisKK2xvY2sgZGlyIGNoYW5nZWQgb24gbGludXggZnJvbSAvdmFyL2xvY2sgdG8gL3J1bi9wcHBk
L2xvY2sgd2l0aAorcHBwZC0yLjUuMCwgd2hpY2ggbWFrZXMgcHBwZCBmYWlsIHRvIHN0YXJ0IGlm
IHRoZSBkaXN0cmlidXRpb24gZG9lcyBub3QKK3ByZS1jcmVhdGUgdGhlIGRpcmVjdG9yeS4KKwor
VGhpcyByZXZlcnRzIGl0IGJhY2sgdG8gL3Zhci9sb2NrLgorCitUaGUgcGF0aHMgZm9yIG90aGVy
IE9TIHNob3VsZCBiZSBpZGVudGljYWwgYXMgTE9DQUxTVEFURURJUiBzaG91bGQgYmUKKy92YXIs
IGJ1dCBhbHNvIHJldmVydCB0aGVtIGJhY2sgYXMgd2VsbCBqdXN0IGluIGNhc2UuCitTaW5jZSB0
aGUgdmFyaWFibGUgaXMgbm8gbG9uZ2VyIHVzZWQgcmVtb3ZlIGl0IGZyb20gbWFrZWZpbGVzLgor
CitGaXhlczogNjZhOGM3NGMzZjczICgiTGV0IC4vY29uZmlndXJlIGNvbnRyb2wgdGhlIHBhdGhz
IGZvciBwcHBkIikKK0ZpeGVzOiAjNDE5CisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20v
cHBwLXByb2plY3QvcHBwL2NvbW1pdC85OWNiZjVlMjY5OTk0NDgyZWRhZjY0NjI0YmU4YjFjODA2
Zjk1ODdjCitTaWduZWQtb2ZmLWJ5OiBEb21pbmlxdWUgTWFydGluZXQgPGRvbWluaXF1ZS5tYXJ0
aW5ldEBhdG1hcmstdGVjaG5vLmNvbT4KK0NvLWF1dGhvcmVkLWJ5OiBEb21pbmlxdWUgTWFydGlu
ZXQgPGRvbWluaXF1ZS5tYXJ0aW5ldEBhdG1hcmstdGVjaG5vLmNvbT4KKy0tLQorIHBwcGQvTWFr
ZWZpbGUuYW0gfCAyICstCisgcHBwZC9wYXRobmFtZXMuaCB8IDYgKysrLS0tCisgMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9w
cHBkL01ha2VmaWxlLmFtIGIvcHBwZC9NYWtlZmlsZS5hbQoraW5kZXggZTViZWRmMjZhZjk2Li43
Y2IzMDA1MzMyMmUgMTAwNjQ0CistLS0gYS9wcHBkL01ha2VmaWxlLmFtCisrKysgYi9wcHBkL01h
a2VmaWxlLmFtCitAQCAtODMsNyArODMsNyBAQCBwcHBkX1NPVVJDRVMgPSBcCisgICAgIHVwYXAu
YyBcCisgICAgIHV0aWxzLmMKKyAKKy1wcHBkX0NQUEZMQUdTID0gLURTWVNDT05GRElSPVwiJHtz
eXNjb25mZGlyfVwiIC1ETE9DQUxTVEFURURJUj1cIiR7bG9jYWxzdGF0ZWRpcn1cIiAtRFBQUERf
UlVOVElNRV9ESVI9JyJAUFBQRF9SVU5USU1FX0RJUkAiJyAtRFBQUERfTE9HRklMRV9ESVI9JyJA
UFBQRF9MT0dGSUxFX0RJUkAiJworK3BwcGRfQ1BQRkxBR1MgPSAtRFNZU0NPTkZESVI9XCIke3N5
c2NvbmZkaXJ9XCIgLURQUFBEX1JVTlRJTUVfRElSPSciQFBQUERfUlVOVElNRV9ESVJAIicgLURQ
UFBEX0xPR0ZJTEVfRElSPSciQFBQUERfTE9HRklMRV9ESVJAIicKKyBwcHBkX0xERkxBR1MgPQor
IHBwcGRfTElCUyA9CisgCitkaWZmIC0tZ2l0IGEvcHBwZC9wYXRobmFtZXMuaCBiL3BwcGQvcGF0
aG5hbWVzLmgKK2luZGV4IGRlMmZiNjg4OTAwNS4uMTI2MDlhOTY5NDI5IDEwMDY0NAorLS0tIGEv
cHBwZC9wYXRobmFtZXMuaAorKysrIGIvcHBwZC9wYXRobmFtZXMuaAorQEAgLTEyMCwxMiArMTIw
LDEyIEBACisgI2RlZmluZSBQUFBfUEFUSF9QUFBEQiAgICAgICAgICBQUFBfUEFUSF9WQVJSVU4g
ICIvcHBwZDIudGRiIgorIAorICNpZmRlZiBfX2xpbnV4X18KKy0jZGVmaW5lIFBQUF9QQVRIX0xP
Q0tESVIgICAgICAgIFBQUF9QQVRIX1ZBUlJVTiAgIi9sb2NrIgorKyNkZWZpbmUgUFBQX1BBVEhf
TE9DS0RJUiAgICAgICAgIi92YXIvbG9jayIKKyAjZWxzZQorICNpZmRlZiBTVlI0CistI2RlZmlu
ZSBQUFBfUEFUSF9MT0NLRElSICAgICAgICBMT0NBTFNUQVRFRElSICIvc3Bvb2wvbG9ja3MiCisr
I2RlZmluZSBQUFBfUEFUSF9MT0NLRElSICAgICAgICAiL3Zhci9zcG9vbC9sb2NrcyIKKyAjZWxz
ZQorLSNkZWZpbmUgUFBQX1BBVEhfTE9DS0RJUiAgICAgICAgTE9DQUxTVEFURURJUiAiL3Nwb29s
L2xvY2siCisrI2RlZmluZSBQUFBfUEFUSF9MT0NLRElSICAgICAgICAiL3Zhci9zcG9vbC9sb2Nr
IgorICNlbmRpZgorICNlbmRpZgorIAorLS0gCisyLjQzLjEKKwotLSAKMi40My4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
