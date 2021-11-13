Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B9FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 00:25:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC298610A0
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 00:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC298610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9AB4062B;
	Sat, 13 Nov 2021 00:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhAfiLhtvNxw; Sat, 13 Nov 2021 00:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE3F40622;
	Sat, 13 Nov 2021 00:24:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3EA61BF390
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 00:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDE12826DA
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 00:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dIyzg9vb7SY for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 00:24:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12CE0826FB
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 00:24:54 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lgqhmKQfFFhvKlgqhm0esq; Sat, 13 Nov 2021 01:24:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636763091; bh=IkpA4qm/IwS41VdTSz17fSIslJLqmqDzWsmXhz+a1Tk=;
 h=From:To:Subject:Date:MIME-Version;
 b=nuCS3i0UmDfiG4vd7vYsA2pGg8u5+w1sRH8vrR707Fiv/+VizDVJt4r7gtmDL/jL+
 O/t8RDFm0RoUt39FfH3S/Moi59zfNj+h0YqkF/zyoaoeyAfLkaBpgvFEG/ta8hlIhI
 /xv/v9uLL4lQWqsiwUq0JV3JBkIuwzVNoMDbgApBnFNSIxLpMsBYLCLl4JNQSXNCz2
 X8/RG/hMUENfrDNZkkmpl0TFA3bs77HeJNMvMe8/zC1SSrUIWsJIxwzx+AG6wPL6xA
 CNSZqtw7mQvLiLKK9rFln04Mxw/ebL5Dy4LuaWmm2dOLrnE6L9R3UUQbnNV/DniPQ2
 grKd0hhzyGMNg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 01:24:50 +0100
Message-Id: <20211113002450.975462-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGa9YIDKjkRUUZ3HXABA3hYIIq7o4JRngddGyM8hqs7/cBm0i8KN80dVPOVhgCzlpfBaho4DCqbRYlDUFZhN94iqe8GkoUz+w3q7WI+JY4/Waj3CJbD2
 oWUaEM3c+FpTHP/pKC0rp1dv13YIOm8OdaavEbrl9m7lrs2KbCID8Drpm3fejf1/zTuOkL8m0qtbGtkGJQ3Wyo0mEOuvFUZvTkE9nDdgnJLT1d402Paajlvn
 jy8Jlt7Qp5k9v3ZE4OPxdJ7LtqvSBqXciiKdKvh+CZpt3yynpAti9gLoE3AqLR2YFMZDvmkWqdsdrS2pLbTUHA==
Subject: [Buildroot] [PATCH] package/trace-cmd: bump to version 2.9.6
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to version 2.9.6.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 78ff3472c3..1f34a0da60 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  026cce03b4ae61f19848646acecf151dd7dd62617859edcf73ae954eb65b2653  trace-cmd-trace-cmd-v2.9.5-br1.tar.gz
+sha256  9401a43bda4837dfde5e64e0dbe5d3918bf50eb86b4d23fa89713b0f2defcbc1  trace-cmd-trace-cmd-v2.9.6-br1.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index f9b54ed765..a592b1f027 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.9.5
+TRACE_CMD_VERSION = trace-cmd-v2.9.6
 TRACE_CMD_SITE = https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
