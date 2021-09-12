Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449C4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 23:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD1B610A3
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 23:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BD1B610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B277401EF;
	Sun, 12 Sep 2021 23:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNXZjzPRZMvG; Sun, 12 Sep 2021 23:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 446384017B;
	Sun, 12 Sep 2021 23:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7041BF3D1
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 23:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F71980C3E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 23:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExIOUc5hm1sm for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 23:09:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id 674BB80C30
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 23:09:01 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PYapmEaNznyXHPYapmAWqu; Mon, 13 Sep 2021 01:08:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631488139; bh=m3ffFlkDn/INDVz99iTNY578LcJvxF3oproTsqB0jGw=;
 h=From:To:Subject:Date:MIME-Version;
 b=VmWFRaZFHUAB4J9HkgldQ/bboWwRhDtnY+2ORXYl8w10GXUzrp+vDWKckbGmRY3Yp
 o+ufYR1ZwsFZh5jmQj6JSmNwQBl6+BS6V9iYtPVege+OuI5ubd2rS91bOHwnlTOg9e
 GIMjB8FWT3Un7fQkZByZQU7VMAGFQ46yG8ACgnrEDsotOWZY0qDbWCWjNPnyjoGXmq
 Y92wHDbKLi7jSm6YGrr8c9qRs4/2hqPijgBnkcpOCJ9jQjEUO0eLtuWWs6LqbKWwW7
 qeSm4/Hc4UHivA+1X+4xsvOZKn4ac2eX1Dvg8uLbuIS3rLZ8S/DA1P7xjTSyoTyUcn
 VBpZ+lOQWH8eA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 01:08:56 +0200
Message-Id: <20210912230856.1125573-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPfIovhpenm+035E2hI0jGekN1loYtdJmYHl1/wQhZgVkfPM1ew1gnyXwrBY7wbD5hR3mhjctLPyUU3Ljas/+u1rwEXB4AJCVcBbMOCRQaFRHP4xUB/R
 Lq9tVhJClE6jOGC4jDiTfP2IddeI4ElEavLYzqdC2NGR8gTPVaUqMog6B32FfEWI0jj3q36zoW1LxAczmu/11Ko46tNuA5RMJA5XnQcxGD011Cnq3wTYEMrF
 A08ecHGN4vxhRkPEvXkxpDTxbfI3FeQbWOasAetGOKMK9eEXXmeRvysMTSXdFi97
Subject: [Buildroot] [PATCH] package/trace-cmd: fix build for Sparc64
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Trace-cmd needs -fPIC for Sparc64 platform otherwise it fails on linking,
so add -fPIC to CFLAGS when building for such platform.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index cd3fcb9755..bc431e5dd2 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -31,6 +31,11 @@ endif
 # redefining it on the command line causes build problems.
 TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
 
+# Sparc64 needs -fPIC
+ifeq ($(BR2_sparc64),y)
+TRACE_CMD_CFLAGS += -fPIC
+endif
+
 # trace-cmd use CPPFLAGS to add some extra flags.
 # But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
 # that causes build problems.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
