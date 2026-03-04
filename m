Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFD3EB7EA6
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 08:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 459A7810EB;
	Wed,  4 Mar 2026 08:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCpd3IGjB1Gl; Wed,  4 Mar 2026 08:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E93D881323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772612575;
	bh=urP9C2AQrU5sjDn255kuxoIx0JWMtswxgDIpyZcHzB4=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OZIZfoTuDRgA1oP/DHGKUA/V1U0ZLHDY1CE4d816NID7IvyuTCG2K3vbY6nwJpgU2
	 HecFB0Isx8tP7oBQ6jsC9/De7hldfmPy1cFupEEFJk3QhnXReUxHagEQdyZsZ2T3sk
	 +zY3drS0bSJrlwFKHl8h22RsN44rZIBK1zr8LT9IluXIp1QWt73JAFMiTxKHYcf7Ub
	 LHMMDFCt1n3IqV3dypdCl3Byh0CT/zFPJ0EhKvUC5GGCDapMOOW5cNCUmu4QZzrXio
	 9dRz8Z/KR99B2+VFO3oOBXmKxqiWH+kaUncJKhbNVp5yNAsplDkHkPyXIb+KwX27PM
	 m+aq2zYFADvWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E93D881323;
	Wed,  4 Mar 2026 08:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2853925B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 187F660689
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CagCx9Q8y7t for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 08:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A8F46068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A8F46068A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A8F46068A
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F22574E42531
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CA4AE5FF5C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4FADA103696F6; Wed,  4 Mar 2026 09:22:46 +0100 (CET)
Date: Wed, 04 Mar 2026 09:22:39 +0100
MIME-Version: 1.0
Message-Id: <20260304-openscap_nptl_threads-v1-1-9dff92cc37e0@bootlin.com>
References: <20260304-openscap_nptl_threads-v1-0-9dff92cc37e0@bootlin.com>
In-Reply-To: <20260304-openscap_nptl_threads-v1-0-9dff92cc37e0@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772612566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ebiBMX4OqhZnoJfmf8KmtEBLPXVAYyEIakbwdiF3Umc=;
 b=K/VWsYs8SVGXcOVZhr85Y0jZoY4VNlJm+obTrSgxXoQ9Xpk6aGq4Q5Tjq0j+FGJ7T4lVlU
 cTGq37gF7AxUFJWj0Buv07zzLxQTkoFO9lOIiRFqBgixg1+H702CLoxJuPgRTCU/jJqNY3
 ECdccFGUV+7LLn/hbkeuPZJAiAROzPbi5v7u40aJFoKD3nBsKrhXxzdje9MmdK3CUnra7j
 1MVE2tHS64OgrbtG0YAaAL0dMyQRGmh8AN2jLJYR+/SxvkhWADbUPy+nS3l7FIME+8yDLN
 +EE55bMgH3kB1QsnPxpNDuPKBl8AYyYgYYZAzzpYat8T4K1hJ/wxEsUWzq+bQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=K/VWsYs8
Subject: [Buildroot] [PATCH 1/2] package/openscap: fix dependencies doc
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

VGhlIGNvbW1lbnQgZGlzcGxheWVkIGluIG1lbnVjb25maWcgZm9yIG9wZW5zY2FwIHdoZW4gd2Ug
YXJlIGxhY2tpbmcKZGVwZW5kZW5jaWVzIGlzIGN1cnJlbnRseSBicm9rZW46IGl0IHNob3VsZCBi
ZSBhbiBvciBvZiBpbnZlcnRlZApleHBlY3RlZCB2YWx1ZXMuCgpVcGRhdGUgdGhlIGNvbW1lbnQg
Zm9yIG9wZW5zY2FwIHdoZW4gaXQgaXMgbWlzc2luZyBzb21lIGRlcGVuZGVuY3kuCgpTaWduZWQt
b2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0K
IHBhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmluIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5z
Y2FwL0NvbmZpZy5pbiBiL3BhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmluCmluZGV4IDMxNzA1NWM3
NTMyNy4uYjVmODA5MzE1YzkxIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5p
bgorKysgYi9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgpAQCAtMTksNiArMTksNSBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfT1BFTlNDQVAKIAkgIGh0dHBzOi8vd3d3Lm9wZW4tc2NhcC5vcmcvCiAJ
ICBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNjYXAKIAotY29tbWVudCAib3BlbnNj
YXAgbmVlZHMgYSB0b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJ5IgotCWRlcGVuZHMgb24gQlIy
X1BBQ0tBR0VfTElCR1BHX0VSUk9SX0FSQ0hfU1VQUE9SVFMKLQlkZXBlbmRzIG9uIEJSMl9TVEFU
SUNfTElCUworY29tbWVudCAib3BlbnNjYXAgbmVlZHMgbGliZ3BnLWVycm9yIGFuZCBhIHRvb2xj
aGFpbiB3LyBkeW5hbWljIGxpYnJhcnkiCisJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfTElCR1BH
X0VSUk9SX0FSQ0hfU1VQUE9SVFMgfHwgQlIyX1NUQVRJQ19MSUJTCgotLSAKMi41My4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
