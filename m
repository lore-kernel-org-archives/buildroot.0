Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E22CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3647F414BD;
	Sun, 15 Oct 2023 18:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3647F414BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g6gXTGA0b9-p; Sun, 15 Oct 2023 18:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A0CA414C8;
	Sun, 15 Oct 2023 18:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A0CA414C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5611BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E74881DFC
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E74881DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIS0s5wgK3FV for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:32:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86DAE81E01
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86DAE81E01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73EFD84C30; Sun, 15 Oct 2023 18:32:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:23:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3d2cffe1a249a26ea907257a7c1cc445c680b994
X-Git-Newrev: 56caafceab3ec12669ccb7aa6fc8b653778064e1
X-Patchwork-Hint: ignore
Message-Id: <20231015183250.73EFD84C30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/netsnmp: fix musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=56caafceab3ec12669ccb7aa6fc8b653778064e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
