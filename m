From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 10:52:03 +0100
Subject: [Buildroot] [PATCH 5/8] linux: add the generic help rules
In-Reply-To: <20160310103934.0aaef6d1@free-electrons.com>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <a92e7f048404917f9c9e7ed62c7041af04bf5934.1457561521.git.yann.morin.1998@free.fr>
 <56E0B5F5.9040109@mind.be> <3817786.Ntra8H592Z@sagittea>
 <20160310103934.0aaef6d1@free-electrons.com>
Message-ID: <56E143C3.4080809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/10/16 10:39, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 10 Mar 2016 10:21:17 +0100, J?r?me Pouiller wrote:
>
>>>    So now this will be printed on a single line, instead of being split
>>> like it was before. Well, J?r?me's patch already did that as well I
>>> guess.
>> In fact, my patch correctly support this case if you use two separate
>> strings:
>>
>> EXTRA_HELP += \
>>     "linux-update-defconfig : Save the Linux configuration to the path specified" \
>>     "                           by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE"
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
>          @echo
>          @echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>          @echo '  make O=dir             - Locate all output files in "dir", including .config'
> +       $(foreach hook,$(HELP_HOOKS),$(call $(hook)$(sep)))

  $(call ...) is redundant here. Yes, we currently have it in pkg-generic.mk, 
but it should be removed from there. Actually $(addsuffix $(sep),$(HELP_HOOKS)) 
will probably work.


>          @echo
>          @echo 'For further details, see README, generate the Buildroot manual, or consult'
>          @echo 'it on-line at http://buildroot.org/docs.html'
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 7c904c8..1a0b09c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -250,4 +250,10 @@ $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_
>   endif
>   endif
>
> +define BUSYBOX_HELP
> +       @echo '  busybox-baz            - do stuff'
> +endef
> +
> +HELP_HOOKS += BUSYBOX_HELP

  This bit could easily be done in generic-package. I definitely don't like 
direct manipulation of global variables in a package.mk.

> +
>   $(eval $(kconfig-package))
>
> This way, it is just a function call, and the package, or external.mk
> can do whatever it wants in terms of formatting the help text.
> Including iterating on variables, showing the contents of a file, or
> whatever.

  It's incredible how much discussion we have about such a corner feature :-)
I guess we just need _something_ to disagree about :-P


  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
