From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Jun 2013 11:49:35 +0200
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <4E062DFADC6E8142AA8EE9D214BA0C50E400ED@NB-EX-MBX01.diasemi.com>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
 <51C32CE0.9050902@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E400ED@NB-EX-MBX01.diasemi.com>
Message-ID: <51C421AF.20904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/06/13 11:28, Thomas Weininger wrote:
> Thank you for your suggestion Arnout. I tried it out but the error stays the same:
>
> /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -pthread -shared -L/home/diasemi/workspace/dialog/buildroot/output/host/lib -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -Wl,-rpath,/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include build/temp.linux-i686-2.7/smbusmodule.o -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -lpython2.7 -o build/lib.linux-i686-2.7/smbus.so
> gcc: error: unrecognized command line option '-mfpu=vfpv4-d16'
> gcc: error: unrecognized command line option '-mfloat-abi=hard'
> error: command '/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache' failed with exit status 1
>
> It still uses /usr/bin/gcc for building smbus.so and I am not sure if I understand why this happens. Could it be because it uses python distutils in order to start the build?
>
> The file structure in the py-smbus subdirectory of i2c-tools is:
> py-smbus/
> ??? Module.mk
> ??? README
> ??? setup.py
> ??? smbusmodule.c
>
>  From the Module.mk file:
> all-python: $(INCLUDE_DIR)/linux/i2c-dev.h
>          $(DISTUTILS) build

  Can you add 'echo $$PATH' just above the call to $(DISTUTILS), just to 
be sure that the right python will be used?  Or, in the setup.py script, add

import sys
print sys.path

to check that the host-distutils will be used.


>
> So it uses Python distutils (the setup.py) in order to build smbus.so. And it seems to me that it uses the host distutils instead of the target system's one.
> If this is the problem, then the Module.mk or the setup.py will most likely need to be patched in order to use the target system toolchain?

  Hang on, maybe you have to build host-python-setuptools first?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
