From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 18 Feb 2017 22:40:54 +0100
Subject: [Buildroot] [PATCH] kmod: workaround for microblaze ld bug
Message-ID: <20170218214054.GA361@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a workaround for a microblaze specific ld bug to avoid
segfault.

Fixes:
  http://autobuild.buildroot.net/results/aef1b915ffd3e5678af8682727c22c5618edfd89

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/kmod/kmod.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 7492b92..2524bcd 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -15,6 +15,16 @@ HOST_KMOD_DEPENDENCIES = host-pkgconf
 KMOD_LICENSE = LGPLv2.1+ (library)
 KMOD_LICENSE_FILES = libkmod/COPYING
 
+# --gc-sections triggers binutils ld segfault
+# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
+ifeq ($(BR2_microblaze),y)
+define KMOD_PRECONFIGURE
+	sed -i 's:-Wl,--gc-sections::g' $(@D)/configure
+endef
+
+KMOD_PRE_CONFIGURE_HOOKS += KMOD_PRECONFIGURE
+endif
+
 # static linking not supported, see
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 KMOD_CONF_OPTS = --disable-static --enable-shared
-- 
2.1.4
