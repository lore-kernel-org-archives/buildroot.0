Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB88C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FAE940734;
	Mon,  7 Mar 2022 21:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWN3DNPP1VU4; Mon,  7 Mar 2022 21:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 236A7404B0;
	Mon,  7 Mar 2022 21:47:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA481BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BBE28283D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Y6MzhyUlHVe for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:46:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4B4B829BB
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0125883235; Mon,  7 Mar 2022 21:38:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:43:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59e62a8e0d556567fa97ea400a7c351f4fa22998
X-Git-Newrev: 9fa5d641ac4951087bb007e091a799101d294527
X-Patchwork-Hint: ignore
Message-Id: <20220307213818.0125883235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: fix when gmp is installed on
 the host machine
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fa5d641ac4951087bb007e091a799101d294527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdb's AC_LIB_HAVE_LINKFLAGS macro hardcodes a search starting with
/usr/lib/ which can lead to libgmp from the wrong architecture with the
result that the test fails.  Even if a libgmp is found there it is now
the one that should be used.

This is the same macro used for expat and lzma for which there are
already specific CONF_OPTS flags added here.  Add the same flag for
libgmp and move the handling down so that it is logically grouped with
the other similar options.

Note that there is no --with(out)-gmp flag to configure, as the
dependency is mandatory, so only the --with-libgmp-prefix option is
specified.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gdb/gdb.mk | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 05de3c14d1..9bde2beea1 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -77,14 +77,6 @@ ifeq ($(BR2_GDB_VERSION_11),y)
 HOST_GDB_DEPENDENCIES += host-gmp
 endif
 
-# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
-# we're building the full gdb for the target, we need gmp as a
-# dependency. For now the default gdb version in Buildroot doesn't
-# require gmp.
-ifeq ($(BR2_GDB_VERSION_11)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
-GDB_DEPENDENCIES += gmp
-endif
-
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
 # so we disable it (additionally the option --disable-install-libbfd
@@ -169,6 +161,16 @@ GDB_CONF_OPTS += \
 	--without-curses
 endif
 
+# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
+# we're building the full gdb for the target, we need gmp as a
+# dependency. For now the default gdb version in Buildroot doesn't
+# require gmp.
+ifeq ($(BR2_GDB_VERSION_11)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
+GDB_CONF_OPTS += \
+	--with-libgmp-prefix=$(STAGING_DIR)/usr
+GDB_DEPENDENCIES += gmp
+endif
+
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 GDB_CONF_OPTS += --enable-gdbserver
 GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
