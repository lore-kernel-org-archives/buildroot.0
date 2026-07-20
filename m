Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B387BC44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 08:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32843403CE;
	Mon, 20 Jul 2026 08:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcQuV3rS9GvR; Mon, 20 Jul 2026 08:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04BE2403FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784537784;
	bh=2l8NYQ7hnU2hXOZAZ03olgRDiT+XmlXCUjvpLfOKEfo=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Rn3a7FhpegLztvrJW4jpQoU1brwtTsn1SjZHzY188QRBYgmzykxodkLKvpul7Bw2p
	 KCXcXr+tWD77OBuYiRvFMkQTMVYSQ/R4skGGqMAP5qY/wCvDMpC1CAfpB6tRUoRyja
	 C8nqZ0CND3xCMWDMDUW8xCLuvjZ4qF15onF+wZtxaByhmgf70VtlnYImY/ma3RGY85
	 VXD9G9QUbUD0KR7Ox2PrqUtRVbAsdOzJKl/yU5mSg6lZFxsKaTB9m32E1JiiJhMcQw
	 2ks/ideG6rXUZDkzCXv3yh0benFphmx4bLCorKQscLNW95VirYDc8+xGpV7HF+x6Or
	 rgfYHnC3tQzLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04BE2403FF;
	Mon, 20 Jul 2026 08:56:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CF1F206
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 08:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E57C403FF
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 08:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OaC9alDZ14g for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 08:56:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47752403CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47752403CE
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47752403CE
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 08:56:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 03F624E40E5B;
 Mon, 20 Jul 2026 08:56:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC97B60360;
 Mon, 20 Jul 2026 08:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 940A411BD0A03; 
 Mon, 20 Jul 2026 10:56:16 +0200 (CEST)
Date: Mon, 20 Jul 2026 10:56:15 +0200
MIME-Version: 1.0
Message-Id: <20260720-python-scp-update-v1-1-e88245777950@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJaUDRqxgWMB1lXJSm0xoJ4
 e4UWb7F/ysoR2GFR7VC5K+ozL6gvlRA0+DfjOKKwRp7NTdrMCxpmj0qBczBDYmRqG7aznWtuRO
 ULkR+ye//fPanNY8fpnSMYNt2e8rux3UAAAA=
X-Change-ID: 20260720-python-scp-update-cc1458d8509c
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1784537777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=mtqLc0fuonlbH0BYt/qYbBJNqpDHnd1MrGAUPR8osXY=;
 b=PoNeT7sS7nQZUh8aikNh/tLs0JEK1om1dKetP6gPBf8zuJ3BIcwR0fyy+YdzGmI/jtbh4C
 i4BIQ9uQHoaVovuussepOYiYtWP0+X1ZIaQOM4ZYdV3bKB9UeQIE+a2vj9XwoSAdnbiDef
 ipSG0CnNnEr37rXR0FlvXokAMRbXuf+vAhudHgc8McD94GpNM5qGjtb8UiZjEGGhjzdy0r
 l+HxOrVsYyY8MolVxl3yIZ0ru3oN2DdLpNvTWQvHDgULHCLO3i8pMChOYgVGZDW4PS0lb3
 XLvzp/27/wjWiK6T0mOabX8eIS1bINX7w0u29ZBYchAXqX20Pwwt04KYXoEw3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PoNeT7sS
Subject: [Buildroot] [PATCH] package/python-scp: bump version to 0.16.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nIHVwZGF0ZToKaHR0cHM6Ly9naXRodWIuY29tL2piYXJkaW4vc2NwLnB5L2NvbW1p
dC82OWU1MDQwY2RmMGIzZDE1ZDdmMmE2MmUxMDI0N2IwMDVjOTE1NzE0CgpTaWduZWQtb2ZmLWJ5
OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIHBhY2th
Z2UvcHl0aG9uLXNjcC9weXRob24tc2NwLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvcHl0aG9uLXNj
cC9weXRob24tc2NwLm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRo
b24tc2NwLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1zY3AvcHl0aG9uLXNjcC5oYXNoCmluZGV4IDRl
YzRlNmE0MWE0ZC4uZTc5YzRlZjRhMzdiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1zY3Av
cHl0aG9uLXNjcC5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLmhhc2gK
QEAgLTEsNSArMSw1IEBACiAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBp
L3NjcC9qc29uCi1tZDUgIDU0YzBlM2I2Y2M1MjYyMGNlM2E4MTM2MmZhOGJiMjlkICBzY3AtMC4x
NS4wLnRhci5negotc2hhMjU2ICBmMWIyMmU5OTMyMTIzY2NmMTdlZWJmMTllMDk1M2M2ZTkxNDhm
NTg5ZjkzZDkxYjg3Mjk0MWE2OTYzMDVjODNmICBzY3AtMC4xNS4wLnRhci5negorbWQ1ICBhNzJl
ZGQyY2RjMGZlNmUxNGQ5MDkyMDY1ZjA0YmZlMCAgc2NwLTAuMTYuMC50YXIuZ3oKK3NoYTI1NiAg
MTc2M2E0YjhhYzQyNGVhMGMzMDRmNThiOTVhNGE0YTUxZDUwM2E4MzRlZDc3YjRlODlmMWEzMmIz
MGNiZTY2MiAgc2NwLTAuMTYuMC50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hl
Y2tzdW1zCiBzaGEyNTYgIDI0NTVjZjBmYzc4ZTEzNzcyYmYxMGVmNWYyMDllN2ViODYyNTcwNmQ2
NzFiMmY0MjBjYzhhZGQzN2Q1NDhjMWMgIExJQ0VOU0UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1zY3AvcHl0aG9uLXNjcC5tayBiL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2Nw
Lm1rCmluZGV4IGQyMjNiMTYyOTA3Ni4uYTRiZTIzZmI1MTUwIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zY3AvcHl0aG9uLXNjcC5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zY3AvcHl0aG9u
LXNjcC5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVBZ
VEhPTl9TQ1BfVkVSU0lPTiA9IDAuMTUuMAorUFlUSE9OX1NDUF9WRVJTSU9OID0gMC4xNi4wCiBQ
WVRIT05fU0NQX1NPVVJDRSA9IHNjcC0kKFBZVEhPTl9TQ1BfVkVSU0lPTikudGFyLmd6Ci1QWVRI
T05fU0NQX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZDYv
MWMvZDIxM2UxYzY2NTFkMGJkMzc2MzZiMjFiMWJhOWI4OTVmMjc2ZTgwNTdmODgyYzlmOTQ0OTMx
ZTRmMDAyCitQWVRIT05fU0NQX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvN2YvZTEvMzQ2MzRhODlmMTAwZmNmNGYwMTRhY2E2NTYyMWU3MDFjNWI5MDUzY2Vj
NjJiNjM4Njg2NmUzZjAxNWQ1CiBQWVRIT05fU0NQX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCiBQ
WVRIT05fU0NQX0xJQ0VOU0UgPSBMR1BMLTIuMSsKIFBZVEhPTl9TQ1BfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UudHh0CgotLS0KYmFzZS1jb21taXQ6IGJmODg4MGIzNTRmZWM4MTkxZDY0ZWJmYzhj
M2FiOTdlMzgzOGY1NjAKY2hhbmdlLWlkOiAyMDI2MDcyMC1weXRob24tc2NwLXVwZGF0ZS1jYzE0
NThkODUwOWMKCkJlc3QgcmVnYXJkcywKLS0gIApBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Ro
b3JlQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
