Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EFBD6554F
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 11:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE3160AB8;
	Wed, 17 Dec 2025 11:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLQ6nejJJy99; Wed, 17 Dec 2025 11:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C6FD60906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765972504;
	bh=yOKKgAmZemkF2mmVPp5n9MGaPUvkHY/3uHmALIgsLpo=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NGHi/rtmJbLagPJnXh/RF8YXYDgmOQMOlfdqVATd0rX8yEXoY8eqUgv2gbS+7GZ/B
	 OFveWvfLc0aOO7dLJae0qvI4OG0hSPX7IDHuX63Tann82Uy5lgpKIA9NlNRZj4BEHY
	 5pOmU15T3z7HDFflY7Oi+apZsI4Cp6xG5j8r1Mok1Ps2hqBcxu8NRG7MHB2xCymvJ2
	 Y9mHY/tqk1gm3coA2bmlpPECvQzatoOjPAR3wdkwRqBdTeT+W1xbM3WnCYB8J6kius
	 PuNAF9WQGFAzD8rcBWRtaVcQ1nLiK6e+L0MshCRzMbwH/ZJcPvf2aLLz2hg5wCTErW
	 PqZYt3hww+zdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6FD60906;
	Wed, 17 Dec 2025 11:55:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB0BD372
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 11:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD2EF40A66
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 11:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruYj-31nMPjC for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 11:55:01 +0000 (UTC)
X-Greylist: delayed 2394 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Dec 2025 11:54:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25D2C40774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D2C40774
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.104.224;
 helo=16.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 16.mo550.mail-out.ovh.net (16.mo550.mail-out.ovh.net
 [178.33.104.224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25D2C40774
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 11:54:59 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.110.54.110])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4dWVfy0Mjtz6VJf
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 10:39:54 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-z52g5 (unknown [10.110.168.127])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C09D1802D7;
 Wed, 17 Dec 2025 10:39:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-7d8d68f679-z52g5 with ESMTPSA
 id 8/NhIHmIQmm02gEAcFslug
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 17 Dec 2025 10:39:53 +0000
X-OVh-ClientIp: 90.11.244.6
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 17 Dec 2025 11:39:47 +0100
MIME-Version: 1.0
Message-Id: <20251217-pixman-aarch64-neon-fix-v1-1-3a6aa820097e@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAHKIQmkC/x2MQQqAMAzAviI9W3BDJ/gV8VBnpz3YjQ1EEP/u8
 JhA8kDhLFxgah7IfEmRqBVM24A/SHdG2SqD7exgrBkxyX2SIlH2h+tROSoGudG4wN6t49qFALV
 Omav+z/Pyvh+mx3rFaQAAAA==
X-Change-ID: 20251217-pixman-aarch64-neon-fix-16fec6b7b0ff
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 9833891265196256235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTEcN2QdfHhMmdx5RCiLimgn3LAljbuwLn4YPslzqpBhpHUabSSV87qUlqq8LK1/xcEy1BGcHIhZ38zIF0X8dDmV3bnYMNqOonpux+jnSZn2JJS7eQKQG3fGkgd0f3V5xCISLTOuQa20mhx9UKgQtJ/dARcXD17Qo1LXyBVZIhR0TfyO+AbNL7+ppXAPErdWyWGYSAOwiLLSqQuU3X7r1PXmkKozJiLzcpgnGKw6e4lJZ4BtHa96S8NDTpAR9kL9AeCBW+lCRvTdULd9ZzMica0dLLIkVxeouF28/xmJ+F9oxhhOewQY7SERgpeV+PUkRo8ANlpd830flqbCl71BACfXfUazZ+SuB4ClLqtIo9AmVzu787zdhCGoGTkKLDnfXmhlj5SWiZxrBLDvdVNYI0okC2TfX3QepjospQnwZUTLtsUKuTFz/nt5j8Q8cDN9XeW6NxcrxdcKHdM3tVkNPWicQt0M4dCtb7FOmsEOwzgjrE/KftDlGAcL+XiICJcltlJFtQtAioqeMvpCs59OC3578LNKo4iHV7D7PlB0Cw707FupEH424t5SItnruMZzMAQIjw22e2JAEpMs+lCCMx+21viY/h6uyBsaHYi5FWbzQcAN5NuBem1bhJBMZzsVFvUXXqAjwXfF1A5QhbTXCGue4mqmED3F4kjvYyUcwv2AzQ
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=s8BWEG2ryK56iLUxDkxJpLa6/CZDfC8gEDLcamNY+dQ=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1765967994; v=1;
 b=garSnCTLaitn+CRc07jwugDp0B5GEIVN6uJpQJdTqlBMw9IdjVCnvhniMr/pp1h7j5m0omKm
 fUqebjh7Bnn65LcKJkzrIjH8J2smQdzXaUOhqeHMIjhtExYLMWFS5u4C9mXx02idaocUQ3Tljyi
 oq5c1wcdY/6mFMniCZphx7LsZFngmLPIVSsfrcoA5x+WUd3BnoLaIt6sFtCBeBy5EK7FdcouIfe
 ixEGpIPkkXQNEL416DF9aq/AhZixXfNjDxrbxgCe97+YT0J2msXaX2/8Nx0ZhdzDqLzsljeT2EX
 1ulvoel1Fj8JMwjE60C2iK7rdvuJhsDnbOWEoVuygHKSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=garSnCTL
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005843ff4e8-6fa2-44a0-9fba-629985d5b536,
 4C433822E3DABC298646871AECD04F63782792CD)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH] pixman: fix NEON support on AArch64
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

VGhlIHRlc3QgdG8gZW5hYmxlIE5FT04gb24gQUFyY2g2NCBpcyBhcyBmb2xsb3dpbmc6CgppZmVx
ICgkKEJSMl9hYXJjaDY0KSQoQlIyX0FSTV9DUFVfSEFTX05FT04pLHl5KQoKSXQgY2Fubm90IGJl
IHRvIHRydWUgYXMgJChCUjJfYWFyY2g2NCkgYW5kICQoQlIyX0FSTV9DUFVfSEFTX05FT04pIGFy
ZQptdXR1YWxseSBleGNsdXNpdmUuIE5FT04gaXMgY29tcHVsc29yeSBvbiBBQXJjaDY0IHNvIHJl
bW92ZQokKEJSMl9BUk1fQ1BVX0hBU19ORU9OKSBmcm9tIHRoZSB0ZXN0LgoKKGNoZXJyeSBwaWNr
ZWQgZnJvbSBjb21taXQgMzJmZTQ3MzJjYTQ0MWI3MTM2OWJlMGE1ZTlhYzY5NzBmNDliMGM1NSkK
ClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3BpeG1hbi9waXhtYW4ubWsgYi9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKaW5kZXgg
MWI2NmI0MTcxOTI1Li44N2Q5NzMyMzBmNzggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcGl4bWFuL3Bp
eG1hbi5taworKysgYi9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKQEAgLTY4LDcgKzY4LDcgQEAg
ZWxzZQogUElYTUFOX0NPTkZfT1BUUyArPSAtRG5lb249ZGlzYWJsZWQKIGVuZGlmCiAKLWlmZXEg
KCQoQlIyX2FhcmNoNjQpJChCUjJfQVJNX0NQVV9IQVNfTkVPTikseXkpCitpZmVxICgkKEJSMl9h
YXJjaDY0KSx5KQogUElYTUFOX0NPTkZfT1BUUyArPSAtRGE2NC1uZW9uPWVuYWJsZWQKIGVsc2UK
IFBJWE1BTl9DT05GX09QVFMgKz0gLURhNjQtbmVvbj1kaXNhYmxlZAoKLS0tCmJhc2UtY29tbWl0
OiAxN2Q4MzkyNjAzMmJmYTY5MjkzYjk5NDQ3M2U1OTkxNTlhMGZjOGNiCmNoYW5nZS1pZDogMjAy
NTEyMTctcGl4bWFuLWFhcmNoNjQtbmVvbi1maXgtMTZmZWM2YjdiMGZmCgpCZXN0IHJlZ2FyZHMs
Ci0tIApTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
