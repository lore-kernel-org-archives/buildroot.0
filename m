From: Quick X <quickx@hotmail.com>
Date: Thu, 22 Jan 2009 13:19:05 -0800
Subject: [Buildroot] Some AT91SAM9261-EK Notes
Message-ID: <BAY124-W491126D3265E8BD9DCF5DCD2CE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I was updating/testing some versions of things and noticed three small issues.
 
First: Using the "uClibc-0.9.30.config" file segfaults some packages, for example dropbear and samba.
 
---at91sam9261ek_defconfig---  Works Fine
uClibc 0.9.30 (uClibc-0.9.29.config)
binutils 2.18
gcc 4.2.4
BusyBox 1.13.x (busybox-1.6.0.config)
at91bootstrap 2.10
u-boot-2009.01
 
---Attempted 1---  Compiles but some Packages Don't work
uClibc 0.9.30 (uClibc-0.9.30.config)
binutils 2.19
gcc 4.3.2
BusyBox 1.13.x (busybox-1.13.x.config)
at91bootstrap 2.10
u-boot-2009.01
 
---Attempted 2---  Works Fine
uClibc 0.9.30 (uClibc-0.9.29.config)
binutils 2.19
gcc 4.3.2
BusyBox 1.13.x (busybox-1.13.x.config)
at91bootstrap 2.10
u-boot-2009.01

 
 
As you can see only the uClibc-0.9.30.config was changed to get it working.  When I say doesn't work I mean error messages during Boot (Seg Fault and Core Dump).  IE
 
---Working Hyperterminal Log (From Attempt 2)---
[[[SNIP]]]
Advanced Linux Sound Architecture Driver Version 1.0.18rc3.
at73c213 spi0.3: at73c213: supported bitrate is 48500 (64 divider)
ASoC version 0.13.2
Error: Driver 'at73c213' is already registered, aborting...
ALSA device list:
  #0: AT91SAM9261-EK external DAC on irq 15
TCP cubic registered
NET: Registered protocol family 10
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 136K
Initializing random number generator... done.
Starting network...
ip: RTNETLINK answers: File exists
Starting dropbear sshd: generating rsa key... generating dsa key... OK
Starting SMB services: done
Starting NMB services: done
 
Welcome to the Erik's uClibc development environment running on an AT91SAM9261EK
AT91SAM9261EK login:
---END---
 
 
---Broken Hyperterminal Log (From Attemp 1)---
Advanced Linux Sound Architecture Driver Version 1.0.18rc3.
at73c213 spi0.3: at73c213: supported bitrate is 48500 (64 divider)
ASoC version 0.13.2
Error: Driver 'at73c213' is already registered, aborting...
ALSA device list:
  #0: AT91SAM9261-EK external DAC on irq 15
TCP cubic registered
NET: Registered protocol family 10
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 136K
Initializing random number generator... done.
Starting network...
Starting dropbear sshd: generating rsa key... generating dsa key... Aiee, segfau
lt! You should probably report this as a bug to the developer
OK
Starting SMB services: Aborted (core dumped)
done
Starting NMB services: done
 
Welcome to the Erik's uClibc development environment running on an AT91SAM9261EK
AT91SAM9261EK login:
---END---
 
 
 
 
Second: I was able to test the "save config" using a custom linux config.  This works now as long as you use "save config" (because it sets the "BOARD_PATH" as well as the "BR2_LINUX_KCONFIG").  If you manually set the Linux Config file with a "make menuconfig", then you also have to manually set the "make menuconfig> XXX> Atmel board repository".  Maybe intended but took me a little bit to figure out.
 
 
 
 
Third: Since U-Boot moved I thought I'd try testing "make menuconfig> Target Options> Atmel Device Support> Secondary Locations> () also copy image to..." again.  Setting it to nothing still results in a make error.
 
---Also Copy Image To Make Error---
[[[SNIP]]]
rm -f /home/dustin/buildroot/binaries/at91sam9261ek/at91bootstrap.bin
(cd /home/dustin/buildroot/binaries/at91sam9261ek ; \
         ln -sf at91sam9261ek-dataflashboot-2.10.bin at91bootstrap.bin \
        )
make[1]: Leaving directory `/home/dustin/buildroot/project_build_arm/at91sam9261ek/at91bootstrap-2.10'
make DESTDIR="" -C /home/dustin/buildroot/project_build_arm/at91sam9261ek/at91bootstrap-2.10 install
make[1]: Entering directory `/home/dustin/buildroot/project_build_arm/at91sam9261ek/at91bootstrap-2.10'
install -d
install: missing file operand
Try `install --help' for more information.
make[1]: [install] Error 1 (ignored)
install binaries/at91sam9261ek-dataflashboot-2.10.bin.fixboot /at91sam9261ek-dataflashboot-2.10.bin
install: cannot create regular file `/at91sam9261ek-dataflashboot-2.10.bin': Permission denied
make[1]: *** [install] Error 1
make[1]: Leaving directory `/home/dustin/buildroot/project_build_arm/at91sam9261ek/at91bootstrap-2.10'
make: *** [/home/dustin/buildroot/project_build_arm/at91sam9261ek/at91bootstrap-2.10/.installed] Error 2
dustin at dds186:~/buildroot$
_________________________________________________________________
Drag n? drop?Get easy photo sharing with Windows Live? Photos.
http://www.microsoft.com/windows/windowslive/photos.aspx
