Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20516C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 20:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93BF260850;
	Tue, 11 Aug 2026 20:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcu8bGra01o8; Tue, 11 Aug 2026 20:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9476F60752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786478626;
	bh=OlS3YWBpySp2BHLXnUtCGVqSFWmrb2TN1Av+pPk1Q/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gArmeq1wF7k7xoC3uraekCijy/A7Yp/Jk3D5SDPqNDzLEjYg0c1t58XQoSgC+SRdN
	 z0GfTWb/A9lZaI7x4Lpb4WbccmXva+vQrCUCnRyggieR1v4B+WRSWq9+jm0M6WQBl6
	 DyRt72dAhRpAv/xCnsl8pHG9y0S2wYnaieEIOhwPCgb+yaw4LHdCCX6J3jzCBktZw1
	 7ym7G5osjFhfCdJt3+UT0/yRAQXOa00h4xX8u+NXkHm1OJRTT/+/QAP8/Uf3ZsjLTN
	 8W0ScSqgtjWIPihUAg+pmFuWSanV0vbEKukPYxfEF9b7DWvlIVBEkkYz5W0cDFt4na
	 TvOlXyrfDdMVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9476F60752;
	Tue, 11 Aug 2026 20:03:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDBF72E
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45FB540015
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRaGvXcooCtj for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 20:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7484E400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7484E400C4
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:03:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCF578D3E3; Tue, 11 Aug 2026 20:02:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 21:50:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 092abbe0352d62af8c17167e4f48e76aeea7ce99
X-Git-Newrev: 0e94f8d4de7b5421d5c0d21e22122a444c632770
X-Patchwork-Hint: ignore
Message-Id: <20260811200254.CCF578D3E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: patch CVE-2024-58251
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e94f8d4de7b5421d5c0d21e22122a444c632770
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Based on the work of the Debian community, this patch fixes the
following vulnerability:

This CVE hasn't been addressed upstream and the bugs discussion is 404
[1]. But the same patch is applied on Busybox v1.38 in Yocto & Debian.

- CVE-2024-58251:
    In netstat in BusyBox through 1.37.0, local users can launch of
    network application with an argv[0] containing an ANSI terminal escape
    sequence, leading to a denial of service (terminal locked up) when
    netstat is used by a victim.

For more information, see:
  - https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
  - https://www.cve.org/CVERecord?id=CVE-2024-58251

This patch is still applied on Debian & Yocto as of busybox version
1.38.

[1] https://bugs.busybox.net/show_bug.cgi?id=15922

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...tstat-sanitize-argv0-for-p-CVE-2024-58251.patch | 50 ++++++++++++++++++++++
 package/busybox/busybox.mk                         |  3 ++
 2 files changed, 53 insertions(+)

diff --git a/package/busybox/0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch b/package/busybox/0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
new file mode 100644
index 0000000000..5891424c00
--- /dev/null
+++ b/package/busybox/0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
@@ -0,0 +1,50 @@
+From: Valery Ushakov <valery.ushakov@bell-sw.com>
+Date: Thu, 21 Aug 2025 12:31:53 +0000
+Subject: netstat: CVE-2024-58251 - sanitize argv0 for -p
+Bug-Debian: https://bugs.debian.org/1104009
+
+Signed-off-by: Valery Ushakov <valery.ushakov@bell-sw.com>
+Upstream: https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
+CVE: CVE-2024-58251
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ networking/netstat.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/networking/netstat.c b/networking/netstat.c
+index 807800a62..d979f6079 100644
+--- a/networking/netstat.c
++++ b/networking/netstat.c
+@@ -41,6 +41,7 @@
+ 
+ #include "libbb.h"
+ #include "inet_common.h"
++#include "unicode.h"
+ 
+ //usage:#define netstat_trivial_usage
+ //usage:       "[-"IF_ROUTE("r")"al] [-tuwx] [-en"IF_FEATURE_NETSTAT_WIDE("W")IF_FEATURE_NETSTAT_PRG("p")"]"
+@@ -314,9 +315,12 @@ static int FAST_FUNC dir_act(struct recursive_state *state,
+ 		return FALSE;
+ 	cmdline_buf[n] = '\0';
+ 
++	/* don't write process-controlled argv[0] to the user's terminal as-is */
++	const char *argv0base = printable_string(bb_basename(cmdline_buf));
++
+ 	/* go through all files in /proc/PID/fd and check whether they are sockets */
+ 	strcpy(proc_pid_fname + len - (sizeof("cmdline")-1), "fd");
+-	pid_slash_progname = concat_path_file(pid, bb_basename(cmdline_buf)); /* "PID/argv0" */
++	pid_slash_progname = concat_path_file(pid, argv0base); /* "PID/argv0" */
+ 	n = recursive_action(proc_pid_fname,
+ 			ACTION_RECURSE | ACTION_QUIET,
+ 			add_to_prg_cache_if_socket,
+@@ -686,6 +690,7 @@ int netstat_main(int argc UNUSED_PARAM, char **argv)
+ 	unsigned opt;
+ 
+ 	INIT_G();
++	init_unicode();
+ 
+ 	/* Option string must match NETSTAT_xxx constants */
+ 	opt = getopt32(argv, NETSTAT_OPTS);
+-- 
+2.34.1
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 681624f6dd..855d553360 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 # 0007-awk.c-fix-CVE-2023-42366-bug-15874.patch
 BUSYBOX_IGNORE_CVES += CVE-2023-42366
 
+# 0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
+BUSYBOX_IGNORE_CVES += CVE-2024-58251
+
 # 0010-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
