Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ED0C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62CC66F592;
	Thu, 30 Nov 2023 08:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62CC66F592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGHTYkgatvz6; Thu, 30 Nov 2023 08:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 520186F4D2;
	Thu, 30 Nov 2023 08:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 520186F4D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD761BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC6448449A
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC6448449A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPg_9A4pTG5a for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E9B984499
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E9B984499
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A2C686573; Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:19:52 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 30f8dd83e6ce798e0e636d762e4f5c3ff9caa387
X-Git-Newrev: 3f5b8cf4d70a8b4f28ca36200d4aa253ae470741
X-Patchwork-Hint: ignore
Message-Id: <20231130083134.0A2C686573@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/netsnmp: revert
 back to 5.9.3, backport security fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f5b8cf4d70a8b4f28ca36200d4aa253ae470741
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

In commit 13fc9dcb34926e9b6310b23662920c55c96d83a1, netsnmp was bumped
from 5.9.3 to 5.9.4 to fix two CVEs.

However, even though it's a minor version bump, there are actually 163
commits upstream between those two minor releases, and some of them
are breaking existing use-cases. In particular upstream
a2cb167514ac0c7e1b04e8f151e0b015501362e0 now requires that config_()
macros in MIB files are terminated with a semicolon, causing a build
breakage with existing MIB files that were totally valid with 5.9.3.

This commit therefore proposes to revert back to 5.9.3, by reverting
those two commits:

56caafceab3ec12669ccb7aa6fc8b653778064e1 package/netsnmp: fix musl build
13fc9dcb34926e9b6310b23662920c55c96d83a1 package/netsnmp: security bump to version 5.9.4

and instead backport the one upstream commit that fixes both CVEs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: fix typo as reported by Baruch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 44243b4c80c3c6fd4364fa1582f6a8e8c8b928da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch | 38 ------------
 ...snmp_agent-disallow-SET-with-NULL-varbind.patch | 72 ++++++++++++++++++++++
 package/netsnmp/netsnmp.hash                       |  6 +-
 package/netsnmp/netsnmp.mk                         |  6 +-
 4 files changed, 80 insertions(+), 42 deletions(-)

diff --git a/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch b/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
deleted file mode 100644
index 91a00aec27..0000000000
--- a/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a62169f1fa358be8f330ea8519ade0610fac525b Mon Sep 17 00:00:00 2001
-From: Adam Gajda <adgajda@users.noreply.github.com>
-Date: Mon, 2 Oct 2023 16:40:31 +0200
-Subject: [PATCH] Fix configuration of NETSNMP_FD_MASK_TYPE
-
-Upstream: https://github.com/net-snmp/net-snmp/commit/a62169f1fa358be8f330ea8519ade0610fac525b
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure                        | 2 +-
- configure.d/config_project_types | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 9f0a173d8a..945a27c663 100755
---- a/configure
-+++ b/configure
-@@ -30871,7 +30871,7 @@ CFLAGS="$CFLAGS -Werror"
- 
- { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
- printf %s "checking for the type of fd_set::fds_bits... " >&6; }
--for type in __fd_mask __int32_t unknown; do
-+for type in __fd_mask __int32_t long\ int unknown; do
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
-diff --git a/configure.d/config_project_types b/configure.d/config_project_types
-index 1b4c66b95e..a78e8ebb06 100644
---- a/configure.d/config_project_types
-+++ b/configure.d/config_project_types
-@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
- CFLAGS="$CFLAGS -Werror"
- 
- AC_MSG_CHECKING([for the type of fd_set::fds_bits])
--for type in __fd_mask __int32_t unknown; do
-+for type in __fd_mask __int32_t long\ int unknown; do
-   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
- #include <sys/select.h>
- #include <stddef.h>
diff --git a/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch b/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
new file mode 100644
index 0000000000..3a6321d7a7
--- /dev/null
+++ b/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
@@ -0,0 +1,72 @@
+From b07627fa67c686b07d1eab123cf3e4887a2a93aa Mon Sep 17 00:00:00 2001
+From: Bill Fenner <fenner@gmail.com>
+Date: Fri, 25 Nov 2022 08:41:24 -0800
+Subject: [PATCH] snmp_agent: disallow SET with NULL varbind
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/4589352dac3ae111c7621298cf231742209efd9b
+
+[Thomas: this commit was merged as part of
+https://github.com/net-snmp/net-snmp/pull/490/commits, which fixes
+https://github.com/net-snmp/net-snmp/issues/474 (CVE-2022-44792) and
+https://github.com/net-snmp/net-snmp/issues/475 (CVE-2022-44793). The
+other two commits merged as part of this pull request are related to
+adding a non-regression test for this, which is not relevant for the
+security fix itself.]
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ agent/snmp_agent.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/agent/snmp_agent.c b/agent/snmp_agent.c
+index 867d0c166f..3f678fe2df 100644
+--- a/agent/snmp_agent.c
++++ b/agent/snmp_agent.c
+@@ -3719,12 +3719,44 @@ netsnmp_handle_request(netsnmp_agent_session *asp, int status)
+     return 1;
+ }
+ 
++static int
++check_set_pdu_for_null_varbind(netsnmp_agent_session *asp)
++{
++    int i;
++    netsnmp_variable_list *v = NULL;
++
++    for (i = 1, v = asp->pdu->variables; v != NULL; i++, v = v->next_variable) {
++	if (v->type == ASN_NULL) {
++	    /*
++	     * Protect SET implementations that do not protect themselves
++	     * against wrong type.
++	     */
++	    DEBUGMSGTL(("snmp_agent", "disallowing SET with NULL var for varbind %d\n", i));
++	    asp->index = i;
++	    return SNMP_ERR_WRONGTYPE;
++	}
++    }
++    return SNMP_ERR_NOERROR;
++}
++
+ int
+ handle_pdu(netsnmp_agent_session *asp)
+ {
+     int             status, inclusives = 0;
+     netsnmp_variable_list *v = NULL;
+ 
++#ifndef NETSNMP_NO_WRITE_SUPPORT
++    /*
++     * Check for ASN_NULL in SET request
++     */
++    if (asp->pdu->command == SNMP_MSG_SET) {
++	status = check_set_pdu_for_null_varbind(asp);
++	if (status != SNMP_ERR_NOERROR) {
++	    return status;
++	}
++    }
++#endif /* NETSNMP_NO_WRITE_SUPPORT */
++
+     /*
+      * for illegal requests, mark all nodes as ASN_NULL 
+      */
+-- 
+2.41.0
+
diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index 7898941271..e1e9d10898 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature at
-# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.4/net-snmp-5.9.4.tar.gz.asc
-# using key 6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB
-sha256  8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544  net-snmp-5.9.4.tar.gz
+# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.3/net-snmp-5.9.3.tar.gz.asc
+# using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
+sha256  2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a  net-snmp-5.9.3.tar.gz
 
 # Hash for license file
 sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index b5cda30a7b..fafd604879 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.9.4
+NETSNMP_VERSION = 5.9.3
 NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
+# 0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
+NETSNMP_IGNORE_CVES = \
+	CVE-2022-44792 \
+	CVE-2022-44793
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
