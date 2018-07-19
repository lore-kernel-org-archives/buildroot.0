From: =?utf-8?B?57+f5Y+s6L2p?= <zhaizhaoxuan@xiaomi.com>
Date: Thu, 19 Jul 2018 12:18:15 +0000
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: build host-ccache before
 kconfig
In-Reply-To: <20180719130147.669f214d@windsurf>
References: <20180719094658.26826-1-zhaizhaoxuan@xiaomi.com>
 <20180719130147.669f214d@windsurf>
Message-ID: <3c7dfe85-7197-e42e-9f60-a162331c3860@xiaomi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

 ??? I am so sorry that I sent the incorrect commands.

 ??? After checking this issue again, I found this issue only appears on 
the uclibc and the linux package.
 ??? I mistakenly thought this was a problem with pkg-kconfig.mk and 
modified it. And after that, it works.

 ??? You can try to reproduce this issue by replacing 
"busybox-menuconfig" to "uclibc-menuconfig".

 ??? Please forgive my mistakes. I will send another patch to fix this 
issue by using HOSTCC_NOCCACHE instead.

On?19/07/2018?19:01?PM,?Thomas Petazzoni?wrote:
> Hello,
>
> On Thu, 19 Jul 2018 09:47:09 +0000, ??? wrote:
>> When the ccache is enabled, the HOSTCC variable refers to the ccache binary.
>>
>> But the host-ccache is not a dependency of the kconfig's .config. Some targets
>> such as `busybox-menuconfig` may calls Kconfig before the host-ccache is ready.
>> If the host-ccache is not ready yet, the Kconfig will fail. Because it can not
>> use $HOSTCC to build its utilities without ccache.
>>
>> This issue can be reproduce with the following commands:
>>   1. make clean defconfig
>>   2. echo "BR2_CCACHE=y" >> .config
>>   3. make olddefconfig busybox-menuconfig
>>
>> This patch fixes this issue by add host-ccache to the dependencies of .config.
>> So that the Kconfig can use $HOSTCC.
>>
>> Signed-off-by: Zhai Zhaoxuan <zhaizhaoxuan@xiaomi.com>
> Thanks for this contribution! However, I have not been able to
> reproduce the problem with the steps you describe. Here is what happens
> here:
>
> thomas at windsurf:~/projets/buildroot (master)$ make clean defconfig
> rm -rf /home/thomas/projets/buildroot/output/target /home/thomas/projets/buildroot/output/images /home/thomas/projets/buildroot/output/host  \
> 	/home/thomas/projets/buildroot/output/build /home/thomas/projets/buildroot/output/staging \
> 	/home/thomas/projets/buildroot/output/legal-info /home/thomas/projets/buildroot/output/graphs
> mkdir -p /home/thomas/projets/buildroot/output/build/buildroot-config/lxdialog
> PKG_CONFIG_PATH="" make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc" \
>      obj=/home/thomas/projets/buildroot/output/build/buildroot-config -C support/kconfig -f Makefile.br conf
> /usr/bin/gcc -D_GNU_SOURCE -D_DEFAULT_SOURCE  -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE  -I/home/thomas/projets/buildroot/output/build/buildroot-config -DCONFIG_=\"\"  -MM *.c > /home/thomas/projets/buildroot/output/build/buildroot-config/.depend 2>/dev/null || :
> /usr/bin/gcc -D_GNU_SOURCE -D_DEFAULT_SOURCE  -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE  -I/home/thomas/projets/buildroot/output/build/buildroot-config -DCONFIG_=\"\"   -c conf.c -o /home/thomas/projets/buildroot/output/build/buildroot-config/conf.o
> /usr/bin/gcc -D_GNU_SOURCE -D_DEFAULT_SOURCE  -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE  -I/home/thomas/projets/buildroot/output/build/buildroot-config -DCONFIG_=\"\"  -I. -c /home/thomas/projets/buildroot/output/build/buildroot-config/zconf.tab.c -o /home/thomas/projets/buildroot/output/build/buildroot-config/zconf.tab.o
> /usr/bin/gcc -D_GNU_SOURCE -D_DEFAULT_SOURCE  -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE  -I/home/thomas/projets/buildroot/output/build/buildroot-config -DCONFIG_=\"\"   /home/thomas/projets/buildroot/output/build/buildroot-config/conf.o /home/thomas/projets/buildroot/output/build/buildroot-config/zconf.tab.o  -o /home/thomas/projets/buildroot/output/build/buildroot-config/conf
> rm /home/thomas/projets/buildroot/output/build/buildroot-config/zconf.tab.c
> #
> # configuration written to /home/thomas/projets/buildroot/.config
> #
> thomas at windsurf:~/projets/buildroot (master)$ echo "BR2_CCACHE=y" >> .config
> thomas at windsurf:~/projets/buildroot (master)$ make olddefconfig busybox-menuconfig
> /home/thomas/projets/buildroot/.config:3912:warning: override: reassigning to symbol BR2_CCACHE
> #
> # configuration written to /home/thomas/projets/buildroot/.config
> #
> make[1]: *** No rule to make target 'busybox-menuconfig'.  Stop.
> make: *** [Makefile:79: _all] Error 2
>
> I also tried manually a configuration with BR2_CCACHE enabled and
> busybox enabled, and "make busybox-menuconfig" worked just fine,
> without host-ccache being built.
>
>> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
>> index 81bba5220c..44bcda4cd2 100644
>> --- a/package/pkg-kconfig.mk
>> +++ b/package/pkg-kconfig.mk
>> @@ -54,6 +54,10 @@ $(2)_KCONFIG_FIXUP_CMDS ?=
>>   $(2)_KCONFIG_FRAGMENT_FILES ?=
>>   $(2)_KCONFIG_DOTCONFIG ?= .config
>>   
>> +ifeq ($(BR2_CCACHE),y)
>> +$(2)_KCONFIG_DEPENDENCIES += host-ccache
>> +endif
> I *think* what we will want instead is to use HOSTCC_NOCCACHE to build
> the kconfig utilities.
>
> Best regards,
>
> Thomas

Thanks
------------------
MIOT
Zhai Zhaoxuan
