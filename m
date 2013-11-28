From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 10:27:29 +0100
Subject: [Buildroot] Freescale specific kernel header to compile imx-lib
In-Reply-To: <003f01ceeb99$dc7c9980$9575cc80$@gmail.com>
References: <000b01ceeb8d$1d460fd0$57d22f70$@gmail.com>
 <20131127173911.3f97da37@skate>
 <003f01ceeb99$dc7c9980$9575cc80$@gmail.com>
Message-ID: <20131128102729.294dd0db@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Schnegg,

On Wed, 27 Nov 2013 18:55:28 +0100, Alexandre Schnegg wrote:
> Thank you for your response.
> 
> I can give you some more details.
> 
> When I only select the package "imx-lib", compilation is ok. But when I also
> select the package "gst-fsl-plugins", I have this issue:
> 
> checking whether -lc should be explicitly linked in... no
> checking dynamic linker characteristics... GNU/Linux ld.so
> checking how to hardcode library paths into programs... immediate
> checking whether stripping libraries is possible... no
> checking if libtool supports shared libraries... yes
> checking whether to build shared libraries... yes
> checking whether to build static libraries... yes
> checking vpu_lib.h usability... no
> checking vpu_lib.h presence... no
> checking for vpu_lib.h... no
> configure: error: lib_vpu is required, consider installing imx-lib
> make[1]: ***
> [/home/schnegg/Documents/armadeus/buildroot/output/build/libfslvpuwrap-1.0.1
> 7/.stamp_configured] Error 1

Armadeus is making some fairly major changes to the Buildroot packages,
so I'm not sure whether the help we can provide will be 100% accurate.

<rant>

I've asked gazillions of times the Armadeus people to push their
changes upstream, I'm on their IRC channel to help them to do so if
they need help. But over the past 4+ years, they only contributed 25
patches to Buildroot, and have kept most of their Buildroot changes out
of tree. Seems like they prefer to update their stack of patches over
and over and over again.

</rant>

> make[1]: Leaving directory `/home/schnegg/Documents/armadeus/buildroot'
> make: *** [all] Error 2
> schnegg at ubuntu:~/Documents/armadeus$ make menuconfig
> make[1]: Entering directory `/home/schnegg/Documents/armadeus/buildroot
> 
> It's seems the "imx-lib" isn't built. 

The libfslvpuwrap package has a dependency on imx-lib, so it should get
built before:

LIBFSLVPUWRAP_DEPENDENCIES += imx-lib

Can you restart your build from scratch (make clean; make), and log the
entire build output a file:

	make 2>&1 | tee build.log

And then see if imx-lib is properly built before libfslvpuwrap. If
that's the case, then you should look if a vpu_lib.h file was installed
somewhere. Depending on that, we'll see what's going on: either it has
been installed but libfslvpuwrap isn't looking for it at the right
place, or it hasn't been installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
