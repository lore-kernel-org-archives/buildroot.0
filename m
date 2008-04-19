From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sat, 19 Apr 2008 15:37:32 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <008b01c8a001$f5d75300$090514ac@atmel.com>
References: <20080415214647.D2C693C53C@busybox.net><20080415223131.GB27329@cloud.net.au>	<002f01c89f7b$fae7fb00$050514ac@atmel.com>
	<004301c89f7f$51139540$050514ac@atmel.com>
	<480595BE.3030105@eclis.ch>
	<008401c89f9c$9a0b8560$050514ac@atmel.com>
	<4805F17C.7050107@eclis.ch>
	<065801c89fcd$c457f570$dfb5fea9@atmel.com>
	<480643F6.1070800@eclis.ch>
	<008b01c8a001$f5d75300$090514ac@atmel.com>
Message-ID: <4809F59C.4040509@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson a ?crit :
>>> And they will have to understand the conflict and 
>>> can use "make menuconfig" to resolve the problem.
>>> An easy way to do this, is to call the project:
>>> "Jean-Christian-at91sam9261"
>>> Then the binaries in will contain files like:
>>> "Jean-Christian-at91sam9261-linux-2.6.24.bin"
>> I have not tryed this, but after the build I have thoses file into the 
>> /var/lib/tftpboot:
>>
>> -rw-r--r--  1 jcdr jcdr     553 2008-04-16 20:12 autoscript.at91sam9261ek
>> -rwxr-xr-x  1 jcdr jcdr  200708 2008-04-16 20:12 
>> at91sam9261ek-u-boot-1.2.0-atmel-20080416.bin
>> drwxrwxrwx  2 root root    4096 2008-04-16 20:12 .
>> -rwxr-xr-x  1 jcdr jcdr    4100 2008-04-16 20:12 
>> at91sam9261ek-dataflashboot-2.3.4.bin
>> -rw-r--r--  1 jcdr jcdr 1611128 2008-04-16 20:17 uImage
>>
>> I wonder why the "uImage" is not prefixed with a "at91sam9261ek".
> 
> That is a bug.
> Have not seen this before.

I have redo a test today as you have made commit to fix this.


 From the configuration point of view, the situation is even worse now. 
The command to change from "/tftpboot" to "/var/lib/tftpboot" must now 
be this one:

mv .config .config.def && sed 
's#BR2_TARGET_ATMEL_COPYTO=.*#BR2_TARGET_ATMEL_COPYTO="/var/lib/tftpboot"#;s#BR2_LINUX_COPYTO_TFTPBOOT=y#BR2_LINUX_COPYTO_TFTPBOOT=n#;s#BR2_LINUX_COPYTO=.*#BR2_LINUX_COPYTO="/var/lib/tftpboot"#;' 
< .config.def > .config

Really not a trivial one as it should be. :-(


 From the build point of view, the situation is better now. The build 
complete without having to manually copy the uImage. At the end the 
/var/lib/tftpboot contain:

-rwxr-xr-x  1 jcdr jcdr 197K 2008-04-19 15:24 
at91sam9261ek-u-boot-1.2.0-atmel-20080419.bin
-rw-r--r--  1 jcdr jcdr  553 2008-04-19 15:24 autoscript.at91sam9261ek
-rwxr-xr-x  1 jcdr jcdr 4.1K 2008-04-19 15:24 
at91sam9261ek-dataflashboot-2.3.4.bin
-rw-r--r--  1 jcdr jcdr 1.6M 2008-04-19 15:27 
at91sam9261ek-linux-2.6.24.3-20080419.gz

But where is the rootfs.arm-20080419.ext2 root filesystem ?

Regards,
-- 
Jean-Christian de Rivaz
