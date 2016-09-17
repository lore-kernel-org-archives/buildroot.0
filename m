From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:42:33 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <20160916190244.GC3650@free.fr>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
 <20160916190517.01d3dd5a@free-electrons.com>
 <20160916190244.GC3650@free.fr>
Message-ID: <20160917144233.116fbc8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Sep 2016 21:02:44 +0200, Yann E. MORIN wrote:

> The reason is that .stamp_kconfig_fixup_done depends on the .config file.
> 
> In turn, the .config file depends on the base (def)config and fragments.
> 
> So, touching any of the base (def)config or fragments will trigger a
> full reconfiguration, even without this patch. You can try this:
> 
>     $ make defconfig; make menuconfig  # Enable a pre-built toolchain
>     $ make busybox-build
>     $ touch touch package/busybox/busybox.config
>     $ make V=1 busybox-build
> 
> You'll notice that, in the second busybox-build, the very first command
> to be run, right after the removal of .stmap files, is to copy the base
> busybox config file, followed by a call to the merge-config script:
> 
>     [...]
>     rm -f /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.stamp_kconfig_fixup_done
>     rm -f /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.stamp_configured
>     cp package/busybox/busybox.config /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.config
>     support/kconfig/merge_config.sh -m -O /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0 /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.config
>     Using /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.config as base
>     [...]
> 
> Now, with this patch applied, you'll notice this behaviour is kept, and
> also occurs for the busybox-reconfigure action.
> 
> So, I'd like to argue that this patch fixes the reported issue and covers
> the use-case you pointed to.

That was not the use-case I pointed to, what I pointed to what the
following use-case:

 1. Create a Buildroot configuration, with Linux enabled, using the
    omap2plus_defconfig

 2. Build your system.

 3. Go in menuconfig, and change the Linux defconfig to
    mvebu_v7_defconfig.

 4. Run "make linux-reconfigure"

I would expect the newly defined Linux configuration to be taken into
account, but it's not, it only re-does the fixups and doesn't reload
the configuration from mvebu_v7_defconfig.

Now, we can discuss whether this is the behavior that we want or not.
But at least,  that's the behavior I was referring to, and which your
patch doesn't address.

*But*, I'll apply your patch nonetheless because it fixes other issues,
and doesn't change the behavior I'm describing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
