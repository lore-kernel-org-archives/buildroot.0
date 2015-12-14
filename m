From: Martin Bark <martin@barkynet.com>
Date: Mon, 14 Dec 2015 19:44:54 +0000
Subject: [Buildroot] [PATCH 2/3] package/nodejs: Fix uClibc-ng support
In-Reply-To: <1450122295-5311-1-git-send-email-martin@barkynet.com>
References: <1450122295-5311-1-git-send-email-martin@barkynet.com>
Message-ID: <1450122295-5311-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Bark, Martin" <martin.bark@te.com>

Fix segmentation fault in node.js when using uClibc-ng.

This patch fixes bug #8296, see
https://bugs.busybox.net/show_bug.cgi?id=8296.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../0006-Fix-crash-in-GetInterfaceAddresses.patch  | 37 ++++++++++++++++++++++
 .../0.12.9/0007-Fix-support-for-uClibc-ng.patch    | 32 +++++++++++++++++++
 .../0005-Fix-crash-in-GetInterfaceAddresses.patch  | 37 ++++++++++++++++++++++
 .../4.2.3/0006-Fix-support-for-uClibc-ng.patch     | 32 +++++++++++++++++++
 .../0006-Fix-crash-in-GetInterfaceAddresses.patch  | 37 ++++++++++++++++++++++
 .../5.2.0/0007-Fix-support-for-uClibc-ng.patch     | 32 +++++++++++++++++++
 6 files changed, 207 insertions(+)
 create mode 100644 package/nodejs/0.12.9/0006-Fix-crash-in-GetInterfaceAddresses.patch
 create mode 100644 package/nodejs/0.12.9/0007-Fix-support-for-uClibc-ng.patch
 create mode 100644 package/nodejs/4.2.3/0005-Fix-crash-in-GetInterfaceAddresses.patch
 create mode 100644 package/nodejs/4.2.3/0006-Fix-support-for-uClibc-ng.patch
 create mode 100644 package/nodejs/5.2.0/0006-Fix-crash-in-GetInterfaceAddresses.patch
 create mode 100644 package/nodejs/5.2.0/0007-Fix-support-for-uClibc-ng.patch

diff --git a/package/nodejs/0.12.9/0006-Fix-crash-in-GetInterfaceAddresses.patch b/package/nodejs/0.12.9/0006-Fix-crash-in-GetInterfaceAddresses.patch
new file mode 100644
index 0000000..d964290
--- /dev/null
+++ b/package/nodejs/0.12.9/0006-Fix-crash-in-GetInterfaceAddresses.patch
@@ -0,0 +1,37 @@
+From 839bd9d147b2c85fe70196c86dbdbed504762caf Mon Sep 17 00:00:00 2001
+From: "Bark, Martin" <martin.bark@te.com>
+Date: Mon, 14 Dec 2015 13:27:51 +0000
+Subject: [PATCH 1/2] Fix crash in GetInterfaceAddresses
+
+If uv_interface_addresses() returns UV_ENOSYS then interfaces and count are
+uninitialised. This can cause a segmentation fault inside
+GetInterfaceAddresses when it tries to use the invalid interfaces[]. Fix
+the issue by returning from GetInterfaceAddresses on the UV_ENOSYS error.
+
+This issue was observed when using uCLibc-ng version 1.0.9 because
+uv_interface_addresses() in deps/uv/src/unix/linux-core.c incorrectly
+undefines HAVE_IFADDRS_H.
+
+Submitted upstream, see https://github.com/nodejs/node/pull/4272
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/node_os.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/node_os.cc b/src/node_os.cc
+index a100090..92f53a9 100644
+--- a/src/node_os.cc
++++ b/src/node_os.cc
+@@ -200,7 +200,7 @@ static void GetInterfaceAddresses(const FunctionCallbackInfo<Value>& args) {
+   ret = Object::New(env->isolate());
+ 
+   if (err == UV_ENOSYS) {
+-    args.GetReturnValue().Set(ret);
++    return args.GetReturnValue().Set(ret);
+   } else if (err) {
+     return env->ThrowUVException(err, "uv_interface_addresses");
+   }
+-- 
+2.6.2
+
diff --git a/package/nodejs/0.12.9/0007-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.12.9/0007-Fix-support-for-uClibc-ng.patch
new file mode 100644
index 0000000..918a36a
--- /dev/null
+++ b/package/nodejs/0.12.9/0007-Fix-support-for-uClibc-ng.patch
@@ -0,0 +1,32 @@
+From 1cc08f6ceacbb0e5ba1f4638ca3a97ac002d7792 Mon Sep 17 00:00:00 2001
+From: "Bark, Martin" <martin.bark@te.com>
+Date: Mon, 14 Dec 2015 13:26:10 +0000
+Subject: [PATCH 2/2] Fix support for uClibc-ng
+
+uClibc-ng is currently at v1.0.9.  The patch corrects the uClibc
+version test so that HAVE_IFADDRS_H is defined for uClibc versions
+after v0.9.32.
+
+Submitted upstream to libuv, see https://github.com/libuv/libuv/pull/653
+
+Signed-off-by: Bark, Martin <martin.bark@te.com>
+---
+ deps/uv/src/unix/linux-core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/uv/src/unix/linux-core.c b/deps/uv/src/unix/linux-core.c
+index e6e6828..6cbbb71 100644
+--- a/deps/uv/src/unix/linux-core.c
++++ b/deps/uv/src/unix/linux-core.c
+@@ -39,7 +39,7 @@
+ #define HAVE_IFADDRS_H 1
+ 
+ #ifdef __UCLIBC__
+-# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
++# if __UCLIBC_MAJOR__ < 0 && __UCLIBC_MINOR__ < 9 && __UCLIBC_SUBLEVEL__ < 32
+ #  undef HAVE_IFADDRS_H
+ # endif
+ #endif
+-- 
+2.6.2
+
diff --git a/package/nodejs/4.2.3/0005-Fix-crash-in-GetInterfaceAddresses.patch b/package/nodejs/4.2.3/0005-Fix-crash-in-GetInterfaceAddresses.patch
new file mode 100644
index 0000000..d964290
--- /dev/null
+++ b/package/nodejs/4.2.3/0005-Fix-crash-in-GetInterfaceAddresses.patch
@@ -0,0 +1,37 @@
+From 839bd9d147b2c85fe70196c86dbdbed504762caf Mon Sep 17 00:00:00 2001
+From: "Bark, Martin" <martin.bark@te.com>
+Date: Mon, 14 Dec 2015 13:27:51 +0000
+Subject: [PATCH 1/2] Fix crash in GetInterfaceAddresses
+
+If uv_interface_addresses() returns UV_ENOSYS then interfaces and count are
+uninitialised. This can cause a segmentation fault inside
+GetInterfaceAddresses when it tries to use the invalid interfaces[]. Fix
+the issue by returning from GetInterfaceAddresses on the UV_ENOSYS error.
+
+This issue was observed when using uCLibc-ng version 1.0.9 because
+uv_interface_addresses() in deps/uv/src/unix/linux-core.c incorrectly
+undefines HAVE_IFADDRS_H.
+
+Submitted upstream, see https://github.com/nodejs/node/pull/4272
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/node_os.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/node_os.cc b/src/node_os.cc
+index a100090..92f53a9 100644
+--- a/src/node_os.cc
++++ b/src/node_os.cc
+@@ -200,7 +200,7 @@ static void GetInterfaceAddresses(const FunctionCallbackInfo<Value>& args) {
+   ret = Object::New(env->isolate());
+ 
+   if (err == UV_ENOSYS) {
+-    args.GetReturnValue().Set(ret);
++    return args.GetReturnValue().Set(ret);
+   } else if (err) {
+     return env->ThrowUVException(err, "uv_interface_addresses");
+   }
+-- 
+2.6.2
+
diff --git a/package/nodejs/4.2.3/0006-Fix-support-for-uClibc-ng.patch b/package/nodejs/4.2.3/0006-Fix-support-for-uClibc-ng.patch
new file mode 100644
index 0000000..918a36a
--- /dev/null
+++ b/package/nodejs/4.2.3/0006-Fix-support-for-uClibc-ng.patch
@@ -0,0 +1,32 @@
+From 1cc08f6ceacbb0e5ba1f4638ca3a97ac002d7792 Mon Sep 17 00:00:00 2001
+From: "Bark, Martin" <martin.bark@te.com>
+Date: Mon, 14 Dec 2015 13:26:10 +0000
+Subject: [PATCH 2/2] Fix support for uClibc-ng
+
+uClibc-ng is currently at v1.0.9.  The patch corrects the uClibc
+version test so that HAVE_IFADDRS_H is defined for uClibc versions
+after v0.9.32.
+
+Submitted upstream to libuv, see https://github.com/libuv/libuv/pull/653
+
+Signed-off-by: Bark, Martin <martin.bark@te.com>
+---
+ deps/uv/src/unix/linux-core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/uv/src/unix/linux-core.c b/deps/uv/src/unix/linux-core.c
+index e6e6828..6cbbb71 100644
+--- a/deps/uv/src/unix/linux-core.c
++++ b/deps/uv/src/unix/linux-core.c
+@@ -39,7 +39,7 @@
+ #define HAVE_IFADDRS_H 1
+ 
+ #ifdef __UCLIBC__
+-# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
++# if __UCLIBC_MAJOR__ < 0 && __UCLIBC_MINOR__ < 9 && __UCLIBC_SUBLEVEL__ < 32
+ #  undef HAVE_IFADDRS_H
+ # endif
+ #endif
+-- 
+2.6.2
+
diff --git a/package/nodejs/5.2.0/0006-Fix-crash-in-GetInterfaceAddresses.patch b/package/nodejs/5.2.0/0006-Fix-crash-in-GetInterfaceAddresses.patch
new file mode 100644
index 0000000..d964290
--- /dev/null
+++ b/package/nodejs/5.2.0/0006-Fix-crash-in-GetInterfaceAddresses.patch
@@ -0,0 +1,37 @@
+From 839bd9d147b2c85fe70196c86dbdbed504762caf Mon Sep 17 00:00:00 2001
+From: "Bark, Martin" <martin.bark@te.com>
+Date: Mon, 14 Dec 2015 13:27:51 +0000
+Subject: [PATCH 1/2] Fix crash in GetInterfaceAddresses
+
+If uv_interface_addresses() returns UV_ENOSYS then interfaces and count are
+uninitialised. This can cause a segmentation fault inside
+GetInterfaceAddresses when it tries to use the invalid interfaces[]. Fix
+the issue by returning from GetInterfaceAddresses on the UV_ENOSYS error.
+
+This issue was observed when using uCLibc-ng version 1.0.9 because
+uv_interface_addresses() in deps/uv/src/unix/linux-core.c incorrectly
+undefines HAVE_IFADDRS_H.
+
+Submitted upstream, see https://github.com/nodejs/node/pull/4272
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/node_os.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/node_os.cc b/src/node_os.cc
+index a100090..92f53a9 100644
+--- a/src/node_os.cc
++++ b/src/node_os.cc
+@@ -200,7 +200,7 @@ static void GetInterfaceAddresses(const FunctionCallbackInfo<Value>& args) {
+   ret = Object::New(env->isolate());
+ 
+   if (err == UV_ENOSYS) {
+-    args.GetReturnValue().Set(ret);
++    return args.GetReturnValue().Set(ret);
+   } else if (err) {
+     return env->ThrowUVException(err, "uv_interface_addresses");
+   }
+-- 
+2.6.2
+
diff --git a/package/nodejs/5.2.0/0007-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.2.0/0007-Fix-support-for-uClibc-ng.patch
new file mode 100644
index 0000000..918a36a
--- /dev/null
+++ b/package/nodejs/5.2.0/0007-Fix-support-for-uClibc-ng.patch
@@ -0,0 +1,32 @@
+From 1cc08f6ceacbb0e5ba1f4638ca3a97ac002d7792 Mon Sep 17 00:00:00 2001
+From: "Bark, Martin" <martin.bark@te.com>
+Date: Mon, 14 Dec 2015 13:26:10 +0000
+Subject: [PATCH 2/2] Fix support for uClibc-ng
+
+uClibc-ng is currently at v1.0.9.  The patch corrects the uClibc
+version test so that HAVE_IFADDRS_H is defined for uClibc versions
+after v0.9.32.
+
+Submitted upstream to libuv, see https://github.com/libuv/libuv/pull/653
+
+Signed-off-by: Bark, Martin <martin.bark@te.com>
+---
+ deps/uv/src/unix/linux-core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/uv/src/unix/linux-core.c b/deps/uv/src/unix/linux-core.c
+index e6e6828..6cbbb71 100644
+--- a/deps/uv/src/unix/linux-core.c
++++ b/deps/uv/src/unix/linux-core.c
+@@ -39,7 +39,7 @@
+ #define HAVE_IFADDRS_H 1
+ 
+ #ifdef __UCLIBC__
+-# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
++# if __UCLIBC_MAJOR__ < 0 && __UCLIBC_MINOR__ < 9 && __UCLIBC_SUBLEVEL__ < 32
+ #  undef HAVE_IFADDRS_H
+ # endif
+ #endif
+-- 
+2.6.2
+
-- 
2.5.0
