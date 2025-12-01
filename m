Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CBAD116F3
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 14:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B88A4058B;
	Mon,  1 Dec 2025 14:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMidDWBSIcWe; Mon,  1 Dec 2025 14:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF3E40287
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF3E40287;
	Mon,  1 Dec 2025 14:09:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0FEF1BD
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF1B5405A9
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWgq0ZiMzvyq for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 14:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C466640510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C466640510
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C466640510
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:08:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 67437C17B4E
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:08:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8F1ED606BB;
 Mon,  1 Dec 2025 14:08:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01A5A11918235; Mon,  1 Dec 2025 15:08:53 +0100 (CET)
Date: Mon, 01 Dec 2025 15:08:52 +0100
Message-Id: <20251201-rasdaemon-v3-0-8ad394bdc372@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHShLWkC/1WMQQ7CIBBFr9LMWgxMi7SuvIdxUWGwJBYMNETT9
 O7SJiZ1+Wb+ezMkio4SnKsZImWXXPAF6kMFeuj9g5gzhQE5SiFQstgn09MYPBPGNh1vjLGGoOx
 fkax7b63rrfDg0hTiZ0tnsV5/ldOukgXjrG617LitSXbicg9hejp/1GGEtZNx76q9i8XVUmHbq
 PJT+O8uy/IFv/7qWuAAAAA=
X-Change-ID: 20251125-rasdaemon-1df4904ddfde
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764598136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=12CvuiN6P9DLIO9wHjxPfVNcNuhd6HG/PzfTRkLY8PA=;
 b=IM43TggthPai+i3/ekgF2/PbUkh/pG+dEzXNUAP8hcrZK3IKxywRaG3HGlbetG6hEU/Vwa
 UiLgbYFXQTQmYnwOZsF5WT0x6GUd0/W7aCvAM02+cPwjAY7OPAod+8NnVak3+N7c7aWg/G
 k0WxCqJi5pKP0tGmxk4DmpdTEgyrQjOK0d/zQcvt/KBisnfqY0cN/X2SfPzZtUijLFUqUO
 7o6I1ukVLj3CCzkNl99Efwkhfur4QwIxm1f1zmR3eOKLdUTVOckQpR2Ns5zZSJ9UdVzhql
 oV9V5DAt2e1/RkIlmSPpCbuXt2p//i053UXlpcPG2NNvb8gPmhxyHdd0i1Aijw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IM43Tggt
Subject: [Buildroot] [PATCH v3 0/2] package: add rasdaemon support.
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
 package/rasdaemon/Config.in                        | 25 +++++++++
 package/rasdaemon/S95rasdaemon                     | 63 ++++++++++++++++++++++
 package/rasdaemon/rasdaemon.hash                   |  3 ++
 package/rasdaemon/rasdaemon.mk                     | 33 ++++++++++++
 support/testing/tests/package/test_rasdaemon.py    | 46 ++++++++++++++++
 .../package/test_rasdaemon/linux-debugfs.fragment  |  8 +++
 8 files changed, 183 insertions(+)
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
