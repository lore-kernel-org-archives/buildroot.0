From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 22:08:15 +0100
Subject: [Buildroot] [PATCH v2 13/17] package/Makefile.in: adjust LDFLAGS
	for elf2flt
In-Reply-To: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458335299-27409-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far, our LDFLAGS for the BR2_BINFMT_FLAT case were only used on
Blackfin. However, passing -elf2flt in LDFLAGS is wrong. Indeed,
LDFLAGS are not linker flags, but flags passed to the compiler when
linking.

If you pass -elf2flt to the compiler when linking, it is understood as
"-e lf2flt", i.e "the entry point is named lf2flt", which isn't
exactly the intention. We in fact need to pass -Wl,-elf2flt in LDFLAGS
as well, so that the compiler passes -elf2flt down to the linker.

For some reason, this option does not cause an issue with the Blackfin
toolchain, but it does with either a Buildroot toolchain for Cortex-M
or an OSELAS toolchain for Cortex-M. We have verified that passing
-Wl,-elf2flt continues to work with the Blackfin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index dd595e2..616bdd0 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -145,7 +145,7 @@ TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FL
 	-Wl$(comma)-elf2flt)
 TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt)
-TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-elf2flt)
+TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt)
 endif
 
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
-- 
2.6.4
