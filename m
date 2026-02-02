Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5DEE7FDD8
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24AF40827;
	Mon,  2 Feb 2026 21:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csH-Oq--OSXp; Mon,  2 Feb 2026 21:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E778740917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770067948;
	bh=p4hoPb6R9KDk0Hueih5YybvFlAAabWa1vAvKa73Tqi8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d85C57B9PHKY1Lyx1YcgLN5XREKDNl8SVBwbA0puyg0sDeCw4RsPcO+LPG0P4AF0Y
	 LJAM7fh3eFV9PJqzr2sFr+/RwfAnEufQg3rfALVnvM9G1iNf/mWP+iUnmdXDdUwToF
	 0aaVRVg4OllePxevf2/+cmxNpeLnq0+kb5YSsb/Es3Jtil5m+lDpsR/SLxHQa4N9Zc
	 b3TqYDooNCgU7vahZTtpSezryCUFMpqVNdnmr5Qe1aZWadPRn+GHlXe1OaXf6pQHWm
	 gykqH+AJeQPVSCAGSwN/Kj1m5FrEY50p1MFEVAndXmMKcSBYMI22v5cGmPaSb3dIHu
	 +NCq/FLSSEkTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E778740917;
	Mon,  2 Feb 2026 21:32:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A83149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E56182B1B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QcIbJKa_H9H for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AE082AB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48AE082AB9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31AF1864CE; Mon,  2 Feb 2026 21:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 22:31:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48b56d61bc49e97a807e808f9fdafccf29c85c5c
X-Git-Newrev: 3c15318805c4f4ff21fb6543815a0542b22d86b3
X-Patchwork-Hint: ignore
Message-Id: <20260202213225.31AF1864CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix building with
 libsseccomp and kernel headers < 5.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7632106723199000979=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7632106723199000979==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3c15318805c4f4ff21fb6543815a0542b22d86b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is also fixed in systemd v258+.

Fixes: https://autobuild.buildroot.net/results/8ff/8ff77e79cc7373f452c25212c7e2058368cdd05f/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============7632106723199000979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7632106723199000979==--
