From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 09:26:41 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
 helloworld module be compiled and added to the tartget with a local
 external source
In-Reply-To: <E5B506F1A019418BB170B8E07A87655B@NKDELL>
References: <E5B506F1A019418BB170B8E07A87655B@NKDELL>
Message-ID: <528B20C1.9000606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/13 17:00, Nils Koehler wrote:
> Hi,
>
> I have goggled a lot the last three days to find out how to implement a
> own program and device driver, which is compiled and added to the target
> due buildroot make command, but I did not had success to solve it.
>
> Actually my problems is that:
>
> HELLOWORLD_SOURCE_DIR = /home/koehler/Desktop/Kernel/ldt/

  Where did you get this variable from? We don't use SOURCE_DIR.

>
> seems not to be computed.
>
> In helloworld.c I have added a typo to force an error message if
> buildroot try to compile helloworld.c but until now I did not see it

  Buildroot doesn't check if you change anything in the source code. You 
have to explicitly force a rebuild with

make helloworld-rebuild all


>
> I found hints at:
>
> http://buildroot.uclibc.org/downloads/manual/manual.html#customize-store-package-config

  Hm, that section doesn't say anything about adding packages to 
buildroot. You should refer to 
http://buildroot.net/downloads/manual/manual.html#_the_literal_mk_literal_file

>
> And openWRT:
>
> http://www.ccs.neu.edu/home/noubir/Courses/CS6710/S12/material/OpenWrt_Dev_Tutorial.pdf

  OpenWRT is a different project, that forked from buildroot many years 
ago. There are a few similarities, but the OpenWRT documentation is 
useless for buildroot questions and vice versa.

>
> but the used Keywords are very different and no of the approaches helped
> me right now.
>
> So I think I need some help from outside...
>
> The outgoing situation is I have a helloworld.c program and a Hello world
> module.
>
> Located in /home/koehler/ldt/

  Err, you refer to /home/koehler/Desktop/Kernel/ldt/ in your 
helloworld.mk file...

>
> I can compile them from outside buildroot for Kernel 3.10.17
>
> To be able to make it cinfigurable I have added in
> /buildroot-2013.08/package/Config.in     :
>
> menu "Hardware handling"
>
> menu "Misc devices firmwares"
>
> source "package/helloworld/Config.in"
>
> endmenu
>
> And in /buildroot-2013.08/package/helloworld/Config.in     :
>
> config BR2_PACKAGE_HELLOWORLD
>
> bool "helloworld"
>
> help
>
>      This is a comment that explains what libfoo is.

  This looks good.


>
> This is the in /buildroot-2013.08/package/helloworld/heloworld.mk
>
> Based on the example of builroot manual:
>
> ################################################################################
>
> #
>
> # helloworld
>
> #
>
> ################################################################################
>
> HELLOWORLD_VERSION = 1.0
>
> HELLOWORLD_SOURCE_DIR = /home/koehler/Desktop/Kernel/ldt/
>
> #HELLOWORLD_SITE = http://www.foosoftware.org/download

  This should be

HELLOWORLD_SITE = /home/koehler/Desktop/Kernel/ldt/
HELLOWORLD_SITE_METHOD = local


  Regards,
  Arnout

>
> HELLOWORLD_LICENSE = GPLv3+
>
> HELLOWORLD_LICENSE_FILES = COPYING
>
> HELLOWORLD_INSTALL_STAGING = YES
>
> #HELLOWORLD_CONFIG_SCRIPTS = helloworld-config
>
> #HELLOWORLD_DEPENDENCIES = host-libaaa libbbb
>
> define HELLOWORLD_BUILD_CMDS
>
>      $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>
> endef
>
> define HELLOWORLD_INSTALL_STAGING_CMDS
>
> # $(INSTALL) -D -m 0755 $(@D)/helloworld.a
> $(STAGING_DIR)/usr/lib/helloworld.a
>
> # $(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
>
> # $(INSTALL) -D -m 0755 $(@D)/helloworld.so* $(STAGING_DIR)/usr/lib
>
> endef
>
> define HELLOWORLD_INSTALL_TARGET_CMDS
>
> # $(INSTALL) -D -m 0755 $(@D)/helloworld.so* $(TARGET_DIR)/usr/lib
>
> # $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
>
> endef
>
> define HELLOWORLD_DEVICES
>
> #    /dev/foo c  666  0  0  42  0  -  -  -
>
> endef
>
> define HELLOWORLD_PERMISSIONS
>
> #    /bin/foo f  4755  0  0  -  -  -  -  -
>
> endef
>
> define HELLOWORLD_USERS
>
> #    foo -1 helloworld -1 * - - - LibFoo daemon
>
> endef
>
> $(eval $(generic-package))
>
> Regards
>
> Nils
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
