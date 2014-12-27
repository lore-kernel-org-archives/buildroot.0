From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:24 +0100
Subject: [Buildroot] [PATCH 06/10] package/libxmlrpc: fix shared libraries
	build for uClibc
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-7-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libxmlrpc is able to build shared libraries only for (e)glibc system
since the regexp in config.mk.in is based on "linux-gnu".

Change this regexp to match "linux-uclibc".

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ....in-fix-shared-libraries-build-for-uClibc.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/libxmlrpc/0005-config.mk.in-fix-shared-libraries-build-for-uClibc.patch

diff --git a/package/libxmlrpc/0005-config.mk.in-fix-shared-libraries-build-for-uClibc.patch b/package/libxmlrpc/0005-config.mk.in-fix-shared-libraries-build-for-uClibc.patch
new file mode 100644
index 0000000..5970df5
--- /dev/null
+++ b/package/libxmlrpc/0005-config.mk.in-fix-shared-libraries-build-for-uClibc.patch
@@ -0,0 +1,27 @@
+From 5d68179a54b0a34d989722dcbe3b6eb962feb27d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Tue, 23 Dec 2014 16:04:18 +0100
+Subject: [PATCH] config.mk.in: fix shared libraries build for uClibc
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ config.mk.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/config.mk.in b/config.mk.in
+index c5d4160..45461cf 100644
+--- a/config.mk.in
++++ b/config.mk.in
+@@ -166,7 +166,8 @@ shliblefn = $(1:%=%.shlibledummy)
+ # HOST_OS is usually has a version number suffix, e.g. "aix5.3.0.0", so
+ # we compare based on prefix.
+ 
+-ifeq ($(patsubst linux-gnu%,linux-gnu,$(HOST_OS)),linux-gnu)
++# linux-uclibc is also a linux
++ifeq ($(patsubst linux-%,linux-,$(HOST_OS)),linux-)
+   # Assume linker is GNU Compiler (gcc)
+   SHARED_LIB_TYPE = unix
+   MUST_BUILD_SHLIB = Y
+-- 
+1.9.3
+
-- 
1.9.3
