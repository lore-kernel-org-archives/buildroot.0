From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Sep 2016 20:04:29 +0200
Subject: [Buildroot] Update of pre-built Buildroot toolchains
References: <20160921210722.1b078ab1@free-electrons.com>
Message-ID: <XnsA68DCC3683FD3ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160921210722.1b078ab1 at free-electrons.com: 

> Hello,
> 
> I have just deployed a new set of pre-build Buildroot toolchains in the
> autobuilders. The toolchains have all been rebuilt as of commit
> 589cbc61b0913891fd00019365e52b9e50ff7250. Major changes are:
> 
>  * Almost all toolchains have been switched to the default of gcc 5.x.
>    There are still a few toolchains that intentionally use different
>    gcc version: some using gcc 6.x, some using gcc 4.8.x.

Hi Thomas,

it seems to Cortex m4 toolchain is broken:

wget http://autobuild.buildroot.net/toolchains/configs/br-arm-cortex-m4-
full.config

make defconfig BR2_DEFCONFIG=br-arm-cortex-m4-full.config
make toolchain
output/host/usr/bin/arm-linux-gcc -v
[...]
/home/buildroot/br6/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sys
root/usr/lib/crt1.o: In function `_start': (.text+0x30): undefined
reference to `main' collect2: error: ld returned 1 exit status

This breaks the mplayer build
http://autobuild.buildroot.net/results/c1f/c1fcaa871c9c3ac52dc2060f71c34bd2
6b193323//
because mplayer extracts information about the compiler in use
in mplayer-1.3.0/configure, line 1640 by executing gcc:

cc_name=$($_cc -V 2>&1 | head -n 1 | cut -d ',' -f 1)

For my host gcc this results in

$ gcc -v 2>&1 | tail -n 1 | cut -d ' ' -f 1
gcc

For the Cortex m4 toolchain this code fails to detect gcc

$ output/host/usr/bin/arm-linux-gcc -v 2>&1 | tail -n 1 | cut -d ' ' -f 1
collect2:

which breaks further gcc detection during mplayer configure by using the 
host gcc as cross-compiler. 

Regards, Bernd
