Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284B8C7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 09:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74EB83C56;
	Fri,  9 Jun 2023 09:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B74EB83C56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ee9ICTG6HV7M; Fri,  9 Jun 2023 09:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD3284199;
	Fri,  9 Jun 2023 09:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD3284199
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 896E01BF97F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 09:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B0D83C56
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 09:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63B0D83C56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqlyzHozyWkm for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FEE683FE7
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FEE683FE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BCF88256D; Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Jun 2023 10:10:36 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6bff385173bcd6628bd34a2c09c3253a6d057f8d
X-Git-Newrev: d9f2fa8e63c35bdd79412902546f46a825d01305
X-Patchwork-Hint: ignore
Message-Id: <20230609091042.5BCF88256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mupdf: fix
 building with zlib-ng
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
Content-Type: multipart/mixed; boundary="===============8564695534579925388=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8564695534579925388==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d9f2fa8e63c35bdd79412902546f46a825d01305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit b20eb56440fd2a7b8f578bf9eda89160c8053434)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============8564695534579925388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8564695534579925388==--
