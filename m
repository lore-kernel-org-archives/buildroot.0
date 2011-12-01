From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Thu, 1 Dec 2011 16:05:17 -0600
Subject: [Buildroot] [PATCH 1/1] igh-ethercat: new package
In-Reply-To: <201112011436.25141.minimod@morethan.org>
References: <cover.1322691543.git.thomas.petazzoni@free-electrons.com>
 <8994d83580fbd41c89016f1cc35e10ecce46025b.1322691543.git.thomas.petazzoni@free-electrons.com>
 <001401ccb062$f6768db0$0400a8c0@dspcgrnzks9p98>
 <201112011436.25141.minimod@morethan.org>
Message-ID: <001b01ccb075$4feee420$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This is what his patch looked like:
> http://lists.busybox.net/pipermail/buildroot/2011-November/047920.html
> Note that there is an "eval" at the end of it.
> 
> Note that it isn't in git (yet) but when it gets there (no pun intended):
> http://git.buildroot.net/buildroot/
> You should be able to pull a plain text file from that web interface
> without e-mail mangling.

Ok, so far no build today has resulted in both EtherCAT application and
EtherCAT kernel module.  Actually, since I've started using the new patch,
no EtherCAT stuff gets built into the image.  Since I can't get the image to
even boot when I use 2011.11, I revert back to what I was using yesterday,
2011.05.  Can someone please step me through this.  I have to be pretty
close.  I feel I am providing the relevant details.  I just removed "IGH_"
from the names and use the local copy of ethercat (see .mk file).  Using the
local copy should be ok because it worked yesterday in that it would result
in either application or kernel module, just not both.  So the issue should
be with the following files.  I feel I am attaching good details.  Can
someone please comment so I can get this thing running?

1)  I applied the patch in 2011.11 just so that I could get the proper
Config.in and .mk files.  I got this message after applying the patch as
copied from the website mentioned above using Firefox on Linux:

user1 at dhcppc15:~/buildroot-2011.11> cat ethercat.patch | patch -p1
patching file package/Config.in
patching file package/igh-ethercat/Config.in
patching file package/igh-ethercat/igh-ethercat.mk
patch unexpectedly ends in middle of line
user1 at dhcppc15:~/buildroot-2011.11>


Is that ok?  It seemed to generate the files.

2) I already had package/Config.in with ethercat, but here is what it looks
like.  I am showing the lines surrounding the ethercat part - the whole
thing is much larger:

user1 at linux-0mmn:~/buildroot-2011.05> more package/Config.in
menu "Package Selection for the target"

source "package/busybox/Config.in"
source "package/customize/Config.in"
source "package/ethercat/Config.in"

# Audio and video applications

3) Here is ethercat's Config.in:

user1 at dhcppc15:~/buildroot-2011.05/package/ethercat> more Config.in
config BR2_PACKAGE_ETHERCAT
	bool "ethercat"
	depends on BR2_LINUX_KERNEL
	help
	  IgH EtherCAT Master for Linux.

	  http://www.etherlab.org/en/ethercat/index.php

if BR2_PACKAGE_ETHERCAT

config BR2_PACKAGE_ETHERCAT_8139TOO
	bool "8139too driver"

config BR2_PACKAGE_ETHERCAT_E100
	bool "e100 driver"

config BR2_PACKAGE_ETHERCAT_E1000
	bool "e1000 driver"

config BR2_PACKAGE_ETHERCAT_R8169
	bool "r8169 driver"

endif
user1 at dhcppc15:~/buildroot-2011.05/package/ethercat>


4) Here is ethercat's .mk file:

user1 at dhcppc15:~/buildroot-2011.05/package/ethercat> more ethercat.mk
#IGH_ETHERCAT_VERSION = stable-1.5
#IGH_ETHERCAT_SITE    =
http://etherlabmaster.hg.sourceforge.net/hgweb/etherlabmaster/etherlabmaster
/archive/
#IGH_ETHERCAT_SOURCE  = $(IGH_ETHERCAT_VERSION).tar.bz2

ETHERCAT_VERSION = 1.0
ETHERCAT_SOURCE = etherlabmaster-1.0.tar.bz2
ETHERCAT_SITE = http://127.0.0.1/home/user1/Desktop/EtherCAT4Atmel/

ETHERCAT_AUTORECONF = YES
ETHERCAT_DEPENDENCIES = linux
ETHERCAT_INSTALL_STAGING = YES

ETHERCAT_CONF_OPT = \
	--with-linux-dir=$(LINUX_DIR)

ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_ETHERCAT_E100),--enable-e100,--disable-e100)
ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_ETHERCAT_R8169),--enable-r8169,--disable-r8169)

define ETHERCAT_CREATE_CHANGELOG
	touch $(@D)/ChangeLog
endef

ETHERCAT_POST_PATCH_HOOKS += ETHERCAT_CREATE_CHANGELOG

define ETHERCAT_BUILD_MODULES
	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules
endef

ETHERCAT_POST_BUILD_HOOKS += ETHERCAT_BUILD_MODULES

define ETHERCAT_INSTALL_MODULES
	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules_install
endef

ETHERCAT_POST_INSTALL_TARGET_HOOKS += ETHERCAT_INSTALL_MODULES

$(eval $(call AUTOTARGETS))
user1 at dhcppc15:~/buildroot-2011.05/package/ethercat>
