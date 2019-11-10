From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 20:37:35 +0100
Subject: [Buildroot] [git commit] package/bird: disable on nios2
Message-ID: <20191110193341.711D87FD93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e67462388e3c8f3b6e655c3406b3b7188f9b4d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails with truncation errors:

LD -pthread -o bird obj/conf/cf-parse.tab.o obj/conf/cf-lex.o obj/conf/conf.o obj/filter/filter.o obj/filter/data.o obj/filter/f-util.o obj/filter/tree.o obj/filter/trie.o obj/filter/inst-gen.o obj/lib/bitops.o obj/lib/checksum.o obj/lib/event.o obj/lib/flowspec.o obj/lib/idm.o obj/lib/ip.o obj/lib/lists.o obj/lib/mac.o obj/lib/md5.o obj/lib/mempool.o obj/lib/net.o obj/lib/patmatch.o obj/lib/printf.o obj/lib/resource.o obj/lib/sha1.o obj/lib/sha256.o obj/lib/sha512.o obj/lib/slab.o obj/lib/slists.o obj/lib/strtoul.o obj/lib/tbf.o obj/lib/timer.o obj/lib/xmalloc.o obj/nest/a-path.o obj/nest/a-set.o obj/nest/cli.o obj/nest/cmds.o obj/nest/iface.o obj/nest/locks.o obj/nest/neighbor.o obj/nest/password.o obj/nest/proto.o obj/nest/rt-attr.o obj/nest/rt-dev.o obj/nest/rt-fib.o obj/nest/rt-show.o obj/nest/rt-table.o obj/proto/bgp/attrs.o obj/proto/bgp/bgp.o obj/proto/bgp/packets.o obj/sysdep/linux/netlink.o obj/sysdep/unix/io.o obj/sysdep/unix/krt.o obj/sysdep/unix/log.o obj/sysdep/
 unix/main.o obj/sysdep/unix/random.o
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: FDE encoding in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/libgcc.a(_divdi3.o)(.eh_frame) prevents .eh_frame_hdr table being created
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: FDE encoding in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/libgcc.a(_moddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: FDE encoding in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/libgcc.a(_udivdi3.o)(.eh_frame) prevents .eh_frame_hdr table being created
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: FDE encoding in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/libgcc.a(_umoddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: obj/filter/filter.o: in function `f_rta_cow.constprop.12':
filter.c:(.text+0x9c): relocation truncated to fit: R_NIOS2_TLS_LE16 against `filter_state'
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: filter.c:(.text+0xe4): relocation truncated to fit: R_NIOS2_TLS_LE16 against `filter_state'

Fixes:
 - http://autobuild.buildroot.org/results/d3971f9e1305c3c4388dbf48763f5a54ba223307

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: fix trailing space]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bird/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index c2951c74c3..e78dfdf90f 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BIRD
 	bool "bird"
+	depends on !BR2_nios2 # relocations don't fit
 	depends on BR2_USE_MMU # fork()
 	help
 	  BIRD Internet Routing Daemon
