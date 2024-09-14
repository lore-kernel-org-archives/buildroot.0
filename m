Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0227CC021BB
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB7E94061C;
	Sat, 14 Sep 2024 21:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9icBzkTO98v; Sat, 14 Sep 2024 21:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ADEA40603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ADEA40603;
	Sat, 14 Sep 2024 21:40:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3943F1BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 283D0607C1
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3LGGHsXcR8l7 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:40:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEF37607B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF37607B9
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEF37607B9
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:40:05 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a09dd37ceaso353495ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726350004; x=1726954804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MjCnaO7ZK4c/nsGnbNKeE8jO33IG86o0tM+fWG0zhcQ=;
 b=U9DVqxvjb5Koz/Rjn0ZS48+D/4xJzULOD/M8Ty44NA9HJJmQKes9fpnlfSYP9uvJOZ
 orcj6wyKCGDT1n8UT9nntYawZnhPpms2HsG5PT5Ty/hZtroVvVrS2AQbig3MopI2ENLc
 qqo5ldvwm3hTovcA7m41Y9S2QNqjYpLfrCq515ihG5aqojSLhGSRH/CCdy5L9FHzx1qB
 P3KirTYEhB60gjZreTtId7Jzt71JBpZwxtHes/5QhqfGAwF/tn/MxJeWtZ/OsxwCDKgk
 FUafGvkjrITpbhY720PWwbU7GSqby/wdx2e/VHargK79YuM3mXdpY/xYGnYCihewzE3y
 NBYA==
X-Gm-Message-State: AOJu0YykFnPwzIltZAZHH/apLu3Xi9AuEYlcEn1w6ZoarhvByZEnlYWR
 6VVSGyVwm8Vc1mI2aewMnKzP7FCgg2qS4T/gXI9ekSX+5JQ2qLmZ0EGqcA==
X-Google-Smtp-Source: AGHT+IGEm31D5arcIvmUp/Rady97ndbmanS94ookkiFaZt+qnZ3jmy+h6kecdbP89XDIYx3YX7Q3MQ==
X-Received: by 2002:a92:c262:0:b0:39f:61e4:1ad8 with SMTP id
 e9e14a558f8ab-3a08497baecmr103164455ab.26.1726350003873; 
 Sat, 14 Sep 2024 14:40:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3ccc6sm582979173.78.2024.09.14.14.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:40:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:40:01 -0600
Message-Id: <20240914214001.1321654-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726350004; x=1726954804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MjCnaO7ZK4c/nsGnbNKeE8jO33IG86o0tM+fWG0zhcQ=;
 b=k/MoBLbZHyuFv52Sc3oGIl7MPJNxBpE/bM/cYZlg0cnj8BAZrl8oBBa9fQHoEe4BMS
 fg4erERGBmhLELeaMm3ZpY1BqDdHW27Kuiiudt1rbmTXzt5M1je+g/iAbru8oZaH2AVs
 YRplt+O6WYvsODSjAPObP4Edw12eqQ6kgzKHAaEWlKBrxXpgWH9WXcQUBt3Np7DNpJvn
 Dp193E2jpCcbIPh9V9hfzGJChaiOJPv3e3sPRfOH9YSH7UgadIbV3fNFjS5sDXgRQ0Mh
 H1gUf93nuUTCrln8zhp6R/jVvngvOp40v7u3kBHYXRIjzRi8WhyqIC2uO7I4h1l4FnTf
 k0sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k/MoBLbZ
Subject: [Buildroot] [PATCH 1/1] package/python-augeas: bump to version 1.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-Use-CFFI-in-out-of-line-API-mode-49.patch | 101 ------------------
 package/python-augeas/python-augeas.hash      |   2 +-
 package/python-augeas/python-augeas.mk        |   2 +-
 3 files changed, 2 insertions(+), 103 deletions(-)
 delete mode 100644 package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch

diff --git a/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch b/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch
deleted file mode 100644
index da9093d723..0000000000
--- a/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 9de73fefbe83c74840a93c039258845c49271b9b Mon Sep 17 00:00:00 2001
-From: Jeffery To <jeffery.to@gmail.com>
-Date: Sun, 8 Nov 2020 21:51:09 +0800
-Subject: [PATCH] Use CFFI in out-of-line API mode (#49)
-
-Currently, ffi.py is called during setup to generate augeas.py; this
-file would normally be used for out-of-line ABI mode. ffi.py is also
-imported at run-time, instead of the generated augeas.py, and used in
-in-line ABI mode.
-
-This changes usage of CFFI to out-of-line API mode (CFFI's "main mode of
-usage"): ffi.py is called during setup to generate _augeas.abi3.so (a C
-extension module); this generated module is imported at run-time.
-
-With this change, the headers/development files for augeas (i.e.
-libaugeas-dev on Debian, augeas-devel on Fedora, etc.) and the C
-compiler are required for build/setup. (These were not necessary
-previously.)
-
-Closes https://github.com/hercules-team/python-augeas/issues/48.
-
-Upstream: commit 712c2028568df7760bc98d95577e35709078bfea
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- augeas/__init__.py |  2 +-
- augeas/ffi.py      | 27 ++++++++++++++++++++++-----
- setup.py           |  1 +
- 3 files changed, 24 insertions(+), 6 deletions(-)
-
-diff --git a/augeas/__init__.py b/augeas/__init__.py
-index 9bd97bf..1c0f580 100644
---- a/augeas/__init__.py
-+++ b/augeas/__init__.py
-@@ -32,7 +32,7 @@ format and the transformation into a tree.
- 
- from sys import version_info as _pyver
- 
--from augeas.ffi import ffi, lib
-+from _augeas import ffi, lib
- 
- __author__ = "Nathaniel McCallum <nathaniel@natemccallum.com>"
- __credits__ = """Jeff Schroeder <jeffschroeder@computer.org>
-diff --git a/augeas/ffi.py b/augeas/ffi.py
-index a24daf5..1931764 100644
---- a/augeas/ffi.py
-+++ b/augeas/ffi.py
-@@ -1,9 +1,28 @@
-+import os
-+import subprocess
-+
- from cffi import FFI
- 
-+def get_include_dirs():
-+    XML2_CONFIG = os.environ.get('XML2_CONFIG', 'xml2-config')
-+    PKG_CONFIG = os.environ.get('PKG_CONFIG', 'pkg-config')
-+    try:
-+        stdout = subprocess.check_output([XML2_CONFIG, '--cflags'])
-+    except (OSError, subprocess.CalledProcessError):
-+        try:
-+            stdout = subprocess.check_output([PKG_CONFIG, '--cflags', 'libxml-2.0'])
-+        except (OSError, subprocess.CalledProcessError):
-+            stdout = b''
-+    cflags = stdout.decode('utf-8').split()
-+    return [cflag[2:] for cflag in cflags if cflag.startswith('-I')]
-+
- ffi = FFI()
--ffi.set_source("augeas",
--               None,
--               libraries=['augeas'])
-+ffi.set_source("_augeas",
-+               """
-+               #include <augeas.h>
-+               """,
-+               libraries=['augeas'],
-+               include_dirs=get_include_dirs())
- 
- ffi.cdef("""
- typedef struct augeas augeas;
-@@ -44,7 +63,5 @@ const char *aug_error_details(augeas *aug);
- void free(void *);
- """)
- 
--lib = ffi.dlopen("augeas")
--
- if __name__ == "__main__":
-     ffi.compile(verbose=True)
-diff --git a/setup.py b/setup.py
-index 7d55877..17f9516 100755
---- a/setup.py
-+++ b/setup.py
-@@ -22,6 +22,7 @@ setup(name=name,
-       setup_requires=["cffi>=1.0.0"],
-       cffi_modules=["augeas/ffi.py:ffi"],
-       install_requires=["cffi>=1.0.0"],
-+      zip_safe=False,
-       url="http://augeas.net/",
-       classifiers=[
-           "Programming Language :: Python :: 2.7",
--- 
-2.31.1
-
diff --git a/package/python-augeas/python-augeas.hash b/package/python-augeas/python-augeas.hash
index f4f4209875..d56eaef6a0 100644
--- a/package/python-augeas/python-augeas.hash
+++ b/package/python-augeas/python-augeas.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a1d2cdaf2ad4c091ed5ec7976c52d16e14ecfbf40b1bdcaced2465255fb0f87  python-augeas-1.1.0.tar.gz
+sha256  ee2c1e74cad61124097c5f540f063fa2dd3b8cd3159f1706f11167814c9bfcd5  python-augeas-1.2.0.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/python-augeas/python-augeas.mk b/package/python-augeas/python-augeas.mk
index 7adaa84f49..6d2a08a090 100644
--- a/package/python-augeas/python-augeas.mk
+++ b/package/python-augeas/python-augeas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_AUGEAS_VERSION = 1.1.0
+PYTHON_AUGEAS_VERSION = 1.2.0
 PYTHON_AUGEAS_SITE = $(call github,hercules-team,python-augeas,v$(PYTHON_AUGEAS_VERSION))
 PYTHON_AUGEAS_SETUP_TYPE = setuptools
 PYTHON_AUGEAS_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
