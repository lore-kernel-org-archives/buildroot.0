Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061E3C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7648770390;
	Fri, 28 Feb 2025 16:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFTDHVtO3WbW; Fri, 28 Feb 2025 16:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C72C6FC46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C72C6FC46;
	Fri, 28 Feb 2025 16:52:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D73B711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56D5042E0A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIYFYY7uOMOH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F97419C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06F97419C5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F22A286612; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 23:00:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0f3791f25f5039904765c33f1d8a812290caebb9
X-Git-Newrev: 001e777d507b972a580d75e3ac8d892eff72fbf2
X-Patchwork-Hint: ignore
Message-Id: <20250228162959.F22A286612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-pam: backport
 upstream patch to fix build issue
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1597487535853407353=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1597487535853407353==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=001e777d507b972a580d75e3ac8d892eff72fbf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We are seeing build issues with linux-pam in the autobuilders such as:

md5_crypt.c: In function 'Goodcrypt_md5':
md5_crypt.c:145:13: error: implicit declaration of function 'asprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
  145 |         if (asprintf(&passwd, "%s%.*s$%s", magic, sl, sp, buf) < 0)
      |             ^~~~~~~~
      |             vsprintf

This is due to the fact that <stdio.h> gets included without
_GNU_SOURCE being defined, and so the prototype of asprintf() is not
accessible, at least with uclibc-ng.

The _GNU_SOURCE definition is properly in linux-pam's config.h, but
config.h doesn't get properly included first everywhere. This issue
has been fixed upstream in the mean time, so we simply backport the
upstream patch.

Fixes:

  http://autobuild.buildroot.net/results/49b190b3fbae3cdca4c7a08b3ab5100a937ede9e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...build-consistently-include-config.h-first.patch | 180 +++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/package/linux-pam/0001-build-consistently-include-config.h-first.patch b/package/linux-pam/0001-build-consistently-include-config.h-first.patch
new file mode 100644
index 0000000000..e9f36b8a60
--- /dev/null
+++ b/package/linux-pam/0001-build-consistently-include-config.h-first.patch
@@ -0,0 +1,180 @@
+From cdba2c8cdba9b3500595624fb375c0dda266631b Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Fri, 30 Aug 2024 08:00:00 +0000
+Subject: [PATCH] build: consistently include config.h first
+
+Make sure that config.h is included before any system header.
+
+Upstream: https://github.com/linux-pam/linux-pam/commit/5d7eefb1883c557c7a027f68e966e2fae294a9b6
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libpam/pam_prelude.c                | 8 ++++----
+ modules/pam_namespace/argv_parse.c  | 2 ++
+ modules/pam_setquota/pam_setquota.c | 3 ++-
+ modules/pam_timestamp/sha1.c        | 2 +-
+ modules/pam_unix/audit.c            | 3 +--
+ modules/pam_unix/bigcrypt_main.c    | 2 ++
+ modules/pam_unix/md5.c              | 4 ++--
+ modules/pam_unix/md5_crypt.c        | 2 +-
+ modules/pam_unix/yppasswd.h         | 2 ++
+ 9 files changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/libpam/pam_prelude.c b/libpam/pam_prelude.c
+index 6c73bf5d..c62e2f2c 100644
+--- a/libpam/pam_prelude.c
++++ b/libpam/pam_prelude.c
+@@ -5,17 +5,17 @@
+  * (C) Sebastien Tricaud 2005 <toady@gscore.org>
+  */
+ 
+-#include <stdio.h>
+-#include <syslog.h>
+-
+ #ifdef PRELUDE
+ 
++#include "pam_private.h"
++
++#include <stdio.h>
++#include <syslog.h>
+ #include <libprelude/prelude.h>
+ #include <libprelude/prelude-log.h>
+ #include <libprelude/idmef-message-print.h>
+ 
+ #include "pam_prelude.h"
+-#include "pam_private.h"
+ 
+ 
+ #define ANALYZER_CLASS "pam"
+diff --git a/modules/pam_namespace/argv_parse.c b/modules/pam_namespace/argv_parse.c
+index ac7c9ae0..cbae7831 100644
+--- a/modules/pam_namespace/argv_parse.c
++++ b/modules/pam_namespace/argv_parse.c
+@@ -28,6 +28,8 @@
+  * Version 1.1, modified 2/27/1999
+  */
+ 
++#include "config.h"
++
+ #include <limits.h>
+ #include <stdlib.h>
+ #include <ctype.h>
+diff --git a/modules/pam_setquota/pam_setquota.c b/modules/pam_setquota/pam_setquota.c
+index c15fc669..73445e29 100644
+--- a/modules/pam_setquota/pam_setquota.c
++++ b/modules/pam_setquota/pam_setquota.c
+@@ -8,6 +8,8 @@
+    Copyright © 2016 Keller Fuchs <kellerfuchs@hashbang.sh>
+ */
+ 
++#include "pam_inline.h"
++
+ #include <sys/types.h>
+ #include <sys/quota.h>
+ #include <linux/quota.h>
+@@ -22,7 +24,6 @@
+ #include <security/_pam_macros.h>
+ #include <security/pam_ext.h>
+ #include <security/pam_modutil.h>
+-#include "pam_inline.h"
+ 
+ #ifndef PATH_LOGIN_DEFS
+ # define PATH_LOGIN_DEFS "/etc/login.defs"
+diff --git a/modules/pam_timestamp/sha1.c b/modules/pam_timestamp/sha1.c
+index dff454cf..f21b2870 100644
+--- a/modules/pam_timestamp/sha1.c
++++ b/modules/pam_timestamp/sha1.c
+@@ -37,6 +37,7 @@
+  */
+ /* See http://www.itl.nist.gov/fipspubs/fip180-1.htm for descriptions. */
+ 
++#include "pam_inline.h"
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <netinet/in.h>
+@@ -47,7 +48,6 @@
+ #include <endian.h>
+ #include <unistd.h>
+ #include "sha1.h"
+-#include "pam_inline.h"
+ 
+ static const unsigned char
+ padding[SHA1_BLOCK_SIZE] = {
+diff --git a/modules/pam_unix/audit.c b/modules/pam_unix/audit.c
+index 1547a652..9513aaa9 100644
+--- a/modules/pam_unix/audit.c
++++ b/modules/pam_unix/audit.c
+@@ -1,5 +1,3 @@
+-#include "audit.h"
+-
+ #include "config.h"
+ 
+ #ifdef HAVE_LIBAUDIT
+@@ -11,6 +9,7 @@
+ 
+ #include <security/_pam_types.h>
+ 
++#include "audit.h"
+ #include "passverify.h"
+ 
+ int audit_log(int type, const char *uname, int retval)
+diff --git a/modules/pam_unix/bigcrypt_main.c b/modules/pam_unix/bigcrypt_main.c
+index fab212d9..22d325da 100644
+--- a/modules/pam_unix/bigcrypt_main.c
++++ b/modules/pam_unix/bigcrypt_main.c
+@@ -1,3 +1,5 @@
++#include "config.h"
++
+ #include <stdio.h>
+ #include <string.h>
+ 
+diff --git a/modules/pam_unix/md5.c b/modules/pam_unix/md5.c
+index 95b8de4c..78e9af27 100644
+--- a/modules/pam_unix/md5.c
++++ b/modules/pam_unix/md5.c
+@@ -18,11 +18,11 @@
+  *
+  */
+ 
++#include "pam_inline.h"
++
+ #include <string.h>
+ #include "md5.h"
+ 
+-#include "pam_inline.h"
+-
+ #ifndef HIGHFIRST
+ #define byteReverse(buf, len)	/* Nothing */
+ #else
+diff --git a/modules/pam_unix/md5_crypt.c b/modules/pam_unix/md5_crypt.c
+index 9a6bd4f9..9451f376 100644
+--- a/modules/pam_unix/md5_crypt.c
++++ b/modules/pam_unix/md5_crypt.c
+@@ -12,11 +12,11 @@
+  *
+  */
+ 
++#include "pam_inline.h"
+ #include <string.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include "md5.h"
+-#include "pam_inline.h"
+ 
+ static const unsigned char itoa64[] =	/* 0 ... 63 => ascii - 64 */
+ "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
+diff --git a/modules/pam_unix/yppasswd.h b/modules/pam_unix/yppasswd.h
+index dc686cd7..3a40c3ea 100644
+--- a/modules/pam_unix/yppasswd.h
++++ b/modules/pam_unix/yppasswd.h
+@@ -6,6 +6,8 @@
+ #ifndef _YPPASSWD_H_RPCGEN
+ #define _YPPASSWD_H_RPCGEN
+ 
++#include "config.h"
++
+ #include <rpc/rpc.h>
+ 
+ 
+-- 
+2.47.1
+

--===============1597487535853407353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1597487535853407353==--
