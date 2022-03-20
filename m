Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EA0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5F8540533;
	Sun, 20 Mar 2022 18:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RunURVWvvhKN; Sun, 20 Mar 2022 18:48:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00796400CE;
	Sun, 20 Mar 2022 18:48:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E69B1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5719540896
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otaPSD2RT31s for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C47F40372
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65AF48461A; Sun, 20 Mar 2022 18:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:17:50 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fd0c2292f2a46bfcc61e73c2d4567f50b547b787
X-Git-Newrev: 61dfa6a4ef4780e3e74d6a28d67ede17d3f4fd78
X-Patchwork-Hint: ignore
Message-Id: <20220320183734.65AF48461A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zabbix: fix
 shared netsnmp build
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

commit: https://git.buildroot.net/buildroot/commit/?id=61dfa6a4ef4780e3e74d6a28d67ede17d3f4fd78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following shared build failure with netsnmp raised since the
addition of the package in commit
42382a171277ead59e365f5920e757f01c04ac77:

configure: error: "libnetsnmp.a static library was not found in /home/buildroot/autobuild/instance-0/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib"

Fixes:
 - http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 532e5063f54434cce4afec2ad5371fbf02488b67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-m4-netsnmp.m4-fix-shared-netsnmp-build.patch | 44 ++++++++++++++++++++++
 package/zabbix/zabbix.mk                           |  2 +
 2 files changed, 46 insertions(+)

diff --git a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
new file mode 100644
index 0000000000..ffb1f54ba2
--- /dev/null
+++ b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
@@ -0,0 +1,44 @@
+From 3e810c0804ec40ad6e111a9791cdb2033ecdad71 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 25 Feb 2022 23:30:19 +0100
+Subject: [PATCH] m4/netsnmp.m4: fix shared netsnmp build
+
+Since commit fe391e8689c523d3c7ea6b173d25aa5dba3a6902, the build fails
+with the following error if the user provides the path of
+net-snmp-config through the --with-net-snmp option:
+
+configure: error: "libnetsnmp.a static library was not found in /home/buildroot/autobuild/instance-0/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib"
+
+However, the assumption that a static library will be provided by the
+system is just plain wrong so replace AC_MSG_ERROR by AC_MSG_WARN
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zabbix/zabbix/pull/61]
+---
+ m4/netsnmp.m4 | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/m4/netsnmp.m4 b/m4/netsnmp.m4
+index 5e84d84303..87e21a67e6 100644
+--- a/m4/netsnmp.m4
++++ b/m4/netsnmp.m4
+@@ -140,8 +140,11 @@ AC_HELP_STRING([--with-net-snmp@<:@=ARG@:>@],
+ 			test [ "x$static_linking_support" = "xno" -o -z "$static_linking_support" ] -a -z "$_libsnmp_dir_lib" && AC_MSG_ERROR(["Compiler not support statically linked libs from default folders"])
+ 
+ 			if test "x$static_linking_support" = "xno" -o -z "$static_linking_support"; then
+-				test -f $_libsnmp_dir_lib/libnetsnmp.a || AC_MSG_ERROR(["libnetsnmp.a static library was not found in $_libsnmp_dir_lib"])
+-				SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s|-lnetsnmp|$_libsnmp_dir_lib/libnetsnmp.a|g"`
++				if test -f $_libsnmp_dir_lib/libnetsnmp.a; then
++					SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s|-lnetsnmp|$_libsnmp_dir_lib/libnetsnmp.a|g"`
++				else
++					AC_MSG_WARN(["libnetsnmp.a static library was not found in $_libsnmp_dir_lib"])
++				fi
+ 			else
+ 				SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s/-lnetsnmp/${static_linking_support}static -lnetsnmp ${static_linking_support}dynamic/g"`
+ 			fi
+-- 
+2.34.1
+
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index e6564e68fd..a8ecbb42db 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -10,6 +10,8 @@ ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJO
 ZABBIX_LICENSE = GPL-2.0+
 ZABBIX_LICENSE_FILES = README COPYING
 ZABBIX_CPE_ID_VENDOR = zabbix
+# We're patching m4/netsnmp.m4
+ZABBIX_AUTORECONF = YES
 
 ZABBIX_DEPENDENCIES = pcre
 ZABBIX_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
