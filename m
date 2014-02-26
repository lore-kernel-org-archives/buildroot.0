From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Wed, 26 Feb 2014 08:31:40 +0100
Subject: [Buildroot] In Buildroot, how to compile kernel modules
In-Reply-To: <530CFFD2.4040606@mind.be>
References: <530C6AB2020000460004B173@gwia2.rz.hs-offenburg.de>
 <20140225102301.GA6130@trismegisto.universo>
 <530C80B0020000460004B17F@gwia2.rz.hs-offenburg.de>
 <530CFFD2.4040606@mind.be>
Message-ID: <530DA66C020000460004B1F9@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Right setting kernel dependencies makes sense, but I'm not so sure about the process: when I have the following makefile

obj-m += /<path-to-module>/measurement_gpio.o
KDIR := /<BR-path>/output/build/linux-2.6.39/
PWD := $(shell pwd)
default:
    $(MAKE) ARCH=arm CROSS_COMPILE=/<BR-path>/output/host/opt/ext-toolchain/bin/arm-none-linux-gnueabi- -C modules

where is then the generated .ko file and how can I make sure that in this build process the .ko file will be moved to a certain place ?

Kind Regards

Frank


>>> Arnout Vandecappelle <arnout@mind.be> 25.02.14 21.42 Uhr >>>
On 25/02/14 11:38, Frank Ihle wrote:
> Hi and thanks for your response. Before i start hacking this, is it
> really that complicated ? For me it doesn't seem a big deal ?

 Actually, a much better example for simple modules is
package/on2-8170-modules/on2-8170-modules.mk

 You need to set VERSION and SITE like for all packages.

 You need to set DEPENDENCIES to LINUX (and also in the Config.in you
need to depend on BR2_LINUX_KERNEL).

 And you need the following build/install commands:

define ON2_8170_MODULES_BUILD_CMDS
        $(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D)
endef

define ON2_8170_MODULES_INSTALL_TARGET_CMDS
        $(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) \
        modules_install
endef



 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140226/b0a79691/attachment.html>
