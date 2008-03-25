From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Tue, 25 Mar 2008 18:31:48 +0100
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <00da01c88e8c$9254dd60$070514ac@atmel.com>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
	<47E3F85A.7000608@eclis.ch>
	<071301c88e62$eced8f30$070514ac@atmel.com>
	<47E8DBA5.3040304@eclis.ch>
	<00da01c88e8c$9254dd60$070514ac@atmel.com>
Message-ID: <47E93704.6070804@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson a ?crit :
>> The idea to use only one symbol cam after I see that there is two of 
>> them for Atmel targets. I still don't see why something would go wrong 
>> if the BR2_TARGET_ATMEL_COPYTO will be replaced by the BR2_LINUX_COPYTO. 
> 
> Not running Linux on my laptop at the moment, so I cannot check the svn
> but as I see it, you want to be able to copy the linux image to
> 
> 1) BINARIES_DIR
> 2) root file system (option)
> 3) A place where it is easy to download to the target using tftp,
>     which defaults to "/tftpboot".
>     It is OK, to make this programmable as long the default is used.
>     As an option, we could add a shell symbol "BUILDROOT_TFTP_DIR"
>     which overrides the menuconfig.

Ok, thanks for the explanation.

My two proposed patches only take care of the point number 3 in your 
list. Currently there is two symbols used to copy some file into the 
tftpboot directory: BR2_LINUX_COPYTO and BR2_TARGET_ATMEL_COPYTO.


a) Each of this symbols cannot be set to anything other than "/tftpboot" 
because the scripts that use them have hard coded "/tftpboot" into them. 
  The 2 patches only fix for this simple problem. Without those patches 
the BR2_LINUX_COPYTO and BR2_TARGET_ATMEL_COPYTO are actually almost 
useless as modifying them are granted to fail because of the hard coded 
path in the scripts.

Take for example the "target/linux/Makefile.in.advanced" file. It 3 
lines with the path "/tftpboot" hard coded into it. My patch only 
replace those "/tftpboot" by the symbol "$(BR2_LINUX_COPYTO)". Same 
logic apply for the patch that replace the hard coded "/tftpboot" ba the 
symbol "$(BR2_TARGET_ATMEL_COPYTO)" into the files 
"target/device/Atmel/at91bootstrap/at91bootstrap.mk" and 
"target/device/Atmel/u-boot/u-boot.mk".

Did you see anything wrong that prevent those small patches to be applyed ?


b) Yes there is several symbols that are used to copy the linux kernel, 
but only the two symbols BR2_LINUX_COPYTO and BR2_TARGET_ATMEL_COPYTO 
are set by default to copy files into the /tftpboot directory. In my 
understanding there are both used for the exact same purpose: copy some 
files (not only the linux kernel) into the right tftpboot directory 
(possibly not alway "/tftpboot"). As there carry the same semantic, I 
wonder why we need two of them as there will alway have the same value 
to get a working setup. If there are alway the same, why not simply use 
one of them (BR2_LINUX_COPYTO) and replace the second 
(BR2_TARGET_ATMEL_COPYTO) by the first ?

Best Regards,
-- 
Jean-Christian de Rivaz
