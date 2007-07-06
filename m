From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Thu,  5 Jul 2007 21:21:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltp-testsuite
Message-ID: <20070706042123.85009A4664@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-05 21:21:22 -0700 (Thu, 05 Jul 2007)
New Revision: 19007

Log:
Fix patch filtering and add new patch to disable tests for IPv6 when not selected.


Added:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch

Modified:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk


Changeset:
Added: trunk/buildroot/package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch	                        (rev 0)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch	2007-07-06 04:21:22 UTC (rev 19007)
@@ -0,0 +1,123 @@
+diff -ur ltp-full-20070228/testcases/network/sctp/func_tests/Makefile ltp-full-20070228-patched/testcases/network/sctp/func_tests/Makefile
+--- ltp-full-20070228/testcases/network/sctp/func_tests/Makefile	2007-02-28 22:40:32.000000000 -0600
++++ ltp-full-20070228-patched/testcases/network/sctp/func_tests/Makefile	2007-07-05 22:40:08.524219814 -0500
+@@ -26,8 +26,6 @@
+ 
+ LOADLIBES += $(LIBS) -lltp -lsctputil -lsctp -lpthread
+ 
+-V6FLAGS = -DTEST_V6=1 $(CFLAGS)
+-
+ SRCS = $(wildcard *.c)
+ 
+ V4_TARGETS = test_1_to_1_accept_close test_1_to_1_addrs test_1_to_1_connect \
+@@ -42,11 +40,7 @@
+              test_sctp_sendrecvmsg test_sockopt test_tcp_style \
+              test_timetolive test_1_to_1_connectx test_connectx
+ 
+-V6_TARGETS = test_basic_v6 test_fragments_v6 test_getname_v6 \
+-             test_inaddr_any_v6 test_peeloff_v6 test_sctp_sendrecvmsg_v6 \
+-             test_sockopt_v6 test_tcp_style_v6 test_timetolive_v6
+-
+-all: $(V4_TARGETS) $(V6_TARGETS)
++all: $(V4_TARGETS)
+ 
+ test_1_to_1_accept_close: test_1_to_1_accept_close.c
+ test_1_to_1_addrs: test_1_to_1_addrs.c
+@@ -68,47 +62,19 @@
+ test_assoc_shutdown: test_assoc_shutdown.c
+ test_autoclose: test_autoclose.c
+ test_basic: test_basic.c
+-test_basic_v6: test_basic_v6.o
+ test_connect: test_connect.c
+ test_fragments: test_fragments.c
+-test_fragments_v6: test_fragments_v6.o
+ test_getname: test_getname.c
+-test_getname_v6: test_getname_v6.o
+ test_inaddr_any: test_inaddr_any.c
+-test_inaddr_any_v6: test_inaddr_any_v6.o
+ test_peeloff: test_peeloff.c
+-test_peeloff_v6: test_peeloff_v6.o
+ test_recvmsg: test_recvmsg.c
+ test_sctp_sendrecvmsg: test_sctp_sendrecvmsg.c
+-test_sctp_sendrecvmsg_v6: test_sctp_sendrecvmsg_v6.o
+ test_sockopt: test_sockopt.c
+-test_sockopt_v6: test_sockopt_v6.o
+ test_tcp_style: test_tcp_style.c
+-test_tcp_style_v6: test_tcp_style_v6.o
+ test_timetolive: test_timetolive.c
+-test_timetolive_v6: test_timetolive_v6.o
+ test_1_to_1_connectx: test_1_to_1_connectx.c
+ test_connectx: test_connectx.c
+ 
+-test_basic_v6.o: test_basic.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-test_fragments_v6.o: test_fragments.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-test_getname_v6.o: test_getname.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-test_inaddr_any_v6.o: test_inaddr_any.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-test_peeloff_v6.o: test_peeloff.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-test_sctp_sendrecvmsg_v6.o: test_sctp_sendrecvmsg.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-test_sockopt_v6.o: test_sockopt.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-test_tcp_style_v6.o: test_tcp_style.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-test_timetolive_v6.o: test_timetolive.c
+-	$(CC) -c $(V6FLAGS) -o $@ $^
+-
+ v4test: ${V4_TARGETS}
+ 	@for a in $^;                           \
+ 	do                                      \
+@@ -123,26 +89,9 @@
+ 		fi;                             \
+ 	done
+ 
+-v6test: ${V6_TARGETS}
+-	@for a in $^;                           \
+-	do                                      \
+-		echo "./$$a";                   \
+-		if ./$$a;                       \
+-		then                            \
+-			echo "$$a passes";      \
+-			echo "";                \
+-		else                            \
+-			echo "$$a fails";       \
+-			exit 1;                 \
+-		fi;                             \
+-	done
+-
+ install:
+ 	ln -f $(V4_TARGETS) ../../../bin
+-	ln -f $(V6_TARGETS) ../../../bin
+ 
+ clean:
+ 	rm -f $(V4_TARGETS)
+-	rm -f $(V6_TARGETS)
+-	rm -f ../../../bin/$(V6_TARGETS)
+ 	rm -f *.o
+diff -ur ltp-full-20070228/testcases/network/stress/ns-tools/Makefile ltp-full-20070228-patched/testcases/network/stress/ns-tools/Makefile
+--- ltp-full-20070228/testcases/network/stress/ns-tools/Makefile	2007-02-28 22:40:31.000000000 -0600
++++ ltp-full-20070228-patched/testcases/network/stress/ns-tools/Makefile	2007-07-05 22:39:27.593059603 -0500
+@@ -10,9 +10,8 @@
+ 	ns-echoclient
+ 
+ BINS=ns-tcpserver ns-tcpclient ns-udpserver ns-udpclient \
+-     ns-icmpv4_sender ns-icmpv6_sender \
++     ns-icmpv4_sender \
+      ns-udpsender \
+-     ns-icmp_redirector \
+      ns-mcast_receiver ns-igmp_querier \
+      ns-mcast_join 
+ 
+diff -ur ltp-full-20070228/tools/Makefile ltp-full-20070228-patched/tools/Makefile
+--- ltp-full-20070228/tools/Makefile	2007-02-28 22:40:41.000000000 -0600
++++ ltp-full-20070228-patched/tools/Makefile	2007-07-05 22:39:27.593059603 -0500
+@@ -1,4 +1,4 @@
+-SUBDIRS = apicmds genload netpipe-2.4 netpipe-2.4-ipv6 #top-LTP
++SUBDIRS = apicmds genload netpipe-2.4 #top-LTP
+ 
+ CFLAGS+= -Wall -I../include
+ LOADLIBES+= -L../lib -lltp

Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-07-05 17:56:24 UTC (rev 19006)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-07-06 04:21:22 UTC (rev 19007)
@@ -11,20 +11,22 @@
 LTP_TESTSUITE_DIR:=$(LTP_TESTSUITE_ROOT)/ltp-full-$(LTP_TESTSUITE_VERSION)
 
 #
-# We enable Open POSIX Testsuite if Native POSIX Threads Library (NPTL)
-# is selected. Otherwise, we filter out the patch for it.
+# Enable patches based upon different toolchain configuration options.
 #
-LTP_PATCHES:=$(subst package/ltp-testsuite/,,				 \
-	     $(wildcard package/ltp-testsuite/*.patch))
+LTP_PATCHES:=ltp-testsuite-generate-needs-bash.patch	\
+	     ltp-testsuite-sh-is-not-C-code.patch	\
+	     ltp-testsuite.patch
 
-ifneq ($(BR2_PTHREADS_NATIVE),y)
-  ifneq ($(BR2_EXT_PTHREADS_NATIVE),y)
-LTP_PATCHES:=$(filter-out ltp-testsuite-enable-openposix-for-nptl.patch, \
-	     $(LTP_PATCHES))
-  endif
+ifeq ($(BR2_PTHREADS_NATIVE),y)
+LTP_PATCHES+=ltp-testsuite-enable-openposix-for-nptl.patch
 endif
+ifeq ($(BR2_EXT_PTHREADS_NATIVE),y)
+LTP_PATCHES+=ltp-testsuite-enable-openposix-for-nptl.patch
+endif
+ifneq ($(BR2_INET_IPV6),y)
+LTP_PATCHES+=ltp-testsuite-disable-ipv6-tests.patch
+endif
 
-
 $(DL_DIR)/$(LTP_TESTSUITE_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LTP_TESTSUITE_SITE)/$(LTP_TESTSUITE_SOURCE)
 
@@ -41,10 +43,6 @@
 		-C $(LTP_TESTSUITE_DIR) all
 	touch $@
 
-sjh: $(LTP_TESTSUITE_DIR)/Makefile
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) \
-		-C $(LTP_TESTSUITE_DIR) all
-
 $(LTP_TESTSUITE_DIR)/.installed: $(LTP_TESTSUITE_DIR)/.compiled
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) ' \
