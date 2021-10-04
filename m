Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4369FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:41:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0780661425
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0780661425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF3BE60749;
	Mon,  4 Oct 2021 21:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kglWMZvNwsDk; Mon,  4 Oct 2021 21:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F46A6076F;
	Mon,  4 Oct 2021 21:41:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DB861BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 699BA40460
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIIJxnFhsJCs for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:40:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 513664046A
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:40:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2FA508F29C; Mon,  4 Oct 2021 21:37:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 22:24:07 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 338785a5a1de550a7aa0a1c57e26f52c6ca6e407
X-Git-Newrev: 5ac8c8469355e6a15f3318cb966f04f0a2715192
X-Patchwork-Hint: ignore
Message-Id: <20211004213744.2FA508F29C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] toolchain/helpers.mk:
 gdbinit: set auto-load-safe-path before sysroot
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ac8c8469355e6a15f3318cb966f04f0a2715192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
(cherry picked from commit f0e204d99b1830cec4426ab28089777cb4ddedb8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index dfb2581ed5..5c494d3dde 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -483,8 +483,8 @@ check_toolchain_ssp = \
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
