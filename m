From: =?UTF-8?B?TmlscyBLw7ZobGVy?= <nk_clean@ibt-interfaces.de>
Date: Sat, 02 May 2015 18:18:00 +0200
Subject: [Buildroot] Question about passing the right TARGET_CC and
 TARGET_LD to .c and .cpp Makefile in same project
Message-ID: <5544F8B8.4080701@ibt-interfaces.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a problem to compile .c and .cpp sources together in one project.
For .c files everything is fine. but with .cpp i run into problems. It 
compiles witout any error, but will not run on target.
The executeble itselv is present, but linked against host. I can run the 
executeble on the host but not on the target.

I have googeled a lot but actually i found no way to solve the problem.

I monitored two problems to build my .cpp executebles of a project named 
connect:

     1. Problem
         For a multi input file .cpp application the host g++ is used, 
instead of the TARGET_CC, it seems that TARGET_CC is not passed 
correctly into the makefile see below [1. Problem]

     2. Problem
         In case of linking the parts together LD="" Libary path is emty 
see below [2. Problem]

     The pure .c program the project is compiling fine with right lib 
and gcc, it also runs on the target.

[Cmmented part output of a make run]

[1. Problem]
g++  -Wall -Wextra -m32 -g -rdynamic -pedantic -Wshadow -fbounds-check 
-fstack-protector-all  -c -o util.o util.cpp
g++  -Wall -Wextra -m32 -g -rdynamic -pedantic -Wshadow -fbounds-check 
-fstack-protector-all  -c -o tally.o tally.cpp
g++ -Wall -Wextra -m32 -g -rdynamic -pedantic -Wshadow -fbounds-check 
-fstack-protector-all -o tally tally.o util.o

[2. Problem]
#    /usr/bin/make -j2 
CXX"/home/koehler/s/br/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-g++" 
LD="" -C /home/koehler/s/br/buildroot/out
put/build/connect-1.0 tally


[Normal .c program in same project compiles fine and run on target too]
#    /usr/bin/make -j2 
CC="/home/koehler/s/br/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc" 
LD="/home/koehler/s/br/buildroot/output/h
ost/usr/bin/i586-buildroot-linux-uclibc-ld" -C 
/home/koehler/s/br/buildroot/output/build/connect-1.0 gpi_mon


Does anyone have an idear for me how to solve this issue?

Regards

NIls


----------------------------------------------------------------------------------
Here are the part of the buildroot makefile I use:

connect.mk for CONNECT Package:

define CONNECT_BUILD_CMDS
     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
     $(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) modules_install
endef

define CONNECT_INSTALL_TARGET_CMDS
     $(INSTALL) -D -m 0755 $(@D)/tally $(TARGET_DIR)/bin/tally
     $(INSTALL) -D -m 0755 $(@D)/gpi_mon $(TARGET_DIR)/bin/gpi_mon
endef

define CONNECT_DEVICES
     /dev/debug  c  666  0  0  42  0  -  -  -
endef

$(eval $(generic-package))

------------------------------------------------------------------------------------

And the Makefile for my sourcecode:
# source makefile
ccflags-y+=-DUSE_PLATFORM_DEVICE
ccflags-y+=-Wall -rdynamic -Wshadow -fbounds-check

# Executebles and objects
EXEC = gpi_mon tally
OBJS = tally.o util.o

#dependencies CPP program
tally: tally.o util.o
tally.o: defines.h tally.h tally.cpp
util.o: defines.h tally.h util.cpp

#dependencies C program
gpi_mon.o: defines.h gpi_mon.c

KERNELDIR ?= 
/home/koehler/s/br/buildroot/output/build/linux-$(BR2_LINUX_KERNEL_VERSION)


all: modules program

modules:
     $(MAKE) -C $(KERNELDIR) M=$$PWD modules

modules_install:
     $(MAKE) -C $(KERNELDIR) M=$$PWD modules_install

program: $(EXEC)
     $(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

clean:
     rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions 
modules.order Module.symvers dio *.tmp tally gpi_mon

----------------------------------------------------------------------------------------------------
I use buildroot actual git rep last pull:
koehler at koehler-laptop-ubuntu-final:~/s/br/buildroot$ git log
commit 94856075660dab56249fbe3452b34e489c2a79c5
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Mon Apr 27 00:10:53 2015 +0200

Linux Kernel 3.18.12



-- 
-------------------------------------------------

IBT Interfaces
inh. Nils K?hler
Im Taubhaus 19
63322 R?dermark

Tel. +49-6074-6964-160
Tel. +49-6074-6964-161
Email: nils.koehler at ibt-interfaces.de

Ust-IdNr:DE813155747
