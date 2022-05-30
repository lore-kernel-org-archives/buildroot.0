Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C16FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 18:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1454760A7E;
	Mon, 30 May 2022 18:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKH7gE72agdM; Mon, 30 May 2022 18:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117D060A6F;
	Mon, 30 May 2022 18:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D48411BF38A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 18:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2EF1409DE
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 18:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hg6xeYS9QSBw for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 18:52:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC379409D0
 for <buildroot@buildroot.org>; Mon, 30 May 2022 18:52:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0706086733; Mon, 30 May 2022 18:41:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 20:47:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 727ca56d1426171052ccdc39e33dd72adbbbe1cf
X-Git-Newrev: 75301bf98821ccea20e38abeef41a15f0462be04
X-Patchwork-Hint: ignore
Message-Id: <20220530184106.0706086733@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libstrophe: bump to
 version 0.12.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4128649208216959765=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4128649208216959765==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=75301bf98821ccea20e38abeef41a15f0462be04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It requires a patch to fix a build issue, which has been submitted
upstream.

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libstrophe/0001-fix-ssize_t.patch | 49 +++++++++++++++++++++++++++++++
 package/libstrophe/libstrophe.hash        |  2 +-
 package/libstrophe/libstrophe.mk          |  2 +-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/0001-fix-ssize_t.patch b/package/libstrophe/0001-fix-ssize_t.patch
new file mode 100644
index 0000000000..39b456de57
--- /dev/null
+++ b/package/libstrophe/0001-fix-ssize_t.patch
@@ -0,0 +1,49 @@
+From f31ef9c35c9bba831510777d551c4179295b208f Mon Sep 17 00:00:00 2001
+From: Michael Vetter <jubalh@iodoru.org>
+Date: Mon, 30 May 2022 14:47:44 +0200
+Subject: [PATCH] Include sys/types.h for ssize_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling on buildroot I get:
+`src/tls.c:235:28: error: ‘ssize_t’ undeclared (first use in this
+function); did you mean ‘size_t’? `
+
+To have this POSIX type available we will need to include
+`sys/types.h` on Linux. Unsure about other systems.
+
+Upstream: https://github.com/strophe/libstrophe/pull/207
+Signed-off-by: Michael Vetter <jubalh@iodoru.org>
+---
+ src/rand.c | 1 +
+ src/tls.c  | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/rand.c b/src/rand.c
+index 061e85ee..25e4614a 100644
+--- a/src/rand.c
++++ b/src/rand.c
+@@ -28,6 +28,7 @@
+ #if __GLIBC_PREREQ(2, 25)
+ #define USE_GETRANDOM
+ #include <sys/random.h>
++#include <sys/types.h>
+ #include <errno.h>
+ #endif
+ #endif
+diff --git a/src/tls.c b/src/tls.c
+index 17d85dda..54746baa 100644
+--- a/src/tls.c
++++ b/src/tls.c
+@@ -21,6 +21,10 @@
+ #include <stdarg.h>
+ #include <string.h>
+ 
++#if defined(__linux__)
++#include <sys/types.h>
++#endif
++
+ #include "strophe.h"
+ 
+ #include "common.h"
diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index 9551b191c6..66ff0e7e7e 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  feafee545403d26a44aa573d4adf327d6d07ad3f3466370634d22bbac5bd49ee  libstrophe-0.11.0.tar.xz
+sha256  8e44acb26018816f9856626bd5ff924a36cc612d2b3747ee634d626326b72df7  libstrophe-0.12.0.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 04ba0a69d0..f48d073770 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.11.0
+LIBSTROPHE_VERSION = 0.12.0
 LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
 LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
 LIBSTROPHE_DEPENDENCIES = host-pkgconf

--===============4128649208216959765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4128649208216959765==--
