From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 23 Aug 2007 00:07:04 +0200
Subject: [Buildroot] Hiding non-buildable packages
In-Reply-To: <200708222317.35411.yann.morin.1998@anciens.enib.fr>
References: <1187728137.6145.48.camel@86-115-11-152>
	<200708222244.38319.yann.morin.1998@anciens.enib.fr>
	<1187816364.4321.63.camel@86-115-11-28>
	<200708222317.35411.yann.morin.1998@anciens.enib.fr>
Message-ID: <1187820424.4321.99.camel@86-115-11-28>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-08-22 klockan 23:17 +0200 skrev Yann E. MORIN:
> On Wednesday 22 August 2007 22:59, Ulf Samuelsson wrote:
> > Granted, but do we need it to be perfect?, I think not!
> > I know that openssh does not work due to lack of 64 bit math.
> > I do not think it works for any architecture.
> > Why should every newbie try this out for themseleves,
> > only to find that it does not build...
> > Much better to hide it from the build, and then let the guy
> > which really wants it to reenable and debug it.
> 
> The problem with your suggestion, if I may, is that it becomes quite complex
> to maintain.
> 

No, I think you want for each target you want to have a dependency on 
a negative variable which might or might not be defined.

	depends on !HIDE_PACKAGE_<package>

is added *once* for each packet.


"package/<package>/Config.in" will not have to be touched ever again.
(At least for purpose of maintaining list of buggy package)
You can then hide this packet for several reasons


Then you have an additional file which contains all the dependencies.

config	REALLY_BROKEN_ARM
	depends on BR2_arm && BR2_REALLY_BROKEN
	select HIDE_PACKAGE_1
	select ...
	select ...

config	MAYBE_BROKEN_ARM
	depends on BR2_arm && BR2_MAYBE_BROKEN
	select HIDE_PACKAGE_17
	select ...
	select ...

config	REALLY_BROKEN_X866
	depends on BR2_arm && BR2_REALLY_BROKEN
	select ...
	select ...
	select ...


All your maintenance is then performed in this file.
If you want to move a package from suspicous to really broken
you do that easily within an editor.


> I'd rather have something much simpler, should we do want to add such options:
> 
> config MAYBE_BROKEN
>     bool
>     prompt "Show packages that might not build"
>     default y
>     help
>       Show packages that, for a reason or another, might not build
>       for some architecture(s).
>       If you're lucky, it will build for yours. If not, you can try to
>       fix it, and post your fix. :-)
> 
> config REALLY_BROKEN
>     bool
>     prompt "Show packages that won't build"
>     default n
>     help
>       Some packages are so deeply broken that your help would be
>       greatly appreciated should you post a patch solving the issue! :-)
>       Warning: this option is not for the faint-hearted!
> 
> ...
> 
> config BR2_PACKAGE_FOO
>     bool
>     prompt "foo (MAYBE BROKEN)"
>     depends on MAYBE_BROKEN
>     default n
> 
> config BR2_PACKAGE_BAR
>     bool
>     prompt "bar (BROKEN)"
>     depends on REALLY_BROKEN
>     default n
> 
> 
> Regards,
> Yann E. MORIN.
> 
-- 
Best Regards,
Ulf Samuelsson
