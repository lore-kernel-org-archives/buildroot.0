Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089FCC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 19:35:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D9F61037
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 19:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1D9F61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=petri.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 650EF606CB;
	Thu, 26 Aug 2021 19:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fbVwDPMyhx5; Thu, 26 Aug 2021 19:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87108606CE;
	Thu, 26 Aug 2021 19:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94CEC1BF2B7
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 19:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8336081AF4
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 19:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxH_cQoa7Tks for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 19:35:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CF9F81ADE
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 19:35:12 +0000 (UTC)
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <jonah@petri.us>)
 id 1mJL9Y-0001Qe-8v; Thu, 26 Aug 2021 21:35:08 +0200
Received: by submission01.runbox with esmtpsa [Authenticated ID (799462)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1mJL9S-0003VT-Td; Thu, 26 Aug 2021 21:35:03 +0200
From: Jonah Petri <jonah@petri.us>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 15:34:24 -0400
Message-Id: <20210826193424.1650108-1-jonah@petri.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] toolchain: handle toolchains with
 multiple ld*.so.* files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jonah Petri <jonah@petri.us>, Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Some 3rd party vendor toolchains have multiple files which match
these glob patterns.  In this case, the shell script failed.
Switching to use find and xargs solves the issue.

Signed-off-by: Jonah Petri <jonah@petri.us>
---
Changes:
  v2: add SOB
  v3: fix usage of `find`
    I moved away from -wholename, which seemed needlessly complex, and
instead I'm using just the base directory and -name.  Tested with
previously-failing ARM aarch64 external toolchain build.

 toolchain/helpers.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index dfb2581ed5..cb9ff6479b 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -135,10 +135,8 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-	if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
-		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
-			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
-		fi ; \
+	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
+		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
