From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Feb 2014 10:24:05 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140221100842.2d988a70@skate> (Thomas Petazzoni's message of
 "Fri, 21 Feb 2014 10:08:42 +0100")
References: <20140221073009.2E62F10136B@stock.ovh.net>
 <20140221100842.2d988a70@skate>
Message-ID: <87zjlkvmx6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> sh4a |               dropbear-2014.63 | NOK | http://autobuild.buildroot.net/results/294f462fd585b405fc3067967f9508202bb76230/

 > Download problem. Peter, can you put the tarball on
 > sources.buildroot.net?

I did already yesterday evening. The mirror script runs every 30
minutes, so normally sources.buildroot.net should have the tarballs
pretty much right away, but the script got broken by the recent
BUILDROOT_DL_DIR -> BR2_DL_DIR change and I hadn't noticed it.

Fixed now.

 >> avr32 | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/ee2ec848e893f08fa80caf99a67e68b73b6400e8/

 > driver_nmea2000.c: In function 'nmea2000_open':
 > driver_nmea2000.c:1607: error: 'PF_CAN' undeclared (first use in this function)
 > driver_nmea2000.c:1607: error: (Each undeclared identifier is reported only once
 > driver_nmea2000.c:1607: error: for each function it appears in.)
 > driver_nmea2000.c:1636: error: 'AF_CAN' undeclared (first use in this function)

 > Smells like a too old kernel header problem, but it uses an AVR32
 > toolchain built by Buildroot 2014.02-rc1, so I would suppose the kernel
 > headers are quite recent?

PF_CAN comes from uClibc (bits/socket.h), and 0.9.31 didn't have
PF_CAN. Either we should mark this as !avr32 or backport the uClibc
change:

http://git.buildroot.net/uClibc/commit/?id=6f810c757e5b14a97f

-- 
Bye, Peter Korsgaard
