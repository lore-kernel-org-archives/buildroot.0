Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360C9C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6FF41880;
	Thu,  5 May 2022 20:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRyjlQFKAfnx; Thu,  5 May 2022 20:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E53416F9;
	Thu,  5 May 2022 20:43:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD071BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DF2760AAD
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5zRW57oNJmN for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:43:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3968960AA8
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:43:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4F2D085BE7; Thu,  5 May 2022 20:32:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 22:43:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d56925bc438bfc425919adc33adc9d0c2d9f2c7b
X-Git-Newrev: 9e8e80d1e33587bf74e03bf972ff46a24144a81c
X-Patchwork-Hint: ignore
Message-Id: <20220505203245.4F2D085BE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: Add cpulimit
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e8e80d1e33587bf74e03bf972ff46a24144a81c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cpulimit is a tool which limits the CPU usage of a process (expressed in
percentage, not in CPU time). It is useful to control batch jobs, when
you don't want them to eat too many CPU cycles.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
[Peter: depend on BR2_USE_MMU, add pull request links to patches]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 .../0001-Fix-crash-and-compiler-warnings.patch     | 57 ++++++++++++++++++++++
 ...sysctl.h-and-add-missing-libgen.h-include.patch | 42 ++++++++++++++++
 package/cpulimit/Config.in                         |  8 +++
 package/cpulimit/cpulimit.hash                     |  3 ++
 package/cpulimit/cpulimit.mk                       | 23 +++++++++
 7 files changed, 137 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 292b919137..c54b6b5c09 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -965,6 +965,9 @@ N:	Filip Skoneczny <fskoneczny@gmail.com>
 F:	board/sinovoip/m1-plus
 F:	configs/bananapi_m1_plus_defconfig
 
+N:	Florian Fainelli <f.fainelli@gmail.com>
+F:	package/cpulimit/
+
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
diff --git a/package/Config.in b/package/Config.in
index befeadc27b..8892134133 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2522,6 +2522,7 @@ menu "System tools"
 	source "package/circus/Config.in"
 	source "package/containerd/Config.in"
 	source "package/coreutils/Config.in"
+	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch b/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch
new file mode 100644
index 0000000000..cb170b440b
--- /dev/null
+++ b/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch
@@ -0,0 +1,57 @@
+From d1f42082590bed42cbf6ef1bf37e936df1afbf6b Mon Sep 17 00:00:00 2001
+From: Tobias Tangemann <tobias@tangemann.org>
+Date: Thu, 9 Jul 2015 23:51:07 +0200
+Subject: [PATCH] Fix crash (and compiler warnings)
+
+[Upstream: https://github.com/opsengine/cpulimit/pull/48]
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+---
+ src/cpulimit.c                | 2 +-
+ src/process_group.c           | 4 ++++
+ tests/process_iterator_test.c | 2 +-
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/cpulimit.c b/src/cpulimit.c
+index 50eabeacf214..42d7ca280738 100644
+--- a/src/cpulimit.c
++++ b/src/cpulimit.c
+@@ -43,7 +43,7 @@
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ 
+-#ifdef __APPLE__ || __FREEBSD__
++#if defined(__APPLE__) || defined(__FREEBSD__)
+ #include <libgen.h>
+ #endif
+ 
+diff --git a/src/process_group.c b/src/process_group.c
+index 06d73a6f3541..c9e148cd1b60 100644
+--- a/src/process_group.c
++++ b/src/process_group.c
+@@ -25,6 +25,10 @@
+ #include <sys/time.h>
+ #include <signal.h>
+ 
++#if defined(__APPLE__) || defined(__FREEBSD__)
++#include <libgen.h>
++#endif
++
+ #include <assert.h>
+ 
+ #include "process_iterator.h"
+diff --git a/tests/process_iterator_test.c b/tests/process_iterator_test.c
+index 16151967eb24..1bfc167ba895 100644
+--- a/tests/process_iterator_test.c
++++ b/tests/process_iterator_test.c
+@@ -28,7 +28,7 @@
+ #include <signal.h>
+ #include <string.h>
+ 
+-#ifdef __APPLE__ || __FREEBSD__
++#if defined(__APPLE__) || defined(__FREEBSD__)
+ #include <libgen.h>
+ #endif
+ 
+-- 
+2.25.1
+
diff --git a/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
new file mode 100644
index 0000000000..fa32e3ede2
--- /dev/null
+++ b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
@@ -0,0 +1,42 @@
+From 4c1e021037550c437c7da3a276b95b5bf79e967e Mon Sep 17 00:00:00 2001
+From: Portia <stephensportia@gmail.com>
+Date: Sun, 1 May 2022 12:43:35 +1000
+Subject: [PATCH] Remove sys/sysctl.h and add missing libgen.h include
+
+- sys/sysctl.h has been deprecated and should be removed
+- Adds missing libgen.h include when calling basename()
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+[Upstream: https://github.com/opsengine/cpulimit/pull/109]
+---
+ src/cpulimit.c      | 1 -
+ src/process_group.c | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cpulimit.c b/src/cpulimit.c
+index 50eabeacf214..5b0ec4978f02 100644
+--- a/src/cpulimit.c
++++ b/src/cpulimit.c
+@@ -38,7 +38,6 @@
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+-#include <sys/sysctl.h>
+ #include <sys/resource.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
+diff --git a/src/process_group.c b/src/process_group.c
+index 06d73a6f3541..d4f6fab3385c 100644
+--- a/src/process_group.c
++++ b/src/process_group.c
+@@ -24,6 +24,7 @@
+ #include <limits.h>
+ #include <sys/time.h>
+ #include <signal.h>
++#include <libgen.h>
+ 
+ #include <assert.h>
+ 
+-- 
+2.25.1
+
diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
new file mode 100644
index 0000000000..6ff24f8381
--- /dev/null
+++ b/package/cpulimit/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CPULIMIT
+	bool "cpulimit"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Cpulimit is a tool which limits the CPU usage of a process
+	  (expressed in percentage, not in CPU time)
+
+	  https://github.com/opsengine/cpulimit
diff --git a/package/cpulimit/cpulimit.hash b/package/cpulimit/cpulimit.hash
new file mode 100644
index 0000000000..c6ef4b2e69
--- /dev/null
+++ b/package/cpulimit/cpulimit.hash
@@ -0,0 +1,3 @@
+# sha256sum locally computed:
+sha256  64312f9ac569ddcadb615593cd002c94b76e93a0d4625d3ce1abb49e08e2c2da  cpulimit-0.2.tar.gz
+sha256  920489ca9da706d842870701155e70a101315ba0783cff39765d7e15e0916a4a  LICENSE
diff --git a/package/cpulimit/cpulimit.mk b/package/cpulimit/cpulimit.mk
new file mode 100644
index 0000000000..a864685a84
--- /dev/null
+++ b/package/cpulimit/cpulimit.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cpulimit
+#
+################################################################################
+
+CPULIMIT_VERSION = 0.2
+CPULIMIT_SITE = $(call github,opsengine,cpulimit,v$(CPULIMIT_VERSION))
+CPULIMIT_LICENSE = GPL-2.0+
+CPULIMIT_LICENSE_FILES = LICENSE
+
+define CPULIMIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		LDLIBS="$(TARGET_LDFLAGS)"
+endef
+
+define CPULIMIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/cpulimit \
+		$(TARGET_DIR)/usr/bin/cpulimit
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
