Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6DED7879C
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 16:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F951412B8;
	Fri, 19 Dec 2025 16:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvfKF9HpBToF; Fri, 19 Dec 2025 16:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A7E8412C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766161827;
	bh=srZzVTjiO5LBBXO0/WQQZDIjm9AkwzmF3GR06FlCVSE=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=BXqapPMRcrO7G+ohftOmNS913XXMlTkRSi3UdeotE+I2P6L3a+FIEx3k3JrlCtCoM
	 wrGeRM86yZW4mx4zcz+n3JqHUGnyVo2VNjm6rpK03JSGKPxN9l+1WtvCtlTnOF9NzX
	 1JHz2g1qZxqqlittau1W0r3qotEHkI5/+UJTVqIf5sMgqReIKqrqSKLlnsdyRAbmHA
	 w2H8hnj/HeerzrnRZLZBmhH+Hqs66bUg/ZYw1Ns+Q61xUXFkOiAveausnED1hKrq/s
	 UKuri/V7Ag2lXkpzQlsSpS6IZR7N5KopCjiYAHk2L1/hBx6M6675MBJ3CsIk2x6bkW
	 DA8vlLMiBAnuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7E8412C1;
	Fri, 19 Dec 2025 16:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 725821A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58387418C6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrXsYYNDjeVs for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 16:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0372340100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0372340100
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0372340100
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:30:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 575A1C1B20B
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:29:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D76C6071D;
 Fri, 19 Dec 2025 16:30:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F58D10AA9569; Fri, 19 Dec 2025 17:30:15 +0100 (CET)
Date: Fri, 19 Dec 2025 17:30:14 +0100
Message-Id: <20251219-rasdaemon-v4-0-2cdc992de787@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJZ9RWkC/2XM3QrCIByH4VsJjzP8zNlR9xEdOD+a0DR0SDF27
 7lBJHX40//zziDb5G0Gp90Mki0++xjqYPsd0IMKNwu9qRsQRDjGhMOkslF2jAFi45hEzBhnLKj
 3j2Sdf26ty7XuwecppteWLnh9/VSOTaVgiCDtNJfIUcslPvcxTncfDjqOYO0U0lrRWlKt5oJ0T
 NQ/Qf4t/VqCcGtptZ0yVLLeaPprl2V5A14a5uYcAQAA
X-Change-ID: 20251125-rasdaemon-1df4904ddfde
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766161817; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=xuk3J2y0MqEFQo99NwGGX5AOzvZbmEkmYdcCJg49ooQ=;
 b=iA5BH7cCSrfsGUGwrrCHJnUK6ePmAtIonodw7Nk0xiMdoJ71AvKOfu7X3NgQZdwu9O9/JZ
 ssrMLhs++qx5SA2U9VAc1kvf9LAoqEZ27uiLdAXZTC3XWeRzheJqq0p1bE48OzTm5Bi1OC
 UT9NWzQ9badInu43XI8ItfLnbHROePBH5tGmEKigZzkdPk/OEtws7hIw43e5JJWY9IJyI7
 qRyM6FNoLfftMvFd4+oUvPQGGPkT3+6SbForT6/cI2phNQr61hWxNUBQP79rNBqv6BN+6z
 smawiUunnZbDyf33SgwHYrVqI2W2hqBqin2ztyKObY8qMNUaUHMDF/boAv2IdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iA5BH7cC
Subject: [Buildroot] [PATCH v4 0/2] package: add rasdaemon support.
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
it in support/testing. Adding fake error injections in the selftest
isn't trivial so it only ensures the daemon does run.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Changes in v4:
- Add BR2_TOOLCHAIN_HAS_THREADS
- Make the sqlite dependency optional
- Fix Config.in format
- Add Fiona reviewed-by
- Link to v3: https://lore.kernel.org/r/20251201-rasdaemon-v3-0-8ad394bdc372@bootlin.com

Changes in v3:
- PATCH 1: Init script: Run the daemon in foreground and use
  --background to leave the PID file creation to start-stop-daemon
- Link to v2: https://lore.kernel.org/r/20251127-rasdaemon-v2-0-c57284751172@bootlin.com

Changes in v2:
- PATCH 1:
    Init script: Use a PID file
    Config.in: Add comment for the BR2_SHARED_LIBS dependency, fix the AER feature description
    rasdaemon.mk: Add License's hash
- PATCH 2:
    Add a check to ensure the daemon does run once started by the init
    script.
- Link to v1: https://lore.kernel.org/r/20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com

---
Bastien Curutchet (2):
      package/rasdaemon: Add rasdaemon package
      support/testing: add rasdaemon tests

 DEVELOPERS                                         |  4 ++
 package/Config.in                                  |  1 +
 ...aemon-fix-build-when-sqlite-isn-t-enabled.patch | 46 ++++++++++++++++
 package/rasdaemon/Config.in                        | 26 +++++++++
 package/rasdaemon/S95rasdaemon                     | 63 ++++++++++++++++++++++
 package/rasdaemon/rasdaemon.hash                   |  3 ++
 package/rasdaemon/rasdaemon.mk                     | 40 ++++++++++++++
 support/testing/tests/package/test_rasdaemon.py    | 46 ++++++++++++++++
 .../package/test_rasdaemon/linux-debugfs.fragment  |  8 +++
 9 files changed, 237 insertions(+)
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
