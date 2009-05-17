From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Sun, 17 May 2009 14:37:38 -0300
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <87vdo1nti0.fsf@macbook.be.48ers.dk>
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<877i0jr9i2.fsf@macbook.be.48ers.dk>
	<d6cda7730905142211u73224c09p6202e672f303cd45@mail.gmail.com>
	<87vdo1nti0.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905171037r4f4aa9f7y9a12eb9377ab70f8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, May 16, 2009 at 9:04 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> ?Thiago> make atngw100-extended_defconfig && make
>
> I take it that you mean atngw100-expanded_defconfig? Did you try
> building that after your latest changes? The defconfig seems
> completely bogus to me - docker tried to use pkg-config from
> staging_dir instead of host_dir (fixed now), and you had turned off
> the X stuff and still tried to build libgtk2/webkit/docker/openmotif.

I just test built it and things that are newer than the defconfig,
when oldconfig jumps in asking what to do I just accepted the default
behavior. I didn't change it more than that. Then I run a test build,
and it stopped at avahi, so I fixed the problem with avahi, commited
avahi change, and resume the build.

Once I could see that the defconfg built completely, then I updated
the defconfig with my .config that contains the newly defined symbols
(with their default values).

I usually run atngw100_defconfig on the target and most of the time my
own config based on the atngw100_defconfig on a custom board. I don't
usually use the other configs much, so I leave them as they were,
except for the oldconfig questions that gets their defaults. At best I
update kernel, but not before testing it with the atngw100_defconfig
first.

I did not pull from you since the last merge, since I'm not sure if I
update my master branch what would happen to the patches or if it
would know the merge point, whatever...

So, no idea what changed in the between at the main repository.

> Furthermore, enabling the Xserver doesn't work as there seems to be
> missing some avr32 support:
>
> xf86Bus.c: In function 'xf86FindPrimaryDevice':
> compiler.h:1447: error: impossible constraint in 'asm'
> compiler.h:1447: error: impossible constraint in 'asm'
> compiler.h:1428: error: impossible constraint in 'asm'
> compiler.h:1447: error: impossible constraint in 'asm'
> compiler.h:1428: error: impossible constraint in 'asm'
> compiler.h:1428: error: impossible constraint in 'asm'
> compiler.h:1447: error: impossible constraint in 'asm'
> compiler.h:1428: error: impossible constraint in 'asm'
> make[6]: *** [xf86Bus.lo] Error 1
>
> And there's indeed no avr32 conditionals in hw/xfree86/common/compiler.h.
>
> Are you using this?

I didn't try to build X, I don't use it. Unless it gets built by one
of the _defconfigs that I updated, then I built and didn't see this
happening. I can't afford to stare at the screen for 30 or 40 minutes
watching the build. If it doesn't stop the build then mostly for sure
I would miss it.

> ?Thiago> and it will fail there, because the folder $(TARGET_DIR)/var/lib/ doesn't exist.
>
> Sorry, I never got that far in the build. I can disable all the X
> stuff, but then I guess it will behave just like the other platforms I
> normally compile avahi for.

Well, to me it was a no brainer... ln failed, I looked up the folder
it was trying to create the link, it didn't exist, so, add mkdir -p.
Tried again, problem solved.
I didn't review the package or see if that file is used for anything
or not, I trust the package's author to know what it was supposed to
do. All I was trying to fix is the package build.

> ?Thiago> I found the problem testing the atngw100*_defconfig's from
> ?Thiago> the other patches.
>
> And you didn't run into the above issues?
>

Nope, not in my tree. They all built prior to commit to my local tree
and prior to push.

Kind Regards,
   Thiago A. Correa
