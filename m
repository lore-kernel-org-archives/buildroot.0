From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 May 2009 14:04:55 +0200
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <d6cda7730905142211u73224c09p6202e672f303cd45@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 15 May 2009
	02\:11\:23 -0300")
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<877i0jr9i2.fsf@macbook.be.48ers.dk>
	<d6cda7730905142211u73224c09p6202e672f303cd45@mail.gmail.com>
Message-ID: <87vdo1nti0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> What exactly does this fix? It seems like we should have /var/lib/ as
 >> we're removing /var/lib/avahi-autoipd?
 >> 
 >> A bit more detailed description in your commit message would be good.

 Thiago> Perhaps the order of packages influenced it once that it built onetime
 Thiago> for whoever wrote that.

We use it for several projects (most not using much else than
busybox), so it gets built atleast one a day here without problems.

 Thiago> make atngw100-extended_defconfig && make

I take it that you mean atngw100-expanded_defconfig? Did you try
building that after your latest changes? The defconfig seems
completely bogus to me - docker tried to use pkg-config from
staging_dir instead of host_dir (fixed now), and you had turned off
the X stuff and still tried to build libgtk2/webkit/docker/openmotif.

Furthermore, enabling the Xserver doesn't work as there seems to be
missing some avr32 support:

xf86Bus.c: In function 'xf86FindPrimaryDevice':
compiler.h:1447: error: impossible constraint in 'asm'
compiler.h:1447: error: impossible constraint in 'asm'
compiler.h:1428: error: impossible constraint in 'asm'
compiler.h:1447: error: impossible constraint in 'asm'
compiler.h:1428: error: impossible constraint in 'asm'
compiler.h:1428: error: impossible constraint in 'asm'
compiler.h:1447: error: impossible constraint in 'asm'
compiler.h:1428: error: impossible constraint in 'asm'
make[6]: *** [xf86Bus.lo] Error 1

And there's indeed no avr32 conditionals in hw/xfree86/common/compiler.h.

Are you using this?

 Thiago> and it will fail there, because the folder $(TARGET_DIR)/var/lib/ doesn't exist.

Sorry, I never got that far in the build. I can disable all the X
stuff, but then I guess it will behave just like the other platforms I
normally compile avahi for.

 Thiago> I found the problem testing the atngw100*_defconfig's from
 Thiago> the other patches.

And you didn't run into the above issues?

-- 
Bye, Peter Korsgaard
