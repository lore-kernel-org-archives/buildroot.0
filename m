From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Dec 2015 11:57:06 +0000
Subject: [Buildroot] [PATCH 1/3] qemu: bump version to 2.5.0
Message-ID: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 2.5.0.

- Update hash file.

- Remove upstreamed patch:

  http://git.qemu.org/?p=qemu.git;a=commit;h=fccd35a04640a728f979e6d72b2c7d02c05549f0

- Remove non-existent configure options:

  ERROR: unknown option --disable-guest-base
  Try './configure --help' for more information

  ERROR: unknown option --disable-smartcard-nss
  Try './configure --help' for more information

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...se-appropriate-code-fragment-for-fstack-p.patch | 58 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  4 +-
 3 files changed, 2 insertions(+), 62 deletions(-)
 delete mode 100644 package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch

diff --git a/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch b/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
deleted file mode 100644
index 9ebe334..0000000
--- a/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 7b93e98143c376ed09bfd30658b8641d4a36e77e Mon Sep 17 00:00:00 2001
-From: Rodrigo Rebello <rprebello@gmail.com>
-Date: Thu, 12 Nov 2015 12:04:28 -0200
-Subject: [PATCH] configure: use appropriate code fragment for
- -fstack-protector checks
-Cc: qemu-trivial at nongnu.org
-
-The check for stack-protector support consisted in compiling and linking
-the test program below (output by function write_c_skeleton()) with the
-compiler flag -fstack-protector-strong first and then with
--fstack-protector-all if the first one failed to work:
-
-  int main(void) { return 0; }
-
-This caused false positives when using certain toolchains in which the
-compiler accepts -fstack-protector-strong but no support is provided by
-the C library, since in this stack-protector variant the compiler emits
-canary code only for functions that meet specific conditions (local
-arrays, memory references to local variables, etc.) and the code
-fragment under test included none of them (hence no stack protection
-code generated, no link failure).
-
-This fix modifies the test program used for -fstack-protector checks to
-meet conditions which cause the compiler to generate canary code in all
-variants.
-
-Upstream status: sent
-https://patchwork.ozlabs.org/patch/543357/
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- configure | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/configure b/configure
-index cd219d8..27d7b3c 100755
---- a/configure
-+++ b/configure
-@@ -1471,6 +1471,16 @@ for flag in $gcc_flags; do
- done
- 
- if test "$stack_protector" != "no"; then
-+  cat > $TMPC << EOF
-+int main(int argc, char *argv[])
-+{
-+    char arr[64], *p = arr, *c = argv[0];
-+    while (*c) {
-+        *p++ = *c++;
-+    }
-+    return 0;
-+}
-+EOF
-   gcc_flags="-fstack-protector-strong -fstack-protector-all"
-   sp_on=0
-   for flag in $gcc_flags; do
--- 
-2.1.4
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index c563271..cccb059 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 ecfe8b88037e41e817d72c460c56c6a0b573d540d6ba38b162d0de4fd22d1bdb  qemu-2.4.0.1.tar.bz2
+sha256 3443887401619fe33bfa5d900a4f2d6a79425ae2b7e43d5b8c36eb7a683772d4  qemu-2.5.0.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 7accc1e..1b08b42 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.4.0.1
+QEMU_VERSION = 2.5.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
@@ -197,7 +197,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-curses                \
 			--disable-curl                  \
 			--disable-bluez                 \
-			--disable-guest-base            \
 			--disable-uuid                  \
 			--disable-vde                   \
 			--disable-linux-aio             \
@@ -207,7 +206,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-rbd                   \
 			--disable-libiscsi              \
 			--disable-usb-redir             \
-			--disable-smartcard-nss         \
 			--disable-strip                 \
 			--disable-seccomp               \
 			--disable-sparse                \
-- 
2.4.10
