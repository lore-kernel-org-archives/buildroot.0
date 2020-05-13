From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 13 May 2020 07:02:31 +0200
Subject: [Buildroot] [PATCH] linux: forcibly disable use of gcc plugins
In-Reply-To: <20200512203353.31470-1-yann.morin.1998@free.fr>
References: <20200512203353.31470-1-yann.morin.1998@free.fr>
Message-ID: <CAEyMn7bc+LkfpmZMfmEBAeHnO9ixffhZ=PxypDwxc+k9tYO3_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann et all,

Am Di., 12. Mai 2020 um 22:34 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> The soon-to-be-released linux 5.7 has changed the way it detects the
> ability of gcc to use plugins, when it dropped support for gcc 4.7 or
> older [0].
>
> To detect the ability to use gcc plugins, the kernel has to check whther
> the host gcc is capable enough to build them.
>
> When we call one of the configurator for the linux kernel, we explicitly
> pass a value of HOSTCC=$(HOSTCC_NOCCACHE), because there might be a
> discrepancy between the ncurses headers and libraries as found by the
> linux kconfig build [1] [2].
>
> But then, when we build the kernel, we pass another value to use [3]
> HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" which boils down to
> roughly: gcc -I.../host/include -L.../host/lib -Wl,-rpath,.../host/lib
> This is needed so that at build time, the kernel can build host tools
> that link with our openssl et al.
>
> So, the two HOSTCC we pass to the kernel may have different behaviours.
> For example, on a machine where gmp is missing in the system, it is
> available in $(O)/host/ when using an internal toolchain (and under a
> few other conditions).
>
> In that case, when configuring the kernel, it decides that the host
> compiler can't build plugins, so the dependencies of CONFIG_GCC_PLUGINS
> are not met, and that option is not present in the linux' .config file
> (neither as "=y" nor as "is not set"). But then, when we build the
> kernel, the host compiler suddenly becomes capable of building the
> plugins, and the internal syncconfig run by the kernel will notice that
> the dependencies of CONFIG_GCC_PLUGINS are now met, and that the user
> shall decide on its value. And this blocks a build on an interactive
> console (abbreviated):
>
>     * Restart config...
>     * GCC plugins
>     GCC plugins (GCC_PLUGINS) [Y/n/?] (NEW) _
>
> But most problematic is the behaviour when run in a shell that is not
> interactiove (e.g. a CI job or such) (abbreviated):
>
>     * Restart config...
>     * GCC plugins
>     GCC plugins (GCC_PLUGINS) [Y/n/?] (NEW)
>     Error in reading or end of file.
>       Generate some entropy during boot and runtime (GCC_PLUGIN_LATENT_ENTROPY) [N/y/?] (NEW)
>     Error in reading or end of file.
>       Randomize layout of sensitive kernel structures (GCC_PLUGIN_RANDSTRUCT) [N/y/?] (NEW)
>     Error in reading or end of file.
>     * Memory initialization
>     Initialize kernel stack variables at function entry
>     > 1. no automatic initialization (weakest) (INIT_STACK_NONE)
>       2. zero-init structs marked for userspace (weak) (GCC_PLUGIN_STRUCTLEAK_USER) (NEW)
>       3. zero-init structs passed by reference (strong) (GCC_PLUGIN_STRUCTLEAK_BYREF) (NEW)
>       4. zero-init anything passed by reference (very strong) (GCC_PLUGIN_STRUCTLEAK_BYREF_ALL) (NEW)
>     choice[1-4?]:
>     Error in reading or end of file.
>     Poison kernel stack before returning from syscalls (GCC_PLUGIN_STACKLEAK) [N/y/?] (NEW)
>     Error in reading or end of file.
>     Enable heap memory zeroing on allocation by default (INIT_ON_ALLOC_DEFAULT_ON) [N/y/?] n
>     Enable heap memory zeroing on free by default (INIT_ON_FREE_DEFAULT_ON) [N/y/?] n
>
> The most obvious and simple solution would be to unconditionally disable
> gcc plugins alltogether, in the KCONFIG_FIXUP hook. But that can't work
> either, because after applying the fixups, we call olddefconfig (or the
> likes) with the incapable HOSTCC, so the disabled option would be removed
> anyway, and we'd be back to square one.
>
> So, in addition to the above, we also forcibly hack the same call just
> before actually building the kernel.
>
> Note that the two are needed: the one in the fixups is needed for those
> that have a system that already allows building gcc plugins, and the
> second is needed in the other case, where the system does not allow it
> but would work with our additional headers and libs in $(O)/host/. The
> two ensure there is a very similar experience in the two situations.
>
> Forcibly disabling the use of gcc plugins is not a regression on our
> side: it has never been possible to do so so far. We're now making sure
> that can't work by accident.
>
> Reported-by: Ganesh <ganesh45in@gmail.com>,
> Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Michael Walle <michael.walle@kontron.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

Used the defconfig provided by Michael Walle on the Mailinglist [1] to
test the fix.

Many thanks for the fast investigation and providing this fix.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200510133106.25067-1-michael at walle.cc/

--
BR,
Heiko
