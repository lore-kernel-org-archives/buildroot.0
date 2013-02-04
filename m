From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Feb 2013 21:53:25 +0000 (UTC)
Subject: [Buildroot] [Bug 5900] New: config flags to the Xenomai build
	system ...
Message-ID: <bug-5900-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5900

           Summary: config flags to the Xenomai build system ...
           Product: buildroot
           Version: 2012.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: raespi at icid.cu
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The only two options passed to the xenomai package in the
package/xenomai/xenomai.mk are:

ifeq ($(BR2_PACKAGE_XENOMAI_SMP),y)
XENOMAI_CONF_OPT += --enable-smp
endif

XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/

On my target arch ( smdk2440 / s3c24xx ) I need these also:
XENOMAI_CONF_OPT += CFLAGS="-march=armv4t -msoft-float" LDFLAGS="-march=armv4t
-msoft-float"

without them, the xenomai test suite fails to detect any FPU support at all,
even if it's emulated by software such as this case.  It's something that needs
to be passed to the ./configure according to their "Getting Started" document,
and something that has been discussed recently in their mailing lists ...

I know it can't be passed on like this exactly, but maybe with a conditional
block for this architecture.  Here are the options by arch that you should pass
( taken from the Xenomai site ):

at91rm9200     :: CFLAGS="-march=armv4t -msoft-float"
at91sam9x      :: CFLAGS="-march=armv5 -msoft-float"
imx1           :: CFLAGS="-march=armv4t -msoft-float"
imx21          :: CFLAGS="-march=armv5 -msoft-float"
imx31          :: CFLAGS="-march=armv6 -mfpu=vfp"
imx51/imx53    :: CFLAGS="-march=armv7-a -mfpu=vfp3"
imx6q          :: CFLAGS="-march=armv7-a -mfpu=vfp3"
ixp4xx         :: CFLAGS="-march=armv5 -msoft-float" --enable-arm-tsc=ixp4xx
omap3          :: -march=armv7-a -mfpu=vfp3
omap4          :: -march=armv7-a -mfpu=vfp3
orion          :: -march=armv5 -mfpu=vfp
pxa            :: -march=armv5 -msoft-float
pxa3xx         :: CFLAGS="-march=armv5 -msoft-float"
--enable-arm-quirks=xscale3
s3c24xx        :: CFLAGS="-march=armv4t -msoft-float"
sa1100         :: CFLAGS="-march=armv4t -msoft-float"
--enable-arm-quirks=sa1100

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
