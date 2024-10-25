Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAD9D149D9
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 18:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E13381EE1;
	Fri, 25 Oct 2024 18:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5o4tpX43w6D; Fri, 25 Oct 2024 18:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F71E81EE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F71E81EE2;
	Fri, 25 Oct 2024 18:00:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D881281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 18:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C4D340E8C
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 18:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfJcTrXCUyPe for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 18:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A728A40159
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A728A40159
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 18:00:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90098837A0; Fri, 25 Oct 2024 18:00:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 19:53:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f634043b29c7009cca02516e181d55bb589045c4
X-Git-Newrev: b6784a1f1f67439ce24e7961851d3c5670df4e83
X-Patchwork-Hint: ignore
Message-Id: <20241025180041.90098837A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lrzsz: fix build with GCC >= 14.x
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
Content-Type: multipart/mixed; boundary="===============1122090020393127822=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1122090020393127822==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b6784a1f1f67439ce24e7961851d3c5670df4e83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lrzsz package currently fails to build with GCC >= 14.x. In [1],
Fabrice had proposed to update the package to what's available on a
Github repository from the upstream maintainer at [2], but in this
very repository (not updated since 4 years), the maintainer writes:

  NOTE:

  Do not use the repository until further notice.
  It contains work in progress and at least one change i am unhappy with.

  Use either http://ohse.de/uwe/testing/lrzsz-0.12.21rc.tar.gz (over
  20 years in rc state, so it's good enough), or 0.12.20 from
  https://ohse.de/uwe/software/lrzsz.html (do not expect me to update
  that old site ever again).

So, let's stick to the 0.12.20 version we have, and add a few patches.

Patch 0001 is patching the configure script, which we obviously don't
normally like. However, the configure.in script is very old and no
longer autoreconfs properly with modern autoconf. Since the patch is
trivial, and upstream seems almost dead, we take the route of patching
the configure script.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240726092042.1273023-1-fontaine.fabrice@gmail.com/
[2] https://github.com/UweOhse/lrzsz

Fixes:

  http://autobuild.buildroot.net/results/3eb94eac3e0e1a04d41c618ed9ea2e4e398ea48a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../lrzsz/0001-configure-fix-main-prototype.patch  | 32 ++++++++++++++++
 .../0002-lib-long-options.c-include-stdlib.h.patch | 44 ++++++++++++++++++++++
 .../0003-include-stdio.h-to-remove-warning.patch   | 26 +++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/package/lrzsz/0001-configure-fix-main-prototype.patch b/package/lrzsz/0001-configure-fix-main-prototype.patch
new file mode 100644
index 0000000000..46b7aade00
--- /dev/null
+++ b/package/lrzsz/0001-configure-fix-main-prototype.patch
@@ -0,0 +1,32 @@
+From 43b2b711fedd3a28d497b3a5c0e9054fa203ef3d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 15 Sep 2024 15:12:07 +0200
+Subject: [PATCH] configure: fix main() prototype
+
+The pre-generated configure script has a check that doesn't work with
+GCC >= 14.x due to a partial main() prototype. Doing AUTORECONF = YES
+doesn't work as the configure.in is very old, so let's fix the
+configure script directly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: N/A, patching generated file
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index db26726..d160e27 100755
+--- a/configure
++++ b/configure
+@@ -1008,7 +1008,7 @@ cross_compiling=$ac_cv_prog_cc_cross
+ cat > conftest.$ac_ext <<EOF
+ #line 1010 "configure"
+ #include "confdefs.h"
+-main(){return(0);}
++int main(){return(0);}
+ EOF
+ if { (eval echo configure:1014: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest; then
+   ac_cv_prog_cc_works=yes
+-- 
+2.46.0
+
diff --git a/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch b/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch
new file mode 100644
index 0000000000..6229114e0a
--- /dev/null
+++ b/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch
@@ -0,0 +1,44 @@
+From aa6779c2846f13bf58575486b374ef06b2844fe8 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 21 May 2024 11:13:17 +0200
+Subject: [PATCH] lib/long-options.c: include stdlib.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the following error (compiled with GCC 14.x):
+
+long-options.c:70:11: error: implicit declaration of function ‘exit’
+[-Wimplicit-function-declaration]
+   70 |           exit (0);
+      |           ^~~~
+
+Upstream: https://github.com/UweOhse/lrzsz/pull/4
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/long-options.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/long-options.c b/lib/long-options.c
+index 76b9796..19c84e0 100644
+--- a/lib/long-options.c
++++ b/lib/long-options.c
+@@ -22,6 +22,15 @@
+ #endif
+ 
+ #include <stdio.h>
++
++/* This needs to come after some library #include
++   to get __GNU_LIBRARY__ defined.  */
++#ifdef	__GNU_LIBRARY__
++/* Don't include stdlib.h for non-GNU C libraries because some of them
++   contain conflicting prototypes for getopt.  */
++#include <stdlib.h>
++#endif	/* GNU C library.  */
++
+ #include <getopt.h>
+ #include "long-options.h"
+ 
+-- 
+2.46.0
+
diff --git a/package/lrzsz/0003-include-stdio.h-to-remove-warning.patch b/package/lrzsz/0003-include-stdio.h-to-remove-warning.patch
new file mode 100644
index 0000000000..e4a958cdfa
--- /dev/null
+++ b/package/lrzsz/0003-include-stdio.h-to-remove-warning.patch
@@ -0,0 +1,26 @@
+From e164c9cd3207321e162f054357fcd37b06cb0b8a Mon Sep 17 00:00:00 2001
+From: Uwe Ohse <uwe@ohse.de>
+Date: Mon, 2 Mar 2020 22:38:16 +0000
+Subject: [PATCH] include stdio.h to remove warning
+
+Upstream: https://github.com/UweOhse/lrzsz/commit/937a2ff696fb600672eb0e8fab87f75d5e4fbc25
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/lsyslog.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lsyslog.c b/src/lsyslog.c
+index 6baf4a2..d21ab35 100644
+--- a/src/lsyslog.c
++++ b/src/lsyslog.c
+@@ -24,6 +24,7 @@
+ #include <pwd.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <stdio.h>
+ #endif
+ 
+ #if __STDC__
+-- 
+2.46.0
+

--===============1122090020393127822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1122090020393127822==--
