Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88DAC77B7A
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A0241347;
	Thu, 29 Aug 2024 06:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 252Ko3RW6fQ3; Thu, 29 Aug 2024 06:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BAE54133C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BAE54133C;
	Thu, 29 Aug 2024 06:22:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2548B1BF867
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 262A140C9F
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBvGZo1RFo46 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F302F4082A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F302F4082A
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:22:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDBB686620; Thu, 29 Aug 2024 06:22:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 08:05:59 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 96d32fd6564ee124b9d325cab7c301820e4363a1
X-Git-Newrev: 3f0b87bf31154c5e93bed52a1a1d1d1d2d9a8fa1
X-Patchwork-Hint: ignore
Message-Id: <20240829062205.EDBB686620@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/cpuload: fix
 build with gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f0b87bf31154c5e93bed52a1a1d1d1d2d9a8fa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure with gcc >= 14:

read_cpu_stat.c: In function 'cpudata_new':
read_cpu_stat.c:49:17: error: implicit declaration of function 'error'; did you mean 'perror'? [-Wimplicit-function-declaration]
   49 |                 error("too many cpus");
      |                 ^~~~~
      |                 perror

Fixes:
 - http://autobuild.buildroot.org/results/3bca2659011d123d7b7a0ca19c4e868643d45766

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d3e1821cc6496bfab19e4fe3be9fe6223e8f8176)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Changed-error-calls-to-perror.patch       | 115 +++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/package/cpuload/0001-Changed-error-calls-to-perror.patch b/package/cpuload/0001-Changed-error-calls-to-perror.patch
new file mode 100644
index 0000000000..6672bec677
--- /dev/null
+++ b/package/cpuload/0001-Changed-error-calls-to-perror.patch
@@ -0,0 +1,115 @@
+From ffd61eaa72acf123dea0c80ed3774656289ab49f Mon Sep 17 00:00:00 2001
+From: roiec <roiec@D-H-ROIEC-LX-WW1.com>
+Date: Wed, 5 Jan 2022 17:12:05 +0200
+Subject: [PATCH] Changed 'error' calls to 'perror'
+
+Upstream: https://github.com/kelvincheung/cpuload/pull/1
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .gitignore           | 60 ++++++++++++++++++++++++++++++++++++++++++++
+ src/graph_cpu_load.c |  4 +--
+ src/read_cpu_stat.c  |  2 +-
+ 3 files changed, 63 insertions(+), 3 deletions(-)
+ create mode 100644 .gitignore
+
+diff --git a/.gitignore b/.gitignore
+new file mode 100644
+index 0000000..c2ae907
+--- /dev/null
++++ b/.gitignore
+@@ -0,0 +1,60 @@
++# Prerequisites
++*.d
++
++# Object files
++*.o
++*.ko
++*.obj
++*.elf
++
++# Linker output
++*.ilk
++*.map
++*.exp
++
++# Precompiled Headers
++*.gch
++*.pch
++
++# Libraries
++*.lib
++*.a
++*.la
++*.lo
++
++# Shared objects (inc. Windows DLLs)
++*.dll
++*.so
++*.so.*
++*.dylib
++
++# Executables
++*.exe
++*.out
++*.app
++*.i*86
++*.x86_64
++*.hex
++
++# Debug files
++*.dSYM/
++*.su
++*.idb
++*.pdb
++
++# Kernel Module Compile Results
++*.mod*
++*.cmd
++.tmp_versions/
++modules.order
++Module.symvers
++Mkfile.old
++dkms.conf
++
++#images
++*.tgz
++*.img
++
++
++#build
++configure
+diff --git a/src/graph_cpu_load.c b/src/graph_cpu_load.c
+index e4b7785..525d9ed 100644
+--- a/src/graph_cpu_load.c
++++ b/src/graph_cpu_load.c
+@@ -132,7 +132,7 @@ void graph_new_line(char *str, unsigned long color)
+ 	graph_last_x = graph_last_y = -1;
+ 
+ 	if (graph_data_index >= MAX_GRAPH_DATA - 2)
+-		error("Too many graph data.");
++		perror("Too many graph data.");
+ 
+ 	graph_data[graph_data_index++] = DATUM_COLOR;
+ 	graph_data[graph_data_index++] = color;
+@@ -145,7 +145,7 @@ void graph_new_line(char *str, unsigned long color)
+ void graph_add_point(int size, int amount)
+ {
+ 	if (graph_data_index >= MAX_GRAPH_DATA - 4)
+-		error("Too many graph data.");
++		perror("Too many graph data.");
+ 
+ 	graph_data[graph_data_index++] = DATUM_SIZE;
+ 	graph_data[graph_data_index++] = size;
+diff --git a/src/read_cpu_stat.c b/src/read_cpu_stat.c
+index 3d014be..ff51d7f 100644
+--- a/src/read_cpu_stat.c
++++ b/src/read_cpu_stat.c
+@@ -46,7 +46,7 @@ ProcessList *cpudata_new(void)
+ 	fclose(file);
+ 
+ 	if (cpu > cpus -1) {
+-		error("too many cpus");
++		perror("too many cpus");
+ 		exit(1);
+ 	}
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
