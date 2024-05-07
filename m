Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ECDC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C2A4157C;
	Tue,  7 May 2024 07:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9m9nahy4qI83; Tue,  7 May 2024 07:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5F2402F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA5F2402F7;
	Tue,  7 May 2024 07:11:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47FF21BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41DA081EEC
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 284NGiK9V374 for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5106C81ED8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5106C81ED8
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4271F869AA; Tue,  7 May 2024 07:11:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 09:02:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be3252fe01f39f8ac21d611861bd0c5dda58b09f
X-Git-Newrev: e0066bcb851b730f0517b5d5712a9e49b4296c7d
X-Patchwork-Hint: ignore
Message-Id: <20240507071154.4271F869AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdadm: fix uclibc and musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0066bcb851b730f0517b5d5712a9e49b4296c7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix following uclibc build failure raised since bump to version 4.3 in
commit 99e9ff08d0705279532ca0cf3de22ea54660cbdc and
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=577fd10486d8d1472a6b559066f344ac30a3a391:

Create.c: In function 'write_zeroes_fork':
Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
      |                                   ^~~~~~~~~~~~~~~~~~~~

as well as the following musl build failure:

util.c: In function 'get_md_name':
util.c:1031:29: error: 'NAME_MAX' undeclared (first use in this function); did you mean 'MD_NAME_MAX'?
 1031 |         static char devname[NAME_MAX];
      |                             ^~~~~~~~
      |                             MD_NAME_MAX
util.c:1031:29: note: each undeclared identifier is reported only once for each function it appears in
/home/buildroot/instance-0/output-1/host/bin/x86_64-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -DNO_LIBUDEV -DSendmail=\""/usr/sbin/sendmail -t"\" -DCONFFILE=\"/etc/mdadm.conf\" -DCONFFILE2=\"/etc/mdadm/mdadm.conf\" -DMAP_DIR=\"/run/mdadm\" -DMAP_FILE=\"map\" -DMDMON_DIR=\"/run/mdadm\" -DFAILED_SLOTS_DIR=\"/run/mdadm/failed-slots\" -DNO_COROSYNC -DNO_DLM    -DUSE_PTHREADS -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBINDIR=\"/sbin\"  -o Monitor.o -c Monitor.c
/home/buildroot/instance-0/output-1/host/bin/x86_64-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -DNO_LIBUDEV -DSendmail=\""/usr/sbin/sendmail -t"\" -DCONFFILE=\"/etc/mdadm.conf\" -DCONFFILE2=\"/etc/mdadm/mdadm.conf\" -DMAP_DIR=\"/run/mdadm\" -DMAP_FILE=\"map\" -DMDMON_DIR=\"/run/mdadm\" -DFAILED_SLOTS_DIR=\"/run/mdadm/failed-slots\" -DNO_COROSYNC -DNO_DLM    -DUSE_PTHREADS -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBINDIR=\"/sbin\"  -o dlink.o -c dlink.c
Create.c: In function 'write_zeroes_fork':
Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
      |                                   ^~~~~~~~~~~~~~~~~~~~

Fixes: 99e9ff08d0705279532ca0cf3de22ea54660cbdc
 - http://autobuild.buildroot.org/results/0e04bcdb591ca5642053e1f7e31384f06581e989
 - http://autobuild.buildroot.org/results/c77ee2615e9d473e93d95c778648c7e897b7f234

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-limits-h-include-for-NAME_MAX-definition.patch | 32 +++++++++++++++++
 package/mdadm/0003-Create.c-fix-uclibc-build.patch | 42 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch b/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
new file mode 100644
index 0000000000..ceaf7f923c
--- /dev/null
+++ b/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
@@ -0,0 +1,32 @@
+From 8bda86099089b44129ef6206764f9de47a45f0db Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 12 Mar 2024 11:01:50 +0100
+Subject: util.c: add limits.h include for NAME_MAX definition
+
+Add limits.h include for NAME_MAX definition.
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+
+Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=8bda86099089b44129ef6206764f9de47a45f0db
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util.c b/util.c
+index 05ad3343..49a9c6e2 100644
+--- a/util.c
++++ b/util.c
+@@ -36,7 +36,7 @@
+ #include	<ctype.h>
+ #include	<dirent.h>
+ #include	<dlfcn.h>
+-
++#include	<limits.h>
+ 
+ /*
+  * following taken from linux/blkpg.h because they aren't
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/mdadm/0003-Create.c-fix-uclibc-build.patch b/package/mdadm/0003-Create.c-fix-uclibc-build.patch
new file mode 100644
index 0000000000..c8399be076
--- /dev/null
+++ b/package/mdadm/0003-Create.c-fix-uclibc-build.patch
@@ -0,0 +1,42 @@
+From 52bead95d2957437c691891fcdc49bd6afccdd49 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Apr 2024 18:45:13 +0200
+Subject: Create.c: fix uclibc build
+
+Define FALLOC_FL_ZERO_RANGE if needed as FALLOC_FL_ZERO_RANGE is only
+defined for aarch64 on uclibc-ng resulting in the following or1k build
+failure since commit 577fd10486d8d1472a6b559066f344ac30a3a391:
+
+Create.c: In function 'write_zeroes_fork':
+Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
+      |                                   ^~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0e04bcdb591ca5642053e1f7e31384f06581e989
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=52bead95d2957437c691891fcdc49bd6afccdd49
+---
+ Create.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Create.c b/Create.c
+index 4397ff49..d94253b1 100644
+--- a/Create.c
++++ b/Create.c
+@@ -32,6 +32,10 @@
+ #include	<sys/signalfd.h>
+ #include	<sys/wait.h>
+ 
++#ifndef FALLOC_FL_ZERO_RANGE
++#define FALLOC_FL_ZERO_RANGE 16
++#endif
++
+ static int round_size_and_verify(unsigned long long *size, int chunk)
+ {
+ 	if (*size == 0)
+-- 
+cgit 1.2.3-korg
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
