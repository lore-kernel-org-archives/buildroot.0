From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 9 Sep 2008 08:47:28 -0700
Subject: [Buildroot] [buildroot 0004844]: Bridge-utils broken under kernel
	2.4
Message-ID: <5308f6f852df9ea4fc477443a1615ec3@bugs.uclibc.org>
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
Last Modified:              09-09-2008 08:47 PDT
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
======================================================================
