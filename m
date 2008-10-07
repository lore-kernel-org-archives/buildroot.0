From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 7 Oct 2008 01:43:58 -0700
Subject: [Buildroot] [buildroot 0004844]: Bridge-utils broken under kernel
	2.4
Message-ID: <f2729087d4ac53ce6371df76e7677902@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4844 
====================================================================== 
Reported By:                Feynman
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4844
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-08-2008 11:05 PDT
Last Modified:              10-07-2008 01:43 PDT
====================================================================== 
Summary:                    Bridge-utils broken under kernel 2.4
Description: 
Snapshot buildroot-20080905

The bridge-utils package compiles but the brctl command fails.
The error message is:
# brctl addbr br0
add bridge failed: Invalid argument

I think this is a problem with the bridge-utils 1.4. The former version
1.06 works fine.

My configuration is: 386, kernel 2.4, busybox 1.11.x
The project is openMGB, a RDC based NAS with WAP.


====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 09-08-08 11:26  
---------------------------------------------------------------------- 
I don't have access to any system with a 2.4 kernel anymore - Does it work
if you change the version in bridge.mk back to v1.06? If so, please report
the problem with bridge-utils upstream. 

---------------------------------------------------------------------- 
 hmoffatt - 09-08-08 18:11  
---------------------------------------------------------------------- 
1.4 seems to use /sys/class/net which wouldn't exist on linux 2.4 

---------------------------------------------------------------------- 
 jacmet - 09-09-08 00:27  
---------------------------------------------------------------------- 
The README claims to only use sysfs stuff on 2.6 kernels, but I don't see
any fallback code. Probably the README is just stale - The bridge-utils
upsteam tarball seems pretty broken in general (no configure, configure.in
using wrong version, stale README, ..)

I don't have a problem with reverting to 1.06 if that fixes the bug
reporter's issue. 

---------------------------------------------------------------------- 
 hmoffatt - 09-09-08 06:15  
---------------------------------------------------------------------- 
Do we need to support 2.4? I don't think you can build it using buildroot?
I would've expected a project that is using current buildroot and current
busybox to also run a current kernel.. 

---------------------------------------------------------------------- 
 jacmet - 09-09-08 08:39  
---------------------------------------------------------------------- 
I don't personally have any interest in 2.4, but if we can keep it working
with small effort, then that's fine with me. 

---------------------------------------------------------------------- 
 Feynman - 09-09-08 08:47  
---------------------------------------------------------------------- 
Ok. I've changed the version in the brdige.mk file to 1.0.6 but the
autoreconf fails:
[...]
>>> bridge 1.0.6 Running autoreconf
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I
/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/share/aclocal
--force
autoreconf: configure.in: tracing
autoreconf: configure.in: not using Libtool
autoreconf: running:
/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/bin/autoconf
--include=/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/share/aclocal
--force
autoreconf: running:
/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/bin/autoheader
--include=/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/share/aclocal
--force
autoheader: warning: missing template: HAVE_LIBSYSFS
autoheader: Use AC_DEFINE([HAVE_LIBSYSFS], [], [Description])
autoreconf:
/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/bin/autoheader
failed with exit status: 1
make[1]: ***
[/home/welzel/naswork/openMGB/build/buildroot/build_i386/bridge-1.0.6/.stamp_autoconfigured]
Fehler 1
make[1]: Leaving directory `/home/welzel/naswork/openMGB/build/buildroot'
make: *** [toolchain] Fehler 2

It would be fine if buildroot supports kernel 2.4. It's right, you can't
built the kernel 2.4 with buildroot but we can build it seperately.

The project openMGB must use the kernel 2.4 because the WLAN driver for
the Ralink chipset (RT2560) is not working properly for the kernel 2.6.
Only the WLAN client is working. Not the access point driver (WLAN AP). So
we must use the "old" kernel 2.4.

I hope it is possible to support both version: the "old" 1.0.6 within the
kernel 2.4 and the "new" version 2.4 within the kernel 2.6.

Thanks in advance. 

---------------------------------------------------------------------- 
 jacmet - 09-09-08 08:49  
---------------------------------------------------------------------- 
Please set BRIDGE_AUTORECONF to NO and try again 

---------------------------------------------------------------------- 
 hmoffatt - 09-09-08 16:57  
---------------------------------------------------------------------- 
Recent busybox has brctl built in - maybe that will work on 2.4? Better
than reverting bridge-utils to an old version.

Although according to the changelog not a lot changed between 1.06 and 1.4
anyway (I'm not sure why the version number jumped so much) 

---------------------------------------------------------------------- 
 hmoffatt - 09-09-08 17:01  
---------------------------------------------------------------------- 
According to the comments in busybox's brctl it doesn't use sysfs so it
should work on 2.4

It only has the basic bridge control functionality though - no STP. I'm
not sure if you'd be using STP in a wifi environment anyway 

---------------------------------------------------------------------- 
 Feynman - 09-11-08 09:49  
---------------------------------------------------------------------- 
I've tried to use the build in brctl from busybox 1.12. See error message
below:


/usr/bin/make -j1
CC=/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
CROSS_COMPILE="/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-"
\
               
CROSS="/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-"
PREFIX="/home/welzel/naswork/openMGB/build/buildroot/project_build_i386/openMGB/root"
\
                ARCH=i386 \
                EXTRA_CFLAGS="-Os 
-I/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/usr/include
-I/home/welzel/naswork/openMGB/build/buildroot/build_i386/staging_dir/include
-mtune=i386 -march=i386 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" -C
/home/welzel/naswork/openMGB/build/buildroot/project_build_i386/openMGB/busybox-1.12.0
make[2]: Entering directory
`/home/welzel/naswork/openMGB/build/buildroot/project_build_i386/openMGB/busybox-1.12.0'
  CC      networking/brctl.o
networking/brctl.c: In function `brctl_main':
networking/brctl.c:186: error: `SIOCBRADDBR' undeclared (first use in this
function)
networking/brctl.c:186: error: (Each undeclared identifier is reported
only once
networking/brctl.c:186: error: for each function it appears in.)
networking/brctl.c:186: error: `SIOCBRDELBR' undeclared (first use in this
function)
networking/brctl.c:202: error: `SIOCBRADDIF' undeclared (first use in this
function)
networking/brctl.c:202: error: `SIOCBRDELIF' undeclared (first use in this
function)
make[3]: *** [networking/brctl.o] Fehler 1
make[2]: *** [networking] Fehler 2
make[2]: Leaving directory
`/home/welzel/naswork/openMGB/build/buildroot/project_build_i386/openMGB/busybox-1.12.0'
make[1]: ***
[/home/welzel/naswork/openMGB/build/buildroot/project_build_i386/openMGB/busybox-1.12.0/busybox]
Fehler 2
make[1]: Leaving directory `/home/welzel/naswork/openMGB/build/buildroot'
make: *** [toolchain] Fehler 2

Second try was to change the version to 1.0.6 and BRIDGE_AUTORECONF to NO.
This works very well.

If it is possible, please modify the config.in to decide which
bridge-utils or made the decision on the used kernel.

Thanks 

---------------------------------------------------------------------- 
 Feynman - 09-13-08 05:19  
---------------------------------------------------------------------- 
@jacmet

If possible add these two changes to the bridge-utils package:

bridge.mk:

#############################################################
#
# bridge-utils - User Space Program For Controlling Bridging
#
#############################################################
#
BR2_PACKAGE_BRIDGE_VERSION:=$(strip $(subst ",,
$(BR2_PACKAGE_BRIDGE_VERSION)))
BR2_PACKAGE_BRIDGE_AUTORECONF:=$(strip $(subst ",,
$(BR2_PACKAGE_BRIDGE_AUTORECONF)))

BRIDGE_VERSION:=$(BR2_PACKAGE_BRIDGE_VERSION)
BRIDGE_SOURCE:=bridge-utils-$(BRIDGE_VERSION).tar.gz
BRIDGE_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge/
BRIDGE_AUTORECONF:=$(BR2_PACKAGE_BRIDGE_AUTORECONF)
BRIDGE_INSTALL_STAGING:=NO
BRIDGE_INSTALL_TARGET:=YES
BRIDGE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
BRIDGE_CONF_OPT:=--with-linux-headers=$(LINUX_HEADERS_DIR) $(DISABLE_NLS)
BRIDGE_DEPENDENCIES:=uclibc

$(eval $(call AUTOTARGETS,package,bridge))

# bridge has no install-strip target
$(BRIDGE_HOOK_POST_INSTALL): $(BRIDGE_TARGET_INSTALL_TARGET)
	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/brctl
	touch $@

# bridge has no uninstall target
$(BUILD_DIR)/bridge-$(BRIDGE_VERSION)/.stamp_uninstalled:
	$(call MESSAGE,"Uninstalling")
	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
		include/libbridge.h man/man8/brctl.8 sbin/brctl)
	rm -f $(@D)/.stamp_target_installed


Config.in:

config BR2_PACKAGE_BRIDGE
	bool "bridge-utils"
	help
	  Manage ethernet bridging; a way to connect networks together to
	  form a larger network.

	  http://bridge.sourceforge.net/

choice
	prompt "bridge-utils version"
	default BR2_PACKAGE_BRIDGE_KERNEL26
	depends on BR2_PACKAGE_BRIDGE
	help
	  Selects the bridge-util version.
	  1.0.6 is required for kernel 2.4.

config BR2_PACKAGE_BRIDGE_KERNEL24
	bool "1.0.6"

config BR2_PACKAGE_BRIDGE_KERNEL26
	bool "1.4"
endchoice

config BR2_PACKAGE_BRIDGE_VERSION
	string
	default "1.4"		if BR2_PACKAGE_BRIDGE_KERNEL26
	default "1.0.6"	    if BR2_PACKAGE_BRIDGE_KERNEL24
	
config BR2_PACKAGE_BRIDGE_AUTORECONF
	string
	default "YES"		if BR2_PACKAGE_BRIDGE_KERNEL26
	default "NO"		if BR2_PACKAGE_BRIDGE_KERNEL24 

---------------------------------------------------------------------- 
 Feynman - 10-07-08 00:20  
---------------------------------------------------------------------- 
Hi,

this problem still remains. Can anyone fix this? Maybe with the above
bridge.mk and .Config files. Ohter solutions are also welcome.

Please help.

Regards,
     Christian 

---------------------------------------------------------------------- 
 hmoffatt - 10-07-08 01:43  
---------------------------------------------------------------------- 
Can you please send diffs rather than replacement files? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-08-08 11:05  Feynman        New Issue                                    
09-08-08 11:05  Feynman        Status                   new => assigned     
09-08-08 11:05  Feynman        Assigned To               => buildroot       
09-08-08 11:26  jacmet         Note Added: 0011194                          
09-08-08 18:11  hmoffatt       Note Added: 0011214                          
09-09-08 00:27  jacmet         Note Added: 0011224                          
09-09-08 06:15  hmoffatt       Note Added: 0011234                          
09-09-08 08:39  jacmet         Note Added: 0011244                          
09-09-08 08:47  Feynman        Note Added: 0011254                          
09-09-08 08:49  jacmet         Note Added: 0011264                          
09-09-08 16:57  hmoffatt       Note Added: 0011274                          
09-09-08 17:01  hmoffatt       Note Added: 0011284                          
09-11-08 09:49  Feynman        Note Added: 0011424                          
09-13-08 05:19  Feynman        Note Added: 0011464                          
10-07-08 00:20  Feynman        Note Added: 0012934                          
10-07-08 01:43  hmoffatt       Note Added: 0012974                          
======================================================================
