From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Feb 2014 18:32:54 +0100
Subject: [Buildroot] In Buildroot, how to compile kernel modules
In-Reply-To: <530DA66C020000460004B1F9@gwia2.rz.hs-offenburg.de>
References: <530C6AB2020000460004B173@gwia2.rz.hs-offenburg.de>
 <20140225102301.GA6130@trismegisto.universo>
 <530C80B0020000460004B17F@gwia2.rz.hs-offenburg.de>
 <530CFFD2.4040606@mind.be>
 <530DA66C020000460004B1F9@gwia2.rz.hs-offenburg.de>
Message-ID: <530E2546.6000404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/14 08:31, Frank Ihle wrote:
> Right setting kernel dependencies makes sense, but I'm not so sure about
> the process: when I have the following makefile
> 
> obj-m += /<path-to-module>/measurement_gpio.o

 The obj-m should not contain a path.

> KDIR := /<BR-path>/output/build/linux-2.6.39/
> PWD := $(shell pwd)
> default:
>     $(MAKE) ARCH=arm
> CROSS_COMPILE=/<BR-path>/output/host/opt/ext-toolchain/bin/arm-none-linux-gnueabi-
> -C modules
> 
> where is then the generated .ko file and how can I make sure that in this
> build process the .ko file will be moved to a certain place ?

 The modules_install target of the kernel will do that:

define ON2_8170_MODULES_INSTALL_TARGET_CMDS
$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) \
        modules_install
endef


 If you want to support the same from your own makefile, you should add
something like:

make -C $(KDIR) M=`pwd` INSTALL_MOD_PATH=<...>/output/target \
	modules_install


 By the way, please don't top-post, and strip the irrelevant parts from
the quoted text.

 Regards,
 Arnout

> 
> Kind Regards
> 
> Frank
> 

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
