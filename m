Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B774C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:19:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C2A60F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47C2A60F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15D1E40275;
	Sun, 25 Jul 2021 21:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsFaz9ZGgE1G; Sun, 25 Jul 2021 21:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E0A04026F;
	Sun, 25 Jul 2021 21:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF321BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B977833C9
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XOePUmauLHv for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:19:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 601908339C
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:19:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 876F088F7E; Sun, 25 Jul 2021 20:45:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:19:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 049135c409b081d37b9455cd7564c8581334e11b
X-Git-Newrev: 6fb3216a80c64c08375429d89497eaeec5622150
X-Patchwork-Hint: ignore
Message-Id: <20210725204515.876F088F7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: mark sysroot as 'safe' path for
 gdb auto-load
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6fb3216a80c64c08375429d89497eaeec5622150
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdb can automatically load certain files as described in [1]. Such files
could install pretty-printers for complex data structures.

libstdcxx (C++ standard library) provided by gcc, is one example of a
library for which such auto-load file is available. But there are other
examples too, like libglib2.

However, gdb will only auto-load files if the file is located in one of the
locations treated as 'safe'. The Buildroot sysroot is not by default in that
list.

Provide a better debugging experience by adding the sysroot to the 'safe'
list, via the gdbinit file prepared by Buildroot.

[1] https://sourceware.org/gdb/onlinedocs/gdb/objfile_002dgdbdotext-file.html

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/helpers.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 17bc159f3e..dfb2581ed5 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -483,7 +483,8 @@ check_toolchain_ssp = \
 #
 gen_gdbinit_file = \
 	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
-	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
+	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
+	echo "add-auto-load-safe-path $(STAGING_DIR)" >> $(STAGING_DIR)/usr/share/buildroot/gdbinit
 
 # Given a path, determine the relative prefix (../) needed to return to the
 # root level. Note that the last component is treated as a file component; use a
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
