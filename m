Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D7C3A59D
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 14:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC241606EC;
	Sun, 23 Oct 2022 14:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC241606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkJUP_NFJUyz; Sun, 23 Oct 2022 14:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80ABF606DC;
	Sun, 23 Oct 2022 14:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80ABF606DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C32F1BF4D6
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 14:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53AC28149A
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 14:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53AC28149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Krx06X3eu3HM for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 14:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE5981495
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FE5981495
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 14:17:13 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w18so11829378wro.7
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 07:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9+cw+r37b4htRa2/A/4+5jo0P2B7O2SVciERRbSnP8=;
 b=11+YnRW9P0aU2NGI99PimfinpcmU+9/cWgFDR8aVNTAZ9cDjPA+VbRhL9cPqlFD81p
 645Qtm/rQzOSsZoKNJe2o85X2GN2HCg4zDZXPGbsp3bxDVWMnWyrWSwZZf/hjQUPfu97
 5DWwa5QaJAnGp+nkGe5Xb/SlCOHlLzGwO+MBBuT+yms/YZso5cwYgf4H1XvHvPjfY9vM
 ImzxaAblL1v3DPqUV1zy+tpBZFEmCgEm0McQNgWunOxOpcE9QgmmUEYjEpomsgQ/yCVb
 qSnzHPI9m5njSuEqhARm1IxT+eK28MpAcE4tnpzdIz6NxHrQG7oQz17B5w1X9S9+b5a8
 OoWA==
X-Gm-Message-State: ACrzQf0QyHRwpbDaNaR9cx1A/B6a+nArAqFEVqvKVH620jzcbLtDQxa7
 58QyLhjLizNN8f8wOr7EMBq9mB/S8xY=
X-Google-Smtp-Source: AMsMyM5dkXoEsEpCVmmK9x0oHh0Nf8M9O1AUjFiyewZMM7l0r1IE/eoF6nHPfpa+rCsBiNN1/DAuyw==
X-Received: by 2002:a05:6000:1ac8:b0:231:90f0:217e with SMTP id
 i8-20020a0560001ac800b0023190f0217emr18227765wry.525.1666534631088; 
 Sun, 23 Oct 2022 07:17:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m17-20020a5d6251000000b002345cb2723esm10741709wrv.17.2022.10.23.07.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 07:17:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 16:17:06 +0200
Message-Id: <20221023141706.197964-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+9+cw+r37b4htRa2/A/4+5jo0P2B7O2SVciERRbSnP8=;
 b=NYiA+5PAUPU+BIN2HIoGU6PCzSGdCeGGV5SSF6gQdAHNQ/AQdumH7EFk1jCckGpb0R
 zScpoUt6Hq2qyT2Qknqr8ZYmPRc0TC3UjPNLqyCyV1ti9iL7CJvQetNYSsxAOqd5ZcBJ
 6FOITtnV0tHKfWah1AQdhWzQVSonuWqP96FFFtgqBnIk7xXlwtejfR2X3pB8drF2695H
 ZpvB6yJOZ6TzTDvCIc0iHClDBe6X+pJ17GlPmX16XvwTvREY+v8ECy16tBphysL6oed8
 M8ufYWPbjFy001FXFeJbl3++R64xkd/Rx0zw6H6kIWHvXm96jbRXMfs9hLE5imWIjfr/
 S7xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NYiA+5PA
Subject: [Buildroot] [PATCH 1/1] package/lirc-tools: bump to version 0.10.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop first to third patches (already in version)
- Add a patch to disable documentation and avoid a build failure without
  doxygen

https://sourceforge.net/p/lirc/git/ci/lirc-0.10.2/tree/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-build-without-Python.patch       | 63 -------------------
 ...evinput.c-fix-build-with-musl-1.2.0.patch} |  0
 ...0002-Fix-python-client-cross-compile.patch | 47 --------------
 ...002-configure-add-disable-doc-option.patch | 52 +++++++++++++++
 ...irc-version-detection-when-cross-com.patch | 51 ---------------
 package/lirc-tools/lirc-tools.hash            |  8 +--
 package/lirc-tools/lirc-tools.mk              |  2 +-
 7 files changed, 57 insertions(+), 166 deletions(-)
 delete mode 100644 package/lirc-tools/0001-Fix-build-without-Python.patch
 rename package/lirc-tools/{0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch => 0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch} (100%)
 delete mode 100644 package/lirc-tools/0002-Fix-python-client-cross-compile.patch
 create mode 100644 package/lirc-tools/0002-configure-add-disable-doc-option.patch
 delete mode 100644 package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch

diff --git a/package/lirc-tools/0001-Fix-build-without-Python.patch b/package/lirc-tools/0001-Fix-build-without-Python.patch
deleted file mode 100644
index b1940eac0d..0000000000
--- a/package/lirc-tools/0001-Fix-build-without-Python.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 71f329d997d949d3c12d62d2f1473a1c99ee49b0 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 27 Aug 2017 21:30:37 +0300
-Subject: [PATCH] Fix build without Python
-
-Don't define HAVE_PYTHON35 when PYTHON_LIBS is empty.
-
-Also, don't build Python dependent code when HAVE_PYTHON35 is not
-defined.
-
-This fixes build failures like:
-
-Makefile:1616: recipe for target 'python-pkg/dist/lirc-0.10.0.tar.gz' failed
-make[3]: *** [python-pkg/dist/lirc-0.10.0.tar.gz] Error 1
-python-pkg/lirc/_client.c:1:20: fatal error: Python.h: No such file or directory
- #include <Python.h>
-                    ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 74a2bcab6b
-
- Makefile.am  | 2 ++
- configure.ac | 3 ++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 9f3dd14340cc..d8164fcd44cf 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -104,6 +104,7 @@ dist_py_pkg_doc_DATA    = python-pkg/doc/Doxyfile \
- 
- libpython               = $(libdir)/python$(PYTHON_VERSION)
- pydir                   = $(libpython)/site-packages/lirc
-+if HAVE_PYTHON35
- py_LTLIBRARIES          = python-pkg/lib/_client.la
- python_pkg_lib__client_la_SOURCES = \
-                           python-pkg/lirc/_client.c
-@@ -116,6 +117,7 @@ python_pkg_lib__client_la_LDFLAGS  = \
-                           $(PYTHON_LIBS)
- python_pkg_lib__client_la_LIBADD = \
-                           lib/liblirc_client.la
-+endif
- 
- pylint: .phony
- 	$(MAKE) -C tools pylint
-diff --git a/configure.ac b/configure.ac
-index 4108688433f8..07d901deafdf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -50,7 +50,8 @@ test -z "$PYTHON_LIBS" && \
- test -n "$PYTHON_LIBS" || \
-     AC_MSG_WARN([No python package found (missing devel package?)])
- python_version_nodots=$(echo $PYTHON_VERSION | tr -d '.')
--AM_CONDITIONAL(HAVE_PYTHON35, [test $python_version_nodots -ge 35])
-+AM_CONDITIONAL(HAVE_PYTHON35, [test -n "$PYTHON_LIBS" && \
-+			       test $python_version_nodots -ge 35])
- CFLAGS="$CFLAGS $PYTHON_CFLAGS"
- 
- 
--- 
-2.14.1
-
diff --git a/package/lirc-tools/0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch b/package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch
similarity index 100%
rename from package/lirc-tools/0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch
rename to package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch
diff --git a/package/lirc-tools/0002-Fix-python-client-cross-compile.patch b/package/lirc-tools/0002-Fix-python-client-cross-compile.patch
deleted file mode 100644
index 02deefaf98..0000000000
--- a/package/lirc-tools/0002-Fix-python-client-cross-compile.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 13c4ffcfde07f659a836fba4a604dc1c5024bb90 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 29 Aug 2017 11:37:36 +0300
-Subject: [PATCH] Fix python client cross compile
-
-The setup.py setuptools wrapper needs to use a version of python built
-specifically for cross compiling to cross compile successfully. Allow
-setting that in the environment using the SETUPTOOLS_ENV variable.
-
-Fixes the following build failure:
-
-/usr/bin/ld: skipping incompatible .../lirc-tools-0.10.0/lib/.libs/liblirc_client.so when searching for -llirc_client
-/usr/bin/ld: cannot find -llirc_client
-collect2: error: ld returned 1 exit status
-error: command '/usr/bin/gcc' failed with exit status 1
-Makefile:1578: recipe for target 'all-local' failed
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://sourceforge.net/p/lirc/tickets/308/
-
- Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index d8164fcd44cf..a16be4278ae2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -131,6 +131,7 @@ pep8: $(py_PYTHON)
- if HAVE_PYTHON35
- all-local:
- 	cd python-pkg; \
-+	    $(SETUPTOOLS_ENV) \
- 	    CFLAGS="-I$(abs_top_srcdir)/lib -I$(abs_builddir)/lib" \
- 	    LDFLAGS=-L$(abs_builddir)/lib/.libs $(PYTHON) setup.py \
- 	    $(if $(VERBOSE),,-q) build
-@@ -179,6 +180,7 @@ $(abs_builddir)/python-pkg/setup.py:
- $(PYTHON_TARBALL): $(abs_builddir)/python-pkg/setup.py
- 	cp $(top_builddir)/VERSION $(abs_builddir)/python-pkg
- 	cd $(abs_builddir)/python-pkg; CFLAGS=-I$(abs_top_srcdir)/lib \
-+	    $(SETUPTOOLS_ENV) \
- 	    LDFLAGS=-L$(abs_builddir)/lib/.libs $(PYTHON) setup.py -q sdist
- 
- $(top_builddir)/python-pkg/VERSION: VERSION
--- 
-2.14.1
-
diff --git a/package/lirc-tools/0002-configure-add-disable-doc-option.patch b/package/lirc-tools/0002-configure-add-disable-doc-option.patch
new file mode 100644
index 0000000000..fab485ffef
--- /dev/null
+++ b/package/lirc-tools/0002-configure-add-disable-doc-option.patch
@@ -0,0 +1,52 @@
+From e9d5cbc01e3c0d6a31e2dba2f224b7f3dd21db37 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 23 Oct 2022 16:10:50 +0200
+Subject: [PATCH] configure: add --disable-doc option
+
+Allow the user to disable documentation through --disable-doc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 8 ++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6718af13..58a321d8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -45,7 +45,11 @@ if WITH_SYSTEMDSYSTEMUNITDIR
+     SYSTEMD_DIR         = systemd
+ endif
+ 
+-SUBDIRS                 = lib daemons tools plugins configs doc $(SYSTEMD_DIR)
++if HAVE_DOC
++    DOC_DIR             = doc
++endif
++
++SUBDIRS                 = lib daemons tools plugins configs $(DOC_DIR) $(SYSTEMD_DIR)
+ 
+ if INSTALL_ETC
+ 
+diff --git a/configure.ac b/configure.ac
+index d28c6732..f3384c95 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -486,6 +486,14 @@ AC_ARG_VAR(SETUPTOOLS_ENV,
+ )
+ 
+ 
++AC_ARG_ENABLE(doc,
++  [  --enable-doc       Build and install documentation (default=yes)],
++  [ enable_doc="${enableval}" ],
++  [ enable_doc=yes]
++)
++AM_CONDITIONAL([HAVE_DOC], [test x$enable_doc = xyes])
++
++
+ suffix=$(echo "$VERSION" | sed 's/.*-//')
+ AM_CONDITIONAL(DEVEL, [test x$suffix = xdevel])
+ 
+-- 
+2.35.1
+
diff --git a/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch b/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch
deleted file mode 100644
index 04fbfe6ea2..0000000000
--- a/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 732fd31610a6790a927ea9ed6d660796a1641254 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 7 Sep 2017 08:12:01 +0200
-Subject: [PATCH] build: Fix lirc version detection when cross compiling.
-
-The setup.py script that runs on the host can't use the client library
-built for target. So setup.py falls back to a wrong hard-coded VERSION
-value.
-
-Instead of importing the target library, use exec() to read
-lirc/config.py directly for its VERSION value.
-
-Fixes build failure:
-
-/usr/bin/install -c -m 644 ./python-pkg/dist/lirc-0.10.0.tar.gz \
-    '.../output/host/arm-buildroot-linux-musleabihf/sysroot/usr/share/lirc'
-/usr/bin/install: cannot stat './python-pkg/dist/lirc-0.10.0.tar.gz': \
-    No such file or directory
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 732fd31610a6
-
- python-pkg/setup.py | 9 +++------
- 1 file changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/python-pkg/setup.py b/python-pkg/setup.py
-index e9b33690f828..a2d92e0432aa 100644
---- a/python-pkg/setup.py
-+++ b/python-pkg/setup.py
-@@ -6,14 +6,11 @@ import subprocess
- import os.path
- import os
- 
--try:
--    import lirc.config
--    VERSION = lirc.config.VERSION.replace('-devel','')
--except ImportError:
--    VERSION='0.0.0'
--
- from setuptools import setup, Extension
- 
-+exec(open("lirc/config.py").read())
-+VERSION = VERSION.replace('-devel','')
-+
- if 'CFLAGS' in os.environ:
-     cflags = os.environ['CFLAGS'].split()
-     if 'LDFLAGS' in os.environ:
--- 
-2.14.1
-
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index 187768db47..4808508cca 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -1,6 +1,6 @@
-# hash from https://sourceforge.net/projects/lirc/files/LIRC/0.10.1/
-sha1  9d6f6d18ac566a96ef4ca1d6909a4e8bc517d48a  lirc-0.10.1.tar.bz2
-md5  86c3f8e4efaba10571addb8313d1e040  lirc-0.10.1.tar.bz2
+# hash from https://sourceforge.net/projects/lirc/files/LIRC/0.10.2/
+sha1  02092890205891b6de5a699294485a1eedba46c5  lirc-0.10.2.tar.bz2
+md5  cb96cfb0af8067c0062e2f5a100f426a  lirc-0.10.2.tar.bz2
 # Locally computed
-sha256  8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2  lirc-0.10.1.tar.bz2
+sha256  3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a  lirc-0.10.2.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 05f20f5726..5263330741 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIRC_TOOLS_VERSION = 0.10.1
+LIRC_TOOLS_VERSION = 0.10.2
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
