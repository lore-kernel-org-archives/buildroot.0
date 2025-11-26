Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA8FD1039D
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E136F817AA;
	Wed, 26 Nov 2025 10:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tfa9dkg5Jdv; Wed, 26 Nov 2025 10:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E9C281498
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9C281498;
	Wed, 26 Nov 2025 10:20:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8B2523F
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFBBC81199
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I18nUrgmf43l for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7373581161
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7373581161
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7373581161
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:20:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 33FF24E418DB;
 Wed, 26 Nov 2025 10:20:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EF9B960721;
 Wed, 26 Nov 2025 10:20:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98987102F08B8; Wed, 26 Nov 2025 11:20:10 +0100 (CET)
Date: Wed, 26 Nov 2025 11:20:08 +0100
Message-Id: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFjUJmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNT3aLE4pTE1Nz8PF3DlDQTSwOTlJS0lFQloPqCotS0zAqwWdGxtbU
 AYwi7y1sAAAA=
X-Change-ID: 20251125-rasdaemon-1df4904ddfde
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764152412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=B8jkh1xe+pAANws+lT5GirKEyHoArmKNBdcsCmeRoF8=;
 b=V+PLM2ghfHsu9tCz82PFqCr9dxJp0smnS/IEA9VoDnREKtKWJYd0y1UzdunL9jDQBcSNGJ
 Ns+zUoAimrqTa9bzGnvUBH9N3RkkTaEa/jKP+2xDlhRfAbiQtci4vuH1K0UXuxOQb/HO/b
 dAxhTeZThAKbUhpMAuvCtNTHS4Fy+5XEfJmuWqM6aYCtDOHfWOTnh7L2ldgXV8p5y4RrwV
 pUNBCDv/x/M5Gt4fzaR1EXXvc8HS/UO8aadY2cEzJenG7j/ySYbBO6beLcKoaHjPsZRVQq
 HaSIwODUHZM2wxEFkfdBxO4DO+qXhM0uL6Zn88DxW79alwTfMhBRsj27Iud2+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=V+PLM2gh
Subject: [Buildroot] [PATCH 0/2] package: add rasdaemon support.
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Rasdaemon is a tool that provides a way to collect all hardware error
events reported by the Linux kernel in a common framework.

My use case is on a PowerPC P2020. I use to it to monitor and react to
the PCIe AER events caught by the SoC's EDAC.

The first patch adds the package. The second one adds a small test for
it in support/testing.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Bastien Curutchet (2):
      package/rasdaemon: Add rasdaemon package
      support/testing: add rasdaemon tests

 DEVELOPERS                                      |  4 ++
 package/Config.in                               |  1 +
 package/rasdaemon/Config.in                     | 23 +++++++++
 package/rasdaemon/S95rasdaemon                  | 62 +++++++++++++++++++++++++
 package/rasdaemon/rasdaemon.hash                |  1 +
 package/rasdaemon/rasdaemon.mk                  | 33 +++++++++++++
 support/testing/tests/package/test_rasdaemon.py | 25 ++++++++++
 7 files changed, 149 insertions(+)
---
base-commit: c8cb1a238de5a803228f12ad32b36cae2acfc778
change-id: 20251125-rasdaemon-1df4904ddfde

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
