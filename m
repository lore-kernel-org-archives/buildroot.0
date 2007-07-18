From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Wed, 18 Jul 2007 22:28:32 +0100
Subject: [Buildroot] linux26 compile error
In-Reply-To: <42345.75.129.164.68.1184788955.squirrel@kujawski.org>
References: <52010.75.129.164.68.1184752475.squirrel@kujawski.org>
	<20070718114550.GA22077@marvin.netwinder.org>
	<55400.75.129.164.68.1184768952.squirrel@kujawski.org>
	<469E6DD6.2010106@teamboyce.co.uk>
	<42345.75.129.164.68.1184788955.squirrel@kujawski.org>
Message-ID: <469E8600.5000802@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank Kujawski wrote:
> That gets me one step further, but it is failing trying to apply a patch:
>
> $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
>         toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
>         touch $@
>
>
>       Successfully remade target file `cross-depmod26'.
>       Considering target file
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.modules_installed'.
>        File
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.modules_installed'
> does not exist.
>         Considering target file
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/root/lib/modules/2.6.21.5/modules.dep'.
>          File
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/root/lib/modules/2.6.21.5/modules.dep'
> does not exist.
>           Considering target file
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.configured'.
>            File
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.configured'
> does not exist.
>             Considering target file
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched'.
>              File
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched'
> does not exist.
>               Considering target file
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.unpacked'.
>                 Pruning file
> `/projects/BuildRoot/buildroot/../dl/linux-2.6.21.5.tar.bz2'.
>                Finished prerequisites of target file
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.unpacked'.
>                Prerequisite
> `/projects/BuildRoot/buildroot/../dl/linux-2.6.21.5.tar.bz2' is
> older than target
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.unpacked'.
>               No need to remake target
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.unpacked'.
>              Finished prerequisites of target file
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched'.
>             Must remake target
> `/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched'.
> toolchain/patch-kernel.sh
> /projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5
> /kernel-patches/
> Aborting.  '/kernel-patches/' is not a directory.
> make: ***
> [/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched]
> Error 1
>
>
>
>
>
>
>
>   
>> Frank Kujawski wrote:
>>     
>>> As it would be, I do need the kernel.  Could I replace this:
>>>
>>> $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
>>>         toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
>>>         touch $@
>>> endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
>>>
>>> with something like
>>>
>>> $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
>>>         toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
>>>         touch $@
>>> else # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
>>> $(LINUX26_DIR)/.patched:
>>>         touch $@
>>> endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
>>>
>>>
>>>
>>>       
>>>> On Wed, Jul 18, 2007 at 04:54:35AM -0500, Frank Kujawski wrote:
>>>>
>>>>         
>>>>> I am getting a compile error on:
>>>>> linux26: cross-depmod26
>>>>> $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
>>>>> $(TARGET_DIR)/boot/$(LINUX26_FORMAT)
>>>>>
>>>>>           
>>>> This is caused by a conditional check in target/linux/Makefile.in:
>>>> ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
>>>> surrounding the part that defindes the $(LINUX26_DIR)/.patched
>>>> target.  You have LINUX26_VERSION matching LINUX_HEADERS_VERSION
>>>> and therefore all the code inside the "ifneq" is skipped.  This
>>>> results in the make error: "no rule to make target"
>>>>
>>>> If you do not need to build a kernel, the simplest fix would be
>>>> to disable the linux26 target entirely (turn off BR2_PACKAGE_LINUX).
>>>>
>>>> I'm not sure why the ifneq is there in the first place.  It may
>>>> have made sense prior to the BSP patch that was recently added.
>>>>
>>>> -R
>>>>
>>>>
>>>>         
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at uclibc.org
>>> http://busybox.net/mailman/listinfo/buildroot
>>>
>>>       
>> All,
>>
>> I commented out the ifdef in the makefile until this patch was completed
>> as this looks to me to be an incomplete BSP patch at the moment.
>> Attached is my temporary fix until this is completed.
>>
>> Regards,
>> Rod Boyce
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>     
>
>
>   
Frank,

 From your output log message it seems that the system is looking in th 
ewrong place for the kernel-patches directory.  In your case i slooks 
like it is looking off the root directory for this which looks very odd 
to me.
  I cannot tell if this error message is occuring when makeing th 
ekernel headers target or the actual kernel sorry have a look in 
tool_chain/kernel-headers (or something like that) and have a read of 
target/linux as well both these places could be causing you the 
trouble.  I remember a long time ago I had to create this directory for 
myself and my x86 target but you are using the ARM target and I have 
never had trouble building that.

Sorry I cannot be more help.
Regards,
Rod Boyce
