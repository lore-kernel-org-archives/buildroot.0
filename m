Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61CBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:46:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CEB60FC1
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52CEB60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E17283E7A;
	Tue, 21 Sep 2021 20:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmcoNSeS2MPx; Tue, 21 Sep 2021 20:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A8DA83E4A;
	Tue, 21 Sep 2021 20:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 757B71BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63C1783E4B
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6_iQLiJKqaW for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:46:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 038A283E4A
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:46:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1613A8C981; Tue, 21 Sep 2021 20:44:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:44:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1ee121caee78380722f9cc0fae6b77ddacdaafc
X-Git-Newrev: f0e204d99b1830cec4426ab28089777cb4ddedb8
X-Patchwork-Hint: ignore
Message-Id: <20210921204420.1613A8C981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/helpers.mk: gdbinit: set
 auto-load-safe-path before sysroot
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f0e204d99b1830cec4426ab28089777cb4ddedb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gdbinit supplied by Buildroot does two things:
A. specify the sysroot where gdb can find shared libraries
B. mark the sysroot as a 'safe path' for its auto-load feature, to make sure
  that pretty printers for libstdc++.so are added automatically (see commit
  6fb3216a80c64c08375429d89497eaeec5622150)

When debugging a core file, and the gdbinit file is specified via '-x'
rather than '-ix', then the order of these settings matters: If you first
set the sysroot, then gdb will immediately start finding the shared
libraries it needs for the core file, detect libstdc++ and its associated
libstdc++-gdb.py file, then give a big warning about safe paths:

  warning: File ".../i686-buildroot-linux-gnu/sysroot/lib/libstdc++.so.6.0.24-gdb.py"
          auto-loading has been declined by your `auto-load safe-path' set
          to "$debugdir:$datadir/auto-load".
  To enable execution of this file add
          add-auto-load-safe-path .../i686-buildroot-linux-gnu/sysroot/lib/libstdc++.so.6.0.24-gdb.py
  line to your configuration file "/home/me/.gdbinit".
  To completely disable this security protection add
          set auto-load safe-path /
  line to your configuration file "/home/me/.gdbinit".
  For more information about this security protection see the
  "Auto-loading safe path" section in the GDB manual.  E.g., run from the shell:
          info "(gdb)Auto-loading safe path"

and the pretty printing code is not loaded. This is because the second
line from the gdbinit file was not yet parsed at this point.

By changing the order (first configuring the safe path, then setting the
sysroot), this issue does not appear and everything is as expected.

Note that when '-ix' were used instead of '-x' to pass the gdbinit file to
gdb, then the order would not matter, because the entire gdbinit file would
be parsed before considering the core file.
However, even though the Buildroot manual now suggests '-ix', users may not
have noticed this change and continue to use '-x'.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1dfb52ac38..ef8e9a5f64 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -481,8 +481,8 @@ check_toolchain_ssp = \
 #
 gen_gdbinit_file = \
 	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
-	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
-	echo "add-auto-load-safe-path $(STAGING_DIR)" >> $(STAGING_DIR)/usr/share/buildroot/gdbinit
+	echo "add-auto-load-safe-path $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
+	echo "set sysroot $(STAGING_DIR)" >> $(STAGING_DIR)/usr/share/buildroot/gdbinit
 
 # Given a path, determine the relative prefix (../) needed to return to the
 # root level. Note that the last component is treated as a file component; use a
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
