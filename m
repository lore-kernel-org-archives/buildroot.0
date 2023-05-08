Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898B0C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD9942123;
	Mon,  8 May 2023 21:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BD9942123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34d54wH6glpN; Mon,  8 May 2023 21:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC39841E46;
	Mon,  8 May 2023 21:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC39841E46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79B751BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E73D41E46
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E73D41E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmySg6TxuWbb for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 21:02:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F334404EE
 for <buildroot@buildroot.org>; Mon,  8 May 2023 21:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F334404EE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEE0986253; Mon,  8 May 2023 21:02:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 23:01:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5b8646c19937ce030598e0037df9da1c75be727
X-Git-Newrev: b20eb56440fd2a7b8f578bf9eda89160c8053434
X-Patchwork-Hint: ignore
Message-Id: <20230508210223.EEE0986253@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: fix building with zlib-ng
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
Content-Type: multipart/mixed; boundary="===============6593561293842817117=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6593561293842817117==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b20eb56440fd2a7b8f578bf9eda89160c8053434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current mupdf version fails to build when zlib-ng is used as the
zlib implementation. Add a patch to fix it.

This fixes the following build failure raised since the bump to
version 1.21.0 of the mupdf package in commit
3c2033cd2ace077e7dfaf58a2589b2a93a5fd7b0:

source/fitz/encode-basic.c: In function 'deflate_write':
source/fitz/encode-basic.c:343:27: error: 'UINT_MAX' undeclared (first use in this function)
  343 |         newbufsize = n >= UINT_MAX ? UINT_MAX : deflateBound(&state->z, n);
      |                           ^~~~~~~~
source/fitz/encode-basic.c:26:1: note: 'UINT_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?

Fixes: http://autobuild.buildroot.net/results/87128e9967cff20078c65ab847877aa44cc409d9

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...Add-missing-limits.h-include-for-UINT_MAX.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/mupdf/0001-Add-missing-limits.h-include-for-UINT_MAX.patch b/package/mupdf/0001-Add-missing-limits.h-include-for-UINT_MAX.patch
new file mode 100644
index 0000000000..95f2f86666
--- /dev/null
+++ b/package/mupdf/0001-Add-missing-limits.h-include-for-UINT_MAX.patch
@@ -0,0 +1,70 @@
+From ebce9f1b129ebc8f2b17afa02a4ffcb9453c11d9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
+Date: Mon, 24 Apr 2023 17:27:35 +0200
+Subject: [PATCH] Add missing limits.h include for UINT_MAX
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+encode-basic.c uses 'UINT_MAX', which is available in the 'limits.h'
+header.
+
+In some configurations that build with zlib from [1], by chance
+limits.h gets indirectly included when including 'z-imp.h' (the
+includes are: 'z-imp.h' -> 'zlib.h' -> 'zconf.h' -> 'limits.h'), so
+the build succeeds.
+
+When using other zlib implementations however (for example from [2]),
+limits.h is not necessarily included indirectly, which leads to the
+build failing in the following way:
+
+source/fitz/encode-basic.c: In function 'deflate_write':
+source/fitz/encode-basic.c:343:27: error: 'UINT_MAX' undeclared (first use in this function)
+  343 |         newbufsize = n >= UINT_MAX ? UINT_MAX : deflateBound(&state->z, n);
+      |                           ^~~~~~~~
+source/fitz/encode-basic.c:26:1: note: 'UINT_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
+
+Add the missing include, so that the build succeeds no matter if zlib
+indirectly includes 'limit.h' or not.
+
+Similarly, also add it in output-ps.c where it's also missing.
+
+[1]: https://zlib.net/
+[2]: https://github.com/zlib-ng/zlib-ng
+
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+Upstream: https://bugs.ghostscript.com/show_bug.cgi?id=706667
+---
+ source/fitz/encode-basic.c | 2 ++
+ source/fitz/output-ps.c    | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/source/fitz/encode-basic.c b/source/fitz/encode-basic.c
+index 03a4ff76b..84f0c35e6 100644
+--- a/source/fitz/encode-basic.c
++++ b/source/fitz/encode-basic.c
+@@ -24,6 +24,8 @@
+ 
+ #include "z-imp.h"
+ 
++#include <limits.h>
++
+ struct ahx
+ {
+ 	fz_output *chain;
+diff --git a/source/fitz/output-ps.c b/source/fitz/output-ps.c
+index ef22c3cd6..3dc8ea17d 100644
+--- a/source/fitz/output-ps.c
++++ b/source/fitz/output-ps.c
+@@ -24,6 +24,8 @@
+ 
+ #include "z-imp.h"
+ 
++#include <limits.h>
++
+ typedef struct ps_band_writer_s
+ {
+ 	fz_band_writer super;
+-- 
+2.39.1
+

--===============6593561293842817117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6593561293842817117==--
