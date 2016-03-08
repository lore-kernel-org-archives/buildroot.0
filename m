From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Mar 2016 00:16:34 +0100
Subject: [Buildroot] [PATCH v2 2/2] help: relocate help messages
 specific to one package
In-Reply-To: <20160308225948.GD14289@free.fr>
References: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
 <1457473693-25776-2-git-send-email-jezz@sysmic.org>
 <20160308225948.GD14289@free.fr>
Message-ID: <56DF5D52.6080609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/08/16 23:59, Yann E. MORIN wrote:
> J?r?me, All,
>
> On 2016-03-08 22:48 +0100, J?r?me Pouiller spake thusly:
>> Use $EXTRA_HELP feature in order to integrate help messages specific
>> to one package (linux-menuconfig, etc...) package they are
>> related.
>>
>> It would be possible to do it using kconfig framework, but I was not
>> sure it is necessary to document kconfig targets systematicaly.
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>> ---
>> v2:
>>    - Rename LOCAL_HELP
>>
>>   Makefile                   | 16 ----------------
>>   boot/barebox/barebox.mk    |  5 +++++
>>   linux/linux.mk             |  7 +++++++
>>   package/busybox/busybox.mk |  4 ++++
>>   package/uclibc/uclibc.mk   |  4 ++++
>>   5 files changed, 20 insertions(+), 16 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 1c9f63c..eb92052 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -932,22 +932,6 @@ help:
>>   	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
>>   	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
>>   	@echo '  <pkg>-rebuild          - Restart the build from the build step'
>> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>> -	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
>> -endif
>> -ifeq ($(BR2_LINUX_KERNEL),y)
>> -	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
>> -	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
>> -	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
>> -	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
>> -endif
>> -ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>> -	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
>> -endif
>> -ifeq ($(BR2_TARGET_BAREBOX),y)
>> -	@echo '  barebox-menuconfig     - Run barebox menuconfig'
>> -	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
>> -endif
>>   	@for i in $(EXTRA_HELP); do echo "  $$i"; done
>
> Following my reply to the previous mail, here's an alternate proposal
> (it may need a bit of tweaking, though, I jut wrote it in the mail
> without testing):
>
>      for h in $(PACKAGE_HELP_y); do \
>          printf "  %24.24s - %s\n" "$${h%% *}" "$${h#* }"; \
>      done

  Nice, but actually largely independent of this patch. This improvement could 
be done in a follow-up (third) patch. The patch in the current state is mostly 
moving things around.

  I would tend to prefer splitting on something other than space, though. 
<space><colon><space> for instance. So $${h%% : *}.


>
> and see below how it is set...
>
>>   	@echo
>>   	@echo 'Documentation:'
>> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
>> index 7715daf..24d0162 100644
>> --- a/boot/barebox/barebox.mk
>> +++ b/boot/barebox/barebox.mk
>> @@ -117,4 +117,9 @@ $(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_
>>   endif
>>   endif
>>
>> +ifeq ($(BR2_TARGET_BAREBOX),y)
>> +	EXTRA_HELP += 'barebox-menuconfig     - Run barebox menuconfig'
>> +	EXTRA_HELP += 'barebox-savedefconfig  - Run barebox savedefconfig'
>> +endif
>
> PACKAGE_HELP_$(BR2_TARGET_BAREBOX) += "barebox-menuconfig Run barebox menuconfig"
> PACKAGE_HELP_$(BR2_TARGET_BAREBOX) += "barebox-savedefconfig Run barebox savedefconfig"

  I'm not particularly fond of the _y trick. We have it in a few places, but 
IMHO it doesn't make things more readable or maintainable at all. Only when you 
have a lot of different symbols to check and something relatively short on the 
right hand side, then it looks OK. Like is often the case in the kernel.

  So I would tend to accept these patches as they are now, and have your 
proposal as a follow-up.

  Regards,
  Arnout

>
> and so on...
>
> Which IMHO is much more readable, and allows us to nicely change the
> layout of the help texts.
>
> Regards,
> Yann E. MORIN.
>
>> +
>>   $(eval $(kconfig-package))
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 7e20255..6cfc8e7 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -435,6 +435,13 @@ endif
>>
>>   endif # BR_BUILDING
>>
>> +ifeq ($(BR2_LINUX_KERNEL),y)
>> +	EXTRA_HELP += 'linux-menuconfig       - Run Linux kernel menuconfig'
>> +	EXTRA_HELP += 'linux-savedefconfig    - Run Linux kernel savedefconfig'
>> +	EXTRA_HELP += 'linux-update-defconfig - Save the Linux configuration to the path specified'
>> +	EXTRA_HELP += '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
>> +endif
>> +
>>   $(eval $(kconfig-package))
>>
>>   # Support for rebuilding the kernel after the cpio archive has
>> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
>> index 7c904c8..d4ee149 100644
>> --- a/package/busybox/busybox.mk
>> +++ b/package/busybox/busybox.mk
>> @@ -250,4 +250,8 @@ $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_
>>   endif
>>   endif
>>
>> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>> +	EXTRA_HELP += 'busybox-menuconfig     - Run BusyBox menuconfig'
>> +endif
>> +
>>   $(eval $(kconfig-package))
>> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
>> index 200de04..9448364 100644
>> --- a/package/uclibc/uclibc.mk
>> +++ b/package/uclibc/uclibc.mk
>> @@ -460,4 +460,8 @@ $(error No uClibc configuration file specified, check your BR2_UCLIBC_CONFIG set
>>   endif
>>   endif
>>
>> +ifeq ($(BR2_PACKAGE_UCLIBC),y)
>> +	EXTRA_HELP += 'uclibc-menuconfig      - Run uClibc menuconfig'
>> +endif
>> +
>>   $(eval $(kconfig-package))
>> --
>> 2.7.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
