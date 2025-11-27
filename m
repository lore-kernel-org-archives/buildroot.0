Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A74AD11183
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 14:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C4B40C28;
	Thu, 27 Nov 2025 14:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwklwmHQaL7b; Thu, 27 Nov 2025 14:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576A241263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576A241263;
	Thu, 27 Nov 2025 14:14:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 099012A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 14:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC41760705
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 14:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pj83sgHxJ_dy for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 14:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E38DA60698
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E38DA60698
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E38DA60698
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 14:14:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E1708C16A17
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 14:13:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA20F6068C;
 Thu, 27 Nov 2025 14:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F20E102F275C; Thu, 27 Nov 2025 15:14:10 +0100 (CET)
Date: Thu, 27 Nov 2025 15:14:04 +0100
Message-Id: <20251127-rasdaemon-v2-0-c57284751172@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKxcKGkC/03M0QrCIBTG8VcZ5zpD3YzsqveIXZge24GmQ4cUw
 3fPBkGX/4+P3wYZE2GGS7dBwkKZYmghDx3YyYQHMnKtQXKphJCKJZOdwTkGJpwfNB+c8w6h/Ze
 Enl67dRtbT5TXmN47XcR3/SmnP6UIxll/tkpz36PS4nqPcX1SONo4w1hr/QCbJRpTpAAAAA==
X-Change-ID: 20251125-rasdaemon-1df4904ddfde
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764252853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=hrI8SYOrhzhcIuv8xOgaZK+gck/YT+reyr9OqEOWpsA=;
 b=x8QqcgukZAeDtRMQ2ZqFD8XiEBKh1VGHbmj/NuTpvjEH/E/UQyjy6lsTSY4AktFvTyQXlV
 1AnXewg17ijsjCdJuGGTD1NEKeNeer514wHPbz0H02biK2XAsV4+jPUfTKmOIjSaTqUely
 te/ndYqCkCrJnUCQAxPpwaBUYGuNakORgN7NhxzdvbYVnWPHV/svo3pYWEJgkp0kRIg8VT
 vCHyvSwjHM9A8lV7phC4DUUW+5MeGrjxcGQL62tm1O/FKGufsKqmVa6gg9otWh7B/MNoGm
 mCfzndiMwA2wkDctt6CCcyCfWIicgGU3ge53YFHC8r3h99Lsz+DRHBMm6NE0wA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=x8Qqcguk
Subject: [Buildroot] [PATCH v2 0/2] package: add rasdaemon support.
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
 package/rasdaemon/Config.in                        | 25 ++++++++
 package/rasdaemon/S95rasdaemon                     | 69 ++++++++++++++++++++++
 package/rasdaemon/rasdaemon.hash                   |  3 +
 package/rasdaemon/rasdaemon.mk                     | 33 +++++++++++
 support/testing/tests/package/test_rasdaemon.py    | 46 +++++++++++++++
 .../package/test_rasdaemon/linux-debugfs.fragment  |  8 +++
 8 files changed, 189 insertions(+)
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
