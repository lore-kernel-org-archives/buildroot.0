Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C986C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 01:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B572F40896;
	Thu, 30 Dec 2021 01:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEYl11DAkZxY; Thu, 30 Dec 2021 01:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E679B40940;
	Thu, 30 Dec 2021 01:28:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F60F1BF300
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 01:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EE0560B51
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 01:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qQs_dVSdjebi for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 01:28:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FD08605DB
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 01:28:46 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso21553370pjb.1
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 17:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uHifneh/r/ljY6LQd5r9hLw+nfpalQY3tsXtBqghDQ=;
 b=XpjYm6nZs060iPChmQxL4ehqJEnLG691IzxHARsf9OfXFvbfFt1vZ/L+0m22ab2W11
 NbzQ3LTDG3Ec3qh8Qm6DfHhSqAKY5qqdZ3D74d8K60YMLqSWMbJFUiOK1Oea8iJrfBlf
 v9wv4hiPtzeIxQwy1R1oVnJusYC+OdXs9xXVPX1bt0SOfFCmjgnv5mJkjokxZVrn7yl9
 vtsqLuZHxOWfDjqFzwqHKntwfzXAg7BwCgOlRkMCV09ijy7dNNF4ur5iM5EwQAbD6bAm
 gMltkMn+eI4Lx/Vr5ifnNbLhef0V9fYt3U+WZeIaOMn7EPrmA+SLbjcqvUibs/kjwDp3
 YamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uHifneh/r/ljY6LQd5r9hLw+nfpalQY3tsXtBqghDQ=;
 b=o8bIWmo0y5ye+zVCvsWHvFveOQOKq5YIWBf2zJituBwFIDZxOIjD+31UCkyDGCPYSJ
 qr8h5Z4t14gQwkfaAdLFFXKd4AyrlgnZ6lR8RU0sO2SbQ0hiCP1vRpF25wNk+m69L5bZ
 yGUfbVbnKhT4+czdhjusmnQWQnrSZKu7mTM+A4oHsCeW/gQXWvqQNpGvMFBm1jSQvBYn
 7wFT9GAms9hOyHm5R33vPS5NmM/65me5BDSNu+paQXD6bHO664L1BtRFaGaFUWlKm2q7
 dwxVQBTzjhUxBrlX9p/v+DyiYrosubz/D1pRYcn6oDnN7wMG98GX6AP7X0YhGQPiKWFu
 tcaw==
X-Gm-Message-State: AOAM530NW3fwJFx70QkLPPemO1J0I/+/AQx1Cf/vCJr77gqpUUPlUiAh
 53219SSAUt5aUL6Iw6TL9sT6LMj7ESA=
X-Google-Smtp-Source: ABdhPJyGHVl9KZ23kAz7iNb3o1RURJHEXJArc5twdoCq5NbfGbTTtFSJrlgUBjka9dl9XgYVCH1TCQ==
X-Received: by 2002:a17:90b:3509:: with SMTP id
 ls9mr35331621pjb.233.1640827725597; 
 Wed, 29 Dec 2021 17:28:45 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id h191sm21348724pge.55.2021.12.29.17.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 17:28:45 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 17:28:35 -0800
Message-Id: <20211230012836.3350448-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211230012836.3350448-1-aduskett@gmail.com>
References: <20211230012836.3350448-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/alsa-lib: bump to version 1.2.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop upstream patches
- Add a new patch: 0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch which
  fixes python 3.10 compatibility.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...Tuple_SET_ITEM-usage-no-return-value.patch | 70 +++++++++++++++++++
 .../0002-fix-build-with-disable-ucm.patch     | 43 ------------
 ...3-control-empty-fix-the-static-build.patch | 29 --------
 package/alsa-lib/alsa-lib.hash                |  2 +-
 package/alsa-lib/alsa-lib.mk                  |  2 +-
 5 files changed, 72 insertions(+), 74 deletions(-)
 create mode 100644 package/alsa-lib/0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch
 delete mode 100644 package/alsa-lib/0002-fix-build-with-disable-ucm.patch
 delete mode 100644 package/alsa-lib/0003-control-empty-fix-the-static-build.patch

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
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
