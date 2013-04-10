From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Apr 2013 12:36:37 +0200
Subject: [Buildroot] [PATCH v2 5/7] package: Introduce package-specific
 BINFMT_FLAT options.
In-Reply-To: <CAJxxZ0NmPmR=OeR3T_n648WR+nNB=+1A=wyBDvR0iqoBtmD-gA@mail.gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-5-git-send-email-sonic.adi@gmail.com>
 <20130407232755.762a03b5@skate> <5164FCF2.1070200@mind.be>
 <CAJxxZ0NmPmR=OeR3T_n648WR+nNB=+1A=wyBDvR0iqoBtmD-gA@mail.gmail.com>
Message-ID: <516540B5.9070008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/04/13 10:10, Sonic Zhang wrote:
> Hi Arnout,
>
> On Wed, Apr 10, 2013 at 1:47 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>> ifeq ($(BR2_BINFMT_FLAT),y)
>> TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),\
>>          -Wl,-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
>> endif
>>
>
> This doesn't work.
>
> /home/sonic/projects/buildroot/output/host/usr/bin/bfin-uclinux-gcc
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -pipe -Os  -D__NOMMU__ -D__uClinux__ -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wl --static  bfin-dma.c
>   -o bfin-dma
> cc1: error: unrecognized command line option "-Wl"
> make[1]: *** [bfin-dma] Error 1

  Ah yes, of course, the comma. If should be:

ifeq ($(BR2_BINFMT_FLAT),y)
TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),\
         -Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
endif


> In addition, if 2 generic makefile packages set different flat stack
> sizes, are both of these stack size flags added to the same
> TARGE_LDFLAGS macro with your change?


  That is the magic of late binding in make. The value of TARGET_LDFLAGS 
is only evaluated at the time when it is used, and it is only at that 
time that the $(PKG) is expanded. And if it is used in the body of a 
pattern rule, then the expansion only takes place when the rule is 
instantiated.

  For example, there are two packages, FOO and BAR, that set 
FOO_FLAT_STACKSIZE and BAR_FLAT_STACKSIZE. They both use TARGET_LDFLAGS 
in their BUILD_CMDS. The BUILD_CMDS are used in the following pattern 
rule from pkg-generic.mk:

# Build
$(BUILD_DIR)/%/.stamp_built::
         @$(call MESSAGE,"Building")
         $($(PKG)_BUILD_CMDS)
         $(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
         $(Q)touch $@

  When this rule is instantiated for package foo, then the PKG variable 
is set to FOO. So $($(PKG)_BUILD_CMDS) expands to $(FOO_BUILD_CMDS), 
which expands to something like

$(MAKE) LDFLAGS="$(TARGET_LDFLAGS)"

which expands to

make -j8 LDFLAGS="$(call qstrip,$(BR2_TARGET_LDFLAGS))\
	--static\
	$(if $($(PKG)_FLAT_STACKSIZE),\
         	-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))"

which expands to

make -j8 LDFLAGS="$(call qstrip,"")\
	--static\
	$(if $(FOO_FLAT_STACKSIZE),\
         	-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))"

which expands to

make -j8 LDFLAGS="\
	--static\
	$(if 2048,\
         	-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))"

which expands to

make -j8 LDFLAGS="\
	--static\
	-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE)"

which expands to

make -j8 LDFLAGS="\
	--static\
	-W,-elf2flt=-s$(FOO_FLAT_STACKSIZE)"

which expands to

make -j8 LDFLAGS=" --static -W,-elf2flt=-s2048"


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
