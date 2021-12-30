Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAC0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBBC2400F3;
	Thu, 30 Dec 2021 12:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HN76hDZsY3td; Thu, 30 Dec 2021 12:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70D7B40523;
	Thu, 30 Dec 2021 12:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254A41BF3EF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20FC740523
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EO5fcnCH3kJf for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD8BE400F3
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0883482DA1; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 153d028303c88b25344f33ddee0094b2ac5e2f49
X-Git-Newrev: 4d4a588a504a6446dd0a29a353d94c6e86cfd879
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.0883482DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump to version 1.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d4a588a504a6446dd0a29a353d94c6e86cfd879
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop upstream patches
- Add a new patch: 0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch which
  fixes python 3.10 compatibility.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-PyTuple_SET_ITEM-usage-no-return-value.patch | 70 ++++++++++++++++++++++
 .../alsa-lib/0002-fix-build-with-disable-ucm.patch | 43 -------------
 .../0003-control-empty-fix-the-static-build.patch  | 29 ---------
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 5 files changed, 72 insertions(+), 74 deletions(-)

diff --git a/package/alsa-lib/0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch b/package/alsa-lib/0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch
new file mode 100644
index 0000000000..a1c9f3b80d
--- /dev/null
+++ b/package/alsa-lib/0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch
@@ -0,0 +1,70 @@
+From 1da2ede2d8b01a8851648e774a4c3c5779c0bafa Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@rivian.com>
+Date: Tue, 7 Dec 2021 13:55:54 -0800
+Subject: [PATCH] Fix PyTuple_SET_ITEM() usage - no return value
+
+As noted in bpo-30459 (link bellow) the PyTuple_SET_ITEM() macro
+has not a return value. Make the code compatible with python 3.10.
+
+Link: https://bugs.python.org/issue30459
+Signed-off-by: Adam Duskett <aduskett@rivian.com>
+---
+ modules/mixer/simple/python.c | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/modules/mixer/simple/python.c b/modules/mixer/simple/python.c
+index 8a7264d..c7c1ce7 100644
+--- a/modules/mixer/simple/python.c
++++ b/modules/mixer/simple/python.c
+@@ -775,8 +775,8 @@ pymixer_melement_new(struct pymixer *pymixer, PyObject *args)
+ 	obj = PyDict_GetItemString(pymixer->mdict, class);
+ 	if (obj) {
+ 		obj1 = PyTuple_New(4);
+-		if (PyTuple_SET_ITEM(obj1, 0, (PyObject *)pymixer))
+-			Py_INCREF((PyObject *)pymixer);
++		PyTuple_SET_ITEM(obj1, 0, (PyObject *)pymixer);
++		Py_INCREF((PyObject *)pymixer);
+ 		PyTuple_SET_ITEM(obj1, 1, PyUnicode_FromString(name));
+ 		PyTuple_SET_ITEM(obj1, 2, PyInt_FromLong(index));
+ 		PyTuple_SET_ITEM(obj1, 3, PyInt_FromLong(weight));
+@@ -920,8 +920,8 @@ static PyObject *new_helem(struct python_priv *priv, snd_hctl_elem_t *helem)
+ 	obj = PyDict_GetItemString(priv->py_mdict, "HElement");
+ 	if (obj) {
+ 		obj1 = PyTuple_New(3);
+-		if (PyTuple_SET_ITEM(obj1, 0, py_hctl))
+-			Py_INCREF(py_hctl);
++		PyTuple_SET_ITEM(obj1, 0, py_hctl);
++		Py_INCREF(py_hctl);
+ 		PyTuple_SET_ITEM(obj1, 1, PyFloat_FromDouble(1));
+ 		PyTuple_SET_ITEM(obj1, 2, PyInt_FromLong((long)helem));
+ 		obj2 = PyObject_CallObject(obj, obj1);
+@@ -995,11 +995,11 @@ int alsa_mixer_simple_event(snd_mixer_class_t *class, unsigned int mask,
+ 		}
+         	if (o == NULL)
+         		return 0;
+-        	if (PyTuple_SET_ITEM(t, 1, o))
+-        		Py_INCREF(o);
++        	PyTuple_SET_ITEM(t, 1, o);
++        	Py_INCREF(o);
+         	o = melem ? find_melem(priv, melem) : Py_None;
+-        	if (PyTuple_SET_ITEM(t, 2, o))
+-        		Py_INCREF(o);
++        	PyTuple_SET_ITEM(t, 2, o);
++        	Py_INCREF(o);
+ 		r = PyObject_CallObject(priv->py_event_func, t);
+ 		Py_DECREF(t);
+ 		if (r) {
+@@ -1066,8 +1066,8 @@ static int alsa_mixer_simple_pyinit(struct python_priv *priv,
+ 		obj1 = PyTuple_New(3);
+ 		PyTuple_SET_ITEM(obj1, 0, PyInt_FromLong((long)class));
+ 		PyTuple_SET_ITEM(obj1, 1, PyInt_FromLong((long)mixer));
+-		if (PyTuple_SET_ITEM(obj1, 2, mdict))
+-			Py_INCREF(mdict);
++		PyTuple_SET_ITEM(obj1, 2, mdict);
++		Py_INCREF(mdict);
+ 		obj2 = PyObject_CallObject(obj, obj1);
+ 		Py_XDECREF(obj1);
+ 		PyDict_SetItemString(mdict, "mixer", obj2);
+-- 
+2.33.1
+
diff --git a/package/alsa-lib/0002-fix-build-with-disable-ucm.patch b/package/alsa-lib/0002-fix-build-with-disable-ucm.patch
deleted file mode 100644
index 144c8e3fbd..0000000000
--- a/package/alsa-lib/0002-fix-build-with-disable-ucm.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3fbaea3ff390d4c09adbf5d6ae62fb7b5f3f24f5 Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Mon, 28 Jun 2021 12:08:53 +0200
-Subject: [PATCH] fix build with --disable-ucm
-
-Link: https://mailman.alsa-project.org/pipermail/alsa-devel/2021-June/186729.html
-Reported-by: Michael Forney <mforney@mforney.org>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream: f4f29d42be8b8ad60ea4c5697374adad4bfe6868
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- include/local.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/include/local.h b/include/local.h
-index 4e7d88a0..7cfcec53 100644
---- a/include/local.h
-+++ b/include/local.h
-@@ -374,6 +374,8 @@ int _snd_config_load_with_include(snd_config_t *config, snd_input_t *in,
- void *INTERNAL(snd_dlopen)(const char *name, int mode, char *errbuf, size_t errbuflen);
- #endif
- 
-+#ifdef BUILD_UCM
-+
- const char *uc_mgr_alibcfg_by_device(snd_config_t **config, const char *name);
- 
- static inline int _snd_is_ucm_device(const char *name)
-@@ -381,4 +383,12 @@ static inline int _snd_is_ucm_device(const char *name)
- 	return name && name[0] == '_' && name[1] == 'u' && name[2] == 'c' && name[3] == 'm';
- }
- 
-+#else
-+
-+static inline const char *uc_mgr_alibcfg_by_device(snd_config_t **config, const char *name) { return NULL; }
-+static inline int _snd_is_ucm_device(const char *name) { return 0; }
-+
-+
-+#endif
-+
- #endif
--- 
-2.31.1
-
diff --git a/package/alsa-lib/0003-control-empty-fix-the-static-build.patch b/package/alsa-lib/0003-control-empty-fix-the-static-build.patch
deleted file mode 100644
index 3f5013af3a..0000000000
--- a/package/alsa-lib/0003-control-empty-fix-the-static-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 81e7923fbfad45b2f353a4d6e3053af51f5f7d0b Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Tue, 15 Jun 2021 23:21:42 +0200
-Subject: [PATCH] control: empty - fix the static build
-
-Reported-by: Jan Palus <atler@pld-linux.org>
-Fixes: https://github.com/alsa-project/alsa-lib/issues/157
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-
-[Retrieved from:
-https://github.com/alsa-project/alsa-lib/commit/81e7923fbfad45b2f353a4d6e3053af51f5f7d0b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/control/control_empty.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/control/control_empty.c b/src/control/control_empty.c
-index 49d1026c..c9b048c1 100644
---- a/src/control/control_empty.c
-+++ b/src/control/control_empty.c
-@@ -30,7 +30,7 @@
- 
- #ifndef PIC
- /* entry for static linking */
--const char *_snd_module_ctl_empty = "";
-+const char *_snd_module_control_empty = "";
- #endif
- 
- /*! \page control_plugins
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 6660c8a104..97bcd87141 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  628421d950cecaf234de3f899d520c0a6923313c964ad751ffac081df331438e  alsa-lib-1.2.5.1.tar.bz2
+sha256  7fe3057894ec319118abfd042ef84632a1dcd911806ec9fff6daaa68d15a8c52  alsa-lib-1.2.6.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 3bdde217ce..c43803f607 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.5.1
+ALSA_LIB_VERSION = 1.2.6
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
