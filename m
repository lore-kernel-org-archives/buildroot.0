From: Nils Koehler <nils.koehler@ibt-interfaces.de>
Date: Tue, 19 Nov 2013 15:01:30 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
	helloworld module be compiled and added to the tartget with a
	local external source
In-Reply-To: <528B20C1.9000606@mind.be>
Message-ID: <3258CDB0922447C482F9DCD445EEFB36@NKDELL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > Hi,
> >
> > I have goggled a lot the last three days to find out how to implement a
> > own program and device driver, which is compiled and added to the target
> > due buildroot make command, but I did not had success to solve it.
> >
> > Actually my problems is that:
> >
> > HELLOWORLD_SOURCE_DIR = /home/koehler/Desktop/Kernel/ldt/
> 
>   Where did you get this variable from? We don't use SOURCE_DIR.

mhh... I think, I mixed up some things, I have no idea where I did found it.
I have changed now to the right keywords thank you...

But after...
make helloworld-rebuild all

It is compiling and I can see that the compiled code is updated and present
in the directory /buildroot-2013.08/Build/helloworld-1.0/ 
So far so fine, but it is missing in the /buildroot-2013.08/target/bin/
directory. 

What may be the problem right now?
This is my actual .mk file: 

HELLOWORLD_VERSION = 1.0
HELLOWORLD_SITE = /home/koehler/Desktop/Kernel/helloworld-1.0/
HELLOWORLD_SITE_METHOD = local
HELLOWORLD_LICENSE = GPLv3+
HELLOWORLD_INSTALL_TARGET = YES

define HELLOWORLD_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define HELLOWORLD_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/helloworld $(TARGET_DIR)/bin
endef

define HELLOWORLD_DEVICES
    /dev/ldt  c  666  0  0  42  0  -  -  -
endef

define HELLOWORLD_PERMISSIONS
    /bin/helloworld  f  4755  0  0  -  -  -  -  -
endef


#$(eval $(generic-package))
