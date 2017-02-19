From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:27:14 +0100
Subject: [Buildroot] [git commit] kmod: workaround for microblaze ld bug
Message-ID: <20170219212848.4394A82138@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d81107f021bf2a663f102bace1e3f9590641170
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a workaround for a microblaze specific ld bug to avoid
segfault.

Fixes:
  http://autobuild.buildroot.net/results/aef1b915ffd3e5678af8682727c22c5618edfd89

[Peter: force --gc-sections configure check to false instead of patching
 	configure]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 7492b92..407d90d 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -15,6 +15,12 @@ HOST_KMOD_DEPENDENCIES = host-pkgconf
 KMOD_LICENSE = LGPLv2.1+ (library)
 KMOD_LICENSE_FILES = libkmod/COPYING
 
+# --gc-sections triggers binutils ld segfault
+# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
+ifeq ($(BR2_microblaze),y)
+KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=false
+endif
+
 # static linking not supported, see
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 KMOD_CONF_OPTS = --disable-static --enable-shared
