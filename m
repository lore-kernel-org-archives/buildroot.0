From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Nov 2013 23:38:12 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <20131117172917.GB4425@free.fr>
References: <20131116223632.462c6e60@skate>
	<20131117172917.GB4425@free.fr>
Message-ID: <20131117233812.4ac14561@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 17 Nov 2013 18:29:17 +0100, Yann E. MORIN wrote:

> Here are a few analysis of some of the build failures:
> 
> http://autobuild.humanoidz.org/results/a60/a60a63163288af14f701adfdfa9f62229c983984/
>   -> unable to download the toolchain from mentor.com
>   -> I was able to download the toolchain OK from here
>   -> temporary glitch in network or on the server?

Appears to be a temporary glitch, because I've just tested, and I'm
able to wget this URL from the build server right now.

> http://autobuild.humanoidz.org/results/889/889b3870c30d027af1aedb843648c4ddb7ed79f0/
>   -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/microblaze-linux-gcc'
> 
> http://autobuild.humanoidz.org/results/33f/33ff18fef818bba47eedaff2662142c25b53b4da/
>   -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/aarch64-linux-gcc'
> 
> http://autobuild.humanoidz.org/results/6aa/6aa47858a511e89b0bd6a3a472276baab65afb1c/
>   -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/nios2-linux-gcc'
> 
> For the last three failures above, can it be that the .config file is
> improperly tweaked by the test framework?

That's really weird. If you look at the config files of all of those
builds, they have BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y, and
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y. Which doesn't make any sense
when you look at the defconfig used as the base for those
configurations:

  http://autobuild.buildroot.org/toolchains/configs/free-electrons/microblazeel-unknown-linux-gnu.config
  http://autobuild.buildroot.org/toolchains/configs/free-electrons/linaro-aarch64.config
  http://autobuild.buildroot.org/toolchains/configs/free-electrons/sourcery-nios2.config

Take any of these base configuration, run 'make menuconfig' on them,
and you will definitely not have BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
defined, but instead the proper usage of an existing toolchain profile.

Moreover, there have been some successful builds of Microblaze, AArch64
and NIOS 2 later on. Well, the builds were not necessarily successful
until the end, but they built some packages, which means that the
toolchain was successfully installed. See for example:

  Aarch64
  http://autobuild.buildroot.org/results/450/4506a24e72505949772ce61745d78c7b5754c93e/build-end.log

  Microblaze
  http://autobuild.buildroot.org/results/c7e/c7e5797d0c1e5164ead67c0dcf1d2ab293fb15e7/build-end.log

  NIOS 2
  http://autobuild.buildroot.org/results/351/35108c3a4a128371a55fdda13f14c032bc118c3a/build-end.log

And for those three architectures, there is only one defconfig for
each, so it really means that those builds could only originate from
the same base configuration as the builds who failed in a bizarre way.

So, it was failing for some time, and is now "fixed". But I don't see
any commit today that could be causing this.

Ideas?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
