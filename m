From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:12:15 +0200
Subject: [Buildroot] [git commit] nommu/flat: build packages with the
	correct FLAGS
Message-ID: <20130912223325.617849B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71701eb6d77f2fe03124f559ed0d1a9e559b3d17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building for nommu flat targets the CFLAGS/CXXFLAGS/LDFLAGS must be
adjusted accordingly.
For gcc this means passing along -Wl,-elf2flt to signal the linker.
For ld this means -elf2flt.

Also correct the error in STACKSIZE settings from commit 9edf482d which
is setting gcc flags as ld flags and will surely fail (no package uses
it at the moment so it was never seen).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

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
