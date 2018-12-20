From: =?UTF-8?Q?=C5=81ukasz_Przenios=C5=82o?= <bremenpl@gmail.com>
Date: Thu, 20 Dec 2018 22:04:25 +0100
Subject: [Buildroot] Cross compiling kernel module for the target
In-Reply-To: <CA+OsCCTSNKNMTDCJmfoK6HnBX32LOLx2utgDmwDMOa-DH16NDA@mail.gmail.com>
References: <CA+OsCCTCqQ+Fne+=VtXKgi5E_ezkdTAva-zTk6KaWa9egem0Sg@mail.gmail.com>
 <20181220090411.7ab00f70@windsurf>
 <CA+OsCCQ2TWYiEv-a8uRaJVSd4YX9A4T_EV1ihC1Y2ZyrNPAkag@mail.gmail.com>
 <20181220100733.5c6d0860@windsurf>
 <CA+OsCCRWydtsa1RVjGhc8ZdV-guMuA1ORauct4XH8ZYjgk6zvw@mail.gmail.com>
 <20181220102059.1884d72d@windsurf>
 <CA+OsCCRL-rds9BdUtnaQLANeB+OYrJ=bB+GmqnJdfDzfP1n+Zg@mail.gmail.com>
 <20181220140427.63b19478@windsurf>
 <CA+OsCCTSNKNMTDCJmfoK6HnBX32LOLx2utgDmwDMOa-DH16NDA@mail.gmail.com>
Message-ID: <CA+OsCCQhjcKUZjxj8mh3NmAvfYyVUw-vC5DfuiYW38NZNaWoiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, hold on... It has just built... Replaced the KERNELDIR that was set
to the headers dir with the sources dir listed above. Now the makefile
looks like this:

obj-m    := simp.o
KERNELDIR ?=
/home/lukasz/brl/Machine/beaglebone/build/linux-a75d8e93056181d512f6c818e8627bd4554aaf92
PWD       := $(shell pwd)

all: default

default:
    $(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
    rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

And the make output:

lukasz at lukasz-vb:/tmp/test$ make ARCH=arm
CROSS_COMPILE=arm-buildroot-linux-uclibcgnueabihf-
make -C
/home/lukasz/brl/Machine/beaglebone/build/linux-a75d8e93056181d512f6c818e8627bd4554aaf92
M=/tmp/test modules
make[1]: Entering directory
'/home/lukasz/brl/Machine/beaglebone/build/linux-a75d8e93056181d512f6c818e8627bd4554aaf92'
  CC [M]  /tmp/test/simp.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /tmp/test/simp.mod.o
  LD [M]  /tmp/test/simp.ko
make[1]: Leaving directory
'/home/lukasz/brl/Machine/beaglebone/build/linux-a75d8e93056181d512f6c818e8627bd4554aaf92'
lukasz at lukasz-vb:/tmp/test$
lukasz at lukasz-vb:/tmp/test$
lukasz at lukasz-vb:/tmp/test$ ls -l
total 64
-rw-rw-r-- 1 lukasz lukasz   284 gru 20 21:59 Makefile
-rw-rw-r-- 1 lukasz lukasz    25 gru 20 22:02 modules.order
-rw-rw-r-- 1 lukasz lukasz     0 gru 20 22:02 Module.symvers
-rw-rw-r-- 1 lukasz lukasz   297 gru 20 21:54 simp.c
-rw-rw-r-- 1 lukasz lukasz 12220 gru 20 22:02 simp.ko
-rw-rw-r-- 1 lukasz lukasz   839 gru 20 22:02 simp.mod.c
-rw-rw-r-- 1 lukasz lukasz 18340 gru 20 22:02 simp.mod.dwo
-rw-rw-r-- 1 lukasz lukasz  7608 gru 20 22:02 simp.mod.o
-rw-rw-r-- 1 lukasz lukasz  6120 gru 20 22:02 simp.o

But I dont have the target with me, so cannot test the module. But it
compiles! Thank you very much for help Thomas. I could swear I tried this
setup before, cant tell now what I have missed.



czw., 20 gru 2018 o 21:49 ?ukasz Przenios?o <bremenpl@gmail.com> napisa?(a):

> Thomas, I am building the Kernel with buildroot. Did you mean this
> directory?
>
> lukasz at lukasz-vb:~/brl/Machine/beaglebone/build/linux-a75d8e93056181d512f6c818e8627bd4554aaf92$
> ls -l
> total 114892
> drwxr-xr-x  33 lukasz lukasz     4096 pa?  5 11:52 arch
> drwxr-xr-x   3 lukasz lukasz     4096 pa?  5 11:56 block
> drwxr-xr-x   2 lukasz lukasz     4096 pa?  5 11:56 certs
> -rw-r--r--   1 lukasz lukasz    18693 gru 22  2017 COPYING
> -rw-r--r--   1 lukasz lukasz    98277 gru 22  2017 CREDITS
> drwxr-xr-x   4 lukasz lukasz    20480 pa?  5 11:57 crypto
> drwxr-xr-x 119 lukasz lukasz    12288 pa?  5 11:52 Documentation
> drwxr-xr-x 130 lukasz lukasz     4096 pa?  5 11:57 drivers
> drwxr-xr-x  36 lukasz lukasz     4096 pa?  5 11:56 firmware
> drwxr-xr-x  75 lukasz lukasz    12288 pa?  5 11:56 fs
> drwxr-xr-x  30 lukasz lukasz     4096 pa?  5 11:52 include
> drwxr-xr-x   2 lukasz lukasz     4096 pa?  5 11:56 init
> drwxr-xr-x   2 lukasz lukasz     4096 pa?  5 11:56 ipc
> -rw-r--r--   1 lukasz lukasz     2888 gru 22  2017 Kbuild
> -rw-r--r--   1 lukasz lukasz      252 gru 22  2017 Kconfig
> drwxr-xr-x  16 lukasz lukasz    16384 pa?  5 11:56 kernel
> drwxr-xr-x  12 lukasz lukasz    28672 pa?  5 11:56 lib
> -rw-r--r--   1 lukasz lukasz   384216 gru 22  2017 MAINTAINERS
> -rw-r--r--   1 lukasz lukasz    59246 gru 22  2017 Makefile
> drwxr-xr-x   3 lukasz lukasz    12288 pa?  5 11:56 mm
> -rw-r--r--   1 lukasz lukasz     7056 pa?  5 11:56 modules.builtin
> -rw-r--r--   1 lukasz lukasz    17409 pa?  5 11:57 modules.order
> -rw-r--r--   1 lukasz lukasz   549487 pa?  5 11:57 Module.symvers
> drwxr-xr-x  65 lukasz lukasz     4096 pa?  5 11:56 net
> -rw-r--r--   1 lukasz lukasz    18372 gru 22  2017 README
> -rw-r--r--   1 lukasz lukasz     7490 gru 22  2017 REPORTING-BUGS
> drwxr-xr-x  25 lukasz lukasz     4096 pa?  5 11:52 samples
> drwxr-xr-x  14 lukasz lukasz     4096 pa?  5 11:56 scripts
> drwxr-xr-x  10 lukasz lukasz     4096 pa?  5 11:56 security
> drwxr-xr-x  23 lukasz lukasz     4096 pa?  5 11:57 sound
> -rw-r--r--   1 lukasz lukasz  2571239 pa?  5 11:56 System.map
> drwxr-xr-x   2 lukasz lukasz     4096 pa?  5 11:52 ti_config_fragments
> drwxr-xr-x  30 lukasz lukasz     4096 pa?  5 11:52 tools
> drwxr-xr-x   2 lukasz lukasz     4096 pa?  5 11:56 usr
> drwxr-xr-x   4 lukasz lukasz     4096 pa?  5 11:56 virt
> -rwxr-xr-x   1 lukasz lukasz 51072304 pa?  5 11:56 vmlinux
> -rw-r--r--   1 lukasz lukasz 62819472 pa?  5 11:55 vmlinux.o
>
> I tried providing it as KERNELDIR, but yielded errors as well.
>
> czw., 20 gru 2018 o 14:04 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> napisa?(a):
>
>> Hello,
>>
>> On Thu, 20 Dec 2018 10:34:42 +0100, ?ukasz Przenios?o wrote:
>>
>> > Thomas, I do build my kernel using buildroot- it gives me the cross
>> > compiling tools. My problem is, that I think that the buildroot doesnt
>> > provide the sources for me in the output.
>>
>> I'm sorry, but I don't really understand what you're saying.
>>
>> If you are building the Linux kernel with Buildroot, so you definitely
>> have a directory called output/build/linux-<version>/ which contains
>> the kernel source code, the kernel configuration (.config file) and
>> all the object files/images that result from a kernel build.
>>
>> If you don't have this folder, then you are definitely not building the
>> Linux kernel with Buildroot.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181220/8b9140c9/attachment.html>
