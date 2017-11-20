From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Nov 2017 22:11:47 +0100
Subject: [Buildroot] [git commit] kvm-unit-tests: bump version to fix build
 issue
Message-ID: <20171120210541.D7A76812D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=041715cc5337bbd7311da4f5b0fd97da1b902a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since binutils commit 1a9ccd70f9a7 ("Fix the linker so that it will not
silently generate ELF binaries with invalid program headers. Fix readelf
to report such invalid binaries.") the behaviour has changed and
binutils tries to create a program header segment for which there is no
space. Thanks to Nicholas Piggin and his patch to Linux:
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=ff45000fcb56b5b0f

Cedric fixed this in kvm-unit-tests commit 95062c20790d ("powerpc: add
-n to LDFLAGS") so bump to that version.

Since the patch 0001-remove-werror.patch needs to be adjusted, we take
this opportunity to reformat is as a Git patch.

Fixes:

  http://autobuild.buildroot.net/results/80825b492abf61313637b109d6a0944b38d5f739

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
[Thomas: add necessary hash change, refresh patch that was not
applying anymore.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ile-remove-Werror-to-avoid-build-failures.patch | 26 ++++++++++++++++++++++
 package/kvm-unit-tests/0001-remove-werror.patch    | 17 --------------
 package/kvm-unit-tests/kvm-unit-tests.hash         |  2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk           |  2 +-
 4 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
new file mode 100644
index 0000000..b1ea092
--- /dev/null
+++ b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
@@ -0,0 +1,26 @@
+From 08e14a662b9e75daec29722e49150869952ba1b6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 20 Nov 2017 22:09:39 +0100
+Subject: [PATCH] Makefile: remove -Werror to avoid build failures
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 16ce297..909498e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -45,7 +45,7 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
+               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
+ 
+ CFLAGS += -g
+-CFLAGS += $(autodepend-flags) -Wall -Werror
++CFLAGS += $(autodepend-flags) -Wall
+ frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
+ fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
+ fnostack_protector := $(call cc-option, -fno-stack-protector, "")
+-- 
+2.13.6
+
diff --git a/package/kvm-unit-tests/0001-remove-werror.patch b/package/kvm-unit-tests/0001-remove-werror.patch
deleted file mode 100644
index 058a640..0000000
--- a/package/kvm-unit-tests/0001-remove-werror.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Remove -Werror to avoid build failures
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -45,7 +45,7 @@
-               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
- 
- CFLAGS += -g
--CFLAGS += $(autodepend-flags) -Wall -Werror -Wno-frame-address
-+CFLAGS += $(autodepend-flags) -Wall -Wno-frame-address
- frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
- fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
- fnostack_protector := $(call cc-option, -fno-stack-protector, "")
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index b83e57d..2a4cfe0 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8cb85e5af51820dea8c250e1d4dac723de92c5cd8878354c6fa5c099975f3264  kvm-unit-tests-5731572b2ac23eb410732110b93425b5bb7f27dd.tar.gz
+sha256 ccb9ff17a2c7d6c7d50b4b71b87381181b45484187100ae5b1ac54d9d61e8666  kvm-unit-tests-95062c20790d82713bfa7475b61a4adef3f3645a.tar.gz
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 3a5d0fd..c630ec6 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 5731572b2ac23eb410732110b93425b5bb7f27dd
+KVM_UNIT_TESTS_VERSION = 95062c20790d82713bfa7475b61a4adef3f3645a
 KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
 KVM_UNIT_TESTS_SITE_METHOD = git
 KVM_UNIT_TESTS_LICENSE = LGPL-2.0
