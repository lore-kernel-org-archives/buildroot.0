From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Apr 2011 10:28:11 +0200
Subject: [Buildroot] [PATCH] [BUILDROOT] Update package socketcan and
	rename socketcan to socketcan_utils
In-Reply-To: <1303301727-893-1-git-send-email-kevin.joly@armadeus.com> (kevin
	joly's message of "Wed, 20 Apr 2011 14:15:27 +0200")
References: <1303301727-893-1-git-send-email-kevin.joly@armadeus.com>
Message-ID: <87tydsypno.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "kevin" == kevin joly <kevin.joly@armadeus.com> writes:

 kevin> From: Kevin JOLY <joly.kevin25@gmail.com>
 kevin> Signed-off-by: Kevin JOLY <joly.kevin25@gmail.com>
 kevin> ---
 kevin>  patches/buildroot/2010.11/042-socketcan.patch |   48 +++++++++++++++++++++++-
 kevin>  1 files changed, 46 insertions(+), 2 deletions(-)

 kevin> diff --git a/patches/buildroot/2010.11/042-socketcan.patch b/patches/buildroot/2010.11/042-socketcan.patch
 kevin> index 8c77741..7bb885c 100644
 kevin> --- a/patches/buildroot/2010.11/042-socketcan.patch
 kevin> +++ b/patches/buildroot/2010.11/042-socketcan.patch
 kevin> @@ -5,8 +5,8 @@ Signed-off-by: Kevin Joly <joly.kevin25@gmail.com>
 
 kevin>  Index: buildroot/package/Config.in
 kevin>  ===================================================================
 kevin> ---- buildroot.orig/package/Config.in	2011-04-20 13:56:09.454599001 +0200
 kevin> -+++ buildroot/package/Config.in	2011-04-20 13:57:38.958599001 +0200
 kevin> +--- buildroot.orig/package/Config.in	2011-04-20 14:11:30.206599000 +0200
 kevin> ++++ buildroot/package/Config.in	2011-04-20 14:12:11.566599000 +0200
 kevin>  @@ -428,6 +428,7 @@
 kevin>   source "package/samba/Config.in"
 kevin>   source "package/ser2net/Config.in"
 kevin> @@ -15,3 +15,47 @@ Index: buildroot/package/Config.in
 kevin>   source "package/spawn-fcgi/Config.in"
 kevin>   source "package/squid/Config.in"
 kevin>   source "package/tcpdump/Config.in"
 kevin> +Index: buildroot/package/socketcan_utils/Config.in
 kevin> +===================================================================
 kevin> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
 kevin> ++++ buildroot/package/socketcan_utils/Config.in	2011-04-20 09:45:25.000000000 +0200
 kevin> +@@ -0,0 +1,7 @@
 kevin> ++config BR2_PACKAGE_SOCKETCAN_UTILS
 kevin> ++	bool "socketcan_utils"
 kevin> ++	help
 kevin> ++	  The socketcan_utils package contains several tools for Linux to test
 kevin> ++	  a Controller Area Network.
 kevin> ++
 kevin> ++	  http://developer.berlios.de/projects/socketcan/

The svn directory is called can-utils, so I prefer to use that instead.

 kevin> +Index: buildroot/package/socketcan_utils/socketcan_utils.mk
 kevin> +===================================================================
 kevin> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
 kevin> ++++ buildroot/package/socketcan_utils/socketcan_utils.mk	2011-04-20 11:52:55.000000000 +0200
 kevin> +@@ -0,0 +1,27 @@
 kevin> ++#############################################################
 kevin> ++#
 kevin> ++# socketcan_utils
 kevin> ++#
 kevin> ++#############################################################
 kevin> ++SOCKETCAN_UTILS_VERSION = 1235
 kevin> ++SOCKETCAN_UTILS_SOURCE = socketcan-svn-rev$(SOCKETCAN_VERSION).tar.gz
 kevin> ++SOCKETCAN_UTILS_SITE = http://svn.berlios.de/svnroot/repos/socketcan/trunk/
 kevin> ++SOCKETCAN_UTILS_SITE_METHOD = svn
 kevin> ++TARGET_CFLAGS+= -I$(@D)/kernel/2.6/include \
 kevin> ++	    -DSO_RXQ_OVFL=40 \
 kevin> ++	    -DPF_CAN=29 \
 kevin> ++	    -DAF_CAN=PF_CAN
 kevin> ++

You're changing TARGET_CFLAGS globally here, and can-utils' configure
already checks for PF_CAN / AF_CAN and defines those if not provided by
C library.

 kevin> ++define SOCKETCAN_UTILS_BUILD_CMDS
 kevin> ++	$(MAKE) -C $(@D)/can-utils CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
 kevin> ++endef
 kevin> ++
 kevin> ++define SOCKETCAN_UTILS_INSTALL_TARGET_CMDS
 kevin> ++	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D)/can-utils install PREFIX="/usr"
 kevin> ++endef
 kevin> ++
 kevin> ++define SOCKETCAN_UTILS_CLEAN_CMDS
 kevin> ++	$(MAKE) -C $(@D)/can-utils clean
 kevin> ++endef

 kevin> ++
 kevin> ++$(eval $(call GENTARGETS,package,socketcan_utils))

can-utils uses autotools, so it makes more sense to use AUTOTARGETS
here.

I've made a can-utils package a few months ago as well, but kept back
from committing it as can-utils was supposed to get a release shortly - 
but that hasn't happened, so I'll commit it now.

Thanks for your contribution.

-- 
Bye, Peter Korsgaard
