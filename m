From: Dan Raymond <draymond@foxvalley.net>
Date: Mon, 1 Mar 2021 10:00:45 -0700
Subject: [Buildroot] [PATCH 1/1] fix failure during 'make linux-menuconfig'
 when PATH env var has spaces
In-Reply-To: <20210301072125.GK2390841@scaer>
References: <16100eb6-bac8-2e4d-65f2-26333179f3b8@foxvalley.net>
 <20210301072125.GK2390841@scaer>
Message-ID: <61db383c-08eb-2360-7c2b-ab1afc649b88@foxvalley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Yann.? While I was digging through the Makefiles hunting down this 
bug I saw plenty of evidence of spaces in environment variables (and 
quoting used to manage them).? When using default buildroot and kernel 
options this was the only bug I encountered. After fixing it I am able 
to fully build all targets.? There may be other bugs lurking in various 
packages I didn't build but that doesn't seem like a good reason not to 
fix this one.? Also, note that the bug impacts more than just PATH.? It 
impacts the following variables now (and any that may be added in the 
future):

PATH
PKG_CONFIG
PKG_CONFIG_SYSROOT_DIR
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS
PKG_CONFIG_ALLOW_SYSTEM_LIBS
PKG_CONFIG_LIBDIR

Since I spent the time debugging this and implementing/testing a clean 
and reliable fix why don't we merge this now and if there are future bug 
reports about spaces in environment variables we can discuss how to 
proceed then?

On 3/1/2021 12:21 AM, Yann E. MORIN wrote:
> Dan, All,
>
> On 2021-02-28 19:40 -0700, Dan Raymond spake thusly:
>>  From 4db6db355723bedb5918be214fbd6c6eb4a39257 Mon Sep 17 00:00:00 2001
>> From: Dan Raymond <draymond@foxvalley.net>
>> Date: Sun, 28 Feb 2021 18:27:18 -0700
>> Subject: [PATCH 1/1] fix failure during 'make linux-menuconfig' when PATH
>> env var has spaces
> Thanks for the patch.
>
> However, as I explained on IRC, this is far from sufficient. A lot of
> places do not expect spaces in PATH. For example, the config.guess from
> the gnuconfig package (i.e. a file we do bundle, and that is maintain
> elsewhere), and present in virtually all autotools-based packages, has
> this line:
>
>      PATH=$PATH:/.attbin ; export PATH
>
> So, basically, all autotools packages are somewhat broken when PATH
> contains spaces.
>
> As a second example, package/fakedate/fakedate splits PATH on spaces:
>
>      for P in `echo $PATH | tr ':' ' '`; do
>
> Fixing that is too cumbersome, and again, the vast majority of things is
> going to break when PATH contains spaces.
>
> Rather, as I suggested on IRC, please add a sanity check in
> support/dependencies/dependencies.sh, lines 31..44, that there indeed is
> no spaces in PATH.
>
> Besides, Buildroot does not even build when the top-level or output
> directories contain spaces.
>
> Regards,
> Yann E. MORIN.
>
>> Signed-off-by: Dan Raymond <draymond@foxvalley.net>
>> ---
>>  ?package/pkg-kconfig.mk | 6 +++---
>>  ?support/misc/utils.mk? | 6 ++++++
>>  ?2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
>> index 2aecf2e203..6bf87fbead 100644
>> --- a/package/pkg-kconfig.mk
>> +++ b/package/pkg-kconfig.mk
>> @@ -205,9 +205,9 @@ endif
>>  ?# nconfig, gconfig, xconfig).
>>  ?# So we simply remove our PATH and PKG_CONFIG_* variables.
>>  ?$(2)_CONFIGURATOR_MAKE_ENV = \
>> -??? $$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% \
>> -??? ?? PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=% PKG_CONFIG_ALLOW_SYSTEM_LIBS=% \
>> -??? ?? PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
>> +??? $$(call strip_env,PATH PKG_CONFIG PKG_CONFIG_SYSROOT_DIR \
>> +??? ?? PKG_CONFIG_ALLOW_SYSTEM_CFLAGS PKG_CONFIG_ALLOW_SYSTEM_LIBS \
>> +??? ?? PKG_CONFIG_LIBDIR,$$($(2)_MAKE_ENV)) \
>>  ???? PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"
>>
>>  ?# Configuration editors (menuconfig, ...)
>> diff --git a/support/misc/utils.mk b/support/misc/utils.mk
>> index dc60cad979..640e56c775 100644
>> --- a/support/misc/utils.mk
>> +++ b/support/misc/utils.mk
>> @@ -135,3 +135,9 @@ define PRINTF
>>  ???? ??? ??? $(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
>>  ???? ??? ??? ??? $(subst \,\\,$(1)))))\n'
>>  ?endef
>> +
>> +# strip variables (quoted or unquoted) from an environment string:
>> +# MYENV = PATH="/bin:/dir with spaces" USER=root SHELL=/bin/sh
>> +# $(call strip_env,PATH SHELL,$(MYENV)) --> USER=root
>> +sed_cmds=$(foreach var,$(1),-e 's/$(var)="[^"]*" *//' -e 's/$(var)=[^ ]*
>> *//')
>> +strip_env=$(shell echo "$(subst ",\",$(2))" | sed $(call sed_cmds,$(1)))
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
