From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Apr 2014 09:53:33 -0300
Subject: [Buildroot] [PATCH] glibc: fix build for microblaze
Message-ID: <1398776013-9322-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a conditional patch to get glibc building for microblaze toolchains,
see https://sourceware.org/ml/libc-help/2014-04/msg00020.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...icroblaze-link-with-libgcc_eh.patch.conditional | 23 ++++++++++++++++++++++
 ...icroblaze-link-with-libgcc_eh.patch.conditional | 23 ++++++++++++++++++++++
 package/glibc/glibc.mk                             |  9 +++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 package/glibc/2.18/glibc-microblaze-link-with-libgcc_eh.patch.conditional
 create mode 100644 package/glibc/2.19/glibc-microblaze-link-with-libgcc_eh.patch.conditional

diff --git a/package/glibc/2.18/glibc-microblaze-link-with-libgcc_eh.patch.conditional b/package/glibc/2.18/glibc-microblaze-link-with-libgcc_eh.patch.conditional
new file mode 100644
index 0000000..2ec1662
--- /dev/null
+++ b/package/glibc/2.18/glibc-microblaze-link-with-libgcc_eh.patch.conditional
@@ -0,0 +1,23 @@
+Temporary workaround to make it build, see:
+https://sourceware.org/ml/libc-help/2014-04/msg00020.html
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
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
diff --git a/package/glibc/2.19/glibc-microblaze-link-with-libgcc_eh.patch.conditional b/package/glibc/2.19/glibc-microblaze-link-with-libgcc_eh.patch.conditional
new file mode 100644
index 0000000..2ec1662
--- /dev/null
+++ b/package/glibc/2.19/glibc-microblaze-link-with-libgcc_eh.patch.conditional
@@ -0,0 +1,23 @@
+Temporary workaround to make it build, see:
+https://sourceware.org/ml/libc-help/2014-04/msg00020.html
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
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
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d02ab7e..e3028a5 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -37,6 +37,15 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 GLIBC_EXTRA_CFLAGS += -marm
 endif
 
+# Microblaze patches
+ifeq ($(BR2_microblaze)$(BR2_TOOLCHAIN_BUILDROOT_GLIBC),yy)
+define GLIBC_PATCH_MICROBLAZE
+	support/scripts/apply-patches.sh $(@D) package/glibc/$(GLIBC_VERSION) \
+		glibc-microblaze-link-with-libgcc_eh.patch.conditional
+endef
+endif
+GLIBC_POST_PATCH_HOOKS += GLIBC_PATCH_MICROBLAZE
+
 # MIPS64 defaults to n32 so pass the correct -mabi if
 # we are using a different ABI. OABI32 is also used
 # in MIPS so we pass -mabi=32 in this case as well
-- 
1.8.3.2
