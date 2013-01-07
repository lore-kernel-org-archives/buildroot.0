From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 7 Jan 2013 17:16:50 +0100
Subject: [Buildroot] build hangs when building kernel
Message-ID: <FB5BA32813A44818B6499769D61985DF@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Using the latest pull:
 
The build hangs when it is building the kernel 
 
snip....
 
  LD [M]  fs/fuse/cuse.ko
  LD [M]  fs/fuse/fuse.ko
  LD [M]  lib/crc-ccitt.ko
  LD [M]  fs/nls/nls_iso8859-15.ko
make[1]: Leaving directory `/home/buildroot12git/output/build/linux-3.4.24'
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
PERLLIB="/home/buildroot12git/output/host/usr/lib/perl" /usr/bin/make -j8 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot12git/output/target CROSS_COMPILE="
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-" DEPMOD=/home/buildroot12git/output/host/usr/sbin/depmod
-C /home/buildroot12git/output/build/linux-3.4.24 tx53.dtb
make[1]: Entering directory `/home/buildroot12git/output/build/linux-3.4.24'
  DTC     arch/arm/boot/tx53.dtb
DTC: dts->dtb  on file "arch/arm/boot/dts/tx53.dts"
make[1]: Leaving directory `/home/buildroot12git/output/build/linux-3.4.24'
# dtbs moved from arch/RCH/boot to arch/RCH/boot/dts since 3.8-rc1
cat  >> /home/buildroot12git/output/build/linux-3.4.24/arch/arm/boot/zImage
 
 
 
It looks like the missing cat parameter is causing this.


When I break (ctrl-c) and restart make then the cat parameter is present :

Snip..

 LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
make[1]: Leaving directory `/home/buildroot12git/output/build/linux-3.4.24'
make[1]: Entering directory `/home/buildroot12git/output/build/linux-3.4.24'
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[2]: `include/generated/mach-types.h' is up to date.
  CALL    scripts/checksyscalls.sh
  Building modules, stage 2.
  MODPOST 93 modules
make[1]: Leaving directory `/home/buildroot12git/output/build/linux-3.4.24'
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
PERLLIB="/home/buildroot12git/output/host/usr/lib/perl" /usr/bin/make -j8 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot12git/output/target CROSS_COMPILE="
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-" DEPMOD=/home/buildroot12git/output/host/usr/sbin/depmod
-C /home/buildroot12git/output/build/linux-3.4.24 tx53.dtb
make[1]: Entering directory `/home/buildroot12git/output/build/linux-3.4.24'
make[2]: `arch/arm/boot/tx53.dtb' is up to date.
make[1]: Leaving directory `/home/buildroot12git/output/build/linux-3.4.24'
# dtbs moved from arch/RCH/boot to arch/RCH/boot/dts since 3.8-rc1
####----------->>>>>>>>>  cat /home/buildroot12git/output/build/linux-3.4.24/arch/arm/boot/tx53.dtb >>
/home/buildroot12git/output/build/linux-3.4.24/arch/arm/boot/zImage      
rm -f targetkernel
ln -s /home/buildroot12git/output/build/linux-3.4.24 targetkernel
>>> linux 3.4.24 Installing to target
install -m 0644 -D /home/buildroot12git/output/build/linux-3.4.24/arch/arm/boot/zImage
/home/buildroot12git/output/target/boot/zImage
# dtbs moved from arch/RCH/boot to arch/RCH/boot/dts since 3.8-rc1
cp /home/buildroot12git/output/build/linux-3.4.24/arch/arm/boot/tx53.dtb /home/buildroot12git/output/images/
# Install modules and remove symbolic links pointing to build
# directories, not relevant on the target
make[1]: Entering directory `/home/buildroot12git/output/build/linux-3.4.24'
  INSTALL crypto/aead.ko
  INSTALL crypto/aes_generic.ko
  INSTALL crypto/ansi_cprng.ko

Snip 
 

 
Regards johan
