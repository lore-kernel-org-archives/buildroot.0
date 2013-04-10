From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 10 Apr 2013 16:10:27 +0800
Subject: [Buildroot] [PATCH v2 5/7] package: Introduce package-specific
 BINFMT_FLAT options.
In-Reply-To: <5164FCF2.1070200@mind.be>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-5-git-send-email-sonic.adi@gmail.com>
 <20130407232755.762a03b5@skate> <5164FCF2.1070200@mind.be>
Message-ID: <CAJxxZ0NmPmR=OeR3T_n648WR+nNB=+1A=wyBDvR0iqoBtmD-gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Apr 10, 2013 at 1:47 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/04/13 23:27, Thomas Petazzoni wrote:
>>
>> Dear Sonic Zhang,
>>
>> On Fri, 29 Mar 2013 17:50:41 +0800, Sonic Zhang wrote:
>>
>>> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
>>> index 890506b..bdfea20 100644
>>> --- a/package/pkg-autotools.mk
>>> +++ b/package/pkg-autotools.mk
>>> @@ -82,6 +82,11 @@ $(2)_CLEAN_OPT                       ?= clean
>>>   $(2)_UNINSTALL_STAGING_OPT    ?= DESTDIR=$$(STAGING_DIR) uninstall
>>>   $(2)_UNINSTALL_TARGET_OPT     ?= DESTDIR=$$(TARGET_DIR)  uninstall
>>>
>>> +ifeq ($(BR2_BINFMT_FLAT),y)
>>> + ifneq ($$($(2)_FLAT_STACKSIZE),)
>>> +  $(2)_CONF_ENV                        += LDFLAGS="$(TARGET_LDFLAGS)
>>> -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)"
>>> + endif
>>> +endif
>>>
>>>   #
>>>   # Configure step. Only define it if not already defined by the package
>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>> index 57b0fd0..8ee2b20 100644
>>> --- a/package/pkg-generic.mk
>>> +++ b/package/pkg-generic.mk
>>> @@ -303,6 +303,11 @@ endif
>>>
>>>   $(2)_REDISTRIBUTE             ?= YES
>>>
>>> +ifeq ($(BR2_BINFMT_FLAT),y)
>>> + ifneq ($$($(2)_FLAT_STACKSIZE),)
>>> +  $(2)_FLAT_LDFLAGS = -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)
>>> + endif
>>> +endif
>>>
>>>   $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst
>>> host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
>>
>>
>> I understand the problem but I'm still not really happy with the
>> solution here. Maybe Arnout will have some suggestions.
>
>
>  I had exactly the same thoughts while reading the patch...
>
>
>> The problem I see with the pkg-autotools change is that some packages
>> already override LDFLAGS in their <pkg>_CONF_ENV. For example:
>>
>> NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
>>
>> Since your <pkg>_CONF_ENV += assignment will be done after the ones
>> coming from the package .mk file, you're going to remove the -lintl
>> that had been added by the package.
>>
>> For the pkg-generic change, I'm not entirely happy because it means
>> each and every package should use <pkg>_FLAT_LDFLAGS, while we have
>> told for a long time our packagers to just use $(TARGET_CONFIGURE_OPTS)
>> to get all the right compiler/linker flags.
>>
>> So I think it seems we somehow need to make $(TARGET_LDFLAGS) a
>> per-package variable? Arnout what do you think about this? Do you have
>> ideas?
>
>
>  In fact, it can easily be made a per-package variable. In the definition of
> TARGET_LDFLAGS, we can add:
>
> TARGET_LDFLAGS = ... \
>         $($(PKG)_LDFLAGS)
>
>  The $(PKG) is only evaluated when the TARGET_LDFLAGS variable is used.
>
>  Outside the scope of the generic rules, $(PKG) evaluates to nothing, and
> _LDFLAGS is not defined, so the $($(PKG)_LDFLAGS) has no effect.
>
>  Inside the scope of the generic rules, $(PKG) is always defined. So we just
> have to add the following to the pkg-generic macro:
>
> ifeq ($(BR2_BINFMT_FLAT),y)
>   $(2)_LDFLAGS += -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)
> endif
>
>
>  As far as I can see, that should work nicely. No need to change anything in
> autotools. Unfortunately, it does require changing the packages that have
> something like:
>
> DOSFSTOOLS_LDFLAGS = $(TARGET_LDFLAGS)
>
>  Also, it is not very intuitive, because in a non-autotools package where
> you can't use the LDFLAGS environment variable, you'll have something like:
>
> AXEL_LDFLAGS = -lpthread
> define AXEL_BUILD_CMDS
>         $(TARGET_CONFIGURE_OPTS) $(MAKE) \
>         LFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
> endef
>
> i.e. you're defining AXEL_LDFLAGS but using TARGET_LDFLAGS. Not a really big
> issue, I think, but not very nice either.
>
>
>  For this patch list, however, I think changing the 15 uses of FOO_LDFLAGS
> is going a bit too far. So I propose to make the following change instead in
> package/Makefile.in:
>
> ifeq ($(BR2_BINFMT_FLAT),y)
> TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),\
>         -Wl,-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
> endif
>

This doesn't work.

/home/sonic/projects/buildroot/output/host/usr/bin/bfin-uclinux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-pipe -Os  -D__NOMMU__ -D__uClinux__ -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wl --static  bfin-dma.c
 -o bfin-dma
cc1: error: unrecognized command line option "-Wl"
make[1]: *** [bfin-dma] Error 1


In addition, if 2 generic makefile packages set different flat stack
sizes, are both of these stack size flags added to the same
TARGE_LDFLAGS macro with your change?

Regards,

Sonic
