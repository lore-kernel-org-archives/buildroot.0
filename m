From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 18 Jan 2018 13:51:21 +0100
Subject: [Buildroot] [PATCH] swupdate: add upstream patch to fix musl build
 issue
Message-ID: <20180118125121.28953-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix build issue with the musl C library, as musl
does not provide the GNU extension `strndupa()` breaking the build with
an undefined reference:

```
ipc/lib.a(network_ipc.o): In function `ipc_postupdate':
network_ipc.c:(.text.ipc_postupdate+0x39): undefined reference to `strndupa'
```

The upstream patch provides a compatibility header file adding a definition
of `strndupa` if it is not already defined.

Backported from:
https://github.com/sbabic/swupdate/commit/9867a9d6a21e6b0b9bcba57c3e2398fe671cea17

Fixes:
http://autobuild.buildroot.net/results/f674219225d0b67d0bc78fd10b47a865250746f4/
http://autobuild.buildroot.net/results/d2b0cfcfec583d203af1b26152f14ded3ebd3eee/
http://autobuild.buildroot.net/results/1d0cbd1eb9b1b70bd9f4d1c4fae431baee9d105c/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...1-compat.h-introduce-compatibility-header.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/swupdate/0001-compat.h-introduce-compatibility-header.patch

diff --git a/package/swupdate/0001-compat.h-introduce-compatibility-header.patch b/package/swupdate/0001-compat.h-introduce-compatibility-header.patch
new file mode 100644
index 0000000000..5e3bfb0f49
--- /dev/null
+++ b/package/swupdate/0001-compat.h-introduce-compatibility-header.patch
@@ -0,0 +1,87 @@
+From 9867a9d6a21e6b0b9bcba57c3e2398fe671cea17 Mon Sep 17 00:00:00 2001
+From: Christian Storm <christian.storm@siemens.com>
+Date: Tue, 16 Jan 2018 10:34:52 +0100
+Subject: [PATCH] compat.h: introduce compatibility header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Introduce a compat.h housing compatibility definitions
+and macros along the lines of commit 7b49b8d having
+introduced a compatibility mechanism for Lua.
+
+First use case (and motivation) is the support for
+musl (https://www.musl-libc.org/) which doesn't
+bother to provide
+    char *strndupa(const char *s, size_t n)
+
+Backported from: 9867a9d6a21e6b0b9bcba57c3e2398fe671cea17
+
+Reviewed-by: Stefano Babic <sbabic@denx.de>
+Reported-by: J?rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: Christian Storm <christian.storm@siemens.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ include/compat.h  | 24 ++++++++++++++++++++++++
+ include/util.h    |  1 +
+ ipc/network_ipc.c |  1 +
+ 3 files changed, 26 insertions(+)
+ create mode 100644 include/compat.h
+
+diff --git a/include/compat.h b/include/compat.h
+new file mode 100644
+index 0000000..29d7af1
+--- /dev/null
++++ b/include/compat.h
+@@ -0,0 +1,24 @@
++/*
++ * Author: Christian Storm
++ * Copyright (C) 2018, Siemens AG
++ *
++ * SPDX-License-Identifier:     GPL-2.0-or-later
++ */
++
++#pragma once
++
++#ifndef strndupa
++/*
++ * Define char *strndupa(const char *s, size_t n)
++ * for, e.g., musl (https://www.musl-libc.org/)
++ * which does not bother to implement this function.
++ */
++#define strndupa(s, n)                          \
++	(__extension__({                            \
++		const char *__in = (s);                 \
++		size_t __len = strnlen(__in, (n)) + 1;  \
++		char *__out = (char *)alloca(__len);    \
++		__out[__len - 1] = '\0';                \
++		(char *)memcpy(__out, __in, __len - 1); \
++	}))
++#endif
+diff --git a/include/util.h b/include/util.h
+index bec2975..d43cd8c 100644
+--- a/include/util.h
++++ b/include/util.h
+@@ -12,6 +12,7 @@
+ #include <string.h>
+ #include "swupdate.h"
+ #include "swupdate_status.h"
++#include "compat.h"
+ 
+ #define NOTIFY_BUF_SIZE 	2048
+ #define ENOMEM_ASPRINTF		-1
+diff --git a/ipc/network_ipc.c b/ipc/network_ipc.c
+index 3f197c7..48f6fcc 100644
+--- a/ipc/network_ipc.c
++++ b/ipc/network_ipc.c
+@@ -27,6 +27,7 @@
+ #include <pthread.h>
+ 
+ #include "network_ipc.h"
++#include "compat.h"
+ 
+ #ifdef CONFIG_SOCKET_CTRL_PATH
+ static char* SOCKET_CTRL_PATH = (char*)CONFIG_SOCKET_CTRL_PATH;
+-- 
+2.15.1
+
-- 
2.15.1
