Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B32CA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 23:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B3E83B74;
	Mon, 11 Aug 2025 23:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBcPUl6Y1zcI; Mon, 11 Aug 2025 23:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BAFD838CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BAFD838CC;
	Mon, 11 Aug 2025 23:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E98B8B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 23:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB5AE40FD2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 23:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsZJZMs_ZvtD for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 23:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.98;
 helo=smtpcmd0998.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0688E4029B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0688E4029B
Received: from smtpcmd0998.aruba.it (smtpcmd0998.aruba.it [62.149.156.98])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0688E4029B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 23:14:41 +0000 (UTC)
Received: from localhost.localdomain ([95.168.105.14])
 by Aruba SMTP with ESMTPSA
 id lbiwu2h5S0WuxlbiwuB1zg; Tue, 12 Aug 2025 01:14:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Date: Tue, 12 Aug 2025 01:14:37 +0200
Message-ID: <20250811231437.470780-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFEFwQTFc07ulToOv3Ptg/2XzEb35Ed2ldkyODCgimtStq+o2UbPRN3BqoYgXGeJhAH1fnrjyFW3AVlBQF1R6fY4kplnQuuiS5BZni+DwPnzqwcd9QyN
 Uk96L6DiZAmLAn0yEJ7ACryfO5Po1WXxj5KlFSFyJkzpH32dH6JHWzpYyXVYxE3AEelWYy1tZ3aOMWnQKzCuAA5zVgvpPGZWQZY/itcYqyBYqc4YyP3vLpzD
 6T+W7az1fz9C9YOB97pqI86J/GhOK+NQtbEZBbrlqvTeBb7pVXXYo7MK4mQwDWpyrAZpLI7+ef+U7AT7xmoNtQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1754954079; bh=L8HHHtmJpNsTL/Xs74yrxyqi/XtWY5JDri6EGN6Sazc=;
 h=From:To:Subject:Date:MIME-Version;
 b=EGAtMZllWneLIkLmE1BQD/BvKkNqG2ceP0CfDerCN6HzcvzziCcXmGWu6t+14WUJd
 ScXgFpqDpnytCN0qAGqN4OgmgAUtYZpqSDlcX6V4iprqb/+pPYkxEUVhqqsg/6+IhC
 ieGfuenDzSZwYbSXh8PPKtTEG+4aPHPw+PDqZL8u/DihglX7nzBaTiL3TOmcqlJXjP
 RlCrSIY3CXv4E3LkJIiIWScldVvK0kYEuJWEgp2lOQU0dsa6Sql/o/mKmc1NJ4EHxf
 zwQ915nN+aMPNmzgUucBEX3x/nc8VSe4xg0askEhMWe7g6vl8lgjDPW1YZnDD7sGwt
 r4cVD/dfMQcZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EGAtMZll
Subject: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tag/?h=trace-cmd-v3.3.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 832dae693e..fa61654fd5 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cf16c91c0c49893499710ab2f722fd7c5ffce27485d2f7509370836b168ecd45  trace-cmd-v3.3.2.tar.gz
+sha256  8ed41f61010998e4a1ba54778f9077ee7afb5311d38dca9781d7a397dd70c9d4  trace-cmd-v3.3.3.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index ec8f5c4b59..a1b17289cd 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.3.2
+TRACE_CMD_VERSION = 3.3.3
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
