From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Wed, 22 Dec 2010 22:41:33 +0100
Subject: [Buildroot] [PATCH] New package to do a complete build for the
 seagate dockstar hardware.
In-Reply-To: <705612.60084.qm@web58201.mail.re3.yahoo.com>
References: <1292301534-3059-1-git-send-email-nospamcalfee@yahoo.com>
	<705612.60084.qm@web58201.mail.re3.yahoo.com>
Message-ID: <4D12708D.3060901@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.12.2010 19:07, schrieb Steve Calfee:
> I tried to send this to the list using git send-email using the tips on how to
> send via my gmail account. The list manager bounced the email because that email
>
> address is not used for buildroot. How do others send to the mailing list? Is
> there a way to send via the yahoo mail system from git send-email?
I use googlemail and my git conf looks like this:
[user]
         name = XXX YYY
         email = XXX.YYY at googlemail.com
[sendemail]
         smtpencryption = tls
         smtpserver = smtp.gmail.com
         smtpuser = XXX.YYY at gmail.com
         smtpserverport = 587
         from = XXX YYY <xxx.yyy@googlemail.com>
[format]
         numbered = auto
         to = buildroot at busybox.net
         signoff = true
The smtp password is asked on any "git send-patch".
Maybe your mail was too large....


Anyway, I'm honored that someone picked up my patch for the dockstar. 
Thanks for have a look into this.

Here are my comments. First, buildroot does not include any specific 
skeletons - only a very basic layout with basic functionality is 
provided. If the user likes package xy to behave in a different manner, 
he has to change it himself - those changes will never be integrated 
into br source tree. That's why I placed those parts outside the tree.
Everyone who uses your patch should know this (I guess you are aware of 
this, but possibly not everyone digging in the mailingarchive for some 
dockstar support).


>> While developing and testing, prevent annoying edits of the host  ~/.ssh/...
>> file to change the keys, copy the target's /etc/dropbear/  directory into
>> the skeleton/etc here and it will be reapplied after every  build and so the
>> keys won't change on the target. If you don't do this  dropbear will
>> regenerate the keys on the first startup.
Jepp. I ran several times into the same trap...

>> U-boot - I have not tried to use Marcus' build patches  for u-boot. I have
>> successfully downloaded and installed Jeff Doozan's  dockstar uboot and use
>> it with dockstar.  It is dangerous changing the  bootstrap - if it is messed
>> up it means possibly "bricking" the dockstar and  forcing either a jtag
>> recovery, or figuring out how to recover with a xmodem  terminal, or setting
>> up an attractive plastic paperweight.
I prefer to chainload a full featured second u-boot after the factory 
default u-boot. So you won't brick your device updating mtd0 and have 
always a fallback to the original u-boot. On some development state I 
tested the 2nd stage u-boot of openwrt which worked quite well. In my 
source trees I activated UBI and ext2 support.


Just to let others know, Kernel 2.6.37 and u-boot 2010.12 will have 
native dockstar support integrated (arcNumber=2998). When these are 
released, it may be easier to maintain the dockstar as buildroot target 
and you will find it someday in the default menuconfig...
