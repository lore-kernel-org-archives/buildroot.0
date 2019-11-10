From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 20:41:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/bird: disable on nios2
In-Reply-To: <20191110142258.12684-1-fontaine.fabrice@gmail.com>
References: <20191110142258.12684-1-fontaine.fabrice@gmail.com>
Message-ID: <20191110194124.GB3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fbrice, All,

On 2019-11-10 15:22 +0100, Fabrice Fontaine spake thusly:
> Build fails with truncation errors:
> 
> LD -pthread -o bird obj/conf/cf-parse.tab.o obj/conf/cf-lex.o obj/conf/conf.o obj/filter/filter.o obj/filter/data.o obj/filter/f-util.o obj/filter/tree.o obj/filter/trie.o obj/filter/inst-gen.o obj/lib/bitops.o obj/lib/checksum.o obj/lib/event.o obj/lib/flowspec.o obj/lib/idm.o obj/lib/ip.o obj/lib/lists.o obj/lib/mac.o obj/lib/md5.o obj/lib/mempool.o obj/lib/net.o obj/lib/patmatch.o obj/lib/printf.o obj/lib/resource.o obj/lib/sha1.o obj/lib/sha256.o obj/lib/sha512.o obj/lib/slab.o obj/lib/slists.o obj/lib/strtoul.o obj/lib/tbf.o obj/lib/timer.o obj/lib/xmalloc.o obj/nest/a-path.o obj/nest/a-set.o obj/nest/cli.o obj/nest/cmds.o obj/nest/iface.o obj/nest/locks.o obj/nest/neighbor.o obj/nest/password.o obj/nest/proto.o obj/nest/rt-attr.o obj/nest/rt-dev.o obj/nest/rt-fib.o obj/nest/rt-show.o obj/nest/rt-table.o obj/proto/bgp/attrs.o obj/proto/bgp/bgp.o obj/proto/bgp/packets.o obj/sysdep/linux/netlink.o obj/sysdep/unix/io.o obj/sysdep/unix/krt.o obj/sysdep/unix/log.o obj/sysdep/
>  unix/main.o obj/sysdep/unix/random.o
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: FDE encoding in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/libgcc.a(_divdi3.o)(.eh_frame) prevents .eh_frame_hdr table being created
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: FDE encoding in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/libgcc.a(_moddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: FDE encoding in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/libgcc.a(_udivdi3.o)(.eh_frame) prevents .eh_frame_hdr table being created
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: FDE encoding in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/libgcc.a(_umoddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: obj/filter/filter.o: in function `f_rta_cow.constprop.12':
> filter.c:(.text+0x9c): relocation truncated to fit: R_NIOS2_TLS_LE16 against `filter_state'
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/7.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: filter.c:(.text+0xe4): relocation truncated to fit: R_NIOS2_TLS_LE16 against `filter_state'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d3971f9e1305c3c4388dbf48763f5a54ba223307
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bird/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bird/Config.in b/package/bird/Config.in
> index c2951c74c3..ea59126be1 100644
> --- a/package/bird/Config.in
> +++ b/package/bird/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_BIRD
>  	bool "bird"
> +	depends on !BR2_nios2 # relocations don't fit 
>  	depends on BR2_USE_MMU # fork()
>  	help
>  	  BIRD Internet Routing Daemon
> -- 
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
