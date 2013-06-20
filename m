From: Thomas Weininger <Thomas.Weininger@diasemi.com>
Date: Thu, 20 Jun 2013 07:18:42 +0000
Subject: [Buildroot] Build error when trying to build the py-smbus package
	of i2c-tools
Message-ID: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using Buildroot Git version 28ab11d7855a1b85e4be15cd9c86ad0838fa1cb1 from 2013-06-06. I tried to change the package/i2c-tools/i2c-tools.mk in order to build an extra package called py-smbus, which is part of i2c-tools but not built by default. Considering the i2c-tools README http://www.lm-sensors.org/browser/i2c-tools/trunk/README?rev=6171 I added EXTRA="py-smbus" to the make options.

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 1589d04..403b96d 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -9,7 +9,7 @@ I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
 define I2C_TOOLS_BUILD_CMDS
- $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+ $(MAKE) $(TARGET_CONFIGURE_OPTS) EXTRA="py-smbus" -C $(@D)
endef
 define I2C_TOOLS_INSTALL_TARGET_CMDS


But even this small change breaks the build. I'm confused because of the strage error message:
gcc: error: unrecognized command line option '-mfpu=vfpv4-d16'
gcc: error: unrecognized command line option '-mfloat-abi=hard'

Could you please help me to understand what is going wrong here and how to fix it? The mfpu and mfloat-abi switches are okay IMO. My toolchain is built by Buildroot. It is configured to build for an ARM Cortex A5 target (Atmel SAMA5D3).


>>> i2c-tools 3.1.0 Building
[...]
/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc  -o tools/i2cget tools/i2cget.o tools/i2cbusses.o tools/util.o
running build
running build_ext
building 'smbus' extension
creating build
creating build/temp.linux-i686-2.7
/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include -fPIC -I/home/diasemi/workspace/dialog/buildroot/output/host/usr/include/python2.7 -c smbusmodule.c -o build/temp.linux-i686-2.7/smbusmodule.o
smbusmodule.c: In function 'initsmbus':
smbusmodule.c:695:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
creating build/lib.linux-i686-2.7
/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -pthread -shared -L/home/diasemi/workspace/dialog/buildroot/output/host/lib -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -Wl,-rpath,/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include build/temp.linux-i686-2.7/smbusmodule.o -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -lpython2.7 -o build/lib.linux-i686-2.7/smbus.so
gcc: error: unrecognized command line option '-mfpu=vfpv4-d16'
gcc: error: unrecognized command line option '-mfloat-abi=hard'
error: command '/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache' failed with exit status 1
make[1]: *** [all-python] Error 1
make[1]: Leaving directory `/home/diasemi/workspace/dialog/buildroot/output/build/i2c-tools-3.1.0'
make: *** [/home/diasemi/workspace/dialog/buildroot/output/build/i2c-tools-3.1.0/.stamp_built] Error 2

________________________________

Dialog Semiconductor GmbH
Neue Str. 95
D-73230 Kirchheim
Managing Directors: Dr. Jalal Bagherli, Jean-Michel Richard
Chairman of the Supervisory Board: Gregorio Reyes
Commercial register: Amtsgericht Stuttgart: HRB 231181
UST-ID-Nr. DE 811121668

Legal Disclaimer: This e-mail communication (and any attachment/s) is confidential and contains proprietary information, some or all of which may be legally privileged. It is intended solely for the use of the individual or entity to which it is addressed. Access to this email by anyone else is unauthorized. If you are not the intended recipient, any disclosure, copying, distribution or any action taken or omitted to be taken in reliance on it, is prohibited and may be unlawful.

Please consider the environment before printing this e-mail


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130620/d162d62e/attachment.html>
