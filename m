From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 May 2020 11:55:50 +0200
Subject: [Buildroot] pkg-kconfig woes with linux 5.7
Message-ID: <20200512095550.GW12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

The soon-to-be-released linux 5.7 has changed the way it detects the
ability of gcc to use plugins, when it dropped support for gcc 4.7 or
older [0].

To detect the ability to use gcc plugins, the kernel has to check whther
the host gcc is capable enough to build them.

When we call one of the configurator for the linux kernel, we explicitly
pass a value of HOSTCC=$(HOSTCC_NOCCACHE), because there might be a
discrepancy between the ncurses headers and libraries as found by the
linux kconfig build [1] [2].

But then, when we build the kernel, we pass another value to use [3]
HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" which boils down to
roughly: gcc -I.../host/include -L.../host/lib -Wl,-rpath,.../host/lib
This is needed so that at build time, the kernel can build host tools
that link with our openssl et al.

So, the two HOSTCC we pass to the kernel may have different behaviours.
For example, on my machine, gmp.h is missing in the ystem, but it is
available in $(O)/host/ when using an internal toolchain (and under a
few other conditions).

In that case, when configuring the kernel, it decides that the host
compiler can't build plugins, so the dependencies of CONFIG_GCC_PLUGINS
are not met, and that option is not present in the linux' .config file
(neither as "=y" nor as "is not set"). But then, when we build the
kernel, the host compiler suddenly becomes capable of building the
plugins, and the internal syncconfig run by the kernel will notice that
the dependencies of CONFIG_GCC_PLUGINS are now met, and that the user
shall decide on its value. And this blocks a build on an interactive
console (abbreviated):

    * Restart config...
    * GCC plugins
    GCC plugins (GCC_PLUGINS) [Y/n/?] (NEW) _

But most problematic is the behaviour when run in a shell that is not
interactiove (e.g. a CI job or such) (abbreviated):

    * Restart config...
    * GCC plugins
    GCC plugins (GCC_PLUGINS) [Y/n/?] (NEW)
    Error in reading or end of file.
      Generate some entropy during boot and runtime (GCC_PLUGIN_LATENT_ENTROPY) [N/y/?] (NEW)
    Error in reading or end of file.
      Randomize layout of sensitive kernel structures (GCC_PLUGIN_RANDSTRUCT) [N/y/?] (NEW)
    Error in reading or end of file.
    * Memory initialization
    Initialize kernel stack variables at function entry
    > 1. no automatic initialization (weakest) (INIT_STACK_NONE)
      2. zero-init structs marked for userspace (weak) (GCC_PLUGIN_STRUCTLEAK_USER) (NEW)
      3. zero-init structs passed by reference (strong) (GCC_PLUGIN_STRUCTLEAK_BYREF) (NEW)
      4. zero-init anything passed by reference (very strong) (GCC_PLUGIN_STRUCTLEAK_BYREF_ALL) (NEW)
    choice[1-4?]:
    Error in reading or end of file.
    Poison kernel stack before returning from syscalls (GCC_PLUGIN_STACKLEAK) [N/y/?] (NEW)
    Error in reading or end of file.
    Enable heap memory zeroing on allocation by default (INIT_ON_ALLOC_DEFAULT_ON) [N/y/?] n
    Enable heap memory zeroing on free by default (INIT_ON_FREE_DEFAULT_ON) [N/y/?] n

In either case, the behaviour is incorrect, and has already been
reported both on list [4] and on IRC [5].

Fixing this issue is by far not straightforward.

The most obvious and simple solution would be to unconditionally disable
gcc plugins alltogether, with:

    define LINUX_KCONFIG_FIXUP_CMDS
        [...]
        $(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
        [...]
    endif

But that can't work either, because after applying the fixups, we call
olddefconfig (or the likes) with the incapable HOSTCC, so the disabled
option would be removed anyway, and we'd be back to square one.

Another solution would be to hack the disabling call just before
building the kernel (in _addition_ to the above):

    define LINUX_BUILD_CMDS
        $(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
        [...]
    endef

Even though that would work, this is not nice, as this indeed prevents
users from using gcc plugins, even though their HOSTCC is already
capable without using anything from $(O)/host/

This could be an appropriate makeshift, though, because we so far did
not allow using gcc plugins with linux 5.6 or older. So that would not
be a regression or a new limitation.

The best solution would be if we were able to build the configurators
separately from invoquing them. The linux kernel has a few targets to
that effect: build_menuconfig et al., but it lacks build_config. Other
packages (busybox, uboot, barebox...) will most probably be lacking
those, though, so we'd have to be conditional (like we do to check
whether to call olddefconfig or run yes "" |oldconfig). And still, that
would require a way for the pkg-kconfig infra to accept different
options, to build the configurators and run them (the existing
FOO_KCONFIG_OPTS is used by both.

Any hint? Any suggestion?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=77342a02ff6e14645916d85c8550dd1011c4f7d7
[1] https://git.buildroot.org/buildroot/tree/linux/linux.mk#n287
[2] https://git.buildroot.org/buildroot/commit/linux/linux.mk?id=6d3d09e23213e88c14f2ddc883700499315a41bc
[3] https://git.buildroot.org/buildroot/tree/linux/linux.mk#n132
[4] http://lists.busybox.net/pipermail/buildroot/2020-April/thread.html#281581
[5] https://pastebin.com/8rNDjiNv

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
