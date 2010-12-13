From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 17:27:43 +0100
Subject: [Buildroot] [PATCH 07/14] ltp-testsuite: bump version and use
	autotargets
In-Reply-To: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b83f24bcdc13acbfedd09b866a9e13e3cff59298.1292257643.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reworking ltp-testsuite is needed in order to get rid of some
thread-specific options that will be cleaned-up in the next commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in                    |   13 ++-
 ...tp-testsuite-20101031-disable-controllers.patch |   25 ++++
 .../ltp-testsuite-disable-ipv6-tests.patch         |  123 --------------------
 .../ltp-testsuite-enable-openposix-for-nptl.patch  |   33 -----
 .../ltp-testsuite-generate-needs-bash.patch        |    8 --
 .../ltp-testsuite-sched-getaffinity.patch          |   11 --
 .../ltp-testsuite-uclibc-syscalls.patch            |   11 --
 package/ltp-testsuite/ltp-testsuite.mk             |   68 +----------
 8 files changed, 40 insertions(+), 252 deletions(-)
 create mode 100644 package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-enable-openposix-for-nptl.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index efe0db7..2ab4134 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,7 +1,16 @@
-config BR2_PACKAGE_LTP-TESTSUITE
+config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
-	depends on BROKEN
+	depends on !BR2_PTHREADS_NONE
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
+	  The LTP testsuite uses several functions that are considered
+	  obsolete, such as sigset() and others. Therefore, the LTP
+	  testsuite does not build with Buildroot's default uClibc
+	  configuration, and options such as
+	  UCLIBC_HAS_OBSOLETE_BSD_SIGNAL are needed.
+
 	  http://ltp.sourceforge.net/
+
+comment "ltp-testsuite requires a toolchain with thread support"
+	depends on BR2_PTHREADS_NONE
diff --git a/package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch b/package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch
new file mode 100644
index 0000000..57d6038
--- /dev/null
+++ b/package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch
@@ -0,0 +1,25 @@
+Disable controllers testcases
+
+The cpuset controllers testcases do not build due to bug
+https://sourceforge.net/tracker/?func=detail&aid=3126942&group_id=3382&atid=103382. Disabling
+just the cpuset controllers do not seem to be easily possible, and
+those controller features are rarely used on embedded systems anyway.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ testcases/kernel/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: ltp-testsuite-20101031/testcases/kernel/Makefile
+===================================================================
+--- ltp-testsuite-20101031.orig/testcases/kernel/Makefile
++++ ltp-testsuite-20101031/testcases/kernel/Makefile
+@@ -28,7 +28,7 @@
+ #
+ # KEEP THIS LIST ALPHABETIZED PLEASE!
+ ifneq ($(UCLINUX),1)
+-SUBDIRS		:= containers connectors controllers fs hotplug io ipc mem \
++SUBDIRS		:= containers connectors fs hotplug io ipc mem \
+ 		   numa performance_counters power_management pty sched \
+ 		   security syscalls timers tracing
+ else
diff --git a/package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch b/package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch
deleted file mode 100644
index 6f1a927..0000000
--- a/package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-diff -ur ltp-full-20070228/testcases/network/sctp/func_tests/Makefile ltp-full-20070228-patched/testcases/network/sctp/func_tests/Makefile
---- ltp-full-20070228/testcases/network/sctp/func_tests/Makefile	2007-02-28 22:40:32.000000000 -0600
-+++ ltp-full-20070228-patched/testcases/network/sctp/func_tests/Makefile	2007-07-05 22:40:08.524219814 -0500
-@@ -26,8 +26,6 @@
- 
- LOADLIBES += $(LIBS) -lltp -lsctputil -lsctp -lpthread
- 
--V6FLAGS = -DTEST_V6=1 $(CFLAGS)
--
- SRCS = $(wildcard *.c)
- 
- V4_TARGETS = test_1_to_1_accept_close test_1_to_1_addrs test_1_to_1_connect \
-@@ -42,11 +40,7 @@
-              test_sctp_sendrecvmsg test_sockopt test_tcp_style \
-              test_timetolive test_1_to_1_connectx test_connectx
- 
--V6_TARGETS = test_basic_v6 test_fragments_v6 test_getname_v6 \
--             test_inaddr_any_v6 test_peeloff_v6 test_sctp_sendrecvmsg_v6 \
--             test_sockopt_v6 test_tcp_style_v6 test_timetolive_v6
--
--all: $(V4_TARGETS) $(V6_TARGETS)
-+all: $(V4_TARGETS)
- 
- test_1_to_1_accept_close: test_1_to_1_accept_close.c
- test_1_to_1_addrs: test_1_to_1_addrs.c
-@@ -68,47 +62,19 @@
- test_assoc_shutdown: test_assoc_shutdown.c
- test_autoclose: test_autoclose.c
- test_basic: test_basic.c
--test_basic_v6: test_basic_v6.o
- test_connect: test_connect.c
- test_fragments: test_fragments.c
--test_fragments_v6: test_fragments_v6.o
- test_getname: test_getname.c
--test_getname_v6: test_getname_v6.o
- test_inaddr_any: test_inaddr_any.c
--test_inaddr_any_v6: test_inaddr_any_v6.o
- test_peeloff: test_peeloff.c
--test_peeloff_v6: test_peeloff_v6.o
- test_recvmsg: test_recvmsg.c
- test_sctp_sendrecvmsg: test_sctp_sendrecvmsg.c
--test_sctp_sendrecvmsg_v6: test_sctp_sendrecvmsg_v6.o
- test_sockopt: test_sockopt.c
--test_sockopt_v6: test_sockopt_v6.o
- test_tcp_style: test_tcp_style.c
--test_tcp_style_v6: test_tcp_style_v6.o
- test_timetolive: test_timetolive.c
--test_timetolive_v6: test_timetolive_v6.o
- test_1_to_1_connectx: test_1_to_1_connectx.c
- test_connectx: test_connectx.c
- 
--test_basic_v6.o: test_basic.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--test_fragments_v6.o: test_fragments.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--test_getname_v6.o: test_getname.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--test_inaddr_any_v6.o: test_inaddr_any.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--test_peeloff_v6.o: test_peeloff.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--test_sctp_sendrecvmsg_v6.o: test_sctp_sendrecvmsg.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--test_sockopt_v6.o: test_sockopt.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--test_tcp_style_v6.o: test_tcp_style.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--test_timetolive_v6.o: test_timetolive.c
--	$(CC) -c $(V6FLAGS) -o $@ $^
--
- v4test: ${V4_TARGETS}
- 	@for a in $^;                           \
- 	do                                      \
-@@ -123,26 +89,9 @@
- 		fi;                             \
- 	done
- 
--v6test: ${V6_TARGETS}
--	@for a in $^;                           \
--	do                                      \
--		echo "./$$a";                   \
--		if ./$$a;                       \
--		then                            \
--			echo "$$a passes";      \
--			echo "";                \
--		else                            \
--			echo "$$a fails";       \
--			exit 1;                 \
--		fi;                             \
--	done
--
- install:
- 	ln -f $(V4_TARGETS) ../../../bin
--	ln -f $(V6_TARGETS) ../../../bin
- 
- clean:
- 	rm -f $(V4_TARGETS)
--	rm -f $(V6_TARGETS)
--	rm -f ../../../bin/$(V6_TARGETS)
- 	rm -f *.o
-diff -ur ltp-full-20070228/testcases/network/stress/ns-tools/Makefile ltp-full-20070228-patched/testcases/network/stress/ns-tools/Makefile
---- ltp-full-20070228/testcases/network/stress/ns-tools/Makefile	2007-02-28 22:40:31.000000000 -0600
-+++ ltp-full-20070228-patched/testcases/network/stress/ns-tools/Makefile	2007-07-05 22:39:27.593059603 -0500
-@@ -10,9 +10,8 @@
- 	ns-echoclient
- 
- BINS=ns-tcpserver ns-tcpclient ns-udpserver ns-udpclient \
--     ns-icmpv4_sender ns-icmpv6_sender \
-+     ns-icmpv4_sender \
-      ns-udpsender \
--     ns-icmp_redirector \
-      ns-mcast_receiver ns-igmp_querier \
-      ns-mcast_join 
- 
-diff -ur ltp-full-20070228/tools/Makefile ltp-full-20070228-patched/tools/Makefile
---- ltp-full-20070228/tools/Makefile	2007-02-28 22:40:41.000000000 -0600
-+++ ltp-full-20070228-patched/tools/Makefile	2007-07-05 22:39:27.593059603 -0500
-@@ -1,4 +1,4 @@
--SUBDIRS = apicmds genload netpipe-2.4 netpipe-2.4-ipv6 #top-LTP
-+SUBDIRS = apicmds genload netpipe-2.4 #top-LTP
- 
- CFLAGS+= -Wall -I../include
- LOADLIBES+= -L../lib -lltp
diff --git a/package/ltp-testsuite/ltp-testsuite-enable-openposix-for-nptl.patch b/package/ltp-testsuite/ltp-testsuite-enable-openposix-for-nptl.patch
deleted file mode 100644
index ebb888c..0000000
--- a/package/ltp-testsuite/ltp-testsuite-enable-openposix-for-nptl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-diff -ur ltp-full-20060615/testcases/Makefile ltp-full-20060615-patched/testcases/Makefile
---- ltp-full-20060615/testcases/Makefile	2006-01-31 08:48:38.000000000 -0600
-+++ ltp-full-20060615-patched/testcases/Makefile	2006-07-04 22:20:40.298850250 -0500
-@@ -1,4 +1,4 @@
--SUBDIRS = `ls */Makefile | sed "s/Makefile//g" | grep -v open | grep -v pounder | grep -v DOTS`
-+SUBDIRS = `ls */Makefile | sed "s/Makefile//g" | grep -v open_hpi | grep -v pounder | grep -v DOTS`
- UCLINUX_SUBDIRS = kernel
- 
- all:
-diff -ur ltp-full-20060615/testcases/open_posix_testsuite/LDFLAGS ltp-full-20060615-patched/testcases/open_posix_testsuite/LDFLAGS
---- ltp-full-20060615/testcases/open_posix_testsuite/LDFLAGS	2005-06-03 11:29:49.000000000 -0500
-+++ ltp-full-20060615-patched/testcases/open_posix_testsuite/LDFLAGS	2006-07-04 22:21:34.322226500 -0500
-@@ -14,3 +14,5 @@
- # allow for the NPTL-specific compilation (used in some test cases)
- # Note: this sometimes require the package nptl-devel.*.rpm to be installed.
- #-I /usr/include/nptl -L /usr/lib/nptl -D_XOPEN_SOURCE=600 -lpthread -lrt -lm
-+
-+-D_XOPEN_SOURCE=600 -lpthread -lrt -lm -D_GNU_SOURCE
-diff -ur ltp-full-20060615/testcases/open_posix_testsuite/Makefile ltp-full-20060615-patched/testcases/open_posix_testsuite/Makefile
---- ltp-full-20060615/testcases/open_posix_testsuite/Makefile	2006-05-21 18:38:52.000000000 -0500
-+++ ltp-full-20060615-patched/testcases/open_posix_testsuite/Makefile	2006-07-04 22:22:16.660872500 -0500
-@@ -45,7 +45,10 @@
- TIMEOUT = $(top_builddir)/t0 $(TIMEOUT_VAL)
- 
- 
--all: build-tests run-tests 
-+all: build-tests $(top_builddir)/t0
-+
-+install:
-+	@echo " "
- 
- build-tests: $(BUILD_TESTS:.c=.test)
- run-tests: $(RUN_TESTS:.test=.run-test)
diff --git a/package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch b/package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch
deleted file mode 100644
index 1f28956..0000000
--- a/package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch
+++ /dev/null
@@ -1,8 +0,0 @@
---- ltp-full-20061121/testcases/network/generate.sh.orig	2006-12-07 22:21:56.000000000 -0700
-+++ ltp-full-20061121/testcases/network/generate.sh	2006-12-07 22:22:05.000000000 -0700
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- #   Copyright (c) International Business Machines  Corp., 2001
- #
diff --git a/package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch b/package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch
deleted file mode 100644
index 9e4a9d8..0000000
--- a/package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- ltp-full-20090630/testcases/kernel/syscalls/sched_getaffinity/Makefile	2009-06-15 19:38:04.000000000 +0100
-+++ ltp-full-20090630.mod/testcases/kernel/syscalls/sched_getaffinity/Makefile	2009-07-02 15:02:33.000000000 +0100
-@@ -16,7 +16,7 @@
- #  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- #
- 
--CFLAGS += -I../../../../include -Wall
-+CFLAGS += -I../../../../include -Wall -D_GNU_SOURCE
- LDLIBS += -L../../../../lib -lltp
- 
- SRCS    = $(wildcard *.c)
diff --git a/package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch b/package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch
deleted file mode 100644
index 866a56c..0000000
--- a/package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- ltp-full-20090630/testcases/kernel/syscalls/Makefile	2009-02-26 11:37:28.000000000 +0000
-+++ ltp-full-20090630.mod/testcases/kernel/syscalls/Makefile	2009-07-02 14:57:30.000000000 +0100
-@@ -25,7 +25,7 @@
- #
- # Commented this out since there are directories here we don't want built by default
- #
--SUBDIR = `ls */Makefile | sed "s/Makefile//g"` 
-+SUBDIR = `ls */Makefile | sed "s/Makefile//g" | grep -vE "^clock_nanosleep|quotactl|sched_getaffinity|sigreturn|unshare"` 
- UCLINUX_SUBDIR = `ls */Makefile | sed "s/Makefile//g" | grep -vE "^fork|epoll|capget|capset|chmod|chown|llseek|nftw|clone|profil|getcontext|remap_file_pages"`
- 
- all:
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 7be12fd..8f2a986 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -3,68 +3,8 @@
 # ltp-testsuite
 #
 #############################################################
-LTP_TESTSUITE_VERSION:=20090630
-LTP_TESTSUITE_SOURCE:=ltp-full-$(LTP_TESTSUITE_VERSION).tgz
-LTP_TESTSUITE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
-LTP_TESTSUITE_CAT:=$(ZCAT)
-LTP_TESTSUITE_ROOT:=$(TARGET_DIR)/root
-LTP_TESTSUITE_DIR:=$(LTP_TESTSUITE_ROOT)/ltp-full-$(LTP_TESTSUITE_VERSION)
+LTP_TESTSUITE_VERSION = 20101031
+LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
+LTP_TESTSUITE_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
 
-#
-# Enable patches based upon different toolchain configuration options.
-#
-LTP_PATCHES:=ltp-testsuite-generate-needs-bash.patch \
-	     ltp-testsuite-sh-is-not-C-code.patch \
-	     ltp-testsuite-sched-getaffinity.patch \
-	     ltp-testsuite-uclibc-syscalls.patch
-
-ifeq ($(BR2_PTHREADS_NATIVE),y)
-LTP_PATCHES+=ltp-testsuite-enable-openposix-for-nptl.patch
-endif
-ifeq ($(BR2_EXT_PTHREADS_NATIVE),y)
-LTP_PATCHES+=ltp-testsuite-enable-openposix-for-nptl.patch
-endif
-ifneq ($(BR2_INET_IPV6),y)
-LTP_PATCHES+=ltp-testsuite-disable-ipv6-tests.patch
-endif
-
-$(DL_DIR)/$(LTP_TESTSUITE_SOURCE):
-	 $(call DOWNLOAD,$(LTP_TESTSUITE_SITE),$(LTP_TESTSUITE_SOURCE))
-
-ltp-testsuite-source: $(DL_DIR)/$(LTP_TESTSUITE_SOURCE)
-
-$(LTP_TESTSUITE_DIR)/Makefile: $(DL_DIR)/$(LTP_TESTSUITE_SOURCE)
-	mkdir -p $(LTP_TESTSUITE_ROOT)
-	$(LTP_TESTSUITE_CAT) $(DL_DIR)/$(LTP_TESTSUITE_SOURCE) | tar -C $(LTP_TESTSUITE_ROOT) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LTP_TESTSUITE_DIR) package/ltp-testsuite/ $(LTP_PATCHES)
-	touch -c $@
-
-$(LTP_TESTSUITE_DIR)/.compiled: $(LTP_TESTSUITE_DIR)/Makefile
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) \
-		-C $(LTP_TESTSUITE_DIR) all
-	touch $@
-
-$(LTP_TESTSUITE_DIR)/.installed: $(LTP_TESTSUITE_DIR)/.compiled
-	# Use fakeroot to pretend to do 'make install' as root
-	echo '$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) ' \
-			'-C $(LTP_TESTSUITE_DIR) install' \
-			> $(BUILD_DIR)/.fakeroot.ltp
-	touch $@
-
-ltp-testsuite: host-fakeroot $(LTP_TESTSUITE_DIR)/.installed
-
-ltp-testsuite-clean:
-	-$(MAKE) -C $(LTP_TESTSUITE_DIR) clean
-
-ltp-testsuite-dirclean:
-	rm -rf $(LTP_TESTSUITE_DIR)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LTP-TESTSUITE),y)
-TARGETS+=ltp-testsuite
-endif
+$(eval $(call AUTOTARGETS,package,ltp-testsuite))
\ No newline at end of file
-- 
1.7.0.4
