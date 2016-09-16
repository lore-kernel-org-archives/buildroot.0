From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Sep 2016 21:02:44 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <20160916190517.01d3dd5a@free-electrons.com>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
 <20160916190517.01d3dd5a@free-electrons.com>
Message-ID: <20160916190244.GC3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-09-16 19:05 +0200, Thomas Petazzoni spake thusly:
> On Wed, 14 Sep 2016 00:35:17 +0200, Yann E. MORIN wrote:
> 
> > +# Force olddefconfig again on -reconfigure
> > +$(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
> > +
> > +$(1)-clean-kconfig-for-reconfigure:
> > +	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done
> 
> I was about to apply this, but in fact, I'm not sure I agree.
> 
> <foo>-reconfigure is supposed to re-do the configuration step entirely.
> For example, with an autotools package, if I change the value of
> <pkg>_CONF_OPTS and then do make <foo>-reconfigure, the configuration
> is done again, with the new <pkg>_CONF_OPTS.
> 
> Here, what you're doing is that you're only re-doing the "fixup" of
> the .config, but you're not re-loading the configuration from the
> original defconfig or full config file. This means that if the user
> changes the defconfig and does "make linux-reconfigure", it won't
> reload the defconfig.
> 
> Unless my analysis is wrong, I think the patch should be changed to
> re-do the configuration step entirely.

So, as I said previously, this use-case is alredy covered by the current
set of dependencies, and this patch does not change the behaviour for
this use-case.

The reason is that .stamp_kconfig_fixup_done depends on the .config file.

In turn, the .config file depends on the base (def)config and fragments.

So, touching any of the base (def)config or fragments will trigger a
full reconfiguration, even without this patch. You can try this:

    $ make defconfig; make menuconfig  # Enable a pre-built toolchain
    $ make busybox-build
    $ touch touch package/busybox/busybox.config
    $ make V=1 busybox-build

You'll notice that, in the second busybox-build, the very first command
to be run, right after the removal of .stmap files, is to copy the base
busybox config file, followed by a call to the merge-config script:

    [...]
    rm -f /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.stamp_kconfig_fixup_done
    rm -f /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.stamp_configured
    cp package/busybox/busybox.config /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.config
    support/kconfig/merge_config.sh -m -O /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0 /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.config
    Using /home/ymorin/dev/buildroot/outoput/build/busybox-1.25.0/.config as base
    [...]

Now, with this patch applied, you'll notice this behaviour is kept, and
also occurs for the busybox-reconfigure action.

So, I'd like to argue that this patch fixes the reported issue and covers
the use-case you pointed to.

Please apply, as you seemed keen on doing so initially. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
