From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 13 Apr 2014 11:47:02 +0200
Subject: [Buildroot] [PATCH 5/6] temporary hack to fix linking error
In-Reply-To: <1397382423-4939-1-git-send-email-wbx@openadk.org>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
Message-ID: <1397382423-4939-6-git-send-email-wbx@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See here for more info:
https://sourceware.org/ml/libc-help/2014-04/msg00020.html

Still working on the issue.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/glibc/2.18/microblaze-libgcc_eh.patch |   18 ++++++++++++++++++
 package/glibc/2.19/microblaze-libgcc_eh.patch |   18 ++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 package/glibc/2.18/microblaze-libgcc_eh.patch
 create mode 100644 package/glibc/2.19/microblaze-libgcc_eh.patch

diff --git a/package/glibc/2.18/microblaze-libgcc_eh.patch b/package/glibc/2.18/microblaze-libgcc_eh.patch
new file mode 100644
index 0000000..a8650df
--- /dev/null
+++ b/package/glibc/2.18/microblaze-libgcc_eh.patch
@@ -0,0 +1,18 @@
+diff -Nur glibc-2.19.orig/Makeconfig glibc-2.19/Makeconfig
+--- glibc-2.19.orig/Makeconfig	2014-02-07 10:04:38.000000000 +0100
++++ glibc-2.19/Makeconfig	2014-04-11 08:22:27.000000000 +0200
+@@ -559,12 +559,12 @@
+ # statically link programs.  When --disable-shared is used, we use
+ # -lgcc_eh since elf/static-stubs.o isn't sufficient.
+ ifeq (yes,$(build-shared))
+-static-gnulib = -lgcc $(static-gnulib-arch)
++static-gnulib = -lgcc -lgcc_eh $(static-gnulib-arch)
+ else
+ static-gnulib = -lgcc -lgcc_eh $(static-gnulib-arch)
+ endif
+ static-gnulib-tests := -lgcc -lgcc_eh $(libunwind)
+-libc.so-gnulib := -lgcc
++libc.so-gnulib := -lgcc -lgcc_eh
+ endif
+ +preinit = $(addprefix $(csu-objpfx),crti.o)
+ +postinit = $(addprefix $(csu-objpfx),crtn.o)
diff --git a/package/glibc/2.19/microblaze-libgcc_eh.patch b/package/glibc/2.19/microblaze-libgcc_eh.patch
new file mode 100644
index 0000000..a8650df
--- /dev/null
+++ b/package/glibc/2.19/microblaze-libgcc_eh.patch
@@ -0,0 +1,18 @@
+diff -Nur glibc-2.19.orig/Makeconfig glibc-2.19/Makeconfig
+--- glibc-2.19.orig/Makeconfig	2014-02-07 10:04:38.000000000 +0100
++++ glibc-2.19/Makeconfig	2014-04-11 08:22:27.000000000 +0200
+@@ -559,12 +559,12 @@
+ # statically link programs.  When --disable-shared is used, we use
+ # -lgcc_eh since elf/static-stubs.o isn't sufficient.
+ ifeq (yes,$(build-shared))
+-static-gnulib = -lgcc $(static-gnulib-arch)
++static-gnulib = -lgcc -lgcc_eh $(static-gnulib-arch)
+ else
+ static-gnulib = -lgcc -lgcc_eh $(static-gnulib-arch)
+ endif
+ static-gnulib-tests := -lgcc -lgcc_eh $(libunwind)
+-libc.so-gnulib := -lgcc
++libc.so-gnulib := -lgcc -lgcc_eh
+ endif
+ +preinit = $(addprefix $(csu-objpfx),crti.o)
+ +postinit = $(addprefix $(csu-objpfx),crtn.o)
-- 
1.7.10.4
