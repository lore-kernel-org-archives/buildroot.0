Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8ABCDB483
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E0DE414B8;
	Sun, 15 Oct 2023 18:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0DE414B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mccbgjg89owq; Sun, 15 Oct 2023 18:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91658414FF;
	Sun, 15 Oct 2023 18:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91658414FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B25B1BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81813416D0
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81813416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eh4Mqno5WCmY for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEF7941706
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEF7941706
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF2D88559B; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:23:15 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 8f5cf8d488fd77038dede3f8e48f6288d15203a2
X-Git-Newrev: 72b50b9043be5ea506bb20ad861b2fb0e1f75fe2
X-Patchwork-Hint: ignore
Message-Id: <20231015183251.CF2D88559B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/netsnmp: fix musl
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=72b50b9043be5ea506bb20ad861b2fb0e1f75fe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following musl build failure raised since bump to version 5.9.4
in commit 868603755c16296ae2a61845891edeafc36e48ca:

large_fd_set.c: In function 'LFD_SET':
../include/net-snmp/net-snmp-config.h:1614:30: error: unknown type name 'unknown'; did you mean 'union'?
 1614 | #define NETSNMP_FD_MASK_TYPE unknown
      |                              ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/394ebf93621c33dc2ddf370297268e6de9de7c9a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dad81003c905c5fe33599c1676ed46108b512bc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch | 38 ++++++++++++++++++++++
 package/netsnmp/netsnmp.mk                         |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch b/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
new file mode 100644
index 0000000000..91a00aec27
--- /dev/null
+++ b/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
@@ -0,0 +1,38 @@
+From a62169f1fa358be8f330ea8519ade0610fac525b Mon Sep 17 00:00:00 2001
+From: Adam Gajda <adgajda@users.noreply.github.com>
+Date: Mon, 2 Oct 2023 16:40:31 +0200
+Subject: [PATCH] Fix configuration of NETSNMP_FD_MASK_TYPE
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/a62169f1fa358be8f330ea8519ade0610fac525b
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure                        | 2 +-
+ configure.d/config_project_types | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 9f0a173d8a..945a27c663 100755
+--- a/configure
++++ b/configure
+@@ -30871,7 +30871,7 @@ CFLAGS="$CFLAGS -Werror"
+ 
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
+ printf %s "checking for the type of fd_set::fds_bits... " >&6; }
+-for type in __fd_mask __int32_t unknown; do
++for type in __fd_mask __int32_t long\ int unknown; do
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+diff --git a/configure.d/config_project_types b/configure.d/config_project_types
+index 1b4c66b95e..a78e8ebb06 100644
+--- a/configure.d/config_project_types
++++ b/configure.d/config_project_types
+@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
+ CFLAGS="$CFLAGS -Werror"
+ 
+ AC_MSG_CHECKING([for the type of fd_set::fds_bits])
+-for type in __fd_mask __int32_t unknown; do
++for type in __fd_mask __int32_t long\ int unknown; do
+   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
+ #include <sys/select.h>
+ #include <stddef.h>
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index ae85f2697f..b5cda30a7b 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -40,6 +40,8 @@ NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true inst
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
+# We're patching configure.d/config_project_types
+NETSNMP_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_CONF_OPTS += --with-endianness=big
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
