From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:29:16 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/kvm-unit-tests:
 fix build with SSP
Message-ID: <20200314162025.14DC883676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=474c3b3393e22672c4166cb1e79b6b6f0e8cbdc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add a patch to correct a typo in the Makefile, so -fno-stack-protector /
-fno-stack-protector-all are really used.  With this applied, kvm-unit-tests
will always be built without SSP as intented by upstream.  This will fix the
build on ppc64 with SSP that started to fail for an unknown reason since
November 27th.

Moreover, the Arch Linux workaround could also be removed in a follow-up
patch.

Fixes:
 - http://autobuild.buildroot.org/results/ad689b08173548af21dd1fb0e827fd561de6dfef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc006056bb06352a853a27d6691deac8842b6b20)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Makefile-fix-stack-protector-tests.patch  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch b/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
new file mode 100644
index 0000000000..be819f27c6
--- /dev/null
+++ b/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
@@ -0,0 +1,36 @@
+From 9bf9155804652c0b3a94af9723c79b6de430187b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 24 Feb 2020 00:04:06 +0100
+Subject: [PATCH] Makefile: fix stack-protector tests
+
+Rename fnostack_protector into fno_stack_protector and
+fnostack_protector_all into fnostack_protector_all otherwise build will
+fail if -fstack-protector is passed by the toolchain
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ad689b08173548af21dd1fb0e827fd561de6dfef
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to kvm at vger.kernel.org]
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 767b6c6..754ed65 100644
+--- a/Makefile
++++ b/Makefile
+@@ -55,8 +55,8 @@ COMMON_CFLAGS += -Wignored-qualifiers -Werror
+ 
+ frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
+ fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
+-fnostack_protector := $(call cc-option, -fno-stack-protector, "")
+-fnostack_protector_all := $(call cc-option, -fno-stack-protector-all, "")
++fno_stack_protector := $(call cc-option, -fno-stack-protector, "")
++fno_stack_protector_all := $(call cc-option, -fno-stack-protector-all, "")
+ wno_frame_address := $(call cc-option, -Wno-frame-address, "")
+ fno_pic := $(call cc-option, -fno-pic, "")
+ no_pie := $(call cc-option, -no-pie, "")
+-- 
+2.25.0
+
