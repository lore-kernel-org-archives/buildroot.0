From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Sep 2013 09:53:44 -0300
Subject: [Buildroot] [PATCH] nommu/flat: build packages with the correct
	FLAGS
Message-ID: <1378904024-14607-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building for nommu flat targets the CFLAGS/CXXFLAGS/LDFLAGS must be
adjusted accordingly.
For gcc this means passing along -Wl,-elf2flt to signal the linker.
For ld this means -elf2flt.

Also correct the error in STACKSIZE settings from commit 9edf482d which
is setting gcc flags as ld flags and will surely fail (no package uses
it at the moment so it was never seen).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 91ae1b9..dd365be 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -115,7 +115,11 @@ TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
+TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
+	-Wl$(comma)-elf2flt)
+TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
+	-Wl$(comma)-elf2flt)
+TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-elf2flt)
 endif
 
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
-- 
1.8.1.5
