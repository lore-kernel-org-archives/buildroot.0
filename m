Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E434EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A420C40271;
	Sat,  1 Jan 2022 21:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ci6KgfWFgwLx; Sat,  1 Jan 2022 21:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB7534026E;
	Sat,  1 Jan 2022 21:38:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 471591BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E6EE60A9C
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQbA_PdQc7Xo for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:38:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC0960594
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:38:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2F50F82A1F; Sat,  1 Jan 2022 21:32:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 22:37:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 540029eb4550760c2190a18ecbf0cb4391bb1dea
X-Git-Newrev: 0629443499230b1dd4ab77c3e469d778ad1b2a66
X-Patchwork-Hint: ignore
Message-Id: <20220101213259.2F50F82A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=0629443499230b1dd4ab77c3e469d778ad1b2a66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure with alsa-utils raised since bump
to version 1.2.6 in commit 4d4a588a504a6446dd0a29a353d94c6e86cfd879:

checking for snd_tplg_new in -latopology... no
configure: error: No linkable libatopology was found.

Fixes:
 - http://autobuild.buildroot.org/results/08d028004090b2a8292f03910cb9bf80a73ac804

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...y-parser.c-drop-duplicate-safe_strtol_bas.patch | 51 +++++++++++++
 ...rt-of-safe_strto-functions-from-libasound.patch | 88 ++++++++++++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch b/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch
new file mode 100644
index 0000000000..a3741c42c0
--- /dev/null
+++ b/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch
@@ -0,0 +1,51 @@
+From 47252054b4a2d5c8382cb1342f5d4eb89dabf95f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 1 Jan 2022 17:20:47 +0100
+Subject: [PATCH] src/topology/parser.c: drop duplicate safe_strtol_base
+
+The safe_strtol_base() function is defined twice since
+	f547b2e3 ("conf: introduce safe_strtol_base()") and
+	5fab157a ("topology: do not call strtol directly")
+resulting in the following build failure when alsa-utils is built
+statically because safe_strtol_base is defined twice.
+
+Fixes: http://autobuild.buildroot.org/results/08d028004090b2a8292f03910cb9bf80a73ac804
+Fixes: https://github.com/alsa-project/alsa-lib/pull/207
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+[Retrieved from:
+https://github.com/alsa-project/alsa-lib/commit/47252054b4a2d5c8382cb1342f5d4eb89dabf95f]
+---
+ src/topology/parser.c | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/src/topology/parser.c b/src/topology/parser.c
+index 01c95afa..e70173f6 100644
+--- a/src/topology/parser.c
++++ b/src/topology/parser.c
+@@ -21,25 +21,6 @@
+ #include "list.h"
+ #include "tplg_local.h"
+ 
+-/*
+- * Safe strtol call
+- */
+-int safe_strtol_base(const char *str, long *val, int base)
+-{
+-	char *end;
+-	long v;
+-	if (!*str)
+-		return -EINVAL;
+-	errno = 0;
+-	v = strtol(str, &end, base);
+-	if (errno)
+-		return -errno;
+-	if (*end)
+-		return -EINVAL;
+-	*val = v;
+-	return 0;
+-}
+-
+ /*
+  * Get integer value
+  */
diff --git a/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch b/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch
new file mode 100644
index 0000000000..3dfcb78b5c
--- /dev/null
+++ b/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch
@@ -0,0 +1,88 @@
+From c687c482107f746332dd18f7407f6c6efbffccb2 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Sat, 1 Jan 2022 19:18:25 +0100
+Subject: [PATCH] conf: fix the export of safe_strto* functions from libasound
+
+Only one library should define the safe_strto function. Export it
+correctly and add _snd_ prefix to avoid possible clashes with the other
+application code.
+
+Fixes: 47252054 ("src/topology/parser.c: drop duplicate safe_strtol_base")
+Fixes: https://github.com/alsa-project/alsa-lib/pull/208
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+[Retrieved from:
+https://github.com/alsa-project/alsa-lib/commit/c687c482107f746332dd18f7407f6c6efbffccb2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/local.h | 8 ++++++--
+ src/Versions.in | 6 ++++++
+ src/conf.c      | 6 +++---
+ 3 files changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/include/local.h b/include/local.h
+index ebc9350c..f64fe9d8 100644
+--- a/include/local.h
++++ b/include/local.h
+@@ -232,10 +232,14 @@ size_t page_align(size_t size);
+ size_t page_size(void);
+ size_t page_ptr(size_t object_offset, size_t object_size, size_t *offset, size_t *mmap_offset);
+ 
+-int safe_strtoll_base(const char *str, long long *val, int base);
++#define safe_strtoll_base _snd_safe_strtoll_base
++int _snd_safe_strtoll_base(const char *str, long long *val, int base);
+ static inline int safe_strtoll(const char *str, long long *val) { return safe_strtoll_base(str, val, 0); }
+-int safe_strtol_base(const char *str, long *val, int base);
++#define safe_strtol_base _snd_safe_strtol_base
++int _snd_safe_strtol_base(const char *str, long *val, int base);
+ static inline int safe_strtol(const char *str, long *val) { return safe_strtol_base(str, val, 0); }
++#define safe_strtod _snd_safe_strtod
++int _snd_safe_strtod(const char *str, double *val);
+ 
+ int snd_send_fd(int sock, void *data, size_t len, int fd);
+ int snd_receive_fd(int sock, void *data, size_t len, int *fd);
+diff --git a/src/Versions.in b/src/Versions.in
+index 5daccbd4..85031b38 100644
+--- a/src/Versions.in
++++ b/src/Versions.in
+@@ -134,3 +134,9 @@ ALSA_1.1.6 {
+ 
+     @SYMBOL_PREFIX@snd_dlopen;
+ } ALSA_0.9.7;
++
++ALSA_1.2.6 {
++  global:
++
++    @SYMBOL_PREFIX@_snd_safe_strto*;
++} ALSA_1.1.6;
+diff --git a/src/conf.c b/src/conf.c
+index d3597cbc..098ebd63 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -663,7 +663,7 @@ static int input_stdio_open(snd_input_t **inputp, const char *file,
+ 	return err;
+ }
+ 
+-int safe_strtoll_base(const char *str, long long *val, int base)
++int _snd_safe_strtoll_base(const char *str, long long *val, int base)
+ {
+ 	char *end;
+ 	long v;
+@@ -679,7 +679,7 @@ int safe_strtoll_base(const char *str, long long *val, int base)
+ 	return 0;
+ }
+ 
+-int safe_strtol_base(const char *str, long *val, int base)
++int _snd_safe_strtol_base(const char *str, long *val, int base)
+ {
+ 	char *end;
+ 	long v;
+@@ -695,7 +695,7 @@ int safe_strtol_base(const char *str, long *val, int base)
+ 	return 0;
+ }
+ 
+-static int safe_strtod(const char *str, double *val)
++int _snd_safe_strtod(const char *str, double *val)
+ {
+ 	char *end;
+ 	double v;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
