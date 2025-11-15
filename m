Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3535CEB2CC
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 11:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3965F842EC;
	Sat, 15 Nov 2025 11:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBo2RJfFqkEP; Sat, 15 Nov 2025 11:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 428B4842ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 428B4842ED;
	Sat, 15 Nov 2025 11:33:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28F50158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 11:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17FDE60627
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 11:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlQux6GyBd7M for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 11:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10E75605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10E75605FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10E75605FC
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 11:33:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2841BA4C65D6;
 Sat, 15 Nov 2025 12:33:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54136)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKEXL-000000001wB-36C1;
 Sat, 15 Nov 2025 11:33:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Nov 2025 12:33:47 +0100
Message-ID: <20251115113347.183802-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763206428;
 bh=oYqrABRz8oXbb3/fNQuRbUfO4HzWarQ/AxV8X7XA7uo=;
 h=From:To:Cc:Subject:Date:From;
 b=G89pwInDN2yULozRMfy5wWeBfMblr4H+8maIfLfita/qkBe/nlxMeFV+YV2lduiO4
 iKThToJKW9X0Qi1W7hq3BfufOQooAioEDJ7BV8n3aByq3J675Z6fgahPH/F93mGSOf
 lM/aKSbcilD0iJoMtLq7ldZe783+oWsQPYsJHtkLhHWdpAOLCH9dgDUw+Y3G65Q1QD
 GGjlLhuuiZIMoG0F4y0w776xTP4jd7Bl9Qi5SOZeJWoccLMrSSjSMmEpfZ8SbIyEOO
 CCMh6Fkh4So999RnO149UjrdRrEgk6YwyZ6v9HiTWG92p0CogpQlP2YpmMwI/oKdo6
 OVBwaCC1pEwnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=G89pwInD
Subject: [Buildroot] [PATCH 1/1] package/libroxml: fix musl build errors
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

Fixes:
https://autobuild.buildroot.net/results/0ff/0ff4394319d2014884328c347ef495da327a562e/

Added Upstream tag to patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...1-src-roxml_mem.h-add-missing-extern.patch |  3 +-
 .../libroxml/0002-Fix-musl-build-errors.patch | 69 +++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 package/libroxml/0002-Fix-musl-build-errors.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 42a04d2a6b..4821f41cce 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -596,7 +596,6 @@ package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch
 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch lib_patch.Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch lib_patch.Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch lib_patch.Upstream
-package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch lib_patch.Upstream
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch lib_patch.Upstream
 package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch lib_patch.Upstream
 package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch lib_patch.Upstream
diff --git a/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch b/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
index 6f63d7b546..12e67f9c91 100644
--- a/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
+++ b/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
@@ -13,8 +13,9 @@ libtool: link: /home/peko/autobuild/instance-0/output-1/host/bin/arm-buildroot-l
 Fixes:
  - http://autobuild.buildroot.org/results/b6ac3664d61ad826515b57c4d057b6f001b5167d
 
+Upstream: https://github.com/blunderer/libroxml/commit/34257124eefe0ca095ed54681c818381070ed549
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/blunderer/libroxml/pull/79]
 ---
  src/roxml_mem.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/libroxml/0002-Fix-musl-build-errors.patch b/package/libroxml/0002-Fix-musl-build-errors.patch
new file mode 100644
index 0000000000..4931f12d5b
--- /dev/null
+++ b/package/libroxml/0002-Fix-musl-build-errors.patch
@@ -0,0 +1,69 @@
+From abf4404c6c0213666f3fce73cff6e51435eac923 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 15 Nov 2025 12:29:33 +0100
+Subject: [PATCH] Fix musl build errors
+
+src/roxml_cat.c: In function 'display_usage':
+src/roxml_cat.c:21:22: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Wimplicit-function-declaration]
+   21 |         char *name = basename(prgname);
+      |                      ^~~~~~~~
+      |                      rename
+src/roxml_cat.c:21:22: error: initialization of 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
+
+src/roxml_mem.c: In function 'roxml_malloc':
+src/roxml_mem.c:138:18: error: assignment to 'long unsigned int' from 'pthread_t' {aka 'struct __pthread *'} makes integer from pointer without a cast [-Wint-conversion]
+  138 |         cell->id = pthread_self();
+
+src/roxml_utils.h:51:16: error: returning 'pthread_t' {aka 'struct __pthread *'} from a function with return type 'long unsigned int' makes integer from pointer without a cast [-Wint-conversion]
+   51 |         return pthread_self();
+
+Upstream: https://github.com/blunderer/libroxml/pull/86
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/roxml_cat.c   | 1 +
+ src/roxml_mem.c   | 2 +-
+ src/roxml_utils.h | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/roxml_cat.c b/src/roxml_cat.c
+index 11e42d9..4320efd 100644
+--- a/src/roxml_cat.c
++++ b/src/roxml_cat.c
+@@ -5,6 +5,7 @@
+ #include <getopt.h>
+ #include <string.h>
+ #include <errno.h>
++#include <libgen.h>
+ #include "roxml.h"
+ 
+ static struct option long_options[] =
+diff --git a/src/roxml_mem.c b/src/roxml_mem.c
+index 91b5db2..bf757bb 100644
+--- a/src/roxml_mem.c
++++ b/src/roxml_mem.c
+@@ -135,7 +135,7 @@ ROXML_INT void *roxml_malloc(int size, int num, int type)
+ 	cell->next->prev = cell;
+ 	cell = cell->next;
+ 	cell->type = type;
+-	cell->id = pthread_self();
++	cell->id = (unsigned long)pthread_self();
+ 	cell->occ = size;
+ 	cell->ptr = calloc(num, size);
+ 	head_cell.prev = cell;
+diff --git a/src/roxml_utils.h b/src/roxml_utils.h
+index 3f50976..f5fc582 100644
+--- a/src/roxml_utils.h
++++ b/src/roxml_utils.h
+@@ -48,7 +48,7 @@ ROXML_STATIC_INLINE ROXML_INT int roxml_unlock(node_t *n)
+ #else /* CONFIG_XML_THREAD_SAFE==1 */
+ ROXML_STATIC_INLINE ROXML_INT unsigned long int roxml_thread_id(node_t *n)
+ {
+-	return pthread_self();
++	return (unsigned long)pthread_self();
+ }
+ 
+ ROXML_STATIC_INLINE ROXML_INT int roxml_lock_init(node_t *n)
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
