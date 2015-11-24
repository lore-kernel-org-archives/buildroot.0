From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 24 Nov 2015 20:40:35 +0100
Subject: [Buildroot] WiringPi - problem adding package to my buildroot
In-Reply-To: <CACvocV5bQo_YG05=ujYEJHygDQCw6_XZDLJ9zdCLO4tGCSswtg@mail.gmail.com>
References: <CACvocV5bQo_YG05=ujYEJHygDQCw6_XZDLJ9zdCLO4tGCSswtg@mail.gmail.com>
Message-ID: <20151124204035.7ecad2e8@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giovanni,

On Tue, 24 Nov 2015 19:17:43 +0100, "astrolite ." <ciclonite@gmail.com> wrote:

> Hi all,
> After  sucessfully added pigpio package to buildroot, i'm tried to add
> wiringPi package.
> But i've a problem that not understand..
> 
> These are my files :
> Config.in
> 
> config BR2_PAGiovanniCKAGE_WIRINGPI
> bool "wiringPi"
> help
>  wiringPi libraries
> 
> wiringPi.mk
> 
> WIRINGPI_VERSION = 488e3729e44721b79ba655429f453f7396157c22
> WIRINGPI_INSTALL_TARGET = YES
> WIRINGPI_INSTALL_STAGING = YES
> WIRINGPI_AUTORECONF = YES
> WIRINGPI_SITE = $(call github,ciclonite,pigpio,$(LIBPIGPIO_VERSION))

Fixup for this line:

	WIRINGPI_SITE = $(call github,ciclonite,wiringPi,$(WIRINGPI_VERSION))

and the following is missing:

	$(eval $(autotools-package))

but build failed with
	config.status: error: cannot find input file: `Makefile.in'

in the base directory, maybe a autoreconf/configure/make in the
subdirectory wiringPi works?

> 
> 
> when i launch make :
> 
> make
> /usr/bin/make -j1  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
> silentoldconfig
> make[1]: Entering directory
> `/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05'
> BR2_DEFCONFIG=''
> KCONFIG_AUTOCONFIG=/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/buildroot-config/auto.conf
> KCONFIG_AUTOHEADER=/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/buildroot-config/autoconf.h
> KCONFIG_TRISTATE=/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/buildroot-config/tristate.config
> BR2_CONFIG=/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/.config
> BR2_EXTERNAL=support/dummy-external SKIP_LEGACY=
> /root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/buildroot-config/conf
> --silentoldconfig Config.in
> make[1]: Leaving directory
> `/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05'
> >>> host-gawk 4.1.2 Patching
> 
> Applying 0001-no-versioned.patch using patch:
> patching file Makefile.in
> Reversed (or previously applied) patch detected!  Skipping patch.
> 2 out of 2 hunks ignored -- saving rejects to file Makefile.in.rej
> Patch failed!  Please fix 0001-no-versioned.patch!
> make: ***
> [/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/host-gawk-4.1.2/.stamp_patched]
> Error 1
> 
> Someone can help me to find out the problem?

I think a previous build was aborted while the package host-gawk was build, the patch was already
applied, but before the file 'output/build/host-gawk-4.1.2/.stamp_patched' was written...

Best way is to call clean for this package, eg.:

	$ make host-gawk-dirclean

or by hand:

	$ rm -rf output/build/host-gawk-4.1.2

Regards,
Peter

> Thanks,
> Giovanni
