Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67D8C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 11:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A581417EA;
	Tue, 25 Jun 2024 11:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dceE4MYPIGZu; Tue, 25 Jun 2024 11:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4041C41979
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4041C41979;
	Tue, 25 Jun 2024 11:46:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D37811BF426
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 11:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEEED41979
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 11:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAZsyCmGgXdq for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 11:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D28F417EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D28F417EA
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D28F417EA
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 11:46:47 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:46:45 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2024 13:46:45 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 13:46:44 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 13:46:43 +0200
X-IronPort-AV: E=Sophos;i="6.08,263,1712613600"; d="scan'208";a="158191506"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 25 Jun 2024 13:46:43 +0200
Message-ID: <e2b3835bcee63a27b24a757a2db3e9103faebc63.1719316003.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1719316008; x=1750852008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2OeTs5FgvvsjQLhEDLirWDAF0X9EHh0ALLzjwNRWkCg=;
 b=Bwx3gaadECfuCHW/ivZbiwMRbje/LERVvcWd2ZPyUbSLD60N+UO2zOja
 G7ECc5dL4LYfvM4nnUMLXrcJhiQz1tZ07r/5/1FcHi3oTx3A2mx6MoCoy
 0BOTSHOKXRufMA/wAl2iqf3HJlbNKj2x5Zk9Qof5fISev4NewhwdDFhFN
 AR9HRngdl3IB9p5kcWDKfdSvE8CLnFj49DUUliqonvFkRRA0VqnOiUy9e
 oBkymYp0qz0Q5B1Lel5m5I/B3sTNXxDRksq6HGcwJd9RtROb3BHzQRGC0
 RXbhe7SL5t+0SAit3GTonSnV+vfXkvnrkpKj8l4/oFY3U9SZTtXJTfKHZ
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Bwx3gaad
Subject: [Buildroot] [PATCH] package/slang: fix patch fuzz
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
Cc: yann.morin@orange.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set the
maximum fuzz factor to 0), we no longer accept fuzz in patches. Before
8f88a644ed7d was applied, alot of patches were fixed in preparatory
commits, but slang was missed (although the patch has been present since
2017.

Fix the fuzz:
  - leading TABs in Makefile commands
  - fix context

Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/slang/0001-slsh-libs.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slang/0001-slsh-libs.patch b/package/slang/0001-slsh-libs.patch
index fad16d1b2f..100399e818 100644
--- a/package/slang/0001-slsh-libs.patch
+++ b/package/slang/0001-slsh-libs.patch
@@ -12,10 +12,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 +++ b/slsh/Makefile.in
 @@ -92,7 +92,7 @@
  $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
-    $(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
+ 	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
  $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
 -	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)
 +	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
  $(OBJDIR)/slsh.o: $(OBJDIR_TSTAMP) slsh.c slsh.h config.h Makefile
-    cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
+ 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
  $(OBJDIR)/readline.o: $(OBJDIR_TSTAMP) readline.c slsh.h config.h Makefile
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
