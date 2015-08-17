From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 17 Aug 2015 18:50:12 +0200
Subject: [Buildroot] xtables-addons does not build for arm kernel 4.1.4
Message-ID: <20150817185012.2051aa10@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

I am trying to compile xtables-addons by Buildroot, however, I get a lot
of "undefined!" warnings and some errors.

I build with:
- Buildroot (master: 15a53b93a034af78)
- internal toolchain
- Linux 4.1.4.

The Buildroot is patched by http://lists.busybox.net/pipermail/buildroot/2015-August/137485.html
for the olinuxino lime2 support. However, the same issues come with olimex_a20_olinuxino_lime_defconfig.

My setup is:

$ make olimex_a20_olinuxino_lime2_defconfig
$ make menuconfig
  enable Target packages/Network Applications/xtables-addons
$ make

And I end up with:

WARNING: "param_ops_uint" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "single_release" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "seq_read" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "seq_lseek" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "__aeabi_unwind_cpp_pr1" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "xt_unregister_matches" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "unregister_pernet_subsys" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "xt_register_matches" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "register_pernet_subsys" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "printk" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "proc_set_user" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "proc_create_data" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
WARNING: "strncpy" [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_quota2.ko] undefined!
(...)
make[6]: *** [buildroot-a20/output/build/xtables-addons-2.7/extensions/xt_DELUDE.mod.o] Error 1
buildroot-a20/output/build/xtables-addons-2.7/extensions/compat_xtables.mod.c:8:1: error: variable ?__this_module? has initializer but incomplete type
 __attribute__((section(".gnu.linkonce.this_module"))) = {
 ^
buildroot-a20/output/build/xtables-addons-2.7/extensions/compat_xtables.mod.c:9:2: error: unknown field ?name? specified in initializer
  .name = KBUILD_MODNAME,
  ^
buildroot-a20/output/build/xtables-addons-2.7/extensions/compat_xtables.mod.c:9:2: warning: excess elements in struct initializer
buildroot-a20/output/build/xtables-addons-2.7/extensions/compat_xtables.mod.c:9:2: warning: (near initialization for ?__this_module?)
buildroot-a20/output/build/xtables-addons-2.7/extensions/compat_xtables.mod.c:10:2: error: unknown field ?arch? specified in initializer
  .arch = MODULE_ARCH_INIT,
  ^
buildroot-a20/output/build/xtables-addons-2.7/extensions/compat_xtables.mod.c:10:10: error: ?MODULE_ARCH_INIT? undeclared here (not in a function)
  .arch = MODULE_ARCH_INIT,
          ^
buildroot-a20/output/build/xtables-addons-2.7/extensions/compat_xtables.mod.c:10:2: warning: excess elements in struct initializer
  .arch = MODULE_ARCH_INIT,
(...)

I can see the commit eaa872edca27c6f375d
that should fix some kind of issues with Linux 4.1+. Is there something I am missing here?

I can build xtables-addons from git (tag 2.7, e277360) for both Linux 4.1.4 and 4.1.5 on
x86_64 by the standard xtables-addons build-system (without Buildroot).

Regards
Jan Viktorin

-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
