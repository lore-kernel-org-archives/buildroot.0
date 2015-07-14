From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jul 2015 13:38:14 +0200
Subject: [Buildroot] [PATCH] package/qpid-proton: needs host-python2
Message-ID: <1436873894-1080-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qpid-proton is using constructs that are not valid in python3.
qpid-proton is hardcoding calls to /usr/bin/python, which can be
whatever version.

So, fix the scripts to use '/usr/bin/env python' so it finds it in the
PATH, and add a dependency to host-python.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/qpid-proton/0002-fix-python.patch | 22 ++++++++++++++++++++++
 package/qpid-proton/qpid-proton.mk        |  2 ++
 2 files changed, 24 insertions(+)
 create mode 100644 package/qpid-proton/0002-fix-python.patch

diff --git a/package/qpid-proton/0002-fix-python.patch b/package/qpid-proton/0002-fix-python.patch
new file mode 100644
index 0000000..c6f57e8
--- /dev/null
+++ b/package/qpid-proton/0002-fix-python.patch
@@ -0,0 +1,22 @@
+Those scripts are not pytrhon3-compliant, use python2
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN qpid-proton-0.9.1.orig/proton-c/src/codec/encodings.h.py qpid-proton-0.9.1/proton-c/src/codec/encodings.h.py
+--- qpid-proton-0.9.1.orig/proton-c/src/codec/encodings.h.py	2015-04-29 21:17:49.000000000 +0200
++++ qpid-proton-0.9.1/proton-c/src/codec/encodings.h.py	2015-07-14 13:20:40.798356160 +0200
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python2
+ #
+ # Licensed to the Apache Software Foundation (ASF) under one
+ # or more contributor license agreements.  See the NOTICE file
+diff -durN qpid-proton-0.9.1.orig/proton-c/src/protocol.h.py qpid-proton-0.9.1/proton-c/src/protocol.h.py
+--- qpid-proton-0.9.1.orig/proton-c/src/protocol.h.py	2015-04-29 21:17:49.000000000 +0200
++++ qpid-proton-0.9.1/proton-c/src/protocol.h.py	2015-07-14 13:21:19.750824925 +0200
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python2
+ #
+ # Licensed to the Apache Software Foundation (ASF) under one
+ # or more contributor license agreements.  See the NOTICE file
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index eae4589..cb06d97 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -11,8 +11,10 @@ QPID_PROTON_LICENSE = Apache-2.0
 QPID_PROTON_LICENSE_FILES = LICENSE
 QPID_PROTON_INSTALL_STAGING = YES
 QPID_PROTON_DEPENDENCIES = \
+	host-python \
 	util-linux \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
+
 QPID_PROTON_CONF_OPTS = \
 	-DBUILD_JAVA=OFF \
 	-DENABLE_VALGRIND=OFF \
-- 
1.9.1
