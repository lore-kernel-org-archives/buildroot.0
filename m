Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D2EC25B4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9203960B34;
	Tue,  7 May 2024 16:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3X4sfyYOLIx; Tue,  7 May 2024 16:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B018660B56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B018660B56;
	Tue,  7 May 2024 16:29:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1281BF997
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7789C40582
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BuJ4iomxu9J for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FCE740342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FCE740342
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FCE740342
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:29:51 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6f0585edd8bso1300457a34.2
 for <buildroot@buildroot.org>; Tue, 07 May 2024 09:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715099390; x=1715704190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQhqm8bsvHPm3gy5KXu/NXBTgWhuxC2RY51nBFJEccU=;
 b=GmNOAvKo2DmHTB8wM5yiJPYFFUEsZ6KBzoaWJ5DWDHTVlUWsIRXjRcjb99aQj9kBoG
 Q5X+lDrenxVKKT1IdoosK4hIu/Rw/St7/edGZnpAWPpEpzOZIFFl0IR9XLLL3Z8RnZKj
 VFKNPlzrhCZO/9qlovdk/0axeu9xDp9BFNmSC1+i2fbIvEp3Ljl69Rf6MACqGVeFjnXJ
 /ARG0AxseH7j9jg1H1jaB29mxMN3qwcutsSQl5ipkR/6rPRe2xWVXRti//GfcM3aPYgN
 ldjLyVQ7CgEVOzXqRuzHrRqtP5HSW7InxtPJOiF5Cxk52hqeuR+C7FHC3wRT9XQEonac
 le1Q==
X-Gm-Message-State: AOJu0YyG4N2tvG5TGGpsEj3oAKuk3uNq9RSzRL7LqZb+5uVAmstFdisW
 Y4e1x/DeQio/HTmy8JTVG4XEpcTAD0XJbSE0mg1zicUvr/Qgfnq9F/pgv2TV
X-Google-Smtp-Source: AGHT+IEqcaxYWRgIoGz2Rs9W0EySmH90mqdMTU42w6BIHp9eY4fI4fO2H6sVb76JtKBXXjLeNOWJVg==
X-Received: by 2002:a05:6830:f96:b0:6ee:3b91:5e3b with SMTP id
 ez22-20020a0568300f9600b006ee3b915e3bmr18044573otb.27.1715099389862; 
 Tue, 07 May 2024 09:29:49 -0700 (PDT)
Received: from localhost.localdomain ([47.210.125.56])
 by smtp.gmail.com with ESMTPSA id
 bb9-20020a056830470900b006ee512d78f2sm2568149otb.26.2024.05.07.09.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 09:29:49 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 May 2024 11:29:36 -0500
Message-Id: <20240507162936.18729-2-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507162936.18729-1-vfazio@gmail.com>
References: <20240428024210.11950-1-vfazio@gmail.com>
 <20240507162936.18729-1-vfazio@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715099390; x=1715704190; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQhqm8bsvHPm3gy5KXu/NXBTgWhuxC2RY51nBFJEccU=;
 b=QFs0EQFI3lSPvQ3uJkhdueDLLG5l8uDJ52stVgHYHi3EPixhJFeL+9qZZ5Azy93MJK
 gEFiM+4O+W3XSDJziZpugJV7GQj/3mXL+CgRhBXL4k9k93K09+TnAxlus2/iiTXaPd5r
 iSDpX+Gf6RMZSHQYYuGO6WN9yN7EiAjxQN+LdRmSA3zYFvGUZYSKPH29BYiTwJXUaZMj
 oIE0WqMK4y7VY/RIaEbQ/SB1pYRxg20Y87N/cyV8CvuTN+hZ7RMbruzPxTgWbbBWGdGp
 sTAt2xdFE20XSWBQXb+K0w+cq61Y1GzlknYKweLD/drToB0tcPE9/zpAWJ+nyoKx5soF
 m6wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QFs0EQFI
Subject: [Buildroot] [PATCH v2 2/2] package/python3: drop unnecessary patches
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patches 0004 and 0009 relied upon environment variables that were used
to drive custom logic in distutils when executed by an external Python
interpreter. This issue should have been mostly addressed upstream [0],
but even if that was not the case, distutils is no longer a supported
installation method for packages to use for installation as of 09de823c.
As such, there shouldn't be a need to continue to patch it as setuptools
vendors its own distutils that supercedes the one provided by Python.

Patches 0010 and 0026 (see [1] [2] [3]) can be removed due to a fix
introduced in 3.7 [4].

Patch 0028 can be dropped since commit 3fed4245 removed the dependency
on a host provided python to build host-python3.

[0] https://github.com/python/cpython/commit/9731330d6f4d63d6d57c8e99c8d11ef1def42858
[1]: https://github.com/python/cpython/issues/67096
[2]: https://github.com/python/cpython/issues/75894
[3]: https://github.com/python/cpython/issues/66338
[4]: https://github.com/python/cpython/commit/14086cfc5eed8c5e78342d79e5db87a135d75fa8

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Changes v1 -> v2:
  - reworded rationale for 0004 and 0009
---
 .checkpackageignore                           |  5 --
 ...y-header-paths-for-cross-compilation.patch | 69 -------------------
 ...e-shebang-of-Python-scripts-for-cros.patch | 35 ----------
 ...ig.sh.in-ensure-sed-invocations-only.patch | 67 ------------------
 ...thon-config.sh-don-t-reassign-prefix.patch | 53 --------------
 ...-fix-building-on-older-distributions.patch | 47 -------------
 6 files changed, 276 deletions(-)
 delete mode 100644 package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
 delete mode 100644 package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 delete mode 100644 package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
 delete mode 100644 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
 delete mode 100644 package/python3/0028-fix-building-on-older-distributions.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3be4f6a1df..071a72b837 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1323,13 +1323,10 @@ package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch lib_patch.Ups
 package/python3/0001-Make-the-build-of-pyc-files-conditional.patch lib_patch.Upstream
 package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch lib_patch.Upstream
 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch lib_patch.Upstream
-package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch lib_patch.Upstream
 package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch lib_patch.Upstream
 package/python3/0006-Don-t-add-multiarch-paths.patch lib_patch.Upstream
 package/python3/0007-Abort-on-failed-module-build.patch lib_patch.Upstream
 package/python3/0008-Serial-ioctl-workaround.patch lib_patch.Upstream
-package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch lib_patch.Upstream
-package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch lib_patch.Upstream
 package/python3/0011-Add-an-option-to-disable-pydoc.patch lib_patch.Upstream
 package/python3/0012-Add-an-option-to-disable-lib2to3.patch lib_patch.Upstream
 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch lib_patch.Upstream
@@ -1345,9 +1342,7 @@ package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch lib_p
 package/python3/0023-Add-an-option-to-disable-openssl-support.patch lib_patch.Upstream
 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch lib_patch.Upstream
 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch lib_patch.Upstream
-package/python3/0026-python-config.sh-don-t-reassign-prefix.patch lib_patch.Upstream
 package/python3/0027-Add-an-option-to-disable-uuid-module.patch lib_patch.Upstream
-package/python3/0028-fix-building-on-older-distributions.patch lib_patch.Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch lib_patch.Upstream
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
deleted file mode 100644
index 9a55d2582d..0000000000
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 132b9dca3bb4d4682f7e318648ce11e1abb31b62 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:33:14 +0100
-Subject: [PATCH] Adjust library/header paths for cross-compilation
-
-When cross-compiling third-party extensions, the get_python_inc() or
-get_python_lib() can be called, to return the path to headers or
-libraries. However, they use the sys.prefix of the host Python, which
-returns incorrect paths when cross-compiling (paths pointing to host
-headers and libraries).
-
-In order to fix this, we introduce the _python_sysroot, _python_prefix
-and _python_exec_prefix variables, that allow to override these
-values, and get correct header/library paths when cross-compiling
-third-party Python modules.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Refresh for 3.10.0
----
- Lib/distutils/command/build_ext.py |  5 ++++-
- Lib/sysconfig.py                   | 15 +++++++++++----
- 2 files changed, 15 insertions(+), 5 deletions(-)
-
-diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index f287b34998..298234d6a1 100644
---- a/Lib/distutils/command/build_ext.py
-+++ b/Lib/distutils/command/build_ext.py
-@@ -234,7 +234,10 @@ def finalize_options(self):
-         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
-             if not sysconfig.python_build:
-                 # building third party extensions
--                self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
-+                libdir = sysconfig.get_config_var('LIBDIR')
-+                if "_python_sysroot" in os.environ:
-+                    libdir = os.environ.get("_python_sysroot") + libdir
-+                self.library_dirs.append(libdir)
-             else:
-                 # building python standard extensions
-                 self.library_dirs.append('.')
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index ebe3711827..6328ec41af 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
-@@ -168,10 +168,17 @@ def joinuser(*args):
- _PY_VERSION = sys.version.split()[0]
- _PY_VERSION_SHORT = f'{sys.version_info[0]}.{sys.version_info[1]}'
- _PY_VERSION_SHORT_NO_DOT = f'{sys.version_info[0]}{sys.version_info[1]}'
--_PREFIX = os.path.normpath(sys.prefix)
--_BASE_PREFIX = os.path.normpath(sys.base_prefix)
--_EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
--_BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
-+if "_python_sysroot" in os.environ:
-+    _sysroot=os.environ.get('_python_sysroot')
-+    _PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
-+    _EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
-+    _BASE_PREFIX = _PREFIX
-+    _BASE_EXEC_PREFIX = _EXEC_PREFIX
-+else:
-+    _PREFIX = os.path.normpath(sys.prefix)
-+    _EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+    _BASE_PREFIX = os.path.normpath(sys.base_prefix)
-+    _BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
- _CONFIG_VARS = None
- _USER_BASE = None
- 
--- 
-2.34.1
-
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
deleted file mode 100644
index eff8fc7694..0000000000
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2439bd2ed5dbdd7e5fda15adefd0f6f1b047ec1b Mon Sep 17 00:00:00 2001
-From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
-Date: Wed, 23 Dec 2015 11:44:30 +0100
-Subject: [PATCH] Do not adjust the shebang of Python scripts for
- cross-compilation
-
-The copy_scripts() method in distutils copies the scripts listed in
-the setup file and adjusts the first line to refer to the current
-Python interpreter. When cross-compiling, this means that the adjusted
-shebang refers to the host Python interpreter.
-
-This patch modifies copy_scripts() to preserve the shebang when
-cross-compilation is detected.
-
-Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
----
- Lib/distutils/command/build_scripts.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/build_scripts.py
-index ccc70e6465..d6d54195c1 100644
---- a/Lib/distutils/command/build_scripts.py
-+++ b/Lib/distutils/command/build_scripts.py
-@@ -91,7 +91,7 @@ def copy_scripts(self):
-                     adjust = True
-                     post_interp = match.group(1) or b''
- 
--            if adjust:
-+            if adjust and not '_python_sysroot' in os.environ:
-                 log.info("copying and adjusting %s -> %s", script,
-                          self.build_dir)
-                 updated_files.append(outfile)
--- 
-2.34.1
-
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
deleted file mode 100644
index f26ee85b61..0000000000
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 55ef5552e4ee60266e3299f253bec3b13785e585 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Thu, 20 Nov 2014 13:24:59 +0100
-Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
- beginning of strings
-
-The build/real prefix handling using sed breaks if build != real and the
-standard include / lib directories are used ($prefix/include and $prefix/lib).
-
-E.G.
-
-prefix_build="/usr", libdir="$prefix/lib", includedir="$prefix/include".
-
-If this gets installed with make DESTDIR="/foo" install, then we end up with
-prefix_real = prefix = "/foo/usr" as expected, but
-includedir="/foo/foo/usr/include" and libdir="/foo/foo/usr/lib" because of
-the double sed invocation (prefix is already expanded).  Work around it by
-ensuring we only match the beginning of the string.
-
-Submitted upstream: http://bugs.python.org/issue22907
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Misc/python-config.sh.in | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index 2602fe24c0..a1bc3cd5f7 100644
---- a/Misc/python-config.sh.in
-+++ b/Misc/python-config.sh.in
-@@ -24,18 +24,19 @@ installed_prefix ()
-     echo $RESULT
- }
- 
-+prefix_build="@prefix@"
- prefix_real=$(installed_prefix "$0")
- 
- # Use sed to fix paths from their built-to locations to their installed-to
- # locations. Keep prefix & exec_prefix using their original values in case
- # they are referenced in other configure variables, to prevent double
- # substitution, issue #22140.
--prefix="@prefix@"
--exec_prefix="@exec_prefix@"
-+prefix=$(echo "$prefix_build" | sed "s#^$prefix_build#$prefix_real#")
-+exec_prefix=$(echo "$exec_prefix_build" | sed "s#^$exec_prefix_build#$prefix_real#")
- exec_prefix_real=${prefix_real}
--includedir=$(echo "@includedir@" | sed "s#$prefix#$prefix_real#")
--libdir=$(echo "@libdir@" | sed "s#$prefix#$prefix_real#")
--CFLAGS=$(echo "@CFLAGS@" | sed "s#$prefix#$prefix_real#")
-+includedir=$(echo "@includedir@" | sed "s#^$prefix_build#$prefix_real#")
-+libdir=$(echo "@libdir@" | sed "s#^$prefix_build#$prefix_real#")
-+CFLAGS=$(echo "@CFLAGS@" | sed "s#^$prefix_build#$prefix_real#")
- VERSION="@VERSION@"
- LIBM="@LIBM@"
- LIBC="@LIBC@"
-@@ -49,7 +50,7 @@ OPT="@OPT@"
- PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
- LDVERSION="@LDVERSION@"
- LIBDEST=${prefix_real}/lib/python${VERSION}
--LIBPL=$(echo "@LIBPL@" | sed "s#$prefix#$prefix_real#")
-+LIBPL=$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
- SO="@EXT_SUFFIX@"
- PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
- INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
--- 
-2.34.1
-
diff --git a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
deleted file mode 100644
index b6bfb010a0..0000000000
--- a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 755fb526a62df2a73560f42184db8aadb6899bb0 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Fri, 6 Oct 2017 09:54:15 -0500
-Subject: [PATCH] python-config.sh: don't reassign ${prefix}
-
-When prefix is set to a path like /usr during crossbuild
-the sed operations end up executing twice, once for the prefix
-reassignment and another for includedir if it is set as a string
-including the ${prefix} variable.  This results in an issue
-when the build directory is under /usr.
-
-This patch updates the remaining location which uses the prefix
-variable to also sed and update to use the real path.
-
-Upstream bug report:
-https://bugs.python.org/issue31713
-
-Buildroot bug:
-https://bugs.busybox.net/show_bug.cgi?id=10361
-
-Fixes failures like the following:
-dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/758858efa97b6273c1b470513f5492258a6d8853
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- Misc/python-config.sh.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index a1bc3cd5f7..164d2d3603 100644
---- a/Misc/python-config.sh.in
-+++ b/Misc/python-config.sh.in
-@@ -31,7 +31,7 @@ prefix_real=$(installed_prefix "$0")
- # locations. Keep prefix & exec_prefix using their original values in case
- # they are referenced in other configure variables, to prevent double
- # substitution, issue #22140.
--prefix=$(echo "$prefix_build" | sed "s#^$prefix_build#$prefix_real#")
-+prefix=$prefix_build
- exec_prefix=$(echo "$exec_prefix_build" | sed "s#^$exec_prefix_build#$prefix_real#")
- exec_prefix_real=${prefix_real}
- includedir=$(echo "@includedir@" | sed "s#^$prefix_build#$prefix_real#")
-@@ -49,7 +49,7 @@ LDLIBRARY="@LDLIBRARY@"
- OPT="@OPT@"
- PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
- LDVERSION="@LDVERSION@"
--LIBDEST=${prefix_real}/lib/python${VERSION}
-+LIBDEST=$( echo "${prefix}/lib/python${VERSION}" | sed "s#^$prefix_build#$prefix_real#")
- LIBPL=$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
- SO="@EXT_SUFFIX@"
- PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
--- 
-2.34.1
-
diff --git a/package/python3/0028-fix-building-on-older-distributions.patch b/package/python3/0028-fix-building-on-older-distributions.patch
deleted file mode 100644
index 4541b31c5f..0000000000
--- a/package/python3/0028-fix-building-on-older-distributions.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e52e2c5e3df4bc3d2ff07ecb3b8e2a9099ea1631 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Thu, 16 Aug 2018 14:52:37 -0700
-Subject: [PATCH] fix building on older distributions
-
-Python > 3.6.3 calls os.replace in the update_file.py script, during the
-regen-importlib phase of the build process.
-
-According to Doc/whatsnew/3.3.rst line 1631, os.replace acts in the same
-way as os.rename, however, it is now cross-platform compatible for Windows.
-
-Because BuildRoot is guaranteed only to be built in  POSIX environment, it is
-safe to change os.replace back to os.rename.
-
-This change fixes building on older systems such as CentOS7, that only come
-with python 2.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Tools/scripts/update_file.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Tools/scripts/update_file.py b/Tools/scripts/update_file.py
-index b4182c1d0c..ab443cb1a6 100644
---- a/Tools/scripts/update_file.py
-+++ b/Tools/scripts/update_file.py
-@@ -53,7 +53,7 @@ def update_file_with_tmpfile(filename, tmpfile, *, create=False):
-         if not create:
-             raise  # re-raise
-         outcome = 'created'
--        os.replace(tmpfile, filename)
-+        os.rename(tmpfile, filename)
-     else:
-         with targetfile:
-             old_contents = targetfile.read()
-@@ -62,7 +62,7 @@ def update_file_with_tmpfile(filename, tmpfile, *, create=False):
-         # Now compare!
-         if old_contents != new_contents:
-             outcome = 'updated'
--            os.replace(tmpfile, filename)
-+            os.rename(tmpfile, filename)
-         else:
-             outcome = 'same'
-             os.unlink(tmpfile)
--- 
-2.34.1
-
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
