Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74D5ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 16:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0CEF41703;
	Sat, 17 Sep 2022 16:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0CEF41703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QeKZW-IyNDM; Sat, 17 Sep 2022 16:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83FA4417A9;
	Sat, 17 Sep 2022 16:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83FA4417A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE341BF48D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D822083F56
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D822083F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLU2Mh-hb5Gg for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 16:11:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE29183F63
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 16:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE29183F63
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD0488459E; Sat, 17 Sep 2022 16:11:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 18:11:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca9fbfd5eeab5ecd63b9e2a0ee882723105ba706
X-Git-Newrev: f640de44fac0c31e26e23a35b39d2b49b2060fbd
X-Patchwork-Hint: ignore
Message-Id: <20220917161148.BD0488459E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump version to 5.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f640de44fac0c31e26e23a35b39d2b49b2060fbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust CFLAGS to be able to compile on uclibc-ng < 1.0.42.

Remove patch from this release, backport 3 patches fixing build from
upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../iproute2/0001-bpf_glue-include-errno.h.patch   | 32 ---------------------
 .../0001-ipstats-Add-param.h-for-musl.patch        | 29 +++++++++++++++++++
 .../0002-ipstats-add-missing-headers.patch         | 33 ++++++++++++++++++++++
 ...efine-_GNU_SOURCE-when-checking-for-setns.patch | 29 +++++++++++++++++++
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  7 +++--
 6 files changed, 97 insertions(+), 35 deletions(-)

diff --git a/package/iproute2/0001-bpf_glue-include-errno.h.patch b/package/iproute2/0001-bpf_glue-include-errno.h.patch
deleted file mode 100644
index 9371344d00..0000000000
--- a/package/iproute2/0001-bpf_glue-include-errno.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f8decf82af07591833f89004e9b72cc39c1b5c52 Mon Sep 17 00:00:00 2001
-From: Juhee Kang <claudiajkang@gmail.com>
-Date: Tue, 19 Jul 2022 00:58:27 +0900
-Subject: [PATCH] bpf_glue: include errno.h
-
-If __NR_bpf is not enabled, bpf() function set errno and return -1. Thus,
-this patch includes the header.
-
-Fixes: ac4e0913beb1 ("bpf: Export bpf syscall wrapper")
-Signed-off-by: Juhee Kang <claudiajkang@gmail.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-[ upstream status: f8decf82af07591833f89004e9b72cc39c1b5c52 ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- lib/bpf_glue.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/bpf_glue.c b/lib/bpf_glue.c
-index c1cf351b..88a24751 100644
---- a/lib/bpf_glue.c
-+++ b/lib/bpf_glue.c
-@@ -7,6 +7,7 @@
- #include <sys/syscall.h>
- #include <limits.h>
- #include <unistd.h>
-+#include <errno.h>
- 
- #include "bpf_util.h"
- #ifdef HAVE_LIBBPF
--- 
-2.37.1
-
diff --git a/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch b/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
new file mode 100644
index 0000000000..db6982ab8b
--- /dev/null
+++ b/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
@@ -0,0 +1,29 @@
+From cf6b60c504d4be5e1df2b2745e55d677967831d0 Mon Sep 17 00:00:00 2001
+From: Changhyeok Bae <changhyeok.bae@gmail.com>
+Date: Tue, 9 Aug 2022 04:01:05 +0000
+Subject: [PATCH] ipstats: Add param.h for musl
+
+Fix build error for musl
+| /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipstats.c:231: undefined reference to `MIN'
+
+Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
+[ upstream status: cf6b60c504d4be5e1df2b2745e55d677967831d0 ]
+---
+ ip/ipstats.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ip/ipstats.c b/ip/ipstats.c
+index 5cdd15ae..1ac275bd 100644
+--- a/ip/ipstats.c
++++ b/ip/ipstats.c
+@@ -1,6 +1,7 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ #include <assert.h>
+ #include <errno.h>
++#include <sys/param.h>
+
+ #include "list.h"
+ #include "utils.h"
+--
+2.37.2
+
diff --git a/package/iproute2/0002-ipstats-add-missing-headers.patch b/package/iproute2/0002-ipstats-add-missing-headers.patch
new file mode 100644
index 0000000000..d4b9a5d10d
--- /dev/null
+++ b/package/iproute2/0002-ipstats-add-missing-headers.patch
@@ -0,0 +1,33 @@
+From 28c740473510cd911b97cc5d7d23bd809a0f200b Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Tue, 9 Aug 2022 13:27:33 -0700
+Subject: [PATCH] ipstats: add missing headers
+
+IWYU reports several headers are not explicitly
+included by ipstats.
+
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+[ upstream status: 28c740473510cd911b97cc5d7d23bd809a0f200b]
+---
+ ip/ipstats.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ip/ipstats.c b/ip/ipstats.c
+index 1ac275bd..dadded14 100644
+--- a/ip/ipstats.c
++++ b/ip/ipstats.c
+@@ -1,7 +1,11 @@
+ // SPDX-License-Identifier: GPL-2.0+
++#include <alloca.h>
+ #include <assert.h>
+ #include <errno.h>
++#include <stdio.h>
++#include <string.h>
+ #include <sys/param.h>
++#include <sys/socket.h>
+
+ #include "list.h"
+ #include "utils.h"
+--
+2.37.2
+
diff --git a/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch b/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
new file mode 100644
index 0000000000..a5076d7711
--- /dev/null
+++ b/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
@@ -0,0 +1,29 @@
+From d5fe96ab70928508f072a47449e9b641e46de323 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 22:34:40 -0700
+Subject: [PATCH] configure: Define _GNU_SOURCE when checking for setns
+
+glibc defines this function only as gnu extention
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+[ upstream status: d5fe96ab70928508f072a47449e9b641e46de323 ]
+---
+ configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure b/configure
+index 440facb7..c02753bb 100755
+--- a/configure
++++ b/configure
+@@ -191,6 +191,7 @@ check_ipt_lib_dir()
+ check_setns()
+ {
+     cat >$TMPDIR/setnstest.c <<EOF
++#define _GNU_SOURCE
+ #include <sched.h>
+ int main(int argc, char **argv)
+ {
+-- 
+2.37.2
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 2bb1ddbc72..a4b0e62c02 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  5ba3d464d51c8c283550d507ffac3d10f7aec587b7c66b0ccb6950643646389e  iproute2-5.18.0.tar.xz
+sha256  26b7a34d6a7fd2f7a42e2b39c5a90cb61bac522d1096067ffeb195e5693d7791  iproute2-5.19.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index b9347ed367..5c3595d5f4 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.18.0
+IPROUTE2_VERSION = 5.19.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
@@ -43,9 +43,12 @@ define IPROUTE2_CONFIGURE_CMDS
 	$(IPROUTE2_DISABLE_IPTABLES)
 endef
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+IPROUTE2_CFLAGS = $(TARGET_CFLAGS) -Dstatic_assert=_Static_assert
+
 define IPROUTE2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) LDFLAGS="$(TARGET_LDFLAGS)" \
-		CFLAGS="$(TARGET_CFLAGS) -DXT_LIB_DIR=\\\"/usr/lib/xtables\\\"" \
+		CFLAGS="$(IPROUTE2_CFLAGS) -DXT_LIB_DIR=\\\"/usr/lib/xtables\\\"" \
 		CBUILD_CFLAGS="$(HOST_CFLAGS)" $(MAKE) V=1 LIBDB_LIBS=-lpthread \
 		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
 		SHARED_LIBS="$(if $(BR2_STATIC_LIBS),n,y)" -C $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
