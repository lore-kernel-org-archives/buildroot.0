From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Nov 2013 15:29:23 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
 helloworld module be compiled and added to the tartget with a local
 external source
In-Reply-To: <3258CDB0922447C482F9DCD445EEFB36@NKDELL>
References: <528B20C1.9000606@mind.be>
 <3258CDB0922447C482F9DCD445EEFB36@NKDELL>
Message-ID: <20131119152923.1d5efac0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nils Koehler,

On Tue, 19 Nov 2013 15:01:30 +0100, Nils Koehler wrote:

> It is compiling and I can see that the compiled code is updated and present
> in the directory /buildroot-2013.08/Build/helloworld-1.0/ 

There is no such thing as a /Build/ directory in Buildroot. Maybe
you're talking about output/build/helloworld-1.0/, right?

Please be *precise* in the paths you give. Even a single character
difference... makes a complete difference.

> So far so fine, but it is missing in the /buildroot-2013.08/target/bin/
> directory. 

Are you talking about output/target/bin/ instead?

> What may be the problem right now?
> This is my actual .mk file: 
> 
> HELLOWORLD_VERSION = 1.0
> HELLOWORLD_SITE = /home/koehler/Desktop/Kernel/helloworld-1.0/
> HELLOWORLD_SITE_METHOD = local
> HELLOWORLD_LICENSE = GPLv3+
> HELLOWORLD_INSTALL_TARGET = YES

This last line is not needed, that's the default;

> 
> define HELLOWORLD_BUILD_CMDS
>     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> endef
> 
> define HELLOWORLD_INSTALL_TARGET_CMDS
>     $(INSTALL) -D -m 0755 $(@D)/helloworld $(TARGET_DIR)/bin
> endef

It should be:

	$(INSTALL) -D -m 0755 $(@D)/helloworld $(TARGET_DIR)/bin/helloworld

If it still doesn't work, please post the file named "build.log" after
executing:

make helloworld-rebuild 2>&1 | tee build.log

> define HELLOWORLD_PERMISSIONS
>     /bin/helloworld  f  4755  0  0  -  -  -  -  -
> endef

Unless your binary needs to be setuid root, this part is not needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
