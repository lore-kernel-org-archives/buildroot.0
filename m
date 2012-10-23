From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Oct 2012 17:09:13 +0200
Subject: [Buildroot] [gpsd-users] Getting ready to ship 3.8
In-Reply-To: <20121023145349.EFC1940659@snark.thyrsus.com>
References: <20121023145349.EFC1940659@snark.thyrsus.com>
Message-ID: <20121023170913.7f5d701f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric S. Raymond,

On Tue, 23 Oct 2012 10:53:49 -0400 (EDT), Eric S. Raymond wrote:
> I'd like to do a point release soon. No one big reason, but we've had
> an accumulation of minor fixes, feature additions, and packaging
> tweaks that I want to get out the door.
> 
> However, there are two reported segfault errors - Debian bug #689187
> in gpsfake and Savannah bug #37451 in gpsmon - which I haven't been
> able to reproduce. They may point at a difficult-to-invoke bug in the
> NMEA driver.  Due to these, we're currently in state Red.
> 
> The bug reports are here:
> 
> https://savannah.nongnu.org/bugs/index.php?37451
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=689187
> 
> All experienced devs: please try to reproduce these and see
> if you can generate any insights.

We have recently packaged gpsd 3.7 in Buildroot (an embedded Linux
build system that works by cross-compiling software for different
architectures), and have faced a number of issues for which we have
patches:

 * First issue is that we still support Python 2.5 based hosts, while
   the current SCons based gpsd build system makes some assumption
   about Python 2.6 being available. This requires three patches:

   http://git.buildroot.net/buildroot/plain/package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch
   http://git.buildroot.net/buildroot/plain/package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch
   http://git.buildroot.net/buildroot/plain/package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch

 * Second issue is that gpsd hardcodes a runtime library path (RPATH)
   in its libraries, which when cross-compiling means that paths of the
   build machine are leaked into the target machine. So we have a
   simple patch that disables the RPATH usage:

   http://git.buildroot.net/buildroot/plain/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch

Is there some interest in those patches? If so, I can submit them
officially for integration. We are always interested in reducing our
patch queues by getting things integrated upstream when possible.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
