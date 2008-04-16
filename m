From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 16 Apr 2008 06:39:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
References: <20080415214647.D2C693C53C@busybox.net>
	<20080415223131.GB27329@cloud.net.au>
Message-ID: <002f01c89f7b$fae7fb00$050514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Hamish Moffatt" <hamish@cloud.net.au>
To: <buildroot@uclibc.org>
Sent: Wednesday, April 16, 2008 12:31 AM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/target/linux


> On Tue, Apr 15, 2008 at 02:46:47PM -0700, ulf at uclibc.org wrote:
>> Author: ulf
>> Date: 2008-04-15 14:46:47 -0700 (Tue, 15 Apr 2008)
>> New Revision: 21740
>> 
>> Log:
>> Allow build to complete, even if tftpboot is not writeable by user
>> 
>> Modified:
>>    trunk/buildroot/target/linux/Makefile.in.advanced
>> 
>> 
>> Changeset:
>> Modified: trunk/buildroot/target/linux/Makefile.in.advanced
>> ===================================================================
>> --- trunk/buildroot/target/linux/Makefile.in.advanced 2008-04-15 17:10:24 UTC (rev 21739)
>> +++ trunk/buildroot/target/linux/Makefile.in.advanced 2008-04-15 21:46:47 UTC (rev 21740)
>> @@ -438,8 +438,8 @@
>>  cp -dpf .config $(TARGET_DIR)/boot/busybox.config
>>  
>>  /tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
>> - mkdir -p /tftpboot
>> - cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
>> + -mkdir -p /tftpboot
>> + -cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
> 
> I think that's a bad idea. Now you will build the system, the copy
> silently fails to run, you will boot your embedded target and wonder why
> it behaves the same as before?
> 
> 


OK, I see your point.
AFAIK, the copy will only fail if you do not have any write access or if the disk is full.
Since the filename contains a date, you have to be very unlucky if someone
else has created a u-boot for the same project, the same day.
Even if there is such a file, your problem will disappear the next day,

I think the u-boot configuration is written to the file system
and the file system will thus always be created after u-boot.
If the disk is full, then the build will probably fail at this point.


The advantage of this, is that the build can continue and u-boot generated
in binaries even if there is no /tftpboot access.

Best Regards
Ulf Samuelsson
