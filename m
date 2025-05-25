Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FB4C54FB3
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 14:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D6360612;
	Sun, 25 May 2025 14:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZxFYHyOqcnZ; Sun, 25 May 2025 14:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D9F6062E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D9F6062E;
	Sun, 25 May 2025 14:19:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A87C12A8
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EFEF4009A
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkdVfBxlC171 for <buildroot@buildroot.org>;
 Sun, 25 May 2025 14:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D60404007D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D60404007D
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:19:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3B8E87623; Sun, 25 May 2025 14:19:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 May 2025 16:15:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 066f6088723f03cc3fec863d0d48a6e9cf214582
X-Git-Newrev: df0805618bdf58a072514e042c809989c0fb020d
X-Patchwork-Hint: ignore
Message-Id: <20250525141951.C3B8E87623@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing:
 TestClangCompilerRT: Add a kernel fragment for 48 bits virtual adress
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

commit: https://git.buildroot.net/buildroot/commit/?id=df0805618bdf58a072514e042c809989c0fb020d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a kernel fragment to enable
CONFIG_ARM64_VA_BITS_48 for the AARCH64 QEMU platform in the
clang compiler -rt runtime test.

Without this setting, this sanitize-based test fails with clang-20
due to insufficient virtual adress space.

"This might potentially affect ARM platforms with 39-bit address space." from [1]

[1] https://github.com/llvm/llvm-project/commit/a588cfe37ea36ec4fae35a233a13d3557fba86e9

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_clang.py                        | 5 ++++-
 support/testing/tests/package/test_clang/linux-arm64-va48.fragment | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index f36faa059a..a9794a49fa 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -7,8 +7,10 @@ FUZZ_TIMEOUT = 120
 
 class TestClangCompilerRT(infra.basetest.BRTest):
     br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
+    # Without this option the test fails due to insufficient address space for 64-bit allocator
+    va48_fragment = infra.filepath("tests/package/test_clang/linux-arm64-va48.fragment")
     config = \
-        """
+        f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -17,6 +19,7 @@ class TestClangCompilerRT(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.283"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{va48_fragment}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_COMPILER_RT=y
         BR2_PACKAGE_LLVM=y
diff --git a/support/testing/tests/package/test_clang/linux-arm64-va48.fragment b/support/testing/tests/package/test_clang/linux-arm64-va48.fragment
new file mode 100644
index 0000000000..1bafe6e581
--- /dev/null
+++ b/support/testing/tests/package/test_clang/linux-arm64-va48.fragment
@@ -0,0 +1 @@
+CONFIG_ARM64_VA_BITS_48=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
