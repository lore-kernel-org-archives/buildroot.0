Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD78C54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E37441716;
	Sat, 16 Mar 2024 22:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqTNcFPRBH8e; Sat, 16 Mar 2024 22:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888FE410E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 888FE410E6;
	Sat, 16 Mar 2024 22:02:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE96D1BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9AD6606B9
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jufTxG1eM5or for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE828606BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE828606BB
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D24F680262; Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 22:20:35 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e1291e7dd715d12925623f19aa45553436d6920b
X-Git-Newrev: 5f687db36631fc014b2ea82380ee78663ddd79d3
X-Patchwork-Hint: ignore
Message-Id: <20240316220156.D24F680262@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sudo: fix build
 with uClibc
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
Content-Type: multipart/mixed; boundary="===============6928667278724909566=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6928667278724909566==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5f687db36631fc014b2ea82380ee78663ddd79d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

uClibc lacks process_vm_readv(), and sudo fails to build since commit
c87746afefe7 (package/sudo: security bump to version 1.9.15p5), with
errors such as:

    ./exec_ptrace.c: In function ‘ptrace_write_vec’:
    ./exec_ptrace.c:895:9: error: ‘nwritten’ undeclared (first use in this function); did you mean ‘pwrite’?
      895 |         nwritten = ptrace_write_string(pid, strtab, vec[i]);
          |         ^~~~~~~~
          |         pwrite

Backport an upstream commit to fix the issue.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0f0117ad942070717e495ac88af943a3b1f8fcec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ptrace-fix-build-without-precess_vm_readv.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch b/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
new file mode 100644
index 0000000000..446f1d1797
--- /dev/null
+++ b/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
@@ -0,0 +1,41 @@
+From 5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 17 Feb 2024 17:52:45 +0100
+Subject: [PATCH] src/exec_ptrace: fix build without precess_vm_readv()
+
+Commit 32f4b98f6b4a (sudo frontend: silence most -Wconversion warnings.)
+broke the build on C libraries that miss process_vm_readv(), like
+uClibc-ng.
+
+Indeed, the ssize_t nwritten is declared guarded by HAVE_PROCESS_VM_READV,
+but is then re-assigned and used a few lines below, outside any guard.
+
+Fix that by always declaring the object, as it is always needed.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Upstream: https://github.com/sudo-project/sudo/commit/5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c
+---
+ src/exec_ptrace.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
+index 9dd36c275..3d44b82e2 100644
+--- a/src/exec_ptrace.c
++++ b/src/exec_ptrace.c
+@@ -878,11 +878,12 @@ ptrace_write_vec(pid_t pid, struct sudo_ptrace_regs *regs, char **vec,
+     unsigned long addr, unsigned long strtab)
+ {
+     const unsigned long strtab0 = strtab;
++    ssize_t nwritten;
+     size_t i;
+     debug_decl(ptrace_write_vec, SUDO_DEBUG_EXEC);
+
+ #ifdef HAVE_PROCESS_VM_READV
+-    ssize_t nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
++    nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
+     if (nwritten != -1 || errno != ENOSYS)
+ 	debug_return_ssize_t(nwritten);
+ #endif /* HAVE_PROCESS_VM_READV */
+--
+2.43.0
+

--===============6928667278724909566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6928667278724909566==--
