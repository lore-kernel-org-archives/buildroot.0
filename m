From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sat, 19 Apr 2008 14:43:32 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <000601c8a058$c21680c0$060514ac@atmel.com>
References: <20080415214647.D2C693C53C@busybox.net><20080415223131.GB27329@cloud.net.au>	<002f01c89f7b$fae7fb00$050514ac@atmel.com>
	<004301c89f7f$51139540$050514ac@atmel.com>
	<480595BE.3030105@eclis.ch>
	<008401c89f9c$9a0b8560$050514ac@atmel.com>
	<4805F17C.7050107@eclis.ch>
	<065801c89fcd$c457f570$dfb5fea9@atmel.com>
	<480643F6.1070800@eclis.ch>
	<000601c8a058$c21680c0$060514ac@atmel.com>
Message-ID: <4809E8F4.10505@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson a ?crit :
>>> "Advanced build" is a selection done in the target/linux/Config.in's.
>> I my test I never changed the Linux kernel configuration, only the top 
>> level ".config". In fact I used exactly this command:
>>
>> git clean -dfx && git reset --hard && git svn rebase && ( yes "" | make 
>> at91sam9261ek_defconfig ) && mv .config .config.def && sed 
>> 's#/tftpboot#/var/lib/tftpboot#' < .config.def > .config  && ( yes "" | 
>> make )
>>
> 
> 
> And you can also create your own custom board
> Do the following (Once!):
> 
> 1) cd ~
> 2) mkdir -p buildroot
> 3) mkdir -p buildroot/local
> 4) Edit "~/.bashrc"
>     export BUILDROOT_LOCAL=~/buildroot/local
>     <save>
> 5) make at91sam9261ek_defconfig
> 6) make menuconfig
>     Change BR2_LINUX_COPYTO_TFTPBOOT to "n"
>     <save>
> 7) make saveconfig

Sorry, I can't get the rational of why you insists to mess with the TFTP 
serveur setting while configuring a new board. This is absolutely no 
related at all. What you describes here is only one of the possible 
methods to configure a new board. Let the user chose the method that 
best fit there needs. Anyway, for any method, there should be nothing to 
do about the TFTP server setting. This is just so odd.

The user will have to adjust the TFTP server setting only to match the 
real path of the directory served by the TFTP server. For example if his 
TFTP server use /var/lib/tftpboot instead of /tftpboot, it should simply 
change the "/tftpboot" in the configuration file by "/var/lib/tftpboot". 
Is that so hard to understand ? There is nothing related to the 
definition of a new board, nothing related to the build, just a very 
trivial change. Actually this don't work like this because of the odd 
BR2_LINUX_COPYTO_TFTPBOOT symbol. This is why I am unhappy and try to 
search a better solution.

BR2_LINUX_COPYTO_TFTPBOOT=y or BR2_LINUX_COPYTO="/tftpboot" are exactly 
the same thing, this why it make the same Makefile target problem. One 
of the two must be removed to fix the problem and make thing simple for 
the users. Now, BR2_LINUX_COPYTO have the possibility to be adapted to a 
different TFTP server path, but BR2_LINUX_COPYTO_TFTPBOOT cannot. So it 
seem obvious that this is BR2_LINUX_COPYTO_TFTPBOOT that must be 
removed. For backward compatibility, we can introduce something like 
this (pseudo code):

if ( (BR2_LINUX_COPYTO_TFTPBOOT==y) and (BR2_LINUX_COPYTO="") ) {
     BR2_LINUX_COPYTO="/tftpboot"
}

Regards,
-- 
Jean-Christian de Rivaz
