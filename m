From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 15 Apr 2008 21:00:11 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
References: <20080415171026.A45293C435@busybox.net> <4804E950.4080108@eclis.ch>
Message-ID: <007c01c89f2c$3e015030$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Jean-Christian de Rivaz" <jc@eclis.ch>
To: <buildroot@uclibc.org>
Cc: <ulf@uclibc.org>
Sent: Tuesday, April 15, 2008 7:43 PM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/target/linux


> ulf at uclibc.org a ?crit :
>> Author: ulf
>> Date: 2008-04-15 10:10:24 -0700 (Tue, 15 Apr 2008)
>> New Revision: 21739
>> 
>> Log:
>> Reversing bad tftpboot patch resulting in two identical targets
>> 
>> Modified:
>>    trunk/buildroot/target/linux/Makefile.in.advanced
> 
> Ouch! Can you please explain why did you re-introduce this bug ?
> The BR2_LINUX_COPYTO variable have absolutely no way to work with a hard 
> coded "/tftpboot/". Just try to copy to /var/lib/tftpboot for example.

Because it is not a bug.

The Configuration now allows you to

1) Copy to /tftpboot                                (if BR2_LINUX_COPYTO_TFTPBOOT is set)
2) Copy to $(BR2_LINUX_COPYTO)    (if BR2_LINUX_COPYTO is non-empty)

Before the patch you would have (a little simplified)

++++++++++++++++++++++++++++++++++++++++++++++++++++++
LINUX_COPYTO:=BR2_LINUX_COPYTO

$(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
        mkdir -p $(BR2_LINUX_COPYTO)
        cp -dpf $(LINUX26_KERNEL) $(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)

$(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
        mkdir -p $(LINUX_COPYTO)
        cp -dpf $(LINUX26_KERNEL) $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
--------------------------------------------------------------------------------------------------

Since LINUX_COPYTO is identical to BR2_LINUX_COPYTO you 
have two IDENTICAL rules, which makes no sense.

If you want to copy to "/var/lib/tftpboot" your .config should contain:

BR2_LINUX_COPYTO_TFTPBOOT=n
BR2_LINUX_COPYTO="/var/lib/tftpboot"



> 
> Please expose a test case so this "resulting in two identical targets" 
> issue can be resolved the right way. Because reversing this patch is 
> just plain wrong.
> 
>> Changeset:
>> Modified: trunk/buildroot/target/linux/Makefile.in.advanced
>> ===================================================================
>> --- trunk/buildroot/target/linux/Makefile.in.advanced 2008-04-15 08:27:24 UTC (rev 21738)
>> +++ trunk/buildroot/target/linux/Makefile.in.advanced 2008-04-15 17:10:24 UTC (rev 21739)
>> @@ -230,7 +230,7 @@
>>  endif
>>  
>>  ifeq ($(BR2_LINUX_COPYTO_TFTPBOOT),y)
>> -LINUX26_TARGETS+=$(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
>> +LINUX26_TARGETS+=/tftpboot/$(LINUX26_KERNEL_NAME)
>>  endif
>>  
>>  ifneq ($(strip $(subst ",,$(BR2_LINUX_COPYTO))),)
>> @@ -437,9 +437,9 @@
>>  mkdir -p $(TARGET_DIR)/boot
>>  cp -dpf .config $(TARGET_DIR)/boot/busybox.config
>>  
>> -$(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
>> - mkdir -p $(BR2_LINUX_COPYTO)
>> - cp -dpf $(LINUX26_KERNEL) $(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
>> +/tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
>> + mkdir -p /tftpboot
>> + cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
>>  
>>  $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
>>  mkdir -p $(LINUX_COPYTO)
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>> 
> 
> -- 
> Jean-Christian de Rivaz
>


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57


Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                 http://www.linux4sam.org/
