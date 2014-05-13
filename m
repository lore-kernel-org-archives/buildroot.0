From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 13 May 2014 20:31:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-12
References: <20140513063008.8B2BB100F96@stock.ovh.net>
 <20140513102429.2a1ff222@free-electrons.com>
Message-ID: <a15a4bx642.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140513102429.2a1ff222 at free-electrons.com: 

>>        arm |                   pango-1.28.4 | NOK |
>>        http://autobuild.buildroot.net/results/ab57dd3729d529366808cbfc80
>>        2f49360b2ec2b9/ 
> 
> To be investigated by some X.org person. Bernd maybe?

Hi,

>   CCLD     pango-view
> /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-
linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: 
libXdamage.so.1, needed by /home/test/test/2/output/host/usr/arm-buildroot-
linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-
link)

same link error for libXfixes.so.3, libXext.so.6 and libX11.so.6, needed by 
libGAL.so. libGAL.so is part of a binary blob provided by package gpu-viv-bin-
mx6q:

BR2_PACKAGE_FIRMWARE_IMX=y
BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y

Depending on the value of BR2_PACKAGE_XORG7 either libGAL-fb.so or libGAL-
x11.so is linked to libGAL.so, see gpu-viv-bin-mx6q.mk.

The defconfig used by the autobuilder disables xorg7 support so libGAL.so 
should point to libGAL-fb.so, which is the case during my attempt to reproduce 
the build error. Running "make pango" compiled without errors, currently 
"make" is executed and could take some time to finish.

@Thomas: Could you please check the link target of output/host/usr/arm-
buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so?

Regards, Bernd
