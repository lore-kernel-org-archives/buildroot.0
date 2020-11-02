From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 2 Nov 2020 19:42:16 +0100
Subject: [Buildroot] [PATCH 1/1] imlib2: Bump to version 1.6.1
In-Reply-To: <20201101214721.GG2887157@scaer>
References: <20201101180154.14307-1-petr.vorel@gmail.com>
 <20201101214721.GG2887157@scaer>
Message-ID: <20201102184216.GB31558@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> Petr, All,

> On 2020-11-01 19:01 +0100, Petr Vorel spake thusly:
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > I'm sorry, I haven't figured out where to disable
> > BR2_TOOLCHAIN_EXTERNAL_INET_RPC as suggested in the helper:
> > riscv32-ilp32d--glibc--bleeding-edge-2020.08-1.tar.bz2: OK (sha256: 18a47b0c221137f40720df08e9bbdc0bcb6e68cde3a30906681e4dec83eb7547)
> > >>> toolchain-external-bootlin 2020.08-1 Extracting
> > bzcat dl/toolchain-external-bootlin/riscv32-ilp32d--glibc--bleeding-edge-2020.08-1.tar.bz2 | br-test-pkg/br-riscv32/host/bin/tar --strip-components=1 -C br-test-pkg/br-riscv32/build/toolchain-external-bootlin-2020.08-1 --exclude='usr/lib/locale/*'   -xf -
> > rm -rf br-test-pkg/br-riscv32/host/opt/ext-toolchain
> > mkdir -p br-test-pkg/br-riscv32/host/opt/ext-toolchain
> > mv br-test-pkg/br-riscv32/build/toolchain-external-bootlin-2020.08-1/* br-test-pkg/br-riscv32/host/opt/ext-toolchain/
> > >>> toolchain-external-bootlin 2020.08-1 Patching
> > >>> toolchain-external-bootlin 2020.08-1 Configuring
> > f951: Warning: Reading file ?<stdin>? as free form
> > RPC support not available in C library, please disable BR2_TOOLCHAIN_EXTERNAL_INET_RPC
> > make: *** [package/pkg-generic.mk:240: br-test-pkg/br-riscv32/build/toolchain-external-bootlin-2020.08-1/.stamp_configured] Error 1

> > In riscv32 section in
> > toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options?
> > But how to disable it?

> > Adding
> > # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
> > into support/config-fragments/autobuild/br-riscv32.config didn't help.

> Aha, you stumbled across the same issue as I did a few days ago, and
> which Thomas explained me on IRC, so here's a reacp:

> The riscv32 toolchain is built with a snapshot of glibc which is almost
> a 2.33:

>     $ grep -n VERSION package/glibc/glibc.mk
>     8:GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
>     9:GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
>     17:GLIBC_VERSION = 2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5
>     21:GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
>     23:GLIBC_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
>     31:GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))


> The 4th line (line 21) is the riscv version. Starting with glibc 2.32,
> (or 2.33? I don't remember exactly) the RPC support in glibc is no
> longer built/installed; i.e. the --enable-obsolete-rpc flag is no longer
> supported.
Thanks a lot for explanation. It's actually 2.32, where I removed --enable-obsolete-rpc :).
It was wanted long time to get rid of Sun-RPC (and libnss_nis, libnss_nisplus
and friends: --enable-obsolete-nsl) as they were abandoned and there are
external implementations (libtirpc and NIS implementation from Thorsten Kukuk in
https://github.com/thkukuk/ which also handles IPv6).

I expected some problems, but obviously not in scripts like this.

> However, the script that generates the entries for the Bootlin
> toolchains, hard-codes the fact that a glibc toolchain will always have
> native RPC:

>     $ grep -n -A7 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC support/scripts/gen-bootlin-toolchains
>     260:            elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC"):
>     261-                # glibc needs mmu support
>     262-                depends.append("BR2_USE_MMU")
>     263-                # glibc doesn't support static only configuration
>     264-                depends.append("!BR2_STATIC_LIBS")
>     265-                selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
>     266-                # all glibc toolchains have RPC support
>     267-                selects.append("BR2_TOOLCHAIN_HAS_NATIVE_RPC")

> Fixing this will imply to find a better heuristic in that script...

class Toolchain has version, which is $(GLIBC_VERSION).
If it's possible to clone the repository - we have $(GLIBC_VERSION) and
sometimes $(GLIBC_SITE), then we could check the version with inspecting version.h
or include/features.h. It looks currently glibc would have to be cloned 3x.

But can just be somewhere manually added value of __GLIBC_MINOR__ version?
Either in package/glibc/glibc.mk or in the script itself?
That would save time to clone the repositories.

Or maybe even expect there is no Sun-RPC and migrate packages to libtirpc and
Thorsten Kukuk NIS implementations?

Kind regards,
Petr

> Regards,
> Yann E. MORIN.
