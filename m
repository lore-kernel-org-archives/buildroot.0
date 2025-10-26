Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B06CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 15:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB7A40589;
	Sun, 26 Oct 2025 15:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SBeVbAOGkAn; Sun, 26 Oct 2025 15:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F144404FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F144404FF;
	Sun, 26 Oct 2025 15:48:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A34DD7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7165D828DA
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57TtUCvxd45p for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 15:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 871A682893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 871A682893
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 871A682893
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:48:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AFA60A4C480B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:48:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47790)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vD2z2-000000002HP-2G5J
 for buildroot@buildroot.org; Sun, 26 Oct 2025 15:48:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 16:48:40 +0100
Message-ID: <20251026154840.85480-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761493720;
 bh=v32/WSiBcIb5MaLm1+2YnU9QXCPB5NQd14C99AuU5Ws=;
 h=From:To:Subject:Date:From;
 b=0uavoIO0bIUW/wcB/ak6SgHlzoD6mmIgw8ssDuTxyK9urvt2h/WNXEaeWdEEZZ9j6
 iMjCZMyjTW/igcCbTj3bJ4AhBbnWl2Rp/h38OGt4cLs0PH6kA99Io3b6W+2WCy5nAT
 Bv9+ycqnTNHrhFbSHN03HBNVjiJc0TWlow3Nlb8dxzISWi8dDa/Xnr3CvHHwsdiIQb
 izPGXQuSeKqlQuni87HwkAAnZhCfWYoJl5paOA34+gO/SBf7KbVXlDIWVmxm8v7E+d
 Vanpw7wkQHRs6zOMxliSEi3qFQxnKDD+hnNDMxnkfiT7e03OL6Z/8W+JUBfLFXEBB9
 7L+Sl+Z+dJ+XA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=0uavoIO0
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: add upstream patches to
 fix musl build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bump of netsnmp to version 5.9.4 with buildroot commit
1799cfebfd5ea1312cce74b3807d4aad044bce67 broke musl builds:

../include/net-snmp/net-snmp-config.h:1614:30: error: unknown type name 'unknown'; did you mean 'union'?

due to broken detection of __fd_mask introduced in 5.9.4 by upstream
commit https://github.com/net-snmp/net-snmp/commit/97df191ff8b16bdc53ba95d2a1c064d2a4666ae6

Added two upstream patches for __fd_mask detection to fix musl builds.

Fixes:
https://autobuild.buildroot.net/results/9d7/9d75061ca917689381c3b32f3e01640701d833a7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...onfiguration-of-NETSNMP_FD_MASK_TYPE.patch | 39 +++++++++
 .../netsnmp/0003-Android-Fix-the-build.patch  | 81 +++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 package/netsnmp/0002-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
 create mode 100644 package/netsnmp/0003-Android-Fix-the-build.patch

diff --git a/package/netsnmp/0002-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch b/package/netsnmp/0002-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
new file mode 100644
index 0000000000..cc45957c59
--- /dev/null
+++ b/package/netsnmp/0002-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
@@ -0,0 +1,39 @@
+From af1b7f77975bbb2fcbdb3f005f8cb010d1d33cd3 Mon Sep 17 00:00:00 2001
+From: Adam Gajda <adgajda@users.noreply.github.com>
+Date: Mon, 2 Oct 2023 16:40:31 +0200
+Subject: [PATCH] Fix configuration of NETSNMP_FD_MASK_TYPE
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/af1b7f77975bbb2fcbdb3f005f8cb010d1d33cd3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure                        | 2 +-
+ configure.d/config_project_types | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 50522690f5..5512349926 100755
+--- a/configure
++++ b/configure
+@@ -31577,7 +31577,7 @@ CFLAGS="$CFLAGS -Werror"
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
diff --git a/package/netsnmp/0003-Android-Fix-the-build.patch b/package/netsnmp/0003-Android-Fix-the-build.patch
new file mode 100644
index 0000000000..5cf37a0cb6
--- /dev/null
+++ b/package/netsnmp/0003-Android-Fix-the-build.patch
@@ -0,0 +1,81 @@
+From b4598662a39ff6974119c900ea56a4d020eac366 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Wed, 20 Dec 2023 13:08:06 -0800
+Subject: [PATCH] Android: Fix the build
+
+Include <sys/select.h> for the fd_set type. In the configure script,
+check whether 'unsigned long' is the underlying type of fd_set. Use
+u_long instead of ulong.
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/b4598662a39ff6974119c900ea56a4d020eac366
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ agent/mibgroup/ip-mib/data_access/ipaddress_linux.c | 4 ++--
+ configure                                           | 2 +-
+ configure.d/config_project_types                    | 2 +-
+ include/net-snmp/types.h                            | 3 +++
+ 4 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
+index b38beb57dd..232202d0f9 100644
+--- a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
++++ b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
+@@ -50,7 +50,7 @@ int _load_v6(netsnmp_container *container, int idx_offset);
+ int
+ netsnmp_access_ipaddress_extra_prefix_info(int index,
+                                            u_long *preferedlt,
+-                                           ulong *validlt,
++                                           u_long *validlt,
+                                            char *addr);
+ #endif
+ 
+@@ -523,7 +523,7 @@ netsnmp_access_other_info_get(int index, int family)
+ 
+ int
+ netsnmp_access_ipaddress_extra_prefix_info(int index, u_long *preferedlt,
+-                                           ulong *validlt, char *addr)
++                                           u_long *validlt, char *addr)
+ {
+ 
+     struct {
+diff --git a/configure b/configure
+index e7bf859bba..48abcbab11 100755
+--- a/configure
++++ b/configure
+@@ -31577,7 +31577,7 @@ CFLAGS="$CFLAGS -Werror"
+ 
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
+ printf %s "checking for the type of fd_set::fds_bits... " >&6; }
+-for type in __fd_mask __int32_t long\ int unknown; do
++for type in __fd_mask __int32_t long 'unsigned long' unknown; do
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+diff --git a/configure.d/config_project_types b/configure.d/config_project_types
+index a78e8ebb06..ac958d6712 100644
+--- a/configure.d/config_project_types
++++ b/configure.d/config_project_types
+@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
+ CFLAGS="$CFLAGS -Werror"
+ 
+ AC_MSG_CHECKING([for the type of fd_set::fds_bits])
+-for type in __fd_mask __int32_t long\ int unknown; do
++for type in __fd_mask __int32_t long 'unsigned long' unknown; do
+   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
+ #include <sys/select.h>
+ #include <stddef.h>
+diff --git a/include/net-snmp/types.h b/include/net-snmp/types.h
+index b78f53ffd7..6228170e5f 100644
+--- a/include/net-snmp/types.h
++++ b/include/net-snmp/types.h
+@@ -23,6 +23,9 @@
+ #endif
+ 
+ #include <sys/types.h>
++#ifdef __ANDROID__
++#include <sys/select.h>
++#endif
+ 
+ #if defined(WIN32) && !defined(cygwin)
+ typedef HANDLE netsnmp_pid_t;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
