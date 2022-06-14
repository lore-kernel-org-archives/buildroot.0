Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0406C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 871574184E;
	Tue, 14 Jun 2022 18:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWa41ADOddIe; Tue, 14 Jun 2022 18:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B11F4182F;
	Tue, 14 Jun 2022 18:51:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 144A11BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FCFE40E46
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epUCVWmePW13 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F208841296
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E0781870E1; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:33:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f26f32882ed90401863646927fd24a236156f846
X-Git-Newrev: a113597fe39b7728a1c9b29500aeb59f9b3f02fd
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.E0781870E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.7
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
Content-Type: multipart/mixed; boundary="===============3767160037316340236=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3767160037316340236==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a113597fe39b7728a1c9b29500aeb59f9b3f02fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches which were applied upstream, added uClibc build fix.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Don-t-use-fork-on-noMMU-platforms.patch   |  6 +-
 ...ix-PyTuple_SET_ITEM-usage-no-return-value.patch | 70 -----------------
 .../alsa-lib/0002-output-include-stdarg.h.patch    | 40 ++++++++++
 ...y-parser.c-drop-duplicate-safe_strtol_bas.patch | 51 -------------
 ...rt-of-safe_strto-functions-from-libasound.patch | 88 ----------------------
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 7 files changed, 45 insertions(+), 214 deletions(-)

diff --git a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
index 17b57d1f3d..0d2b479534 100644
--- a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
+++ b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
@@ -10,7 +10,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Jörg: update patch for 1.1.6]
 Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
 Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141376.html
-[Bernd: update patch for 1.2.4]
+[Bernd: update patch for 1.2.4 & 1.2.7]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  configure.ac         |  2 ++
@@ -21,9 +21,9 @@ diff --git a/configure.ac b/configure.ac
 index cce195ae..0c852434 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -51,6 +51,8 @@ dnl Checks for library functions.
- AC_PROG_GCC_TRADITIONAL
+@@ -52,6 +52,8 @@ dnl Checks for library functions.
  AC_CHECK_FUNCS([uselocale])
+ AC_CHECK_FUNCS([eaccess])
  
 +AC_CHECK_FUNC([fork])
 +
diff --git a/package/alsa-lib/0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch b/package/alsa-lib/0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch
deleted file mode 100644
index a1c9f3b80d..0000000000
--- a/package/alsa-lib/0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 1da2ede2d8b01a8851648e774a4c3c5779c0bafa Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@rivian.com>
-Date: Tue, 7 Dec 2021 13:55:54 -0800
-Subject: [PATCH] Fix PyTuple_SET_ITEM() usage - no return value
-
-As noted in bpo-30459 (link bellow) the PyTuple_SET_ITEM() macro
-has not a return value. Make the code compatible with python 3.10.
-
-Link: https://bugs.python.org/issue30459
-Signed-off-by: Adam Duskett <aduskett@rivian.com>
----
- modules/mixer/simple/python.c | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/modules/mixer/simple/python.c b/modules/mixer/simple/python.c
-index 8a7264d..c7c1ce7 100644
---- a/modules/mixer/simple/python.c
-+++ b/modules/mixer/simple/python.c
-@@ -775,8 +775,8 @@ pymixer_melement_new(struct pymixer *pymixer, PyObject *args)
- 	obj = PyDict_GetItemString(pymixer->mdict, class);
- 	if (obj) {
- 		obj1 = PyTuple_New(4);
--		if (PyTuple_SET_ITEM(obj1, 0, (PyObject *)pymixer))
--			Py_INCREF((PyObject *)pymixer);
-+		PyTuple_SET_ITEM(obj1, 0, (PyObject *)pymixer);
-+		Py_INCREF((PyObject *)pymixer);
- 		PyTuple_SET_ITEM(obj1, 1, PyUnicode_FromString(name));
- 		PyTuple_SET_ITEM(obj1, 2, PyInt_FromLong(index));
- 		PyTuple_SET_ITEM(obj1, 3, PyInt_FromLong(weight));
-@@ -920,8 +920,8 @@ static PyObject *new_helem(struct python_priv *priv, snd_hctl_elem_t *helem)
- 	obj = PyDict_GetItemString(priv->py_mdict, "HElement");
- 	if (obj) {
- 		obj1 = PyTuple_New(3);
--		if (PyTuple_SET_ITEM(obj1, 0, py_hctl))
--			Py_INCREF(py_hctl);
-+		PyTuple_SET_ITEM(obj1, 0, py_hctl);
-+		Py_INCREF(py_hctl);
- 		PyTuple_SET_ITEM(obj1, 1, PyFloat_FromDouble(1));
- 		PyTuple_SET_ITEM(obj1, 2, PyInt_FromLong((long)helem));
- 		obj2 = PyObject_CallObject(obj, obj1);
-@@ -995,11 +995,11 @@ int alsa_mixer_simple_event(snd_mixer_class_t *class, unsigned int mask,
- 		}
-         	if (o == NULL)
-         		return 0;
--        	if (PyTuple_SET_ITEM(t, 1, o))
--        		Py_INCREF(o);
-+        	PyTuple_SET_ITEM(t, 1, o);
-+        	Py_INCREF(o);
-         	o = melem ? find_melem(priv, melem) : Py_None;
--        	if (PyTuple_SET_ITEM(t, 2, o))
--        		Py_INCREF(o);
-+        	PyTuple_SET_ITEM(t, 2, o);
-+        	Py_INCREF(o);
- 		r = PyObject_CallObject(priv->py_event_func, t);
- 		Py_DECREF(t);
- 		if (r) {
-@@ -1066,8 +1066,8 @@ static int alsa_mixer_simple_pyinit(struct python_priv *priv,
- 		obj1 = PyTuple_New(3);
- 		PyTuple_SET_ITEM(obj1, 0, PyInt_FromLong((long)class));
- 		PyTuple_SET_ITEM(obj1, 1, PyInt_FromLong((long)mixer));
--		if (PyTuple_SET_ITEM(obj1, 2, mdict))
--			Py_INCREF(mdict);
-+		PyTuple_SET_ITEM(obj1, 2, mdict);
-+		Py_INCREF(mdict);
- 		obj2 = PyObject_CallObject(obj, obj1);
- 		Py_XDECREF(obj1);
- 		PyDict_SetItemString(mdict, "mixer", obj2);
--- 
-2.33.1
-
diff --git a/package/alsa-lib/0002-output-include-stdarg.h.patch b/package/alsa-lib/0002-output-include-stdarg.h.patch
new file mode 100644
index 0000000000..cf7c25becd
--- /dev/null
+++ b/package/alsa-lib/0002-output-include-stdarg.h.patch
@@ -0,0 +1,40 @@
+From b7c0169a62d4e6ad1a0a9de4ef8ae8089ee98872 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 11 Jun 2022 19:12:19 +0200
+Subject: [PATCH] output: include stdarg.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes a build error with alsa-utils when build with a uClibc toolchain:
+
+alsa-utils/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/alsa/output.h:75:66:
+ error: unknown type name ‘va_list’
+   75 | int snd_output_vprintf(snd_output_t *output, const char *format, va_list args);
+      |                                                                  ^~~~~~~
+alsa-utils/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/alsa/output.h:1:1:
+ note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
+
+Patch sent upstream: https://github.com/alsa-project/alsa-lib/pull/237
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/output.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/output.h b/include/output.h
+index 4a970dc4..5e16420b 100644
+--- a/include/output.h
++++ b/include/output.h
+@@ -28,6 +28,8 @@
+ #ifndef __ALSA_OUTPUT_H
+ #define __ALSA_OUTPUT_H
+ 
++#include <stdarg.h>
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+-- 
+2.30.2
+
diff --git a/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch b/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch
deleted file mode 100644
index a3741c42c0..0000000000
--- a/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 47252054b4a2d5c8382cb1342f5d4eb89dabf95f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 1 Jan 2022 17:20:47 +0100
-Subject: [PATCH] src/topology/parser.c: drop duplicate safe_strtol_base
-
-The safe_strtol_base() function is defined twice since
-	f547b2e3 ("conf: introduce safe_strtol_base()") and
-	5fab157a ("topology: do not call strtol directly")
-resulting in the following build failure when alsa-utils is built
-statically because safe_strtol_base is defined twice.
-
-Fixes: http://autobuild.buildroot.org/results/08d028004090b2a8292f03910cb9bf80a73ac804
-Fixes: https://github.com/alsa-project/alsa-lib/pull/207
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-[Retrieved from:
-https://github.com/alsa-project/alsa-lib/commit/47252054b4a2d5c8382cb1342f5d4eb89dabf95f]
----
- src/topology/parser.c | 19 -------------------
- 1 file changed, 19 deletions(-)
-
-diff --git a/src/topology/parser.c b/src/topology/parser.c
-index 01c95afa..e70173f6 100644
---- a/src/topology/parser.c
-+++ b/src/topology/parser.c
-@@ -21,25 +21,6 @@
- #include "list.h"
- #include "tplg_local.h"
- 
--/*
-- * Safe strtol call
-- */
--int safe_strtol_base(const char *str, long *val, int base)
--{
--	char *end;
--	long v;
--	if (!*str)
--		return -EINVAL;
--	errno = 0;
--	v = strtol(str, &end, base);
--	if (errno)
--		return -errno;
--	if (*end)
--		return -EINVAL;
--	*val = v;
--	return 0;
--}
--
- /*
-  * Get integer value
-  */
diff --git a/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch b/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch
deleted file mode 100644
index 3dfcb78b5c..0000000000
--- a/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From c687c482107f746332dd18f7407f6c6efbffccb2 Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Sat, 1 Jan 2022 19:18:25 +0100
-Subject: [PATCH] conf: fix the export of safe_strto* functions from libasound
-
-Only one library should define the safe_strto function. Export it
-correctly and add _snd_ prefix to avoid possible clashes with the other
-application code.
-
-Fixes: 47252054 ("src/topology/parser.c: drop duplicate safe_strtol_base")
-Fixes: https://github.com/alsa-project/alsa-lib/pull/208
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-
-[Retrieved from:
-https://github.com/alsa-project/alsa-lib/commit/c687c482107f746332dd18f7407f6c6efbffccb2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/local.h | 8 ++++++--
- src/Versions.in | 6 ++++++
- src/conf.c      | 6 +++---
- 3 files changed, 15 insertions(+), 5 deletions(-)
-
-diff --git a/include/local.h b/include/local.h
-index ebc9350c..f64fe9d8 100644
---- a/include/local.h
-+++ b/include/local.h
-@@ -232,10 +232,14 @@ size_t page_align(size_t size);
- size_t page_size(void);
- size_t page_ptr(size_t object_offset, size_t object_size, size_t *offset, size_t *mmap_offset);
- 
--int safe_strtoll_base(const char *str, long long *val, int base);
-+#define safe_strtoll_base _snd_safe_strtoll_base
-+int _snd_safe_strtoll_base(const char *str, long long *val, int base);
- static inline int safe_strtoll(const char *str, long long *val) { return safe_strtoll_base(str, val, 0); }
--int safe_strtol_base(const char *str, long *val, int base);
-+#define safe_strtol_base _snd_safe_strtol_base
-+int _snd_safe_strtol_base(const char *str, long *val, int base);
- static inline int safe_strtol(const char *str, long *val) { return safe_strtol_base(str, val, 0); }
-+#define safe_strtod _snd_safe_strtod
-+int _snd_safe_strtod(const char *str, double *val);
- 
- int snd_send_fd(int sock, void *data, size_t len, int fd);
- int snd_receive_fd(int sock, void *data, size_t len, int *fd);
-diff --git a/src/Versions.in b/src/Versions.in
-index 5daccbd4..85031b38 100644
---- a/src/Versions.in
-+++ b/src/Versions.in
-@@ -134,3 +134,9 @@ ALSA_1.1.6 {
- 
-     @SYMBOL_PREFIX@snd_dlopen;
- } ALSA_0.9.7;
-+
-+ALSA_1.2.6 {
-+  global:
-+
-+    @SYMBOL_PREFIX@_snd_safe_strto*;
-+} ALSA_1.1.6;
-diff --git a/src/conf.c b/src/conf.c
-index d3597cbc..098ebd63 100644
---- a/src/conf.c
-+++ b/src/conf.c
-@@ -663,7 +663,7 @@ static int input_stdio_open(snd_input_t **inputp, const char *file,
- 	return err;
- }
- 
--int safe_strtoll_base(const char *str, long long *val, int base)
-+int _snd_safe_strtoll_base(const char *str, long long *val, int base)
- {
- 	char *end;
- 	long v;
-@@ -679,7 +679,7 @@ int safe_strtoll_base(const char *str, long long *val, int base)
- 	return 0;
- }
- 
--int safe_strtol_base(const char *str, long *val, int base)
-+int _snd_safe_strtol_base(const char *str, long *val, int base)
- {
- 	char *end;
- 	long v;
-@@ -695,7 +695,7 @@ int safe_strtol_base(const char *str, long *val, int base)
- 	return 0;
- }
- 
--static int safe_strtod(const char *str, double *val)
-+int _snd_safe_strtod(const char *str, double *val)
- {
- 	char *end;
- 	double v;
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 42040d631b..a859505372 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f  alsa-lib-1.2.6.1.tar.bz2
+sha256  8814e61f7ec6812c76e23a85cab00e0b0d3bba40816af36b726beb1bc04c74a7  alsa-lib-1.2.7.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 1aa1b4c276..d6054bb000 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.6.1
+ALSA_LIB_VERSION = 1.2.7
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)

--===============3767160037316340236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3767160037316340236==--
