Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2467C432BE
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 20:41:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952D761181
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 20:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 952D761181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=petri.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3794257C;
	Tue, 24 Aug 2021 20:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBfsvdxz9bog; Tue, 24 Aug 2021 20:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C13242582;
	Tue, 24 Aug 2021 20:41:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 336231BF5A5
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 20:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 300C660C0E
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 20:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3J0ch93k5H7 for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 20:41:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEF4460745
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 20:41:44 +0000 (UTC)
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <jonah@petri.us>)
 id 1mIcrr-0005rR-6e; Tue, 24 Aug 2021 22:17:55 +0200
Received: by submission02.runbox with esmtpsa [Authenticated ID (799462)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1mIcri-0001Pz-Ma; Tue, 24 Aug 2021 22:17:47 +0200
From: Jonah Petri <jonah@petri.us>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 16:16:57 -0400
Message-Id: <20210824201657.1553593-1-jonah@petri.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] toolchain: handle toolchains with multiple
 ld*.so.* files
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Jonah Petri <jonah@petri.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Some 3rd party vendor toolchains have multiple files which match
these glob patterns.  In this case, the shell script failed.
Switching to use find and xargs solves the issue.
---
 toolchain/helpers.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index dfb2581ed5..5ed149d57d 100644
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
+       if ! find -wholename $(STAGING_DIR)'/lib/ld*.so.*' > /dev/null; then \
+               find -wholename $${ARCH_SYSROOT_DIR}'/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
