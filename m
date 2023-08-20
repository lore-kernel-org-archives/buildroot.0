Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E00EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D7C841171;
	Mon, 21 Aug 2023 20:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D7C841171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZb3btgh1oiI; Mon, 21 Aug 2023 20:22:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA9184150B;
	Mon, 21 Aug 2023 20:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA9184150B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58AB61BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2CE641612
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2CE641612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbBXYOEAv8eL for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F4041684
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F4041684
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A30D486023; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 21:28:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f4da6c3ebed8ff13f6298cc7363e551a6ca0911d
X-Git-Newrev: 2a5d90a5951623ca0821b51c97dcc6bda8c4c26c
X-Patchwork-Hint: ignore
Message-Id: <20230821200127.A30D486023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/rock5b: Add patches to
 fix gcc12 warnings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7619207646972678161=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7619207646972678161==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2a5d90a5951623ca0821b51c97dcc6bda8c4c26c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch introduces patches for the custom kernel, as it is
currently used for the Radxa Rock 5B. The patches fix two gcc
compiler warnings, which result in a build error, if the kernel
is used with gcc version 12.
Since also the code of custom board drivers for WiFi support is
affected, and no fixes are provided by the vendor, the custom WiFi
support is disabled.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/radxa/rock5b/linux.fragment                  |  3 +
 ...-Adjust-ether_addr-prototypes-to-silence-.patch | 64 ++++++++++++++++++++++
 ...oc-fix-building-error-on-Werror-array-com.patch | 43 +++++++++++++++
 board/radxa/rock5b/readme.txt                      | 20 +++++++
 configs/rock5b_defconfig                           |  1 +
 5 files changed, 131 insertions(+)

diff --git a/board/radxa/rock5b/linux.fragment b/board/radxa/rock5b/linux.fragment
index 811d42a79b..6d65cb7bb8 100644
--- a/board/radxa/rock5b/linux.fragment
+++ b/board/radxa/rock5b/linux.fragment
@@ -1 +1,4 @@
 CONFIG_R8169=y
+# Disable Rockchip specific WiFi drivers, as the kernel
+# code cannot be build with GCC 12 due to several Werrors
+# CONFIG_WL_ROCKCHIP is not set
diff --git a/board/radxa/rock5b/patches/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch b/board/radxa/rock5b/patches/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
new file mode 100644
index 0000000000..5632c5a627
--- /dev/null
+++ b/board/radxa/rock5b/patches/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
@@ -0,0 +1,64 @@
+From 2618a0dae09ef37728dab89ff60418cbe25ae6bd Mon Sep 17 00:00:00 2001
+From: Kees Cook <keescook@chromium.org>
+Date: Sat, 12 Feb 2022 09:14:49 -0800
+Subject: etherdevice: Adjust ether_addr* prototypes to silence
+ -Wstringop-overead
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With GCC 12, -Wstringop-overread was warning about an implicit cast from
+char[6] to char[8]. However, the extra 2 bytes are always thrown away,
+alignment doesn't matter, and the risk of hitting the edge of unallocated
+memory has been accepted, so this prototype can just be converted to a
+regular char *. Silences:
+
+net/core/dev.c: In function ‘bpf_prog_run_generic_xdp’: net/core/dev.c:4618:21: warning: ‘ether_addr_equal_64bits’ reading 8 bytes from a region of size 6 [-Wstringop-overread]
+ 4618 |         orig_host = ether_addr_equal_64bits(eth->h_dest, > skb->dev->dev_addr);
+      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+net/core/dev.c:4618:21: note: referencing argument 1 of type ‘const u8[8]’ {aka ‘const unsigned char[8]’}
+net/core/dev.c:4618:21: note: referencing argument 2 of type ‘const u8[8]’ {aka ‘const unsigned char[8]’}
+In file included from net/core/dev.c:91: include/linux/etherdevice.h:375:20: note: in a call to function ‘ether_addr_equal_64bits’
+  375 | static inline bool ether_addr_equal_64bits(const u8 addr1[6+2],
+      |                    ^~~~~~~~~~~~~~~~~~~~~~~
+
+Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Link: https://lore.kernel.org/netdev/20220212090811.uuzk6d76agw2vv73@pengutronix.de
+Cc: Jakub Kicinski <kuba@kernel.org>
+Cc: "David S. Miller" <davem@davemloft.net>
+Cc: netdev@vger.kernel.org
+Signed-off-by: Kees Cook <keescook@chromium.org>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2618a0dae09ef37728dab89ff60418cbe25ae6bd
+Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
+---
+ include/linux/etherdevice.h | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
+index 2ad71cc90b37d..92b10e67d5f87 100644
+--- a/include/linux/etherdevice.h
++++ b/include/linux/etherdevice.h
+@@ -134,7 +134,7 @@ static inline bool is_multicast_ether_addr(const u8 *addr)
+ #endif
+ }
+ 
+-static inline bool is_multicast_ether_addr_64bits(const u8 addr[6+2])
++static inline bool is_multicast_ether_addr_64bits(const u8 *addr)
+ {
+ #if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && BITS_PER_LONG == 64
+ #ifdef __BIG_ENDIAN
+@@ -372,8 +372,7 @@ static inline bool ether_addr_equal(const u8 *addr1, const u8 *addr2)
+  * Please note that alignment of addr1 & addr2 are only guaranteed to be 16 bits.
+  */
+ 
+-static inline bool ether_addr_equal_64bits(const u8 addr1[6+2],
+-					   const u8 addr2[6+2])
++static inline bool ether_addr_equal_64bits(const u8 *addr1, const u8 *addr2)
+ {
+ #if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && BITS_PER_LONG == 64
+ 	u64 fold = (*(const u64 *)addr1) ^ (*(const u64 *)addr2);
+-- 
+cgit 
+
diff --git a/board/radxa/rock5b/patches/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch b/board/radxa/rock5b/patches/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch
new file mode 100644
index 0000000000..10de6c72d3
--- /dev/null
+++ b/board/radxa/rock5b/patches/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch
@@ -0,0 +1,43 @@
+From ca831f29f8f25c97182e726429b38c0802200c8f Mon Sep 17 00:00:00 2001
+From: Xiongwei Song <sxwjean@gmail.com>
+Date: Fri, 14 Jan 2022 14:07:24 -0800
+Subject: mm: page_alloc: fix building error on -Werror=array-compare
+
+Arthur Marsh reported we would hit the error below when building kernel
+with gcc-12:
+
+  CC      mm/page_alloc.o
+  mm/page_alloc.c: In function `mem_init_print_info':
+  mm/page_alloc.c:8173:27: error: comparison between two arrays [-Werror=array-compare]
+   8173 |                 if (start <= pos && pos < end && size > adj) \
+        |
+
+In C++20, the comparision between arrays should be warned.
+
+Link: https://lkml.kernel.org/r/20211125130928.32465-1-sxwjean@me.com
+Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
+Reported-by: Arthur Marsh <arthur.marsh@internode.on.net>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ca831f29f8f25c97182e726429b38c0802200c8f
+Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
+---
+ mm/page_alloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mm/page_alloc.c b/mm/page_alloc.c
+index 806f317c2e7e2..c4ef450ac4428 100644
+--- a/mm/page_alloc.c
++++ b/mm/page_alloc.c
+@@ -8228,7 +8228,7 @@ void __init mem_init_print_info(void)
+ 	 */
+ #define adj_init_size(start, end, size, pos, adj) \
+ 	do { \
+-		if (start <= pos && pos < end && size > adj) \
++		if (&start[0] <= &pos[0] && &pos[0] < &end[0] && size > adj) \
+ 			size -= adj; \
+ 	} while (0)
+ 
+-- 
+cgit 
+
diff --git a/board/radxa/rock5b/readme.txt b/board/radxa/rock5b/readme.txt
index a88b9b46fa..f02f3d380e 100644
--- a/board/radxa/rock5b/readme.txt
+++ b/board/radxa/rock5b/readme.txt
@@ -60,3 +60,23 @@ Enter 'root' as login user, and the prompt is ready.
 wiki link:
 ----------
 https://forum.radxa.com/c/rock5
+
+Issues:
+=======
+
+The custom Radxa kernel provides custom code to support WiFi. However,
+that code does not compile with GCC 12, which is the current default
+version in buildroot. Hence, the WiFi kernel drivers are disabled, until
+the issues get fixed (if ever). If they are desperately needed, one may
+apply the following workaround, as long as buildroot still supports GCC
+version 11:
+
+1. Set GCC version 11, by adding the following line to
+configs/rock5b_defconfig:
+
+BR2_GCC_VERSION_11_X=y
+
+2. Re-enable custom WiFi drivers by removing the following line from
+board/radxa/rock5b/linux.fragment:
+
+# CONFIG_WL_ROCKCHIP is not set
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 6e525d9676..eed656ef5f 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -5,6 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/radxa/rock5b/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS=""
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
+BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y

--===============7619207646972678161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7619207646972678161==--
