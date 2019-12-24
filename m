From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 24 Dec 2019 17:10:32 +0300
Subject: [Buildroot] [PATCH] arch/arc: Explicitly set "max-page-size" for
 GNU LD
Message-ID: <20191224141032.34544-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Back in the day we relied on a default value that used to be 8KiB
and it worked perfectly fine for ARC's default 8KiB page as well as
4 KiB ones, but not for 16 KiB, see [1] for more details.

So that we fixed by setting "max-page-size" if 16KiB pages are in use by
commit d024d369b82d2 ("arch/arc: Accommodate 16 KiB MMU pages").

But as Yann very rightfully mentioned here [2] we should be setting this
thing explicitly for all page sizes because:
 1. Defaults might change unexpectedly
 2. Explicitly set stuff is better understood
 3. We act similarly to all settings but not only addressing some corner cases

[1] https://git.buildroot.org/buildroot/commit/?id=d024d369b82d2d3d9d4d75489c19e9488202bca0
[2] https://patchwork.ozlabs.org/patch/1212544/#2330647

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/arch.mk.arc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
index 9c04a85a8d..7eb1b95aa7 100644
--- a/arch/arch.mk.arc
+++ b/arch/arch.mk.arc
@@ -5,8 +5,15 @@ ifeq ($(BR2_ARC_ATOMIC_EXT),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
 endif
 
-# By default MAXPAGESIZE for ARC is 8192 so for larger MMU pages
-# it needs to be overridden.
+# Explicitly set LD's "max-page-size" instead of relying on some defaults
+ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
+endif
+
+ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
+endif
+
 ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
 endif
-- 
2.16.2
