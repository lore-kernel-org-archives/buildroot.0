From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 1 Nov 2012 20:10:26 +0100
Subject: [Buildroot] [PATCH 1/1] Create a symbolic link to the target
	kernel directory. example
In-Reply-To: <20121101101912.310579d7@skate>
References: <1351729065-31324-1-git-send-email-sagaert.johan@skynet.be><5091CB65.8070409@mind.be><75B2C156488F433AB22D082571AE6D4E@JohanW7>
 <20121101101912.310579d7@skate>
Message-ID: <D4127A04D6B846E881F6B42F61985647@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

An example makefile explains it all :

With my patch I can write a makefile for my kernel modules like this:

MODULENAME := digitalio

obj-m += $(MODULENAME).o

KERNELDIR=/home/buildroot12git/targetkernel

all:$(MODULENAME).ko

$(MODULENAME).ko:$(MODULENAME).c
	make -C $(KERNELDIR) SUBDIRS=$(PWD) modules CC=arm-linux-gcc LD=arm-linux-ld ARCH=arm

.PHONY clean:
	make -C $(KERNELDIR) M=$(PWD) clean




Without the symbolic link I had to use this makefile, and change it everytime I used another kernel version.

MODULENAME := digitalio

obj-m += $(MODULENAME).o

KERNELDIR=/home/buildroot12git/output/build/linux-76e10d158efb6d4516018846f60c2ab5501900bc

all:$(MODULENAME).ko

$(MODULENAME).ko:$(MODULENAME).c
	make -C $(KERNELDIR) SUBDIRS=$(PWD) modules CC=arm-linux-gcc LD=arm-linux-ld ARCH=arm

.PHONY clean:
	make -C $(KERNELDIR) M=$(PWD) clean 


As I onderstood from Arnout, I could build the module from within buildroot (making use of the buildroot vars) but this not an
option while still developing a module. Every buildroot make would also force a regeneration of the rootfs tar, and this takes a
serious ammount of time with a large rootfs.
So I develop it outside the build system and use the symlink to the kernel I have selected.

Regards, Johan

-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: donderdag 1 november 2012 10:19
Aan: Sagaert Johan
CC: 'Arnout Vandecappelle'; buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] Create a symbolic link to the target kernel directory.


On Thu, 1 Nov 2012 02:14:35 +0100, Sagaert Johan wrote:

> I always build modules outside of the buildroot system.
> Is there another (fast ) way ? I don't like to wait 20 seconds for 
> buildroot tarring the rootfs.

I don't see the relation between waiting 20 seconds for Buildroot to tar the rootfs and the patch you're posting. Care to explain?

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
