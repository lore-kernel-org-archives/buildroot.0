From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Wed, 16 Apr 2008 07:59:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <004301c89f7f$51139540$050514ac@atmel.com>
References: <20080415214647.D2C693C53C@busybox.net><20080415223131.GB27329@cloud.net.au>	<002f01c89f7b$fae7fb00$050514ac@atmel.com>
	<004301c89f7f$51139540$050514ac@atmel.com>
Message-ID: <480595BE.3030105@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson a ?crit :
>> ----- Original Message ----- 
>> From: "Hamish Moffatt" <hamish@cloud.net.au>
>> To: <buildroot@uclibc.org>
>> Sent: Wednesday, April 16, 2008 12:31 AM
>> Subject: Re: [Buildroot] svn commit: trunk/buildroot/target/linux
>>
>>
>>> On Tue, Apr 15, 2008 at 02:46:47PM -0700, ulf at uclibc.org wrote:
>>>> Author: ulf
>>>> Date: 2008-04-15 14:46:47 -0700 (Tue, 15 Apr 2008)
>>>> New Revision: 21740
>>>>
>>>> Log:
>>>> Allow build to complete, even if tftpboot is not writeable by user
>>>>
>>>> Modified:
>>>>    trunk/buildroot/target/linux/Makefile.in.advanced
>>>>
>>>>
>>>> Changeset:
>>>> Modified: trunk/buildroot/target/linux/Makefile.in.advanced
>>>> ===================================================================
>>>> --- trunk/buildroot/target/linux/Makefile.in.advanced 2008-04-15 17:10:24 UTC (rev 21739)
>>>> +++ trunk/buildroot/target/linux/Makefile.in.advanced 2008-04-15 21:46:47 UTC (rev 21740)
>>>> @@ -438,8 +438,8 @@
>>>>  cp -dpf .config $(TARGET_DIR)/boot/busybox.config
>>>>  
>>>>  /tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
>>>> - mkdir -p /tftpboot
>>>> - cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
>>>> + -mkdir -p /tftpboot
>>>> + -cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
>>> I think that's a bad idea. Now you will build the system, the copy
>>> silently fails to run, you will boot your embedded target and wonder why
>>> it behaves the same as before?
>>>
>>>
>>
>> OK, I see your point.
>> AFAIK, the copy will only fail if you do not have any write access or if the disk is full.
>> Since the filename contains a date, you have to be very unlucky if someone
>> else has created a u-boot for the same project, the same day.
>> Even if there is such a file, your problem will disappear the next day,
>>
>> I think the u-boot configuration is written to the file system
>> and the file system will thus always be created after u-boot.
>> If the disk is full, then the build will probably fail at this point.
>>
>>
>> The advantage of this, is that the build can continue and u-boot generated
>> in binaries even if there is no /tftpboot access.
>>
>> Best Regards
>> Ulf Samuelsson
> 
> 
> It would be interesting to hear other people opinions.

I think that we mess with two different goals:

1) Allow the build to complete by not using "/tftpboot". This is really 
important. As pointed many times:
  - System don't have alway a /tftpboot.
  - It is not alway writable by the users.
  - Superuser are not alway ok to do a /tftpboot just for an application.
  - It will not work as expected in case multiple users run buildroot.
  - It is the wrong path for a TFTP server in many new distributions.
So I think there is really no point to keep it (other than the effort to 
change little code in target/linux/Makefile.in.advanced). All the 
Makefile targets and results of the build at this stage must be only 
into the buildroot user tree.

2) Option to copy the result of the build into the TFTP server 
directory. This stage simply take the result of the previous stage and 
allow to have ready to go files available with the TFTP protocol at the 
end of the build. Technically the best way would be to know if there is 
a TFTP server installed and use the directory he serve as a default, or 
to not make a copy if none is installed. As this idea seem difficult to 
make, I agree that we can live with "/tftpboot" by default, even if I 
suspect that "/var/lib/tftpboot" will be more and more appropriate.

This will not solve the possibility that multiple users clash there 
files into the TFTP directory, but at least this remove any possibility 
that there build are broken because of a common target in there 
Makefiles. Users that wants to share a common TFTP server should take 
each others to agree to a directory structure into the TFTP server that 
let each of them have a private space for theres files.

--
Jean-Christian de Rivaz
