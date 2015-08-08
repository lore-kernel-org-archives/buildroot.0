From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:38 -0000
Subject: [Buildroot] [git commit branch/next] audit: Update patch from
	upstream feedback
Message-ID: <20150808105635.B603D7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df7c6adb5e93397d3e825bf1033ddc9584663cff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

After working with the audit maintainers to get patches accepted, the
following one had to be reworked to meet their standards. This patch
will be included in the next version of audit.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/0001-Enable-cross-compiling.patch |  657 ++++++++++-------------
 1 files changed, 285 insertions(+), 372 deletions(-)

diff --git a/package/audit/0001-Enable-cross-compiling.patch b/package/audit/0001-Enable-cross-compiling.patch
index 476c71a..0dbaddb 100644
--- a/package/audit/0001-Enable-cross-compiling.patch
+++ b/package/audit/0001-Enable-cross-compiling.patch
@@ -1,4 +1,4 @@
-From edb90714a7f4fd9cf45b06e98b2a44115bf4952e Mon Sep 17 00:00:00 2001
+From 6a9a6ee6dcffec6288bcccba92166ef6bec5efc7 Mon Sep 17 00:00:00 2001
 From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Date: Thu, 26 Mar 2015 12:26:36 -0500
 Subject: [PATCH] Enable cross compiling
@@ -10,9 +10,9 @@ current Makfile structure tries to build these executables for the
 target instead of the host where they cannot be executed. This patch
 reworks the Makefile structure to build for the correct platform.
 
-This patch is a rework of a patch posted to the audit mailing list at
-the link below.
-https://www.redhat.com/archives/linux-audit/2012-November/msg00000.html
+This is revision 2 of this patch and is a complete rework of the
+original patch. I have tested that it builds on an x86_64 ubuntu
+platform and tested it running on an ARM cross compile platform.
 
 The ax_prog_cc_for_build.m4 file was obtained from GNU at the link
 below.
@@ -20,409 +20,354 @@ http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
 
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 ---
- auparse/Makefile.am        | 276 ++++++++++++++++++++++++++++++---------------
+ auparse/Makefile.am        | 185 ++++++++++++++++++++++++++++++++++++---------
  configure.ac               |   1 +
- lib/Makefile.am            | 133 ++++++++++++++--------
- m4/ax_prog_cc_for_build.m4 | 125 ++++++++++++++++++++
- 4 files changed, 397 insertions(+), 138 deletions(-)
+ lib/Makefile.am            |  85 ++++++++++++++++-----
+ m4/ax_prog_cc_for_build.m4 | 125 ++++++++++++++++++++++++++++++
+ 4 files changed, 342 insertions(+), 54 deletions(-)
  create mode 100644 m4/ax_prog_cc_for_build.m4
 
 diff --git a/auparse/Makefile.am b/auparse/Makefile.am
-index 89b2d21..0fe40e0 100644
+index 89b2d21..f9709de 100644
 --- a/auparse/Makefile.am
 +++ b/auparse/Makefile.am
-@@ -57,208 +57,304 @@ BUILT_SOURCES = accesstabs.h captabs.h clocktabs.h clone-flagtabs.h \
- 	seektabs.h shm_modetabs.h signaltabs.h sockoptnametabs.h \
- 	socktabs.h sockleveltabs.h socktypetabs.h \
- 	tcpoptnametabs.h typetabs.h umounttabs.h
--noinst_PROGRAMS = gen_accesstabs_h gen_captabs_h gen_clock_h \
--	gen_clone-flagtabs_h \
--	gen_epoll_ctls_h gen_famtabs_h \
--	gen_fcntl-cmdtabs_h gen_flagtabs_h gen_ioctlreqtabs_h \
--	gen_icmptypetabs_h gen_ipctabs_h gen_ipccmdtabs_h\
--	gen_ipoptnametabs_h gen_ip6optnametabs_h gen_nfprototabs_h \
--	gen_mmaptabs_h gen_mounttabs_h \
--	gen_open-flagtabs_h gen_persontabs_h \
--	gen_prctl_opttabs_h gen_pktoptnametabs_h gen_prottabs_h \
--	gen_recvtabs_h gen_rlimit_h gen_ptracetabs_h \
--	gen_schedtabs_h gen_seccomptabs_h \
--	gen_seektabs_h gen_shm_modetabs_h gen_signals_h \
--	gen_sockoptnametabs_h gen_socktabs_h gen_sockleveltabs_h \
--	gen_socktypetabs_h gen_tcpoptnametabs_h gen_typetabs_h \
--	gen_umounttabs_h
--
--gen_accesstabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h accesstab.h
+@@ -74,191 +74,302 @@ noinst_PROGRAMS = gen_accesstabs_h gen_captabs_h gen_clock_h \
+ 	gen_umounttabs_h
+ 
+ gen_accesstabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h accesstab.h
 -gen_accesstabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="accesstab.h"'
-+
-+gen_accesstabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h accesstab.h
-+gen_accesstabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="accesstab.h"'
-+gen_accesstabs_h: $(gen_accesstabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_accesstabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_accesstabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="accesstab.h"'
++$(gen_accesstabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_accesstabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_accesstabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  accesstabs.h: gen_accesstabs_h Makefile
  	./gen_accesstabs_h --i2s-transtab access > $@
  
--gen_captabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h captab.h
+ gen_captabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h captab.h
 -gen_captabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="captab.h"'
-+gen_captabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h captab.h
-+gen_captabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="captab.h"'
-+gen_captabs_h: $(gen_captabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_captabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_captabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="captab.h"'
++$(gen_captabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_captabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_captabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  captabs.h: gen_captabs_h Makefile
  	./gen_captabs_h --i2s cap > $@
  
--gen_clock_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h clocktab.h
+ gen_clock_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h clocktab.h
 -gen_clock_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="clocktab.h"'
-+gen_clock_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h clocktab.h
-+gen_clock_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="clocktab.h"'
-+gen_clock_h: $(gen_clock_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_clock_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_clock_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="clocktab.h"'
++$(gen_clock_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_clock_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_clock_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  clocktabs.h: gen_clock_h Makefile
  	./gen_clock_h --i2s clock > $@
  
--gen_clone_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
-+gen_clone_flagtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+ gen_clone_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
  	clone-flagtab.h
 -gen_clone_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="clone-flagtab.h"'
-+gen_clone_flagtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="clone-flagtab.h"'
-+gen_clone-flagtabs_h: $(gen_clone_flagtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_clone_flagtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_clone_flagtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="clone-flagtab.h"'
++$(gen_clone_flagtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_clone_flagtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_clone-flagtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  clone-flagtabs.h: gen_clone-flagtabs_h Makefile
  	./gen_clone-flagtabs_h --i2s-transtab clone_flag > $@
  
--gen_epoll_ctls_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h epoll_ctl.h
+ gen_epoll_ctls_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h epoll_ctl.h
 -gen_epoll_ctls_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="epoll_ctl.h"'
-+gen_epoll_ctls_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h epoll_ctl.h
-+gen_epoll_ctls_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="epoll_ctl.h"'
-+gen_epoll_ctls_h: $(gen_epoll_ctls_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_epoll_ctls_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_epoll_ctls_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="epoll_ctl.h"'
++$(gen_epoll_ctls_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_epoll_ctls_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_epoll_ctls_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  epoll_ctls.h: gen_epoll_ctls_h Makefile
  	./gen_epoll_ctls_h --i2s epoll_ctl > $@
  
--gen_famtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h famtab.h
+ gen_famtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h famtab.h
 -gen_famtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="famtab.h"'
-+gen_famtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h famtab.h
-+gen_famtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="famtab.h"'
-+gen_famtabs_h: $(gen_famtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_famtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_famtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="famtab.h"'
++$(gen_famtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_famtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_famtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  famtabs.h: gen_famtabs_h Makefile
  	./gen_famtabs_h --i2s fam > $@
  
--gen_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h flagtab.h
-+gen_flagtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h flagtab.h
+ gen_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h flagtab.h
  # ../auparse/ is used to avoid using ../lib/flagtab.h
 -gen_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="../auparse/flagtab.h"'
-+gen_flagtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="../auparse/flagtab.h"'
-+gen_flagtabs_h: $(gen_flagtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_flagtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_flagtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="../auparse/flagtab.h"'
++$(gen_flagtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_flagtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_flagtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  flagtabs.h: gen_flagtabs_h Makefile
  	./gen_flagtabs_h --i2s-transtab flag > $@
  
--gen_fcntl_cmdtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
-+gen_fcntl_cmdtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+ gen_fcntl_cmdtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
  	fcntl-cmdtab.h
 -gen_fcntl_cmdtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="fcntl-cmdtab.h"'
-+gen_fcntl_cmdtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="fcntl-cmdtab.h"'
-+gen_fcntl-cmdtabs_h: $(gen_fcntl_cmdtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_fcntl_cmdtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_fcntl_cmdtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="fcntl-cmdtab.h"'
++$(gen_fcntl_cmdtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_fcntl_cmdtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_fcntl-cmdtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  fcntl-cmdtabs.h: gen_fcntl-cmdtabs_h Makefile
  	./gen_fcntl-cmdtabs_h --i2s fcntl > $@
  
--gen_icmptypetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h icmptypetab.h
+ gen_icmptypetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h icmptypetab.h
 -gen_icmptypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="icmptypetab.h"'
-+gen_icmptypetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h icmptypetab.h
-+gen_icmptypetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="icmptypetab.h"'
-+gen_icmptypetabs_h: $(gen_icmptypetabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_icmptypetabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_icmptypetabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="icmptypetab.h"'
++$(gen_icmptypetabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_icmptypetabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_icmptypetabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  icmptypetabs.h: gen_icmptypetabs_h Makefile
  	./gen_icmptypetabs_h --i2s icmptype > $@
  
--gen_ioctlreqtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ioctlreqtab.h
+ gen_ioctlreqtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ioctlreqtab.h
 -gen_ioctlreqtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ioctlreqtab.h"'
-+gen_ioctlreqtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ioctlreqtab.h
-+gen_ioctlreqtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ioctlreqtab.h"'
-+gen_ioctlreqtabs_h: $(gen_ioctlreqtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ioctlreqtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_ioctlreqtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ioctlreqtab.h"'
++$(gen_ioctlreqtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ioctlreqtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ioctlreqtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ioctlreqtabs.h: gen_ioctlreqtabs_h Makefile
  	./gen_ioctlreqtabs_h --i2s ioctlreq > $@
  
--gen_ipctabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipctab.h
+ gen_ipctabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipctab.h
 -gen_ipctabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipctab.h"'
-+gen_ipctabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipctab.h
-+gen_ipctabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipctab.h"'
-+gen_ipctabs_h: $(gen_ipctabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ipctabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_ipctabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipctab.h"'
++$(gen_ipctabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ipctabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ipctabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ipctabs.h: gen_ipctabs_h Makefile
  	./gen_ipctabs_h --i2s ipc > $@
  
--gen_ipccmdtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipccmdtab.h
+ gen_ipccmdtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipccmdtab.h
 -gen_ipccmdtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipccmdtab.h"'
-+gen_ipccmdtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipccmdtab.h
-+gen_ipccmdtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipccmdtab.h"'
-+gen_ipccmdtabs_h: $(gen_ipccmdtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ipccmdtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_ipccmdtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipccmdtab.h"'
++$(gen_ipccmdtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ipccmdtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ipccmdtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ipccmdtabs.h: gen_ipccmdtabs_h Makefile
  	./gen_ipccmdtabs_h --i2s-transtab ipccmd > $@
  
--gen_ipoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipoptnametab.h
+ gen_ipoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipoptnametab.h
 -gen_ipoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipoptnametab.h"'
-+gen_ipoptnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipoptnametab.h
-+gen_ipoptnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipoptnametab.h"'
-+gen_ipoptnametabs_h: $(gen_ipoptnametabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ipoptnametabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_ipoptnametabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipoptnametab.h"'
++$(gen_ipoptnametabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ipoptnametabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ipoptnametabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ipoptnametabs.h: gen_ipoptnametabs_h Makefile
  	./gen_ipoptnametabs_h --i2s ipoptname > $@
  
--gen_ip6optnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ip6optnametab.h
+ gen_ip6optnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ip6optnametab.h
 -gen_ip6optnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ip6optnametab.h"'
-+gen_ip6optnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ip6optnametab.h
-+gen_ip6optnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ip6optnametab.h"'
-+gen_ip6optnametabs_h: $(gen_ip6optnametabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ip6optnametabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_ip6optnametabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ip6optnametab.h"'
++$(gen_ip6optnametabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ip6optnametabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ip6optnametabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ip6optnametabs.h: gen_ip6optnametabs_h Makefile
  	./gen_ip6optnametabs_h --i2s ip6optname > $@
  
--gen_mmaptabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mmaptab.h
+ gen_mmaptabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mmaptab.h
 -gen_mmaptabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="mmaptab.h"'
-+gen_mmaptabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mmaptab.h
-+gen_mmaptabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="mmaptab.h"'
-+gen_mmaptabs_h: $(gen_mmaptabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_mmaptabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_mmaptabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="mmaptab.h"'
++$(gen_mmaptabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_mmaptabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_mmaptabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  mmaptabs.h: gen_mmaptabs_h Makefile
  	./gen_mmaptabs_h --i2s-transtab mmap > $@
  
--gen_mounttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mounttab.h
+ gen_mounttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mounttab.h
 -gen_mounttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="mounttab.h"'
-+gen_mounttabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mounttab.h
-+gen_mounttabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="mounttab.h"'
-+gen_mounttabs_h: $(gen_mounttabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_mounttabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_mounttabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="mounttab.h"'
++$(gen_mounttabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_mounttabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_mounttabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  mounttabs.h: gen_mounttabs_h Makefile
  	./gen_mounttabs_h --i2s-transtab mount > $@
  
--gen_nfprototabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h nfprototab.h
+ gen_nfprototabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h nfprototab.h
 -gen_nfprototabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="nfprototab.h"'
-+gen_nfprototabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h nfprototab.h
-+gen_nfprototabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="nfprototab.h"'
-+gen_nfprototabs_h: $(gen_nfprototabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_nfprototabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_nfprototabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="nfprototab.h"'
++$(gen_nfprototabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_nfprototabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_nfprototabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  nfprototabs.h: gen_nfprototabs_h Makefile
  	./gen_nfprototabs_h --i2s nfproto > $@
  
--gen_open_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
-+gen_open_flagtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+ gen_open_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
  	open-flagtab.h
 -gen_open_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="open-flagtab.h"'
-+gen_open_flagtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="open-flagtab.h"'
-+gen_open-flagtabs_h: $(gen_open_flagtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_open_flagtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_open_flagtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="open-flagtab.h"'
++$(gen_open_flagtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_open_flagtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_open-flagtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  open-flagtabs.h: gen_open-flagtabs_h Makefile
  	./gen_open-flagtabs_h --i2s-transtab open_flag > $@
  
--gen_persontabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h persontab.h
+ gen_persontabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h persontab.h
 -gen_persontabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="persontab.h"'
-+gen_persontabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h persontab.h
-+gen_persontabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="persontab.h"'
-+gen_persontabs_h: $(gen_persontabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_persontabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_persontabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="persontab.h"'
++$(gen_persontabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_persontabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_persontabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  persontabs.h: gen_persontabs_h Makefile
  	./gen_persontabs_h --i2s person > $@
  
--gen_ptracetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ptracetab.h
+ gen_ptracetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ptracetab.h
 -gen_ptracetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ptracetab.h"'
-+gen_ptracetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ptracetab.h
-+gen_ptracetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ptracetab.h"'
-+gen_ptracetabs_h: $(gen_ptracetabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ptracetabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_ptracetabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ptracetab.h"'
++$(gen_ptracetabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ptracetabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ptracetabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ptracetabs.h: gen_ptracetabs_h Makefile
  	./gen_ptracetabs_h --i2s ptrace > $@
  
--gen_prctl_opttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prctl-opt-tab.h
+ gen_prctl_opttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prctl-opt-tab.h
 -gen_prctl_opttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="prctl-opt-tab.h"'
-+gen_prctl_opttabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prctl-opt-tab.h
-+gen_prctl_opttabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="prctl-opt-tab.h"'
-+gen_prctl_opttabs_h: $(gen_prctl_opttabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_prctl_opttabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_prctl_opttabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="prctl-opt-tab.h"'
++$(gen_prctl_opttabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_prctl_opttabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_prctl_opttabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  prctl_opttabs.h: gen_prctl_opttabs_h Makefile
  	./gen_prctl_opttabs_h --i2s prctl_opt > $@
  
--gen_pktoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h pktoptnametab.h
+ gen_pktoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h pktoptnametab.h
 -gen_pktoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="pktoptnametab.h"'
-+gen_pktoptnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h pktoptnametab.h
-+gen_pktoptnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="pktoptnametab.h"'
-+gen_pktoptnametabs_h: $(gen_pktoptnametabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_pktoptnametabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_pktoptnametabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="pktoptnametab.h"'
++$(gen_pktoptnametabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_pktoptnametabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_pktoptnametabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  pktoptnametabs.h: gen_pktoptnametabs_h Makefile
  	./gen_pktoptnametabs_h --i2s pktoptname > $@
  
--gen_prottabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prottab.h
+ gen_prottabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prottab.h
 -gen_prottabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="prottab.h"'
-+gen_prottabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prottab.h
-+gen_prottabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="prottab.h"'
-+gen_prottabs_h: $(gen_prottabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_prottabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_prottabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="prottab.h"'
++$(gen_prottabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_prottabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_prottabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  prottabs.h: gen_prottabs_h Makefile
  	./gen_prottabs_h --i2s-transtab prot > $@
  
--gen_recvtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h recvtab.h
+ gen_recvtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h recvtab.h
 -gen_recvtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="recvtab.h"'
-+gen_recvtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h recvtab.h
-+gen_recvtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="recvtab.h"'
-+gen_recvtabs_h: $(gen_recvtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_recvtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_recvtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="recvtab.h"'
++$(gen_recvtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_recvtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_recvtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  recvtabs.h: gen_recvtabs_h Makefile
  	./gen_recvtabs_h --i2s-transtab recv > $@
  
--gen_rlimit_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h rlimittab.h
+ gen_rlimit_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h rlimittab.h
 -gen_rlimit_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="rlimittab.h"'
-+gen_rlimit_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h rlimittab.h
-+gen_rlimit_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="rlimittab.h"'
-+gen_rlimit_h: $(gen_rlimit_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_rlimit_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_rlimit_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="rlimittab.h"'
++$(gen_rlimit_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_rlimit_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_rlimit_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  rlimittabs.h: gen_rlimit_h Makefile
  	./gen_rlimit_h --i2s rlimit > $@
  
--gen_schedtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h schedtab.h
+ gen_schedtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h schedtab.h
 -gen_schedtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="schedtab.h"'
-+gen_schedtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h schedtab.h
-+gen_schedtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="schedtab.h"'
-+gen_schedtabs_h: $(gen_schedtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_schedtabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_schedtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="schedtab.h"'
++$(gen_schedtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_schedtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_schedtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  schedtabs.h: gen_schedtabs_h Makefile
  	./gen_schedtabs_h --i2s sched > $@
  
--gen_seccomptabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seccomptab.h
+ gen_seccomptabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seccomptab.h
 -gen_seccomptabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="seccomptab.h"'
-+gen_seccomptabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seccomptab.h
-+gen_seccomptabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="seccomptab.h"'
-+gen_seccomptabs_h: $(gen_seccomptabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_seccomptabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_seccomptabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="seccomptab.h"'
++$(gen_seccomptabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_seccomptabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_seccomptabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  seccomptabs.h: gen_seccomptabs_h Makefile
  	./gen_seccomptabs_h --i2s seccomp > $@
  
--gen_seektabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seektab.h
+ gen_seektabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seektab.h
 -gen_seektabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="seektab.h"'
-+gen_seektabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seektab.h
-+gen_seektabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="seektab.h"'
-+gen_seektabs_h: $(gen_seektabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_seektabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_seektabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="seektab.h"'
++$(gen_seektabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_seektabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_seektabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  seektabs.h: gen_seektabs_h Makefile
  	./gen_seektabs_h --i2s seek > $@
  
--gen_shm_modetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h shm_modetab.h
+ gen_shm_modetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h shm_modetab.h
 -gen_shm_modetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="shm_modetab.h"'
-+gen_shm_modetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h shm_modetab.h
-+gen_shm_modetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="shm_modetab.h"'
-+gen_shm_modetabs_h: $(gen_shm_modetabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_shm_modetabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_shm_modetabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="shm_modetab.h"'
++$(gen_shm_modetabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_shm_modetabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_shm_modetabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  shm_modetabs.h: gen_shm_modetabs_h Makefile
  	./gen_shm_modetabs_h --i2s-transtab shm_mode > $@
  
--gen_signals_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h signaltab.h
+ gen_signals_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h signaltab.h
 -gen_signals_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="signaltab.h"'
-+gen_signals_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h signaltab.h
-+gen_signals_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="signaltab.h"'
-+gen_signals_h: $(gen_signals_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_signals_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_signals_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="signaltab.h"'
++$(gen_signals_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_signals_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_signals_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  signaltabs.h: gen_signals_h Makefile
  	./gen_signals_h --i2s signal > $@
  
--gen_sockleveltabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockleveltab.h
+ gen_sockleveltabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockleveltab.h
 -gen_sockleveltabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="sockleveltab.h"'
-+gen_sockleveltabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockleveltab.h
-+gen_sockleveltabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="sockleveltab.h"'
-+gen_sockleveltabs_h: $(gen_sockleveltabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_sockleveltabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_sockleveltabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="sockleveltab.h"'
++$(gen_sockleveltabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_sockleveltabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_sockleveltabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  sockleveltabs.h: gen_sockleveltabs_h Makefile
  	./gen_sockleveltabs_h --i2s socklevel > $@
  
--gen_sockoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockoptnametab.h
+ gen_sockoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockoptnametab.h
 -gen_sockoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="sockoptnametab.h"'
-+gen_sockoptnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockoptnametab.h
-+gen_sockoptnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="sockoptnametab.h"'
-+gen_sockoptnametabs_h: $(gen_sockoptnametabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_sockoptnametabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_sockoptnametabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="sockoptnametab.h"'
++$(gen_sockoptnametabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_sockoptnametabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_sockoptnametabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  sockoptnametabs.h: gen_sockoptnametabs_h Makefile
  	./gen_sockoptnametabs_h --i2s sockoptname > $@
  
--gen_socktabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktab.h
+ gen_socktabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktab.h
 -gen_socktabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="socktab.h"'
-+gen_socktabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktab.h
-+gen_socktabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="socktab.h"'
-+gen_socktabs_h: $(gen_socktabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_socktabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_socktabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="socktab.h"'
++$(gen_socktabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_socktabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_socktabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  socktabs.h: gen_socktabs_h Makefile
  	./gen_socktabs_h --i2s sock > $@
  
--gen_socktypetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktypetab.h
+ gen_socktypetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktypetab.h
 -gen_socktypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="socktypetab.h"'
-+gen_socktypetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktypetab.h
-+gen_socktypetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="socktypetab.h"'
-+gen_socktypetabs_h: $(gen_socktypetabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_socktypetabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_socktypetabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="socktypetab.h"'
++$(gen_socktypetabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_socktypetabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_socktypetabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  socktypetabs.h: gen_socktypetabs_h Makefile
  	./gen_socktypetabs_h --i2s sock_type > $@
  
--gen_tcpoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h tcpoptnametab.h
+ gen_tcpoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h tcpoptnametab.h
 -gen_tcpoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="tcpoptnametab.h"'
-+gen_tcpoptnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h tcpoptnametab.h
-+gen_tcpoptnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="tcpoptnametab.h"'
-+gen_tcpoptnametabs_h: $(gen_tcpoptnametabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_tcpoptnametabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_tcpoptnametabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="tcpoptnametab.h"'
++$(gen_tcpoptnametabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_tcpoptnametabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_tcpoptnametabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  tcpoptnametabs.h: gen_tcpoptnametabs_h Makefile
  	./gen_tcpoptnametabs_h --i2s tcpoptname > $@
  
--gen_typetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h typetab.h
+ gen_typetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h typetab.h
 -gen_typetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="typetab.h"'
-+gen_typetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h typetab.h
-+gen_typetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="typetab.h"'
-+gen_typetabs_h: $(gen_typetabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_typetabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_typetabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="typetab.h"'
++$(gen_typetabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_typetabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_typetabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  typetabs.h: gen_typetabs_h Makefile
  	./gen_typetabs_h --s2i type > $@
  
--gen_umounttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h umounttab.h
+ gen_umounttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h umounttab.h
 -gen_umounttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="umounttab.h"'
-+gen_umounttabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h umounttab.h
-+gen_umounttabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="umounttab.h"'
-+gen_umounttabs_h: $(gen_umounttabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_umounttabs_h_BUILDCFLAGS) \
-+		-o $@ ../lib/gen_tables.c
++gen_umounttabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="umounttab.h"'
++$(gen_umounttabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_umounttabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_umounttabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  umounttabs.h: gen_umounttabs_h Makefile
  	./gen_umounttabs_h --i2s-transtab umount > $@
  
@@ -439,202 +384,170 @@ index ad9084b..f29fa41 100644
  echo .
  echo Checking for header files
 diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 3560a88..1e5ec9f 100644
+index 3560a88..97825bb 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -55,109 +55,146 @@ endif
- if USE_AARCH64
- BUILT_SOURCES += aarch64_tables.h
+@@ -70,94 +70,145 @@ if USE_AARCH64
+ noinst_PROGRAMS += gen_aarch64_tables_h
  endif
--noinst_PROGRAMS = gen_actiontabs_h gen_errtabs_h gen_fieldtabs_h \
--	gen_flagtabs_h gen_ftypetabs_h gen_i386_tables_h \
--	gen_ia64_tables_h gen_machinetabs_h gen_msg_typetabs_h \
--	gen_optabs_h gen_ppc_tables_h gen_s390_tables_h \
--	gen_s390x_tables_h gen_x86_64_tables_h
--if USE_ALPHA
--noinst_PROGRAMS += gen_alpha_tables_h
--endif
--if USE_ARM
--noinst_PROGRAMS += gen_arm_tables_h
--endif
--if USE_AARCH64
--noinst_PROGRAMS += gen_aarch64_tables_h
--endif
--gen_actiontabs_h_SOURCES = gen_tables.c gen_tables.h actiontab.h
+ gen_actiontabs_h_SOURCES = gen_tables.c gen_tables.h actiontab.h
 -gen_actiontabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="actiontab.h"'
-+gen_actiontabs_h_BUILDSOURCES = gen_tables.c gen_tables.h actiontab.h
-+gen_actiontabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="actiontab.h"'
-+gen_actiontabs_h: $(gen_actiontabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_actiontabs_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_actiontabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="actiontab.h"'
++$(gen_actiontabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_actiontabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_actiontabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  actiontabs.h: gen_actiontabs_h Makefile
  	./gen_actiontabs_h --lowercase --i2s --s2i action > $@
  
  if USE_ALPHA
--gen_alpha_tables_h_SOURCES = gen_tables.c gen_tables.h alpha_table.h
+ gen_alpha_tables_h_SOURCES = gen_tables.c gen_tables.h alpha_table.h
 -gen_alpha_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="alpha_table.h"'
-+gen_alpha_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h alpha_table.h
-+gen_alpha_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="alpha_table.h"'
-+gen_alpha_tables_h : $(gen_alpha_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_alpha_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_alpha_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="alpha_table.h"'
++$(gen_alpha_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_alpha_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_alpha_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  alpha_tables.h: gen_alpha_tables_h Makefile
  	./gen_alpha_tables_h --lowercase --i2s --s2i alpha_syscall > $@
  endif
  
  if USE_ARM
--gen_arm_tables_h_SOURCES = gen_tables.c gen_tables.h arm_table.h
+ gen_arm_tables_h_SOURCES = gen_tables.c gen_tables.h arm_table.h
 -gen_arm_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="arm_table.h"'
-+gen_arm_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h arm_table.h
-+gen_arm_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="arm_table.h"'
-+gen_arm_tables_h : $(gen_arm_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_arm_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_arm_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="arm_table.h"'
++$(gen_arm_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_arm_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_arm_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  arm_tables.h: gen_arm_tables_h Makefile
  	./gen_arm_tables_h --lowercase --i2s --s2i arm_syscall > $@
  endif
  
  if USE_AARCH64
--gen_aarch64_tables_h_SOURCES = gen_tables.c gen_tables.h aarch64_table.h
+ gen_aarch64_tables_h_SOURCES = gen_tables.c gen_tables.h aarch64_table.h
 -gen_aarch64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="aarch64_table.h"'
-+gen_aarch64_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h aarch64_table.h
-+gen_aarch64_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="aarch64_table.h"'
-+gen_aarch64_tables_h : $(gen_aarch64_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_aarch64_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_aarch64_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="aarch64_table.h"'
++$(gen_aarch64_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_aarch64_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_aarch64_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  aarch64_tables.h: gen_aarch64_tables_h Makefile
  	./gen_aarch64_tables_h --lowercase --i2s --s2i aarch64_syscall > $@
  endif
  
--gen_errtabs_h_SOURCES = gen_tables.c gen_tables.h errtab.h
+ gen_errtabs_h_SOURCES = gen_tables.c gen_tables.h errtab.h
 -gen_errtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="errtab.h"'
-+gen_errtabs_h_BUILDSOURCES = gen_tables.c gen_tables.h errtab.h
-+gen_errtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="errtab.h"'
-+gen_errtabs_h : $(gen_errtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_errtabs_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_errtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="errtab.h"'
++$(gen_errtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_errtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_errtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  errtabs.h: gen_errtabs_h Makefile
  	./gen_errtabs_h --duplicate-ints --uppercase --i2s --s2i err > $@
  
--gen_fieldtabs_h_SOURCES = gen_tables.c gen_tables.h fieldtab.h
+ gen_fieldtabs_h_SOURCES = gen_tables.c gen_tables.h fieldtab.h
 -gen_fieldtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="fieldtab.h"'
-+gen_fieldtabs_h_BUILDSOURCES = gen_tables.c gen_tables.h fieldtab.h
-+gen_fieldtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="fieldtab.h"'
-+gen_fieldtabs_h : $(gen_fieldtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_fieldtabs_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_fieldtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="fieldtab.h"'
++$(gen_fieldtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_fieldtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_fieldtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  fieldtabs.h: gen_fieldtabs_h Makefile
  	./gen_fieldtabs_h --duplicate-ints --lowercase --i2s --s2i field > $@
  
--gen_flagtabs_h_SOURCES = gen_tables.c gen_tables.h flagtab.h
+ gen_flagtabs_h_SOURCES = gen_tables.c gen_tables.h flagtab.h
 -gen_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="flagtab.h"'
-+gen_flagtabs_h_BUILDSOURCES = gen_tables.c gen_tables.h flagtab.h
-+gen_flagtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="flagtab.h"'
-+gen_flagtabs_h : $(gen_flagtabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_flagtabs_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_flagtabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="flagtab.h"'
++$(gen_flagtabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_flagtabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_flagtabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  flagtabs.h: gen_flagtabs_h Makefile
  	./gen_flagtabs_h --lowercase --i2s --s2i flag > $@
  
--gen_ftypetabs_h_SOURCES = gen_tables.c gen_tables.h ftypetab.h
+ gen_ftypetabs_h_SOURCES = gen_tables.c gen_tables.h ftypetab.h
 -gen_ftypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ftypetab.h"'
-+gen_ftypetabs_h_BUILDSOURCES = gen_tables.c gen_tables.h ftypetab.h
-+gen_ftypetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ftypetab.h"'
-+gen_ftypetabs_h : $(gen_ftypetabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ftypetabs_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_ftypetabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ftypetab.h"'
++$(gen_ftypetabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ftypetabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ftypetabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ftypetabs.h: gen_ftypetabs_h Makefile
  	./gen_ftypetabs_h --lowercase --i2s --s2i ftype > $@
  
--gen_i386_tables_h_SOURCES = gen_tables.c gen_tables.h i386_table.h
+ gen_i386_tables_h_SOURCES = gen_tables.c gen_tables.h i386_table.h
 -gen_i386_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="i386_table.h"'
-+gen_i386_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h i386_table.h
-+gen_i386_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="i386_table.h"'
-+gen_i386_tables_h : $(gen_i386_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_i386_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_i386_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="i386_table.h"'
++$(gen_i386_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_i386_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_i386_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  i386_tables.h: gen_i386_tables_h Makefile
  	./gen_i386_tables_h --duplicate-ints --lowercase --i2s --s2i \
  		i386_syscall > $@
  
--gen_ia64_tables_h_SOURCES = gen_tables.c gen_tables.h ia64_table.h
+ gen_ia64_tables_h_SOURCES = gen_tables.c gen_tables.h ia64_table.h
 -gen_ia64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ia64_table.h"'
-+gen_ia64_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h ia64_table.h
-+gen_ia64_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ia64_table.h"'
-+gen_ia64_tables_h : $(gen_ia64_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ia64_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_ia64_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ia64_table.h"'
++$(gen_ia64_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ia64_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ia64_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ia64_tables.h: gen_ia64_tables_h Makefile
  	./gen_ia64_tables_h --lowercase --i2s --s2i ia64_syscall > $@
  
--gen_machinetabs_h_SOURCES = gen_tables.c gen_tables.h machinetab.h
+ gen_machinetabs_h_SOURCES = gen_tables.c gen_tables.h machinetab.h
 -gen_machinetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="machinetab.h"'
-+gen_machinetabs_h_BUILDSOURCES = gen_tables.c gen_tables.h machinetab.h
-+gen_machinetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="machinetab.h"'
-+gen_machinetabs_h : $(gen_machinetabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_machinetabs_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_machinetabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="machinetab.h"'
++$(gen_machinetabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_machinetabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_machinetabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  machinetabs.h: gen_machinetabs_h Makefile
  	./gen_machinetabs_h --duplicate-ints --lowercase --i2s --s2i machine \
  		> $@
  
--gen_msg_typetabs_h_SOURCES = gen_tables.c gen_tables.h msg_typetab.h
+ gen_msg_typetabs_h_SOURCES = gen_tables.c gen_tables.h msg_typetab.h
 -gen_msg_typetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="msg_typetab.h"'
-+gen_msg_typetabs_h_BUILDSOURCES = gen_tables.c gen_tables.h msg_typetab.h
-+gen_msg_typetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="msg_typetab.h"'
-+gen_msg_typetabs_h : $(gen_msg_typetabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_msg_typetabs_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_msg_typetabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="msg_typetab.h"'
++$(gen_msg_typetabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_msg_typetabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_msg_typetabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  msg_typetabs.h: gen_msg_typetabs_h Makefile
  	./gen_msg_typetabs_h --uppercase --i2s --s2i msg_type > $@
  
--gen_optabs_h_SOURCES = gen_tables.c gen_tables.h optab.h
+ gen_optabs_h_SOURCES = gen_tables.c gen_tables.h optab.h
 -gen_optabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="optab.h"'
-+gen_optabs_h_BUILDSOURCES = gen_tables.c gen_tables.h optab.h
-+gen_optabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="optab.h"'
-+gen_optabs_h : $(gen_optabs_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_optabs_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_optabs_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="optab.h"'
++$(gen_optabs_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_optabs_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_optabs_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  optabs.h: gen_optabs_h Makefile
  	./gen_optabs_h --i2s op > $@
  
--gen_ppc_tables_h_SOURCES = gen_tables.c gen_tables.h ppc_table.h
+ gen_ppc_tables_h_SOURCES = gen_tables.c gen_tables.h ppc_table.h
 -gen_ppc_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ppc_table.h"'
-+gen_ppc_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h ppc_table.h
-+gen_ppc_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ppc_table.h"'
-+gen_ppc_tables_h : $(gen_ppc_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ppc_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_ppc_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ppc_table.h"'
++$(gen_ppc_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_ppc_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_ppc_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  ppc_tables.h: gen_ppc_tables_h Makefile
  	./gen_ppc_tables_h --lowercase --i2s --s2i ppc_syscall > $@
  
--gen_s390_tables_h_SOURCES = gen_tables.c gen_tables.h s390_table.h
+ gen_s390_tables_h_SOURCES = gen_tables.c gen_tables.h s390_table.h
 -gen_s390_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="s390_table.h"'
-+gen_s390_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h s390_table.h
-+gen_s390_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="s390_table.h"'
-+gen_s390_tables_h : $(gen_s390_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_s390_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_s390_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="s390_table.h"'
++$(gen_s390_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_s390_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_s390_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  s390_tables.h: gen_s390_tables_h Makefile
  	./gen_s390_tables_h --lowercase --i2s --s2i s390_syscall > $@
  
--gen_s390x_tables_h_SOURCES = gen_tables.c gen_tables.h s390x_table.h
+ gen_s390x_tables_h_SOURCES = gen_tables.c gen_tables.h s390x_table.h
 -gen_s390x_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="s390x_table.h"'
-+gen_s390x_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h s390x_table.h
-+gen_s390x_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="s390x_table.h"'
-+gen_s390x_tables_h : $(gen_s390x_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_s390x_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_s390x_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="s390x_table.h"'
++$(gen_s390x_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_s390x_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_s390x_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  s390x_tables.h: gen_s390x_tables_h Makefile
  	./gen_s390x_tables_h --lowercase --i2s --s2i s390x_syscall > $@
  
--gen_x86_64_tables_h_SOURCES = gen_tables.c gen_tables.h x86_64_table.h
+ gen_x86_64_tables_h_SOURCES = gen_tables.c gen_tables.h x86_64_table.h
 -gen_x86_64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="x86_64_table.h"'
-+gen_x86_64_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h x86_64_table.h
-+gen_x86_64_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="x86_64_table.h"'
-+gen_x86_64_tables_h : $(gen_x86_64_tables_h_BUILDSOURCES)
-+	$(CC_FOR_BUILD) $(INCLUDES) $(gen_x86_64_tables_h_BUILDCFLAGS) \
-+		-o $@ gen_tables.c
++gen_x86_64_tables_h_CFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="x86_64_table.h"'
++$(gen_x86_64_tables_h_OBJECTS): CC=$(CC_FOR_BUILD)
++$(gen_x86_64_tables_h_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++gen_x86_64_tables_h$(BUILD_EXEEXT): CC=$(CC_FOR_BUILD)
  x86_64_tables.h: gen_x86_64_tables_h Makefile
  	./gen_x86_64_tables_h --lowercase --i2s --s2i x86_64_syscall > $@
 diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
