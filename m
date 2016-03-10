From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Mar 2016 21:34:38 +0100
Subject: [Buildroot] [PATCH 5/8] linux: add the generic help rules
In-Reply-To: <20160310103934.0aaef6d1@free-electrons.com>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <a92e7f048404917f9c9e7ed62c7041af04bf5934.1457561521.git.yann.morin.1998@free.fr>
 <56E0B5F5.9040109@mind.be> <3817786.Ntra8H592Z@sagittea>
 <20160310103934.0aaef6d1@free-electrons.com>
Message-ID: <20160310203438.GF3424@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-10 10:39 +0100, Thomas Petazzoni spake thusly:
> On Thu, 10 Mar 2016 10:21:17 +0100, J?r?me Pouiller wrote:
> 
> > >   So now this will be printed on a single line, instead of being split
> > > like it was before. Well, J?r?me's patch already did that as well I
> > > guess.
> > In fact, my patch correctly support this case if you use two separate
> > strings:
> >   
> > EXTRA_HELP += \
> >    "linux-update-defconfig : Save the Linux configuration to the path specified" \
> >    "                           by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE"
> 
> This is not super great either IMO.
> 
> What about doing something more Buildroot-esque and use the concept of
> hooks that we already use everywhere ?
> 
> For example:
> 
> diff --git a/Makefile b/Makefile
> index f2822a2..db9aee0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -969,6 +969,7 @@ endif
>         @echo
>         @echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>         @echo '  make O=dir             - Locate all output files in "dir", including .config'
> +       $(foreach hook,$(HELP_HOOKS),$(call $(hook)$(sep)))
>         @echo
>         @echo 'For further details, see README, generate the Buildroot manual, or consult'
>         @echo 'it on-line at http://buildroot.org/docs.html'
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 7c904c8..1a0b09c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -250,4 +250,10 @@ $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_
>  endif
>  endif
>  
> +define BUSYBOX_HELP
> +       @echo '  busybox-baz            - do stuff'
> +endef

There is one thing here that bothers me: duplicating the layout of the
help text in that many locations.

Having the macro be used means we can change that layout (e.g. to
accomodate for larger rules) in a single place, and
magically^Wautomatically see all the help texts all properly indented
at once.

Regards,
Yann E. MORIN.

> +HELP_HOOKS += BUSYBOX_HELP

To be done in pkg-generic, of course. ;-)

>  $(eval $(kconfig-package))
> 
> This way, it is just a function call, and the package, or external.mk
> can do whatever it wants in terms of formatting the help text.
> Including iterating on variables, showing the contents of a file, or
> whatever.

Well, remember that all this is *only* about documented the
package-specific rules, not any arbitrary package help.

Do we want to allow for any arbitrary package help? No; please, no.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
