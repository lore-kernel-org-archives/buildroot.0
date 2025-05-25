Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C634C54E90
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 14:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA73480E56;
	Sun, 25 May 2025 14:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRTIIx-TiD4z; Sun, 25 May 2025 14:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17F7580E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F7580E46;
	Sun, 25 May 2025 14:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9855C19D
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 870B280E4F
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nxCwkvxbOdw for <buildroot@buildroot.org>;
 Sun, 25 May 2025 14:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D81A280AD5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D81A280AD5
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:19:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D159287624; Sun, 25 May 2025 14:19:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 May 2025 16:15:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: df0805618bdf58a072514e042c809989c0fb020d
X-Git-Newrev: 737aa40a1c7e98a88fdad0d36b7ab47a4819be1a
X-Patchwork-Hint: ignore
Message-Id: <20250525141951.D159287624@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/llvm-project: add
 llvm-runtimes package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=737aa40a1c7e98a88fdad0d36b7ab47a4819be1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a new host package to install the CMake modules provided by the
runtimes archive of LLVM. These modules are required to build components
like libunwind since upstream refactored the common flag-handling logic
into a shared file: `HandleFlags.cmake`.

This package extracts and installs the relevant files to
`$(HOST_DIR)/lib/cmake/llvm`, where other components like libunwind
will look for them.

see https://github.com/llvm/llvm-project/commit/0af67d167d6c811abf12ad6c27ee34ec1365e5fb

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Mehdi v3: explicitly set version to 20.1.3 for now, it will
	   be changed in llvm-project bump commit]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-runtimes/llvm-runtimes.hash |  2 ++
 package/llvm-project/llvm-runtimes/llvm-runtimes.mk   | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
new file mode 100644
index 0000000000..66d9e1f336
--- /dev/null
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  6394d8f111288c918421756037c10c4f8471325992e37c44cf8811b4e3dde00b  runtimes-20.1.3.src.tar.xz
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.mk b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
new file mode 100644
index 0000000000..34ac9ece31
--- /dev/null
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# llvm-runtimes
+#
+################################################################################
+
+LLVM_RUNTIMES_VERSION = 20.1.3
+LLVM_RUNTIMES_SITE = $(LLVM_PROJECT_SITE)
+LLVM_RUNTIMES_SOURCE = runtimes-$(LLVM_RUNTIMES_VERSION).src.tar.xz
+LLVM_RUNTIMES_LICENSE = Apache-2.0 with exceptions
+
+define HOST_LLVM_RUNTIMES_INSTALL_CMDS
+        mkdir -p $(HOST_DIR)/lib/cmake/llvm/Modules
+        cp -Rv $(@D)/cmake/Modules/* $(HOST_DIR)/lib/cmake/llvm
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
