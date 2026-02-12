Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C235EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49AC161620;
	Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRewoZQ74FHf; Fri, 13 Feb 2026 19:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F214360738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011484;
	bh=xxcKDHo31SYdP0iaIbmaUyKwpVTIy4UiFuU+qagmido=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pTvTzooF6e4j2E6OkhchkA6LCiKGgZlRd23OMWjZ2sTaS4YJ9Q2AoZ2UppiHILL0N
	 tf6wiNPLTnpkHIYvxzAOBzqPzR4IGJN2S4YFkSBvZ9+fm+Hf3JdvSgB72G8V+//yxd
	 gILc9SnTcJp/Z7oTHRbRaIFtJpIhXugX2hz/hIuctDkX/z4KSbDdAsKe4cbqnzhzzY
	 oQrKz63exknpYdjklx0Do9uFyYcz1Q7XlN2cfSB17LalvU2LkOQ4wpO/Wq3jkllMgL
	 fy/jvvIURp5zLil2A5f6Oge8D/oNa7yrEF+kmuCajC9ZQU9N7+iTsVm50ey4IK30wS
	 jvNF3XKKRkOMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F214360738;
	Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C48EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2EBC413D8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNchQlzdPc5m for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC7B2412E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC7B2412E3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A19C083593; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:44:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 090da5c20710947e2811ed99787f09b06e595ba3
X-Git-Newrev: 258e2199ba56cd4a204fd764b391ac14c0b9ed2e
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.A19C083593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/systemd: fix
 building with libsseccomp and kernel headers < 5.8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7029279180047131178=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7029279180047131178==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/258e2199ba56cd4a204fd764b391ac14c0b9ed2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

This is also fixed in systemd v258+.

Fixes: https://autobuild.buildroot.net/results/8ff/8ff77e79cc7373f452c25212c7e2058368cdd05f/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c15318805c4f4ff21fb6543815a0542b22d86b3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...omp-only-add-bpf-syscall-to-seccomp-allow.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/systemd/0001-nspawn-seccomp-only-add-bpf-syscall-to-seccomp-allow.patch b/package/systemd/0001-nspawn-seccomp-only-add-bpf-syscall-to-seccomp-allow.patch
new file mode 100644
index 0000000000..4a74083391
--- /dev/null
+++ b/package/systemd/0001-nspawn-seccomp-only-add-bpf-syscall-to-seccomp-allow.patch
@@ -0,0 +1,46 @@
+From e6ab723c96b91e7c4c495fcef0654102fac26570 Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <bubu@bubu1.eu>
+Date: Mon, 2 Feb 2026 18:26:19 +0100
+Subject: [PATCH] nspawn-seccomp: only add bpf syscall to seccomp allowlist if
+ headers define CAP_BPF
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When building systemd with kernel headers < 5.8 (which added CAP_BPF) it fails with:
+
+  ../src/nspawn/nspawn-seccomp.c: In function ‘add_syscall_filters’:
+  ../src/nspawn/nspawn-seccomp.c:114:19: error: ‘CAP_BPF’ undeclared (first use in this function)
+    114 |                 { CAP_BPF,            "bpf",                         },
+        |                   ^~~~~~~
+  ../src/nspawn/nspawn-seccomp.c:114:19: note: each undeclared identifier is reported only once for each function it appears in
+
+If the kernel headers don't define CAP_BPF, it's likely that the running
+kernel doesn't know about this capability either, so we can assume that
+we'd never allow this syscall anyway.
+
+So if CAP_BPF isn't defined, just skip this allow_list entry entirely.
+
+Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
+Upstream: N/A - fixed in systemd >= 258 by introducing vendored kernel headers for this use-casea
+---
+ src/nspawn/nspawn-seccomp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/nspawn/nspawn-seccomp.c b/src/nspawn/nspawn-seccomp.c
+index 6956689ab5..aaac6085b6 100644
+--- a/src/nspawn/nspawn-seccomp.c
++++ b/src/nspawn/nspawn-seccomp.c
+@@ -108,7 +108,9 @@ static int add_syscall_filters(
+                 { CAP_SYS_BOOT,       "reboot"                       },
+                 { CAP_SYSLOG,         "syslog"                       },
+                 { CAP_SYS_TTY_CONFIG, "vhangup"                      },
++#ifdef CAP_BPF
+                 { CAP_BPF,            "bpf",                         },
++# endif
+ 
+                 /*
+                  * The following syscalls and groups are knowingly excluded:
+-- 
+2.52.0
+

--===============7029279180047131178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7029279180047131178==--
