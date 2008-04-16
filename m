From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Wed, 16 Apr 2008 20:22:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <065801c89fcd$c457f570$dfb5fea9@atmel.com>
References: <20080415214647.D2C693C53C@busybox.net><20080415223131.GB27329@cloud.net.au>	<002f01c89f7b$fae7fb00$050514ac@atmel.com>
	<004301c89f7f$51139540$050514ac@atmel.com>
	<480595BE.3030105@eclis.ch>
	<008401c89f9c$9a0b8560$050514ac@atmel.com>
	<4805F17C.7050107@eclis.ch>
	<065801c89fcd$c457f570$dfb5fea9@atmel.com>
Message-ID: <480643F6.1070800@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson a ?crit :
> 
>> Ulf Samuelsson a ?crit :
>>>> I think that we mess with two different goals:
>>>>
>>>> 1) Allow the build to complete by not using "/tftpboot". This is really 
>>>> important. As pointed many times:
>>>>  - System don't have alway a /tftpboot.
>>>>  - It is not alway writable by the users.
>>>>  - Superuser are not alway ok to do a /tftpboot just for an application.
>>> Linux is not built by default.
>> Are you talking about the Linux kernel ? If yes, this is not true at 
>> least for the at91sam9261 target.
>>
>>> If you enable Linux, then the normal build is the default.
>> Sorry, I don't understand your sentence. I make the test by using the 
>> default configuration of the at91sam9261 target. What do you means by 
>> "enable Linux" ?
>>
> 
> The default is not when you use the make <XXX>_defconfig.
> They you are using a predefined board, and that may have
> configuration items which are different from default settings.
> 
> Default is when you do the make menuconfig from scratch.

I am very surprised by this response. Users take buildroot because it 
have a target (that means an XXX_defconfig) that match there board (if 
it's a development kit) or that is a starting point to match there 
custom board. Maintainers taking buildroot for a new target will 
probably start by duplicate and modifying an existing XXX_defconfig that 
there will publish for the users. Configuring from scratch can be a 
painful and time consuming exercise that request knowledge in many area.

I take buildroot after some search on the internet about works related 
to the AT91SAM9261 processor. The first thing I tryed have been to do a 
make at91sam9261ek_deconfig and a make, just to evaluate the project 
maturity. I started the make menuconfig, but frankly I was boring to 
search what I should change in so many settings to get something working 
while a ready to go XXX_defconfig already exists. Just an an example: 
the make menuconfig have u-boot deselected by default, but without it 
the at91sam9261 target failed to compile. There is many traps like this 
one. It take many try an error cycle to find a good setting. I suspect 
that many users are likely to prefer to start from a "make 
XXX_defconfig" that just work. Anyway when a user have found a 
configuration that match there needs, it will save it configuration file 
and will use the menuconfig only to adjust a setting.

My point is that it's a bad idea trying to see two differents process 
between the make menuconfig and the make XXX_defconfig. The two methods 
should work out of the box.

>>> The problem only occurs when you do the advanced build
>>> and have the COPYTO_TFTPBOOT set.
>> Again what an "advanced build". If I wants to change the tftpboot path I 
>> simply edit the .config file. This method, default config or changes 
>> made by menuconfig make no difference for the Makefile.
>>
> 
> "Advanced build" is a selection done in the target/linux/Config.in's.

I my test I never changed the Linux kernel configuration, only the top 
level ".config". In fact I used exactly this command:

git clean -dfx && git reset --hard && git svn rebase && ( yes "" | make 
at91sam9261ek_defconfig ) && mv .config .config.def && sed 
's#/tftpboot#/var/lib/tftpboot#' < .config.def > .config  && ( yes "" | 
make )

Because on my system there is no such /tftpboot thing.

>>> There is an easy workaround, and that is to disable copying to /tftpboot if there is a problem.
>>> You can always copy manually from your BINARIES to wherever,
>>> or use the programmable COPYTO.
>> Yes, but this is not obvious from the user perspective.
>>
> 
> You only need to learn once.

I have changed the sed command of the above command to this:

sed 
's#/tftpboot#/var/lib/tftpboot#;s#BR2_LINUX_COPYTO_TFTPBOOT=y#BR2_LINUX_COPYTO_TFTPBOOT=n#' 
< .config.def > .config

Now the build can be completed, after this 3 commands:

yes "" | make
cp -pf 
project_build_arm/at91sam9261ek/linux-2.6.24.3/arch/arm/boot/uImage 
project_build_arm/at91sam9261ek/linux-2.6.24.3/uImage
yes "" | make

>>> Question is how much we need to protect the user from impossible combinations.
>> As mush as possible by replacing difficult and fragile things by simple 
>> and reliable ones.
> 
> 
>>>>  - It will not work as expected in case multiple users run buildroot.
>>>>  - It is the wrong path for a TFTP server in many new distributions.
>>>> So I think there is really no point to keep it (other than the effort to 
>>>> change little code in target/linux/Makefile.in.advanced). All the 
>>>> Makefile targets and results of the build at this stage must be only 
>>>> into the buildroot user tree.
>>> The point is that it simplifies the complete build to doing "make".
>> Exactly. Currently this goal in not reach because of the hardcoded 
>> /tftpboot in the Makefile.
> 
> No, the Makefile is not the problem, the ".config" is the problem,
> and that is an easy fix by the user.
> Now, the build will continue if the copy fails.

Sorry but I found this way of doing thing not a clean fix, but a hack. 
The problem is booth the Makefile and the ".config". The 
BR2_LINUX_COPYTO_TFTPBOOT must be removed completely in a way that the 
build in granted to complete whatever is set into BR2_LINUX_COPYTO. This 
last one could be by default "/tftpboot" if you like and must be the 
absolutely last operation of the full build process, like if the user 
manually copy the result files into the TFTP server directory. Really, 
BR2_LINUX_COPYTO_TFTPBOOT is a terrible bad thing that bring absolutely 
no feature that can't be done by BR2_LINUX_COPYTO alone. It only make 
thing confusing and error prone.

>>>> 2) Option to copy the result of the build into the TFTP server 
>>>> directory. This stage simply take the result of the previous stage and 
>>>> allow to have ready to go files available with the TFTP protocol at the 
>>>> end of the build. Technically the best way would be to know if there is 
>>>> a TFTP server installed and use the directory he serve as a default, or 
>>>> to not make a copy if none is installed. As this idea seem difficult to 
>>>> make, I agree that we can live with "/tftpboot" by default, even if I 
>>>> suspect that "/var/lib/tftpboot" will be more and more appropriate.
>>>>
>>>> This will not solve the possibility that multiple users clash there 
>>>> files into the TFTP directory, but at least this remove any possibility 
>>>> that there build are broken because of a common target in there 
>>>> Makefiles. Users that wants to share a common TFTP server should take 
>>>> each others to agree to a directory structure into the TFTP server that 
>>>> let each of them have a private space for theres files.
>>> As long as they do not use the same project name, there is no conflict.
>>> That is the purpose of the long file names.
>> Multiples users can work on the same targets.
> 
> And they will have to understand the conflict and 
> can use "make menuconfig" to resolve the problem.
> An easy way to do this, is to call the project:
> "Jean-Christian-at91sam9261"
> Then the binaries in will contain files like:
> "Jean-Christian-at91sam9261-linux-2.6.24.bin"

I have not tryed this, but after the build I have thoses file into the 
/var/lib/tftpboot:

-rw-r--r--  1 jcdr jcdr     553 2008-04-16 20:12 autoscript.at91sam9261ek
-rwxr-xr-x  1 jcdr jcdr  200708 2008-04-16 20:12 
at91sam9261ek-u-boot-1.2.0-atmel-20080416.bin
drwxrwxrwx  2 root root    4096 2008-04-16 20:12 .
-rwxr-xr-x  1 jcdr jcdr    4100 2008-04-16 20:12 
at91sam9261ek-dataflashboot-2.3.4.bin
-rw-r--r--  1 jcdr jcdr 1611128 2008-04-16 20:17 uImage

I wonder why the "uImage" is not prefixed with a "at91sam9261ek".

-- 
Jean-Christian de Rivaz
