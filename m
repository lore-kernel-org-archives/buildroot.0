From: Mike Sander <msander@cogeco.ca>
Date: Wed, 08 Apr 2009 13:18:48 -0400
Subject: [Buildroot] u-boot fails with custom board support
In-Reply-To: <49DCC925.7060706@atmel.com>
References: <49DCAFCE.4030001@cogeco.ca> <49DCC925.7060706@atmel.com>
Message-ID: <49DCDC78.9030404@cogeco.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> mike sander skrev:
>   
>> Hi All:
>>
>> I'm using buildroot-2009.02. I have a custom board based on atmel
>> at91sam9g20. I have created a top level board config.
>>
>> I invoke make as follows:
>>
>> make BOARD=xx
>>
>>     
> The normal way of using buildroot is to do:
>
> $ make at91sam9g20ek_defconfig
> $ make
>
> If you do any modifications to any the configs (busybox, linux, .config
> etc.)
> you can do:
>
> $ make saveconfig
>
> which will copy all your configs to $(LOCAL)/$(PROJECT)
> It will also update the .config file so that it will use
> your updated config files instead of the default.
>
> You can then retrieve this by making:
> $ make BOARD=<PROJECT> getconfig
> I.E:
> $ make BOARD=at91sam9g20-mike getconfig
>
> which will fetch the new config file into the top directory of buildroot
>
> You then type
> $ make
> to build the project
>
>   
Thank You.  It appears I was doing it wrong.    I did the "make 
BOARD=<PROJECT> getconfig ; make" and it worked as expected..

To be honest, the documentation is a bit vague (IMHO).

I understood "make BOARD=<project>" to be the mechanism to build for a 
specific project.   This does work, except for u-boot.    The getconfig 
is used if you want to modify the configuration (prior to another 
saveconfig).   What then is the use of "make BOARD=<project>"?


<quote>

Once a package has been unpacked, it is possible to manually update 
configuration files. Buildroot can automatically save the configuration 
of buildroot, linux, busybox, uclibc and u-boot in "local/$(PROJECT) by 
using the command:

 $ make saveconfig

Once a buildroot configuration has been created by saveconfig, the 
default "$(TOPDIR)/.config" file can be overridden by

 $ make BOARD=<project>

Buildroot will then use "local/<project>/<project>.config" instead of 
".config".

If you want to modify your board, you can copy the project configuration 
file to ".config" by using the command:

 $ make BOARD=<project> getconfig

</end quote>



Could I propose the following wording: 

Once a package has been unpacked, it is possible to manually update 
configuration files. Buildroot can automatically save the configuration 
of buildroot, linux, busybox, uclibc and u-boot in "local/$(PROJECT) by 
using the command:

 $ make saveconfig


If you want to modify your board, you can copy the project configuration 
file to ".config" by using the command:

 $ make BOARD=<project> getconfig
 <make changes to configuration>
 $ make saveconfig


To build your board:
 $ make BOARD=<project> getconfig
 $ make 



    

Once again, thanks for you assistance.   If you find this proposed 
wording better, can you make changes or should I submit a bug report?

Regards,

Mike



> BR
> Ulf Samuelsson
>
>
>   
>> u-boot is failing with the following messages (see below). I have
>> specified "at91sam9g20ek" in the "board name" section for u-boot (same
>> behaviour with default setting). It appears that u-boot does correctly
>> do the at91sam9g20ek_config. I cannot see how/why make is looking for
>> "Project Name" items under u-boot towards the end of the u-boot build.
>> Manually building u-boot with "make at91sam9g20ek_config;make" works
>> fine. Stock u-boot is perfectly acceptable.
>>
>> I've read the br docs. I did not see any indication that u-boot needs
>> to be tailored when using custom board support. Any suggestions on how
>> to force u-boot to build the stock config? I have tried latest br
>> snapshot too. same behavior. I suspect I have missed something obvious.
>>
>>
>>
>> /usr/bin/make -C board/atmel/xx/
>> make: Entering an unknown directory
>> make: *** board/atmel/xx/: No such file or directory. Stop.
>> make: Leaving an unknown directory
>> make[1]: *** [board/atmel/xx/libxx.a] Error 2
>> make[1]: Leaving directory
>> `/home/br/buildroot/project_build_arm/xx/u-boot-2009.03'
>> make: ***
>> [/home/br/buildroot/project_build_arm/xx/u-boot-2009.03/u-boot.bin]
>> Error 2
>>
>>
>>
>> thanks in advance,
>>
>> mike sander
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>     
>
>
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Scanned with Copfilter Version 0.84beta3a (P3Scan 2.2.1)
> AntiSpam:  SpamAssassin 3.2.3
> by Markus Madlener @ http://www.copfilter.org
>
>   
