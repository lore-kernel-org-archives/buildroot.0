Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F57C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E7A280DE9;
	Tue,  6 Dec 2022 22:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E7A280DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ax6B6cz6W9hP; Tue,  6 Dec 2022 22:14:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD34381E29;
	Tue,  6 Dec 2022 22:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD34381E29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5EE41BF39E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B12904098F
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B12904098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVWuLoQxDl8T for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:13:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 803C6408EA
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 803C6408EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7000585D10; Tue,  6 Dec 2022 22:13:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Dec 2022 23:02:03 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ecda7f786a7cb51fd4d0195495bfdf1fcda19344
X-Git-Newrev: 5aac65cd8e72691988eb4d184b379e1777e10918
X-Patchwork-Hint: ignore
Message-Id: <20221206221352.7000585D10@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gcc: ensure
 __register_frame is optimized out for glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=5aac65cd8e72691988eb4d184b379e1777e10918
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

On some architectures when building with -O0 the __register_frame
symbol fails to get optimized out which can cause linking failures
when building glibc.

To fix this set -O1 for GCC target libs when building with glibc
and BR2_OPTIMIZE_0 on the problematic target architectures.

This was reported both to GCC [1] and glibc [2] upstream. It is not
entirely clear yet where the bug lies exactly. At the moment the
assumption is that it's GCC, so create a symbol
BR2_TOOLCHAIN_HAS_GCC_BUG_107728.

This issue only seems to occur when linking glibc, not with anything
else, so only compile libgcc from host-gcc-initial with -O1.

Fixes:
 - http://autobuild.buildroot.net/results/89b/89b6c6924240b7cf82035a844f3573673e91b364
 - http://autobuild.buildroot.net/results/46f/46f4ec99d2b23d354a4bb5e92123d64f0da6ed27
 - http://autobuild.buildroot.net/results/839/839f929f700cf181ebdf34389c7806a96f55813e
 - http://autobuild.buildroot.net/results/0e2/0e202bf53a683930f3cad6edef2a4dea629eaecb
 - http://autobuild.buildroot.net/results/8a8/8a8c917f597fdcca744e696e19e9300b64004335
 - http://autobuild.buildroot.net/results/c05/c058b27ed2834dfa633b63ec6c3639ab1e8bf412
 - http://autobuild.buildroot.net/results/8ba/8ba8882a861cf7df359c23969c09b2be0725b2e5

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=29621

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0fc5c1ccdb11af5185471272ef5eeece81b5e866)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-initial/gcc-initial.mk |  7 +++++++
 toolchain/Config.in                    | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index f5bc6c5b77..ebd8e8f017 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -43,6 +43,13 @@ HOST_GCC_INITIAL_CONF_OPTS = \
 HOST_GCC_INITIAL_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
 
+# Enable GCC target libs optimizations to optimize out __register_frame
+# when needed for some architectures when building with glibc.
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_107728),y)
+HOST_GCC_INITIAL_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS) -O1"
+HOST_GCC_INITIAL_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS) -O1"
+endif
+
 HOST_GCC_INITIAL_MAKE_OPTS = $(HOST_GCC_COMMON_MAKE_OPTS) all-gcc all-target-libgcc
 HOST_GCC_INITIAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3c9d61c66b..cb073950de 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -228,6 +228,18 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
 	bool
 	default y if BR2_m68k
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728
+# https://sourceware.org/bugzilla/show_bug.cgi?id=29621
+config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
+	bool
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_OPTIMIZE_0
+	default y if BR2_microblazebe || BR2_microblazeel \
+		|| BR2_mips || BR2_mipsel \
+		|| BR2_nios2 \
+		|| BR2_or1k \
+		|| BR2_sh
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
