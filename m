Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A71C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC1840309;
	Tue, 19 Mar 2024 12:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GX-J-vNzAGUe; Tue, 19 Mar 2024 12:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C88540322
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C88540322;
	Tue, 19 Mar 2024 12:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3685B1BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23F896059E
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GjSQsHvhL1O for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695796059A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 695796059A
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F5B183456; Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:04:49 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ebfc153e28bfe5dc55e742d883dcf5837d2ec47c
X-Git-Newrev: 9acadac3e74004a34de185d607df67c516fe67c9
X-Patchwork-Hint: ignore
Message-Id: <20240319122332.5F5B183456@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/strace: musl on
 aarch64 needs headers >= 5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9acadac3e74004a34de185d607df67c516fe67c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

strace needs headers >= 5.0 and
https://github.com/torvalds/linux/commit/9966a05c7b80f075f2bc7e48dbb108d3f2927234
to avoid the following build failure on musl and aarch64 due to headers
conflict raised at least since bump to version 6.0 in commit
544806bfd8052d05dee671c23c354e5f73f954f9:

In file included from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/signal.h:48,
                 from strace.c:17:
/home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/bits/signal.h:18:16: error: redefinition of 'struct sigcontext'
   18 | typedef struct sigcontext {
      |                ^~~~~~~~~~
In file included from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/asm/ptrace.h:26,
                 from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/linux/ptrace.h:107,
                 from ptrace.h:33,
                 from strace.c:16:
/home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/asm/sigcontext.h:28:8: note: originally defined here
   28 | struct sigcontext {
      |        ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/74a480aa76970b36dcd890d9bd7a9df1d49e8e16
 - http://autobuild.buildroot.org/results/79ee8ae5fb9712fd874b56e836eca1b997c50cd9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: fix architecture conditional]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e2e8e655feb7f1162e554a40ea5c7a2db0987ffa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index dc245c7297..e0551f3861 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -4,6 +4,10 @@ config BR2_PACKAGE_STRACE
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
 	# needs at least kernel headers 5.0 on xtensa
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_xtensa
+	# needs at least kernel headers 5.0 on musl aarch64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || \
+		!(BR2_aarch64 || BR2_aarch64_be) || \
+		!BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_RISCV_32
 	help
 	  A useful diagnostic, instructional, and debugging tool.
@@ -22,3 +26,8 @@ comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
 comment "strace needs a toolchain w/ headers >= 5.0 on xtensa"
 	depends on BR2_xtensa
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
+comment "strace needs a musl toolchain w/ headers >= 5.0 on aarch64"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
