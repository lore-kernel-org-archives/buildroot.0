From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 29 Jul 2009 15:25:15 +0200
Subject: [Buildroot] linux .config : override: reassigning to
	symbol	AEABI
In-Reply-To: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
Message-ID: <20090729132515.GM19257@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 29, 2009 at 02:59:14PM +0200, Courousse, Damien wrote:
> The kernel loading gets stuck after mounting the NFS root : 
> ================================================================
> ....
> IP-Config: Complete:
>      device=eth0, addr=10.84.34.8, mask=255.255.255.192, gw=10.84.34.1,
>      host=debian_test, domain=, nis-domain=(none),
>      bootserver=10.84.34.52, rootserver=10.84.34.52, rootpath=
> Looking up port of RPC 100003/2 on 10.84.34.52
> Looking up port of RPC 100005/1 on 10.84.34.52
> VFS: Mounted root (nfs filesystem).
> Freeing init memory: 116K
> Kernel panic - not syncing: Attempted to kill init!
> ================================================================

That smells like an ABI confusion, yes.

> I have configured buildroot to avoid EABI, and everything seems OK on this side in the config files.
> 
> I guess my problem comes from the kernel config, where the EABI symbol is overridden during buildroot compilation: 
> =================================================================
> make[1]: entrant dans le r?pertoire ? /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/linux-2.6.28 ?
> scripts/kconfig/conf -o arch/arm/Kconfig
> .config:1344:warning: override: reassigning to symbol AEABI
> .config:1345:warning: override: reassigning to symbol IPV6
> ================================================================

Building an OABI toolchain for an EABI kernel doesn't make sense, hence
the configs are brought in sync by buildroot.
target/linux/Makefile.in.advanced is where it happens, and it AEABI
should not be set in the kernel config unless BR2_ARM_EABI is set. Could
you double check?

> Do you think this is a normal behaviour, knowing that I did *not* configure buildroot, uclibc and the kernel for EABI?

No, that shouldn't happen. Could you pastebin your br2 .config
somewhere?


Daniel
