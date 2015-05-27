From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 27 May 2015 17:17:08 -0500
Subject: [Buildroot] [PATCH v6 04/22] audit: new package
In-Reply-To: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1432765046-1223-5-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v5 -> v6:
  - Combined arm and armeb detection in mk file (Suggested by Samuel)
  - Fixed toolchain warning to not always show up with blackfin is
    enabled (Suggested by Thomas P.)
  - Reworked audit startup script to be more buildroot-esque
    (Requested by Thomas P.)
  - Reworked patch to allow the ZOS remote plugin to be enabled
    via a configure option to make it upstreamable (Suggested by
    Thomas P.)
  - Fixed audit.mk indentation (Suggested by Thomas P.)
  - Reworked the posix_fallocate patch to make it upstreamable
    (Suggested by Thomas P.)

Changes v4 -> v5:
  - Removed limitation on glibc only build (Matt W.)
  - Updated static lib build option variable name (Matt W.)
  - Upgrading audit to the latest version. Switched to a simpler
    cross compile support patch that should be upstreamable (Clayton S.)
  - Cleaned up build flags and patch names (Clayton S.)
  - Fixed an issue with a missing ADDR_NO_RANDOMIZE flag that is
    required by the audit application. (Clayton S.)
  - Add exclusion on blackfin architecture because memory fences are
    required (Clayton S.)
  - Added a dependency on the toolchain having threads (Clayton S.)
  - Add patch to fix false detection of MS_DIRSYNC in mount.h when
    crosscompiling on systems without that feature. (Clayton S.)
  - Fixed path from sbin to usr/sbin (Matt W.)

Changes v3 -> v4:
  - Added back in the Python bindings configure option instead of
    relying on a check to see if Python is enabled (suggested by
    Thomas P.)
  - Cleaned up the startup script installation step (suggested by
    Thomas P.)
  - Change the startup script order to launch the auditd first thing
    and also change the required shell to sh instead of bash.
  - Adding a dependency on comment BR2_TOOLCHAIN_USES_GLIBC

Changes v2 -> v3:
  - Changed order of patch to correct dependency issue (suggested by
    Thomas P.)
  - Changes patch naming convention (suggested by Thomas P.)
  - Added upstream submission link for patch (suggested by Thomas P.)

Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format
  - Fixed the patch naming to avoid using the version number
  - Cleaned up the patch to include a signed-off-by line
  - Changed the original Python select in the Config.in to be a check
    in the mk file
---
 package/Config.in                                  |   1 +
 package/audit/0001-Enable-cross-compiling.patch    | 773 +++++++++++++++++++++
 .../0002-Make-zos-remote-plugin-optional.patch     |  56 ++
 ...03-Default-ADDR_NO_RANDOMIZE-if-not-found.patch |  44 ++
 ...o-not-call-posix_fallocate-if-unavailable.patch |  47 ++
 ...Fix-header-detection-when-cross-compiling.patch |  46 ++
 package/audit/Config.in                            |  18 +
 package/audit/S01auditd                            |  99 +++
 package/audit/audit.hash                           |   2 +
 package/audit/audit.mk                             |  43 ++
 10 files changed, 1129 insertions(+)
 create mode 100644 package/audit/0001-Enable-cross-compiling.patch
 create mode 100644 package/audit/0002-Make-zos-remote-plugin-optional.patch
 create mode 100644 package/audit/0003-Default-ADDR_NO_RANDOMIZE-if-not-found.patch
 create mode 100644 package/audit/0004-Do-not-call-posix_fallocate-if-unavailable.patch
 create mode 100644 package/audit/0005-Fix-header-detection-when-cross-compiling.patch
 create mode 100644 package/audit/Config.in
 create mode 100644 package/audit/S01auditd
 create mode 100644 package/audit/audit.hash
 create mode 100644 package/audit/audit.mk

diff --git a/package/Config.in b/package/Config.in
index cab7f66..a5c2186 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1377,6 +1377,7 @@ endmenu
 menu "System tools"
 	source "package/acl/Config.in"
 	source "package/attr/Config.in"
+	source "package/audit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/bootutils/Config.in"
 	source "package/coreutils/Config.in"
diff --git a/package/audit/0001-Enable-cross-compiling.patch b/package/audit/0001-Enable-cross-compiling.patch
new file mode 100644
index 0000000..476c71a
--- /dev/null
+++ b/package/audit/0001-Enable-cross-compiling.patch
@@ -0,0 +1,773 @@
+From edb90714a7f4fd9cf45b06e98b2a44115bf4952e Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Thu, 26 Mar 2015 12:26:36 -0500
+Subject: [PATCH] Enable cross compiling
+
+During the audit build, several lookup tables are generated as header
+files that are then linked in with the executables. This process is done
+by a C application that needs to be able to be run on the host. The
+current Makfile structure tries to build these executables for the
+target instead of the host where they cannot be executed. This patch
+reworks the Makefile structure to build for the correct platform.
+
+This patch is a rework of a patch posted to the audit mailing list at
+the link below.
+https://www.redhat.com/archives/linux-audit/2012-November/msg00000.html
+
+The ax_prog_cc_for_build.m4 file was obtained from GNU at the link
+below.
+http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ auparse/Makefile.am        | 276 ++++++++++++++++++++++++++++++---------------
+ configure.ac               |   1 +
+ lib/Makefile.am            | 133 ++++++++++++++--------
+ m4/ax_prog_cc_for_build.m4 | 125 ++++++++++++++++++++
+ 4 files changed, 397 insertions(+), 138 deletions(-)
+ create mode 100644 m4/ax_prog_cc_for_build.m4
+
+diff --git a/auparse/Makefile.am b/auparse/Makefile.am
+index 89b2d21..0fe40e0 100644
+--- a/auparse/Makefile.am
++++ b/auparse/Makefile.am
+@@ -57,208 +57,304 @@ BUILT_SOURCES = accesstabs.h captabs.h clocktabs.h clone-flagtabs.h \
+ 	seektabs.h shm_modetabs.h signaltabs.h sockoptnametabs.h \
+ 	socktabs.h sockleveltabs.h socktypetabs.h \
+ 	tcpoptnametabs.h typetabs.h umounttabs.h
+-noinst_PROGRAMS = gen_accesstabs_h gen_captabs_h gen_clock_h \
+-	gen_clone-flagtabs_h \
+-	gen_epoll_ctls_h gen_famtabs_h \
+-	gen_fcntl-cmdtabs_h gen_flagtabs_h gen_ioctlreqtabs_h \
+-	gen_icmptypetabs_h gen_ipctabs_h gen_ipccmdtabs_h\
+-	gen_ipoptnametabs_h gen_ip6optnametabs_h gen_nfprototabs_h \
+-	gen_mmaptabs_h gen_mounttabs_h \
+-	gen_open-flagtabs_h gen_persontabs_h \
+-	gen_prctl_opttabs_h gen_pktoptnametabs_h gen_prottabs_h \
+-	gen_recvtabs_h gen_rlimit_h gen_ptracetabs_h \
+-	gen_schedtabs_h gen_seccomptabs_h \
+-	gen_seektabs_h gen_shm_modetabs_h gen_signals_h \
+-	gen_sockoptnametabs_h gen_socktabs_h gen_sockleveltabs_h \
+-	gen_socktypetabs_h gen_tcpoptnametabs_h gen_typetabs_h \
+-	gen_umounttabs_h
+-
+-gen_accesstabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h accesstab.h
+-gen_accesstabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="accesstab.h"'
++
++gen_accesstabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h accesstab.h
++gen_accesstabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="accesstab.h"'
++gen_accesstabs_h: $(gen_accesstabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_accesstabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ accesstabs.h: gen_accesstabs_h Makefile
+ 	./gen_accesstabs_h --i2s-transtab access > $@
+ 
+-gen_captabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h captab.h
+-gen_captabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="captab.h"'
++gen_captabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h captab.h
++gen_captabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="captab.h"'
++gen_captabs_h: $(gen_captabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_captabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ captabs.h: gen_captabs_h Makefile
+ 	./gen_captabs_h --i2s cap > $@
+ 
+-gen_clock_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h clocktab.h
+-gen_clock_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="clocktab.h"'
++gen_clock_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h clocktab.h
++gen_clock_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="clocktab.h"'
++gen_clock_h: $(gen_clock_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_clock_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ clocktabs.h: gen_clock_h Makefile
+ 	./gen_clock_h --i2s clock > $@
+ 
+-gen_clone_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
++gen_clone_flagtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+ 	clone-flagtab.h
+-gen_clone_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="clone-flagtab.h"'
++gen_clone_flagtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="clone-flagtab.h"'
++gen_clone-flagtabs_h: $(gen_clone_flagtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_clone_flagtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ clone-flagtabs.h: gen_clone-flagtabs_h Makefile
+ 	./gen_clone-flagtabs_h --i2s-transtab clone_flag > $@
+ 
+-gen_epoll_ctls_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h epoll_ctl.h
+-gen_epoll_ctls_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="epoll_ctl.h"'
++gen_epoll_ctls_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h epoll_ctl.h
++gen_epoll_ctls_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="epoll_ctl.h"'
++gen_epoll_ctls_h: $(gen_epoll_ctls_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_epoll_ctls_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ epoll_ctls.h: gen_epoll_ctls_h Makefile
+ 	./gen_epoll_ctls_h --i2s epoll_ctl > $@
+ 
+-gen_famtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h famtab.h
+-gen_famtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="famtab.h"'
++gen_famtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h famtab.h
++gen_famtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="famtab.h"'
++gen_famtabs_h: $(gen_famtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_famtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ famtabs.h: gen_famtabs_h Makefile
+ 	./gen_famtabs_h --i2s fam > $@
+ 
+-gen_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h flagtab.h
++gen_flagtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h flagtab.h
+ # ../auparse/ is used to avoid using ../lib/flagtab.h
+-gen_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="../auparse/flagtab.h"'
++gen_flagtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="../auparse/flagtab.h"'
++gen_flagtabs_h: $(gen_flagtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_flagtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ flagtabs.h: gen_flagtabs_h Makefile
+ 	./gen_flagtabs_h --i2s-transtab flag > $@
+ 
+-gen_fcntl_cmdtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
++gen_fcntl_cmdtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+ 	fcntl-cmdtab.h
+-gen_fcntl_cmdtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="fcntl-cmdtab.h"'
++gen_fcntl_cmdtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="fcntl-cmdtab.h"'
++gen_fcntl-cmdtabs_h: $(gen_fcntl_cmdtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_fcntl_cmdtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ fcntl-cmdtabs.h: gen_fcntl-cmdtabs_h Makefile
+ 	./gen_fcntl-cmdtabs_h --i2s fcntl > $@
+ 
+-gen_icmptypetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h icmptypetab.h
+-gen_icmptypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="icmptypetab.h"'
++gen_icmptypetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h icmptypetab.h
++gen_icmptypetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="icmptypetab.h"'
++gen_icmptypetabs_h: $(gen_icmptypetabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_icmptypetabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ icmptypetabs.h: gen_icmptypetabs_h Makefile
+ 	./gen_icmptypetabs_h --i2s icmptype > $@
+ 
+-gen_ioctlreqtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ioctlreqtab.h
+-gen_ioctlreqtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ioctlreqtab.h"'
++gen_ioctlreqtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ioctlreqtab.h
++gen_ioctlreqtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ioctlreqtab.h"'
++gen_ioctlreqtabs_h: $(gen_ioctlreqtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ioctlreqtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ ioctlreqtabs.h: gen_ioctlreqtabs_h Makefile
+ 	./gen_ioctlreqtabs_h --i2s ioctlreq > $@
+ 
+-gen_ipctabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipctab.h
+-gen_ipctabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipctab.h"'
++gen_ipctabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipctab.h
++gen_ipctabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipctab.h"'
++gen_ipctabs_h: $(gen_ipctabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ipctabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ ipctabs.h: gen_ipctabs_h Makefile
+ 	./gen_ipctabs_h --i2s ipc > $@
+ 
+-gen_ipccmdtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipccmdtab.h
+-gen_ipccmdtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipccmdtab.h"'
++gen_ipccmdtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipccmdtab.h
++gen_ipccmdtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipccmdtab.h"'
++gen_ipccmdtabs_h: $(gen_ipccmdtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ipccmdtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ ipccmdtabs.h: gen_ipccmdtabs_h Makefile
+ 	./gen_ipccmdtabs_h --i2s-transtab ipccmd > $@
+ 
+-gen_ipoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipoptnametab.h
+-gen_ipoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipoptnametab.h"'
++gen_ipoptnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipoptnametab.h
++gen_ipoptnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ipoptnametab.h"'
++gen_ipoptnametabs_h: $(gen_ipoptnametabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ipoptnametabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ ipoptnametabs.h: gen_ipoptnametabs_h Makefile
+ 	./gen_ipoptnametabs_h --i2s ipoptname > $@
+ 
+-gen_ip6optnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ip6optnametab.h
+-gen_ip6optnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ip6optnametab.h"'
++gen_ip6optnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ip6optnametab.h
++gen_ip6optnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ip6optnametab.h"'
++gen_ip6optnametabs_h: $(gen_ip6optnametabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ip6optnametabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ ip6optnametabs.h: gen_ip6optnametabs_h Makefile
+ 	./gen_ip6optnametabs_h --i2s ip6optname > $@
+ 
+-gen_mmaptabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mmaptab.h
+-gen_mmaptabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="mmaptab.h"'
++gen_mmaptabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mmaptab.h
++gen_mmaptabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="mmaptab.h"'
++gen_mmaptabs_h: $(gen_mmaptabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_mmaptabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ mmaptabs.h: gen_mmaptabs_h Makefile
+ 	./gen_mmaptabs_h --i2s-transtab mmap > $@
+ 
+-gen_mounttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mounttab.h
+-gen_mounttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="mounttab.h"'
++gen_mounttabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mounttab.h
++gen_mounttabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="mounttab.h"'
++gen_mounttabs_h: $(gen_mounttabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_mounttabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ mounttabs.h: gen_mounttabs_h Makefile
+ 	./gen_mounttabs_h --i2s-transtab mount > $@
+ 
+-gen_nfprototabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h nfprototab.h
+-gen_nfprototabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="nfprototab.h"'
++gen_nfprototabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h nfprototab.h
++gen_nfprototabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="nfprototab.h"'
++gen_nfprototabs_h: $(gen_nfprototabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_nfprototabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ nfprototabs.h: gen_nfprototabs_h Makefile
+ 	./gen_nfprototabs_h --i2s nfproto > $@
+ 
+-gen_open_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
++gen_open_flagtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+ 	open-flagtab.h
+-gen_open_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="open-flagtab.h"'
++gen_open_flagtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="open-flagtab.h"'
++gen_open-flagtabs_h: $(gen_open_flagtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_open_flagtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ open-flagtabs.h: gen_open-flagtabs_h Makefile
+ 	./gen_open-flagtabs_h --i2s-transtab open_flag > $@
+ 
+-gen_persontabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h persontab.h
+-gen_persontabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="persontab.h"'
++gen_persontabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h persontab.h
++gen_persontabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="persontab.h"'
++gen_persontabs_h: $(gen_persontabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_persontabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ persontabs.h: gen_persontabs_h Makefile
+ 	./gen_persontabs_h --i2s person > $@
+ 
+-gen_ptracetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ptracetab.h
+-gen_ptracetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ptracetab.h"'
++gen_ptracetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ptracetab.h
++gen_ptracetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ptracetab.h"'
++gen_ptracetabs_h: $(gen_ptracetabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ptracetabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ ptracetabs.h: gen_ptracetabs_h Makefile
+ 	./gen_ptracetabs_h --i2s ptrace > $@
+ 
+-gen_prctl_opttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prctl-opt-tab.h
+-gen_prctl_opttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="prctl-opt-tab.h"'
++gen_prctl_opttabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prctl-opt-tab.h
++gen_prctl_opttabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="prctl-opt-tab.h"'
++gen_prctl_opttabs_h: $(gen_prctl_opttabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_prctl_opttabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ prctl_opttabs.h: gen_prctl_opttabs_h Makefile
+ 	./gen_prctl_opttabs_h --i2s prctl_opt > $@
+ 
+-gen_pktoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h pktoptnametab.h
+-gen_pktoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="pktoptnametab.h"'
++gen_pktoptnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h pktoptnametab.h
++gen_pktoptnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="pktoptnametab.h"'
++gen_pktoptnametabs_h: $(gen_pktoptnametabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_pktoptnametabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ pktoptnametabs.h: gen_pktoptnametabs_h Makefile
+ 	./gen_pktoptnametabs_h --i2s pktoptname > $@
+ 
+-gen_prottabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prottab.h
+-gen_prottabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="prottab.h"'
++gen_prottabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prottab.h
++gen_prottabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="prottab.h"'
++gen_prottabs_h: $(gen_prottabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_prottabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ prottabs.h: gen_prottabs_h Makefile
+ 	./gen_prottabs_h --i2s-transtab prot > $@
+ 
+-gen_recvtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h recvtab.h
+-gen_recvtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="recvtab.h"'
++gen_recvtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h recvtab.h
++gen_recvtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="recvtab.h"'
++gen_recvtabs_h: $(gen_recvtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_recvtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ recvtabs.h: gen_recvtabs_h Makefile
+ 	./gen_recvtabs_h --i2s-transtab recv > $@
+ 
+-gen_rlimit_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h rlimittab.h
+-gen_rlimit_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="rlimittab.h"'
++gen_rlimit_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h rlimittab.h
++gen_rlimit_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="rlimittab.h"'
++gen_rlimit_h: $(gen_rlimit_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_rlimit_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ rlimittabs.h: gen_rlimit_h Makefile
+ 	./gen_rlimit_h --i2s rlimit > $@
+ 
+-gen_schedtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h schedtab.h
+-gen_schedtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="schedtab.h"'
++gen_schedtabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h schedtab.h
++gen_schedtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="schedtab.h"'
++gen_schedtabs_h: $(gen_schedtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_schedtabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ schedtabs.h: gen_schedtabs_h Makefile
+ 	./gen_schedtabs_h --i2s sched > $@
+ 
+-gen_seccomptabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seccomptab.h
+-gen_seccomptabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="seccomptab.h"'
++gen_seccomptabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seccomptab.h
++gen_seccomptabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="seccomptab.h"'
++gen_seccomptabs_h: $(gen_seccomptabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_seccomptabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ seccomptabs.h: gen_seccomptabs_h Makefile
+ 	./gen_seccomptabs_h --i2s seccomp > $@
+ 
+-gen_seektabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seektab.h
+-gen_seektabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="seektab.h"'
++gen_seektabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seektab.h
++gen_seektabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="seektab.h"'
++gen_seektabs_h: $(gen_seektabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_seektabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ seektabs.h: gen_seektabs_h Makefile
+ 	./gen_seektabs_h --i2s seek > $@
+ 
+-gen_shm_modetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h shm_modetab.h
+-gen_shm_modetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="shm_modetab.h"'
++gen_shm_modetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h shm_modetab.h
++gen_shm_modetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="shm_modetab.h"'
++gen_shm_modetabs_h: $(gen_shm_modetabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_shm_modetabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ shm_modetabs.h: gen_shm_modetabs_h Makefile
+ 	./gen_shm_modetabs_h --i2s-transtab shm_mode > $@
+ 
+-gen_signals_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h signaltab.h
+-gen_signals_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="signaltab.h"'
++gen_signals_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h signaltab.h
++gen_signals_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="signaltab.h"'
++gen_signals_h: $(gen_signals_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_signals_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ signaltabs.h: gen_signals_h Makefile
+ 	./gen_signals_h --i2s signal > $@
+ 
+-gen_sockleveltabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockleveltab.h
+-gen_sockleveltabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="sockleveltab.h"'
++gen_sockleveltabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockleveltab.h
++gen_sockleveltabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="sockleveltab.h"'
++gen_sockleveltabs_h: $(gen_sockleveltabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_sockleveltabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ sockleveltabs.h: gen_sockleveltabs_h Makefile
+ 	./gen_sockleveltabs_h --i2s socklevel > $@
+ 
+-gen_sockoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockoptnametab.h
+-gen_sockoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="sockoptnametab.h"'
++gen_sockoptnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockoptnametab.h
++gen_sockoptnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="sockoptnametab.h"'
++gen_sockoptnametabs_h: $(gen_sockoptnametabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_sockoptnametabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ sockoptnametabs.h: gen_sockoptnametabs_h Makefile
+ 	./gen_sockoptnametabs_h --i2s sockoptname > $@
+ 
+-gen_socktabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktab.h
+-gen_socktabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="socktab.h"'
++gen_socktabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktab.h
++gen_socktabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="socktab.h"'
++gen_socktabs_h: $(gen_socktabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_socktabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ socktabs.h: gen_socktabs_h Makefile
+ 	./gen_socktabs_h --i2s sock > $@
+ 
+-gen_socktypetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktypetab.h
+-gen_socktypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="socktypetab.h"'
++gen_socktypetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktypetab.h
++gen_socktypetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="socktypetab.h"'
++gen_socktypetabs_h: $(gen_socktypetabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_socktypetabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ socktypetabs.h: gen_socktypetabs_h Makefile
+ 	./gen_socktypetabs_h --i2s sock_type > $@
+ 
+-gen_tcpoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h tcpoptnametab.h
+-gen_tcpoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="tcpoptnametab.h"'
++gen_tcpoptnametabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h tcpoptnametab.h
++gen_tcpoptnametabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="tcpoptnametab.h"'
++gen_tcpoptnametabs_h: $(gen_tcpoptnametabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_tcpoptnametabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ tcpoptnametabs.h: gen_tcpoptnametabs_h Makefile
+ 	./gen_tcpoptnametabs_h --i2s tcpoptname > $@
+ 
+-gen_typetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h typetab.h
+-gen_typetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="typetab.h"'
++gen_typetabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h typetab.h
++gen_typetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="typetab.h"'
++gen_typetabs_h: $(gen_typetabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_typetabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ typetabs.h: gen_typetabs_h Makefile
+ 	./gen_typetabs_h --s2i type > $@
+ 
+-gen_umounttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h umounttab.h
+-gen_umounttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="umounttab.h"'
++gen_umounttabs_h_BUILDSOURCES = ../lib/gen_tables.c ../lib/gen_tables.h umounttab.h
++gen_umounttabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="umounttab.h"'
++gen_umounttabs_h: $(gen_umounttabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_umounttabs_h_BUILDCFLAGS) \
++		-o $@ ../lib/gen_tables.c
+ umounttabs.h: gen_umounttabs_h Makefile
+ 	./gen_umounttabs_h --i2s-transtab umount > $@
+ 
+diff --git a/configure.ac b/configure.ac
+index ad9084b..f29fa41 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -51,6 +51,7 @@ echo Checking for programs
+ AC_PROG_CC
+ AC_PROG_INSTALL
+ AC_PROG_AWK
++AX_PROG_CC_FOR_BUILD
+ 
+ echo .
+ echo Checking for header files
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 3560a88..1e5ec9f 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -55,109 +55,146 @@ endif
+ if USE_AARCH64
+ BUILT_SOURCES += aarch64_tables.h
+ endif
+-noinst_PROGRAMS = gen_actiontabs_h gen_errtabs_h gen_fieldtabs_h \
+-	gen_flagtabs_h gen_ftypetabs_h gen_i386_tables_h \
+-	gen_ia64_tables_h gen_machinetabs_h gen_msg_typetabs_h \
+-	gen_optabs_h gen_ppc_tables_h gen_s390_tables_h \
+-	gen_s390x_tables_h gen_x86_64_tables_h
+-if USE_ALPHA
+-noinst_PROGRAMS += gen_alpha_tables_h
+-endif
+-if USE_ARM
+-noinst_PROGRAMS += gen_arm_tables_h
+-endif
+-if USE_AARCH64
+-noinst_PROGRAMS += gen_aarch64_tables_h
+-endif
+-gen_actiontabs_h_SOURCES = gen_tables.c gen_tables.h actiontab.h
+-gen_actiontabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="actiontab.h"'
++gen_actiontabs_h_BUILDSOURCES = gen_tables.c gen_tables.h actiontab.h
++gen_actiontabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="actiontab.h"'
++gen_actiontabs_h: $(gen_actiontabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_actiontabs_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ actiontabs.h: gen_actiontabs_h Makefile
+ 	./gen_actiontabs_h --lowercase --i2s --s2i action > $@
+ 
+ if USE_ALPHA
+-gen_alpha_tables_h_SOURCES = gen_tables.c gen_tables.h alpha_table.h
+-gen_alpha_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="alpha_table.h"'
++gen_alpha_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h alpha_table.h
++gen_alpha_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="alpha_table.h"'
++gen_alpha_tables_h : $(gen_alpha_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_alpha_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ alpha_tables.h: gen_alpha_tables_h Makefile
+ 	./gen_alpha_tables_h --lowercase --i2s --s2i alpha_syscall > $@
+ endif
+ 
+ if USE_ARM
+-gen_arm_tables_h_SOURCES = gen_tables.c gen_tables.h arm_table.h
+-gen_arm_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="arm_table.h"'
++gen_arm_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h arm_table.h
++gen_arm_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="arm_table.h"'
++gen_arm_tables_h : $(gen_arm_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_arm_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ arm_tables.h: gen_arm_tables_h Makefile
+ 	./gen_arm_tables_h --lowercase --i2s --s2i arm_syscall > $@
+ endif
+ 
+ if USE_AARCH64
+-gen_aarch64_tables_h_SOURCES = gen_tables.c gen_tables.h aarch64_table.h
+-gen_aarch64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="aarch64_table.h"'
++gen_aarch64_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h aarch64_table.h
++gen_aarch64_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="aarch64_table.h"'
++gen_aarch64_tables_h : $(gen_aarch64_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_aarch64_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ aarch64_tables.h: gen_aarch64_tables_h Makefile
+ 	./gen_aarch64_tables_h --lowercase --i2s --s2i aarch64_syscall > $@
+ endif
+ 
+-gen_errtabs_h_SOURCES = gen_tables.c gen_tables.h errtab.h
+-gen_errtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="errtab.h"'
++gen_errtabs_h_BUILDSOURCES = gen_tables.c gen_tables.h errtab.h
++gen_errtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="errtab.h"'
++gen_errtabs_h : $(gen_errtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_errtabs_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ errtabs.h: gen_errtabs_h Makefile
+ 	./gen_errtabs_h --duplicate-ints --uppercase --i2s --s2i err > $@
+ 
+-gen_fieldtabs_h_SOURCES = gen_tables.c gen_tables.h fieldtab.h
+-gen_fieldtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="fieldtab.h"'
++gen_fieldtabs_h_BUILDSOURCES = gen_tables.c gen_tables.h fieldtab.h
++gen_fieldtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="fieldtab.h"'
++gen_fieldtabs_h : $(gen_fieldtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_fieldtabs_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ fieldtabs.h: gen_fieldtabs_h Makefile
+ 	./gen_fieldtabs_h --duplicate-ints --lowercase --i2s --s2i field > $@
+ 
+-gen_flagtabs_h_SOURCES = gen_tables.c gen_tables.h flagtab.h
+-gen_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="flagtab.h"'
++gen_flagtabs_h_BUILDSOURCES = gen_tables.c gen_tables.h flagtab.h
++gen_flagtabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="flagtab.h"'
++gen_flagtabs_h : $(gen_flagtabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_flagtabs_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ flagtabs.h: gen_flagtabs_h Makefile
+ 	./gen_flagtabs_h --lowercase --i2s --s2i flag > $@
+ 
+-gen_ftypetabs_h_SOURCES = gen_tables.c gen_tables.h ftypetab.h
+-gen_ftypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ftypetab.h"'
++gen_ftypetabs_h_BUILDSOURCES = gen_tables.c gen_tables.h ftypetab.h
++gen_ftypetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ftypetab.h"'
++gen_ftypetabs_h : $(gen_ftypetabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ftypetabs_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ ftypetabs.h: gen_ftypetabs_h Makefile
+ 	./gen_ftypetabs_h --lowercase --i2s --s2i ftype > $@
+ 
+-gen_i386_tables_h_SOURCES = gen_tables.c gen_tables.h i386_table.h
+-gen_i386_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="i386_table.h"'
++gen_i386_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h i386_table.h
++gen_i386_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="i386_table.h"'
++gen_i386_tables_h : $(gen_i386_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_i386_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ i386_tables.h: gen_i386_tables_h Makefile
+ 	./gen_i386_tables_h --duplicate-ints --lowercase --i2s --s2i \
+ 		i386_syscall > $@
+ 
+-gen_ia64_tables_h_SOURCES = gen_tables.c gen_tables.h ia64_table.h
+-gen_ia64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ia64_table.h"'
++gen_ia64_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h ia64_table.h
++gen_ia64_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ia64_table.h"'
++gen_ia64_tables_h : $(gen_ia64_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ia64_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ ia64_tables.h: gen_ia64_tables_h Makefile
+ 	./gen_ia64_tables_h --lowercase --i2s --s2i ia64_syscall > $@
+ 
+-gen_machinetabs_h_SOURCES = gen_tables.c gen_tables.h machinetab.h
+-gen_machinetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="machinetab.h"'
++gen_machinetabs_h_BUILDSOURCES = gen_tables.c gen_tables.h machinetab.h
++gen_machinetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="machinetab.h"'
++gen_machinetabs_h : $(gen_machinetabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_machinetabs_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ machinetabs.h: gen_machinetabs_h Makefile
+ 	./gen_machinetabs_h --duplicate-ints --lowercase --i2s --s2i machine \
+ 		> $@
+ 
+-gen_msg_typetabs_h_SOURCES = gen_tables.c gen_tables.h msg_typetab.h
+-gen_msg_typetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="msg_typetab.h"'
++gen_msg_typetabs_h_BUILDSOURCES = gen_tables.c gen_tables.h msg_typetab.h
++gen_msg_typetabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="msg_typetab.h"'
++gen_msg_typetabs_h : $(gen_msg_typetabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_msg_typetabs_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ msg_typetabs.h: gen_msg_typetabs_h Makefile
+ 	./gen_msg_typetabs_h --uppercase --i2s --s2i msg_type > $@
+ 
+-gen_optabs_h_SOURCES = gen_tables.c gen_tables.h optab.h
+-gen_optabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="optab.h"'
++gen_optabs_h_BUILDSOURCES = gen_tables.c gen_tables.h optab.h
++gen_optabs_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="optab.h"'
++gen_optabs_h : $(gen_optabs_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_optabs_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ optabs.h: gen_optabs_h Makefile
+ 	./gen_optabs_h --i2s op > $@
+ 
+-gen_ppc_tables_h_SOURCES = gen_tables.c gen_tables.h ppc_table.h
+-gen_ppc_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ppc_table.h"'
++gen_ppc_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h ppc_table.h
++gen_ppc_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="ppc_table.h"'
++gen_ppc_tables_h : $(gen_ppc_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_ppc_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ ppc_tables.h: gen_ppc_tables_h Makefile
+ 	./gen_ppc_tables_h --lowercase --i2s --s2i ppc_syscall > $@
+ 
+-gen_s390_tables_h_SOURCES = gen_tables.c gen_tables.h s390_table.h
+-gen_s390_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="s390_table.h"'
++gen_s390_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h s390_table.h
++gen_s390_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="s390_table.h"'
++gen_s390_tables_h : $(gen_s390_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_s390_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ s390_tables.h: gen_s390_tables_h Makefile
+ 	./gen_s390_tables_h --lowercase --i2s --s2i s390_syscall > $@
+ 
+-gen_s390x_tables_h_SOURCES = gen_tables.c gen_tables.h s390x_table.h
+-gen_s390x_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="s390x_table.h"'
++gen_s390x_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h s390x_table.h
++gen_s390x_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="s390x_table.h"'
++gen_s390x_tables_h : $(gen_s390x_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_s390x_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ s390x_tables.h: gen_s390x_tables_h Makefile
+ 	./gen_s390x_tables_h --lowercase --i2s --s2i s390x_syscall > $@
+ 
+-gen_x86_64_tables_h_SOURCES = gen_tables.c gen_tables.h x86_64_table.h
+-gen_x86_64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="x86_64_table.h"'
++gen_x86_64_tables_h_BUILDSOURCES = gen_tables.c gen_tables.h x86_64_table.h
++gen_x86_64_tables_h_BUILDCFLAGS = $(CFLAGS_FOR_BUILD) '-DTABLE_H="x86_64_table.h"'
++gen_x86_64_tables_h : $(gen_x86_64_tables_h_BUILDSOURCES)
++	$(CC_FOR_BUILD) $(INCLUDES) $(gen_x86_64_tables_h_BUILDCFLAGS) \
++		-o $@ gen_tables.c
+ x86_64_tables.h: gen_x86_64_tables_h Makefile
+ 	./gen_x86_64_tables_h --lowercase --i2s --s2i x86_64_syscall > $@
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+new file mode 100644
+index 0000000..77fd346
+--- /dev/null
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -0,0 +1,125 @@
++# ===========================================================================
++#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_PROG_CC_FOR_BUILD
++#
++# DESCRIPTION
++#
++#   This macro searches for a C compiler that generates native executables,
++#   that is a C compiler that surely is not a cross-compiler. This can be
++#   useful if you have to generate source code at compile-time like for
++#   example GCC does.
++#
++#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anything
++#   needed to compile or link (CC_FOR_BUILD) and preprocess (CPP_FOR_BUILD).
++#   The value of these variables can be overridden by the user by specifying
++#   a compiler with an environment variable (like you do for standard CC).
++#
++#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and object
++#   file extensions for the build platform, and GCC_FOR_BUILD to `yes' if
++#   the compiler we found is GCC. All these variables but GCC_FOR_BUILD are
++#   substituted in the Makefile.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 8
++
++AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
++AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
++AC_REQUIRE([AC_PROG_CC])dnl
++AC_REQUIRE([AC_PROG_CPP])dnl
++AC_REQUIRE([AC_EXEEXT])dnl
++AC_REQUIRE([AC_CANONICAL_HOST])dnl
++
++dnl Use the standard macros, but make them use other variable names
++dnl
++pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
++pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
++pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
++pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
++pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_exeext], ac_build_exeext)dnl
++pushdef([ac_objext], ac_build_objext)dnl
++pushdef([CC], CC_FOR_BUILD)dnl
++pushdef([CPP], CPP_FOR_BUILD)dnl
++pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
++pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
++pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
++pushdef([host], build)dnl
++pushdef([host_alias], build_alias)dnl
++pushdef([host_cpu], build_cpu)dnl
++pushdef([host_vendor], build_vendor)dnl
++pushdef([host_os], build_os)dnl
++pushdef([ac_cv_host], ac_cv_build)dnl
++pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
++pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
++pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
++pushdef([ac_cv_host_os], ac_cv_build_os)dnl
++pushdef([ac_cpp], ac_build_cpp)dnl
++pushdef([ac_compile], ac_build_compile)dnl
++pushdef([ac_link], ac_build_link)dnl
++
++save_cross_compiling=$cross_compiling
++save_ac_tool_prefix=$ac_tool_prefix
++cross_compiling=no
++ac_tool_prefix=
++
++AC_PROG_CC
++AC_PROG_CPP
++AC_EXEEXT
++
++ac_tool_prefix=$save_ac_tool_prefix
++cross_compiling=$save_cross_compiling
++
++dnl Restore the old definitions
++dnl
++popdef([ac_link])dnl
++popdef([ac_compile])dnl
++popdef([ac_cpp])dnl
++popdef([ac_cv_host_os])dnl
++popdef([ac_cv_host_vendor])dnl
++popdef([ac_cv_host_cpu])dnl
++popdef([ac_cv_host_alias])dnl
++popdef([ac_cv_host])dnl
++popdef([host_os])dnl
++popdef([host_vendor])dnl
++popdef([host_cpu])dnl
++popdef([host_alias])dnl
++popdef([host])dnl
++popdef([LDFLAGS])dnl
++popdef([CPPFLAGS])dnl
++popdef([CFLAGS])dnl
++popdef([CPP])dnl
++popdef([CC])dnl
++popdef([ac_objext])dnl
++popdef([ac_exeext])dnl
++popdef([ac_cv_objext])dnl
++popdef([ac_cv_exeext])dnl
++popdef([ac_cv_prog_cc_g])dnl
++popdef([ac_cv_prog_cc_cross])dnl
++popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_gcc])dnl
++popdef([ac_cv_prog_CPP])dnl
++
++dnl Finally, set Makefile variables
++dnl
++BUILD_EXEEXT=$ac_build_exeext
++BUILD_OBJEXT=$ac_build_objext
++AC_SUBST(BUILD_EXEEXT)dnl
++AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([CFLAGS_FOR_BUILD])dnl
++AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
++AC_SUBST([LDFLAGS_FOR_BUILD])dnl
++])
+-- 
+1.9.1
+
diff --git a/package/audit/0002-Make-zos-remote-plugin-optional.patch b/package/audit/0002-Make-zos-remote-plugin-optional.patch
new file mode 100644
index 0000000..34b6774
--- /dev/null
+++ b/package/audit/0002-Make-zos-remote-plugin-optional.patch
@@ -0,0 +1,56 @@
+From dceb46116a131564c1cfa7f069fd1a822879436f Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Thu, 26 Mar 2015 12:33:10 -0500
+Subject: [PATCH] Make zos-remote plugin optional
+
+The zos-remote plugin is meant to use LDAP authentication to verify a
+remote audit user. Add the ability to disable the plugin if the feature
+is not desired.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ audisp/plugins/Makefile.am |  6 ++++--
+ configure.ac               | 10 ++++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/audisp/plugins/Makefile.am b/audisp/plugins/Makefile.am
+index b0fa60a..2cba14b 100644
+--- a/audisp/plugins/Makefile.am
++++ b/audisp/plugins/Makefile.am
+@@ -22,8 +22,10 @@
+ 
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig
+ 
+-SUBDIRS = builtins zos-remote remote
+-#SUBDIRS = builtins zos-remote
++SUBDIRS = builtins remote
++if ENABLE_ZOS_REMOTE
++SUBDIRS += zos-remote
++endif
+ if HAVE_PRELUDE
+ SUBDIRS += prelude
+ endif
+diff --git a/configure.ac b/configure.ac
+index f29fa41..2e84b07 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -155,6 +155,16 @@ fi
+ AM_CONDITIONAL(ENABLE_LISTENER, test "x$enable_listener" != "xno")
+ AC_MSG_RESULT($enable_listener)
+ 
++#audisp zos-remote plugin
++AC_MSG_CHECKING(whether to include audisp ZOS remote plugin)
++AC_ARG_ENABLE(zos-remote,
++	      [AS_HELP_STRING([--disable-zos-remote],
++			      [Disable audisp ZOS remote plugin])],
++	      enable_zos_remote=$enableval,
++	      enable_zos_remote=yes)
++AM_CONDITIONAL(ENABLE_ZOS_REMOTE, test "x$enable_zos_remote" != "xno")
++AC_MSG_RESULT($enable_zos_remote)
++
+ #gssapi
+ AC_ARG_ENABLE(gssapi_krb5,
+ 	[AS_HELP_STRING([--enable-gssapi-krb5],[Enable GSSAPI Kerberos 5 support @<:@default=no@:>@])],
+-- 
+1.9.1
+
diff --git a/package/audit/0003-Default-ADDR_NO_RANDOMIZE-if-not-found.patch b/package/audit/0003-Default-ADDR_NO_RANDOMIZE-if-not-found.patch
new file mode 100644
index 0000000..e183c94
--- /dev/null
+++ b/package/audit/0003-Default-ADDR_NO_RANDOMIZE-if-not-found.patch
@@ -0,0 +1,44 @@
+From 6d7a35dfee10d81ddc96398749645757813802fb Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Tue, 31 Mar 2015 08:00:21 -0500
+Subject: [PATCH] Default ADDR_NO_RANDOMIZE if not found
+
+Some older toolchains do not declare ADDR_NO_RANDOMIZE. Add a check for
+it during configure and default it if it is not found.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ auparse/interpret.c | 4 ++++
+ configure.ac        | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/auparse/interpret.c b/auparse/interpret.c
+index 0dcaa9f..a9d6691 100644
+--- a/auparse/interpret.c
++++ b/auparse/interpret.c
+@@ -53,6 +53,10 @@
+ #include "auparse-defs.h"
+ #include "gen_tables.h"
+ 
++#if !HAVE_DECL_ADDR_NO_RANDOMIZE
++# define ADDR_NO_RANDOMIZE       0x0040000
++#endif
++
+ /* This is from asm/ipc.h. Copying it for now as some platforms
+  * have broken headers. */
+ #define SEMOP            1
+diff --git a/configure.ac b/configure.ac
+index 2e84b07..57aec03 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,6 +66,7 @@ AM_PROG_CC_C_O
+ AC_CHECK_DECLS([MS_DIRSYNC], [], [], [[#include <sys/mount.h>]])
+ AC_CHECK_DECLS([AUDIT_FEATURE_VERSION], [], [], [[#include <linux/audit.h>]])
+ AC_CHECK_DECLS([AUDIT_VERSION_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])
++AC_CHECK_DECLS([ADDR_NO_RANDOMIZE],,, [#include <sys/personality.h>])
+ 
+ ALLWARNS=""
+ ALLDEBUG="-g"
+-- 
+1.9.1
+
diff --git a/package/audit/0004-Do-not-call-posix_fallocate-if-unavailable.patch b/package/audit/0004-Do-not-call-posix_fallocate-if-unavailable.patch
new file mode 100644
index 0000000..4bb27a4
--- /dev/null
+++ b/package/audit/0004-Do-not-call-posix_fallocate-if-unavailable.patch
@@ -0,0 +1,47 @@
+From 3f44df90f60c692127f84de090cd5337f627e1c2 Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Wed, 1 Apr 2015 07:49:54 -0500
+Subject: [PATCH] Do not call posix_fallocate() if unavailable
+
+uClibc does not implement posix_fallocate(), and posix_fallocate() is
+mostly only an hint to the kernel that we will need such or such
+amount of space inside a file. Adding a check around the
+posix_fallocate() call so it is only called when it is available.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ audisp/plugins/remote/queue.c | 2 ++
+ configure.ac                  | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/audisp/plugins/remote/queue.c b/audisp/plugins/remote/queue.c
+index 79eebd7..971e4e4 100644
+--- a/audisp/plugins/remote/queue.c
++++ b/audisp/plugins/remote/queue.c
+@@ -215,9 +215,11 @@ static int q_open_file(struct queue *q, const char *path)
+ 			return -1;
+ 		if (q_sync(q) != 0)
+ 			return -1;
++#ifdef HAVE_POSIX_FALLOCATE
+ 		if (posix_fallocate(q->fd, 0,
+ 				    (q->num_entries + 1) * q->entry_size) != 0)
+ 			return -1;
++#endif
+ 	} else {
+ 		uint32_t file_entries;
+ 		if (full_pread(q->fd, &fh, sizeof(fh), 0) != 0)
+diff --git a/configure.ac b/configure.ac
+index 57aec03..c14ec80 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -67,6 +67,7 @@ AC_CHECK_DECLS([MS_DIRSYNC], [], [], [[#include <sys/mount.h>]])
+ AC_CHECK_DECLS([AUDIT_FEATURE_VERSION], [], [], [[#include <linux/audit.h>]])
+ AC_CHECK_DECLS([AUDIT_VERSION_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])
+ AC_CHECK_DECLS([ADDR_NO_RANDOMIZE],,, [#include <sys/personality.h>])
++AC_CHECK_FUNCS([posix_fallocate])
+ 
+ ALLWARNS=""
+ ALLDEBUG="-g"
+-- 
+1.9.1
+
diff --git a/package/audit/0005-Fix-header-detection-when-cross-compiling.patch b/package/audit/0005-Fix-header-detection-when-cross-compiling.patch
new file mode 100644
index 0000000..6d88885
--- /dev/null
+++ b/package/audit/0005-Fix-header-detection-when-cross-compiling.patch
@@ -0,0 +1,46 @@
+From ce268f342b5a921d6608b0c317734b10dc8533b0 Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Wed, 8 Apr 2015 08:49:26 -0500
+Subject: [PATCH] Fix header detection when cross compiling
+
+During the build, there is a check to see if MS_DIRSYNC is defined in
+mount.h. This check is used in gen_tables.c to see if linux/fs.h needs
+to be included. When cross compiling on a system that does not have the
+MS_DIRSYNC defined in mount.h, a compile failure is generated. To
+prevent this issue, do not check for MS_DIRSYNC in the configure and
+simply check to see if MS_DIRSYNC is defined before included linux/fs.h.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ configure.ac     | 1 -
+ lib/gen_tables.c | 2 +-
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c14ec80..e63684b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,7 +63,6 @@ AC_C_INLINE
+ AC_CHECK_SIZEOF([unsigned int])
+ AC_CHECK_SIZEOF([unsigned long])
+ AM_PROG_CC_C_O
+-AC_CHECK_DECLS([MS_DIRSYNC], [], [], [[#include <sys/mount.h>]])
+ AC_CHECK_DECLS([AUDIT_FEATURE_VERSION], [], [], [[#include <linux/audit.h>]])
+ AC_CHECK_DECLS([AUDIT_VERSION_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])
+ AC_CHECK_DECLS([ADDR_NO_RANDOMIZE],,, [#include <sys/personality.h>])
+diff --git a/lib/gen_tables.c b/lib/gen_tables.c
+index 8606a39..9f25b50 100644
+--- a/lib/gen_tables.c
++++ b/lib/gen_tables.c
+@@ -33,7 +33,7 @@
+ #include <sys/stat.h>
+ #include <sys/personality.h>
+ #include <sys/mount.h>
+-#if !HAVE_DECL_MS_DIRSYNC
++#ifndef MS_DIRSYNC
+ #include <linux/fs.h>
+ #endif
+ #include "gen_tables.h"
+-- 
+1.9.1
+
diff --git a/package/audit/Config.in b/package/audit/Config.in
new file mode 100644
index 0000000..66fceec
--- /dev/null
+++ b/package/audit/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_AUDIT
+	bool "audit"
+	# needs memory fences for internal libev
+	depends on !BR2_bfin
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The audit package contains the user space utilities for
+	  storing and searching the audit records generated by
+	  the audit subsystem in the Linux 2.6 kernel
+
+	  Note: The z/OS remote plugin is disabled in this package
+
+	  http://people.redhat.com/sgrubb/audit/
+
+comment "audit needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_bfin
+
diff --git a/package/audit/S01auditd b/package/audit/S01auditd
new file mode 100644
index 0000000..27de572
--- /dev/null
+++ b/package/audit/S01auditd
@@ -0,0 +1,99 @@
+#!/bin/sh
+#
+# auditd       This starts and stops auditd
+#
+# description: This starts the Linux Auditing System Daemon,
+#              which collects security related events in a dedicated
+#              audit log. If this daemon is turned off, audit events
+#              will be sent to syslog.
+#
+
+NAME=auditd
+DAEMON=/usr/sbin/${NAME}
+CONFIG=/etc/audit/auditd.conf
+LOCK=/var/run/${NAME}.pid
+
+start(){
+	echo -n "Initializing ${NAME}: "
+
+	# Create dir to store log files in if one doesn't exist. Create
+	# the directory with SELinux permissions if possible
+	command -v matchpathcon >/dev/null 2>&1 && \
+		mkdir -p /var/log/audit -Z `matchpathcon -n /var/log/audit` || \
+		mkdir -p /var/log/audit
+
+	# Run audit daemon executable
+	start-stop-daemon -S -q -p ${LOCK} --exec ${DAEMON}
+
+	# Load the default rules
+	test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
+
+	echo "OK"
+}
+
+stop(){
+	echo -n "Uninitializing ${NAME}: "
+
+	start-stop-daemon -K -q -p ${LOCK}
+
+	echo "OK"
+}
+
+reload(){
+	echo -n "Reloading ${NAME} configuration: "
+	if [ -e ${LOCK} ]; then
+		kill -HUP `cat ${LOCK}`
+		RETVAL=$?
+		if [ ${RETVAL} ]; then
+			echo "OK"
+		else
+			echo "FAILED"
+		fi
+	else
+		echo "FAILED: ${NAME} not started"
+		RETVAL=1
+	fi
+	return ${RETVAL}
+}
+
+rotate(){
+	echo -n "Rotating ${NAME} logs: "
+	if [ -e ${LOCK} ]; then
+		kill -USR1 `cat ${LOCK}`
+		RETVAL=$?
+		if [ ${RETVAL} ]; then
+			echo "OK"
+		else
+			echo "FAILED"
+		fi
+	else
+		echo "FAILED: ${NAME} not started"
+		RETVAL=1
+	fi
+	return ${RETVAL}
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
+		;;
+	reload)
+		reload
+		;;
+	rotate)
+		rotate
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload|rotate}"
+		exit 1
+		;;
+esac
+
+exit $?
diff --git a/package/audit/audit.hash b/package/audit/audit.hash
new file mode 100644
index 0000000..31f3ea8
--- /dev/null
+++ b/package/audit/audit.hash
@@ -0,0 +1,2 @@
+#Locally computed
+sha256	059346fa0e922faf4dcc054382b21f4845cd8c4942e82cfd0d4cd52bd2b03026	audit-2.4.1.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
new file mode 100644
index 0000000..c3ee0bb
--- /dev/null
+++ b/package/audit/audit.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# audit
+#
+################################################################################
+
+AUDIT_VERSION = 2.4.1
+AUDIT_SITE = http://people.redhat.com/sgrubb/audit/
+AUDIT_LICENSE = GPLv2
+AUDIT_LICENSE_FILES = COPYING
+
+AUDIT_INSTALL_STAGING = YES
+
+# Patching configure.ac and Makefile.am
+AUDIT_AUTORECONF = YES
+
+AUDIT_CONF_OPTS = --without-python --disable-zos-remote
+
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+AUDIT_DEPENDENCIES += libcap-ng
+AUDIT_CONF_OPTS += --with-libcap-ng=yes
+else
+AUDIT_CONF_OPTS += --with-libcap-ng=no
+endif
+
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+AUDIT_CONF_OPTS += --with-arm
+endif
+ifeq ($(BR2_aarch64),y)
+AUDIT_CONF_OPTS += --with-aarch64
+endif
+
+define AUDIT_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 package/audit/S01auditd $(TARGET_DIR)/etc/init.d/
+endef
+
+define AUDIT_INSTALL_CLEANUP
+	$(RM) -rf $(TARGET_DIR)/etc/rc.d
+	$(RM) -rf $(TARGET_DIR)/etc/sysconfig
+endef
+AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
+
+$(eval $(autotools-package))
-- 
1.9.1
