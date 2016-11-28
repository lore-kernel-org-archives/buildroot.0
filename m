From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Nov 2016 22:01:02 +0100
Subject: [Buildroot] [PATCH] roseapplepi: add kernel patches to fix linux
	build issues with gcc 5
Message-ID: <20161128210102.4770-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport 2 patches from upstream (from 3.18-rc1) for gcc 5.x support and a
patch from Marco Franceschetti (https://github.com/vonfritz/kernel/) to fix
gcc 5.x compat issues in the bsp wifi drivers.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../linux/0002-kernel-add-support-for-gcc-5.patch  |  99 +++++++++++++++++
 ...LLVMLinux-use-static-inline-in-ARM-ftrace.patch |  54 +++++++++
 .../linux/0004-Fix-compile-errors-with-gcc5.patch  | 121 +++++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch
 create mode 100644 board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
 create mode 100644 board/roseapplepi/patches/linux/0004-Fix-compile-errors-with-gcc5.patch

diff --git a/board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch b/board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch
new file mode 100644
index 0000000..8d3c703
--- /dev/null
+++ b/board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch
@@ -0,0 +1,99 @@
+From 96b4fb75d15be65edc5494579e4a944534042f99 Mon Sep 17 00:00:00 2001
+From: Sasha Levin <sasha.levin@oracle.com>
+Date: Mon, 13 Oct 2014 15:51:05 -0700
+Subject: [PATCH] kernel: add support for gcc 5
+
+We're missing include/linux/compiler-gcc5.h which is required now
+because gcc branched off to v5 in trunk.
+
+Just copy the relevant bits out of include/linux/compiler-gcc4.h,
+no new code is added as of now.
+
+This fixes a build error when using gcc 5.
+
+Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
+Cc: <stable@vger.kernel.org>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+(cherry picked from commit 71458cfc782eafe4b27656e078d379a34e472adf)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ include/linux/compiler-gcc5.h | 66 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 66 insertions(+)
+ create mode 100644 include/linux/compiler-gcc5.h
+
+diff --git a/include/linux/compiler-gcc5.h b/include/linux/compiler-gcc5.h
+new file mode 100644
+index 0000000..cdd1cc2
+--- /dev/null
++++ b/include/linux/compiler-gcc5.h
+@@ -0,0 +1,66 @@
++#ifndef __LINUX_COMPILER_H
++#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
++#endif
++
++#define __used				__attribute__((__used__))
++#define __must_check			__attribute__((warn_unused_result))
++#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
++
++/* Mark functions as cold. gcc will assume any path leading to a call
++   to them will be unlikely.  This means a lot of manual unlikely()s
++   are unnecessary now for any paths leading to the usual suspects
++   like BUG(), printk(), panic() etc. [but let's keep them for now for
++   older compilers]
++
++   Early snapshots of gcc 4.3 don't support this and we can't detect this
++   in the preprocessor, but we can live with this because they're unreleased.
++   Maketime probing would be overkill here.
++
++   gcc also has a __attribute__((__hot__)) to move hot functions into
++   a special section, but I don't see any sense in this right now in
++   the kernel context */
++#define __cold			__attribute__((__cold__))
++
++#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
++
++#ifndef __CHECKER__
++# define __compiletime_warning(message) __attribute__((warning(message)))
++# define __compiletime_error(message) __attribute__((error(message)))
++#endif /* __CHECKER__ */
++
++/*
++ * Mark a position in code as unreachable.  This can be used to
++ * suppress control flow warnings after asm blocks that transfer
++ * control elsewhere.
++ *
++ * Early snapshots of gcc 4.5 don't support this and we can't detect
++ * this in the preprocessor, but we can live with this because they're
++ * unreleased.  Really, we need to have autoconf for the kernel.
++ */
++#define unreachable() __builtin_unreachable()
++
++/* Mark a function definition as prohibited from being cloned. */
++#define __noclone	__attribute__((__noclone__))
++
++/*
++ * Tell the optimizer that something else uses this function or variable.
++ */
++#define __visible __attribute__((externally_visible))
++
++/*
++ * GCC 'asm goto' miscompiles certain code sequences:
++ *
++ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
++ *
++ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
++ * Fixed in GCC 4.8.2 and later versions.
++ *
++ * (asm goto is automatically volatile - the naming reflects this.)
++ */
++#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
++
++#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
++#define __HAVE_BUILTIN_BSWAP32__
++#define __HAVE_BUILTIN_BSWAP64__
++#define __HAVE_BUILTIN_BSWAP16__
++#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
+-- 
+2.10.2
+
diff --git a/board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch b/board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
new file mode 100644
index 0000000..da38f26
--- /dev/null
+++ b/board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
@@ -0,0 +1,54 @@
+From 8ac9a3f6dbf00d861134bea3f2c930defed6311a Mon Sep 17 00:00:00 2001
+From: Behan Webster <behanw@converseincode.com>
+Date: Wed, 24 Sep 2014 01:06:46 +0100
+Subject: [PATCH] ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h
+
+With compilers which follow the C99 standard (like modern versions of gcc and
+clang), "extern inline" does the wrong thing (emits code for an externally
+linkable version of the inline function). In this case using static inline
+and removing the NULL version of return_address in return_address.c does
+the right thing.
+
+Signed-off-by: Behan Webster <behanw@converseincode.com>
+Reviewed-by: Mark Charlebois <charlebm@gmail.com>
+Acked-by: Steven Rostedt <rostedt@goodmis.org>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+(cherry picked from commit aeea3592a13bf12861943e44fc48f1f270941f8d)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ arch/arm/include/asm/ftrace.h    | 2 +-
+ arch/arm/kernel/return_address.c | 5 -----
+ 2 files changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
+index f89515a..2bb8cac 100644
+--- a/arch/arm/include/asm/ftrace.h
++++ b/arch/arm/include/asm/ftrace.h
+@@ -45,7 +45,7 @@ void *return_address(unsigned int);
+ 
+ #else
+ 
+-extern inline void *return_address(unsigned int level)
++static inline void *return_address(unsigned int level)
+ {
+ 	return NULL;
+ }
+diff --git a/arch/arm/kernel/return_address.c b/arch/arm/kernel/return_address.c
+index 2f8f523..a3b587f 100755
+--- a/arch/arm/kernel/return_address.c
++++ b/arch/arm/kernel/return_address.c
+@@ -63,11 +63,6 @@ void *return_address(unsigned int level)
+ //#warning "TODO: return_address should use unwind tables"
+ //#endif
+ 
+-void *return_address(unsigned int level)
+-{
+-	return NULL;
+-}
+-
+ #endif /* if defined(CONFIG_FRAME_POINTER) && !defined(CONFIG_ARM_UNWIND) / else */
+ 
+ EXPORT_SYMBOL_GPL(return_address);
+-- 
+2.10.2
+
diff --git a/board/roseapplepi/patches/linux/0004-Fix-compile-errors-with-gcc5.patch b/board/roseapplepi/patches/linux/0004-Fix-compile-errors-with-gcc5.patch
new file mode 100644
index 0000000..d76e285
--- /dev/null
+++ b/board/roseapplepi/patches/linux/0004-Fix-compile-errors-with-gcc5.patch
@@ -0,0 +1,121 @@
+From ef34609395c72a1e777ef9c3fb6ce60aa92976bb Mon Sep 17 00:00:00 2001
+From: Marco Franceschetti <vonfritz1@gmail.com>
+Date: Sun, 13 Mar 2016 09:44:54 +0100
+Subject: [PATCH] Fix compile errors with gcc5
+
+(cherry picked from commit e824d45043efd49607f66c89c921b07c1523bf9e)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h    | 6 +++---
+ drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h     | 6 +++---
+ drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h | 6 +++---
+ drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h     | 6 +++---
+ 4 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h b/drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h
+index fc293c4..0898cd4 100755
+--- a/drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h
++++ b/drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h
+@@ -1314,18 +1314,18 @@ enum ieee80211_state {
+ (((Addr[2]) & 0xff) == 0xff) && (((Addr[3]) & 0xff) == 0xff) && (((Addr[4]) & 0xff) == 0xff) && \
+ (((Addr[5]) & 0xff) == 0xff))
+ #else
+-extern __inline int is_multicast_mac_addr(const u8 *addr)
++static __inline int is_multicast_mac_addr(const u8 *addr)
+ {
+         return ((addr[0] != 0xff) && (0x01 & addr[0]));
+ }
+ 
+-extern __inline int is_broadcast_mac_addr(const u8 *addr)
++static __inline int is_broadcast_mac_addr(const u8 *addr)
+ {
+ 	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
+ 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
+ }
+ 
+-extern __inline int is_zero_mac_addr(const u8 *addr)
++static __inline int is_zero_mac_addr(const u8 *addr)
+ {
+ 	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
+ 		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
+diff --git a/drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h b/drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h
+index 09475ef..56e0f5a 100755
+--- a/drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h
++++ b/drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h
+@@ -1318,18 +1318,18 @@ enum ieee80211_state {
+ (((Addr[2]) & 0xff) == 0xff) && (((Addr[3]) & 0xff) == 0xff) && (((Addr[4]) & 0xff) == 0xff) && \
+ (((Addr[5]) & 0xff) == 0xff))
+ #else
+-extern __inline int is_multicast_mac_addr(const u8 *addr)
++static __inline int is_multicast_mac_addr(const u8 *addr)
+ {
+         return ((addr[0] != 0xff) && (0x01 & addr[0]));
+ }
+ 
+-extern __inline int is_broadcast_mac_addr(const u8 *addr)
++static __inline int is_broadcast_mac_addr(const u8 *addr)
+ {
+ 	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
+ 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
+ }
+ 
+-extern __inline int is_zero_mac_addr(const u8 *addr)
++static __inline int is_zero_mac_addr(const u8 *addr)
+ {
+ 	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
+ 		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
+diff --git a/drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h b/drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h
+index 5dfc421..95144b6 100755
+--- a/drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h
++++ b/drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h
+@@ -1314,18 +1314,18 @@ enum ieee80211_state {
+ (((Addr[2]) & 0xff) == 0xff) && (((Addr[3]) & 0xff) == 0xff) && (((Addr[4]) & 0xff) == 0xff) && \
+ (((Addr[5]) & 0xff) == 0xff))
+ #else
+-extern __inline int is_multicast_mac_addr(const u8 *addr)
++static __inline int is_multicast_mac_addr(const u8 *addr)
+ {
+         return ((addr[0] != 0xff) && (0x01 & addr[0]));
+ }
+ 
+-extern __inline int is_broadcast_mac_addr(const u8 *addr)
++static __inline int is_broadcast_mac_addr(const u8 *addr)
+ {
+ 	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
+ 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
+ }
+ 
+-extern __inline int is_zero_mac_addr(const u8 *addr)
++static __inline int is_zero_mac_addr(const u8 *addr)
+ {
+ 	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
+ 		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
+diff --git a/drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h b/drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h
+index 09475ef..56e0f5a 100755
+--- a/drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h
++++ b/drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h
+@@ -1318,18 +1318,18 @@ enum ieee80211_state {
+ (((Addr[2]) & 0xff) == 0xff) && (((Addr[3]) & 0xff) == 0xff) && (((Addr[4]) & 0xff) == 0xff) && \
+ (((Addr[5]) & 0xff) == 0xff))
+ #else
+-extern __inline int is_multicast_mac_addr(const u8 *addr)
++static __inline int is_multicast_mac_addr(const u8 *addr)
+ {
+         return ((addr[0] != 0xff) && (0x01 & addr[0]));
+ }
+ 
+-extern __inline int is_broadcast_mac_addr(const u8 *addr)
++static __inline int is_broadcast_mac_addr(const u8 *addr)
+ {
+ 	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
+ 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
+ }
+ 
+-extern __inline int is_zero_mac_addr(const u8 *addr)
++static __inline int is_zero_mac_addr(const u8 *addr)
+ {
+ 	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
+ 		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
+-- 
+2.10.2
+
-- 
2.10.2
