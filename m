From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 16 Apr 2008 14:59:51 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
References: <20080415214647.D2C693C53C@busybox.net><20080415223131.GB27329@cloud.net.au>	<002f01c89f7b$fae7fb00$050514ac@atmel.com>
	<004301c89f7f$51139540$050514ac@atmel.com>
	<480595BE.3030105@eclis.ch>
	<008401c89f9c$9a0b8560$050514ac@atmel.com>
	<4805F17C.7050107@eclis.ch>
Message-ID: <065801c89fcd$c457f570$dfb5fea9@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Ulf Samuelsson a ?crit :
>>> I think that we mess with two different goals:
>>>
>>> 1) Allow the build to complete by not using "/tftpboot". This is really 
>>> important. As pointed many times:
>>>  - System don't have alway a /tftpboot.
>>>  - It is not alway writable by the users.
>>>  - Superuser are not alway ok to do a /tftpboot just for an application.
>> 
>> Linux is not built by default.
> 
> Are you talking about the Linux kernel ? If yes, this is not true at 
> least for the at91sam9261 target.
> 
>> If you enable Linux, then the normal build is the default.
> 
> Sorry, I don't understand your sentence. I make the test by using the 
> default configuration of the at91sam9261 target. What do you means by 
> "enable Linux" ?
> 

The default is not when you use the make <XXX>_defconfig.
They you are using a predefined board, and that may have
configuration items which are different from default settings.

Default is when you do the make menuconfig from scratch.

>> The problem only occurs when you do the advanced build
>> and have the COPYTO_TFTPBOOT set.
> 
> Again what an "advanced build". If I wants to change the tftpboot path I 
> simply edit the .config file. This method, default config or changes 
> made by menuconfig make no difference for the Makefile.
> 

"Advanced build" is a selection done in the target/linux/Config.in's.

>> There is an easy workaround, and that is to disable copying to /tftpboot if there is a problem.
>> You can always copy manually from your BINARIES to wherever,
>> or use the programmable COPYTO.
> 
> Yes, but this is not obvious from the user perspective.
> 

You only need to learn once.

>> Question is how much we need to protect the user from impossible combinations.
> 
> As mush as possible by replacing difficult and fragile things by simple 
> and reliable ones.


>>>  - It will not work as expected in case multiple users run buildroot.
>>>  - It is the wrong path for a TFTP server in many new distributions.
>>> So I think there is really no point to keep it (other than the effort to 
>>> change little code in target/linux/Makefile.in.advanced). All the 
>>> Makefile targets and results of the build at this stage must be only 
>>> into the buildroot user tree.
>> 
>> The point is that it simplifies the complete build to doing "make".
> 
> Exactly. Currently this goal in not reach because of the hardcoded 
> /tftpboot in the Makefile.

No, the Makefile is not the problem, the ".config" is the problem,
and that is an easy fix by the user.
Now, the build will continue if the copy fails.

>>> 2) Option to copy the result of the build into the TFTP server 
>>> directory. This stage simply take the result of the previous stage and 
>>> allow to have ready to go files available with the TFTP protocol at the 
>>> end of the build. Technically the best way would be to know if there is 
>>> a TFTP server installed and use the directory he serve as a default, or 
>>> to not make a copy if none is installed. As this idea seem difficult to 
>>> make, I agree that we can live with "/tftpboot" by default, even if I 
>>> suspect that "/var/lib/tftpboot" will be more and more appropriate.
>>>
>>> This will not solve the possibility that multiple users clash there 
>>> files into the TFTP directory, but at least this remove any possibility 
>>> that there build are broken because of a common target in there 
>>> Makefiles. Users that wants to share a common TFTP server should take 
>>> each others to agree to a directory structure into the TFTP server that 
>>> let each of them have a private space for theres files.
> 
>> As long as they do not use the same project name, there is no conflict.
>> That is the purpose of the long file names.
> 
> Multiples users can work on the same targets.

And they will have to understand the conflict and 
can use "make menuconfig" to resolve the problem.
An easy way to do this, is to call the project:
"Jean-Christian-at91sam9261"
Then the binaries in will contain files like:
"Jean-Christian-at91sam9261-linux-2.6.24.bin"


> 
> --
> Jean-Christian de Rivaz
>

Best Regards
Ulf Samuelsson
