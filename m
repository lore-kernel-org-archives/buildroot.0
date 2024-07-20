Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74ABC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B948403B5;
	Sat, 20 Jul 2024 20:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp7S952p_kwH; Sat, 20 Jul 2024 20:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2796D403B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2796D403B9;
	Sat, 20 Jul 2024 20:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E9291BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED77540151
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p21icr0TNYHH for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0E5D400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0E5D400D8
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:51:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7BDC86D8C; Sat, 20 Jul 2024 20:51:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:51:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bb426628c19f04cbad6821c1a68f008043d7808
X-Git-Newrev: d3e1821cc6496bfab19e4fe3be9fe6223e8f8176
X-Patchwork-Hint: ignore
Message-Id: <20240720205145.B7BDC86D8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpuload: fix build with gcc >= 14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d3e1821cc6496bfab19e4fe3be9fe6223e8f8176
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
