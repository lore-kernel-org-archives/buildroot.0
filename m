From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 08:23:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081020152350.C04AD3C666@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 08:23:50 -0700 (Mon, 20 Oct 2008)
New Revision: 23746

Log:
toolchain/uclibc: only use make install_headers for 0.9.29+

0.9.28.3 doesn't have install_headers, so use install_dev there.

Got broken by r23561.

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-10-20 13:57:30 UTC (rev 23745)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-10-20 15:23:50 UTC (rev 23746)
@@ -434,7 +434,11 @@
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
+ifeq ($(BR2_UCLIBC_VERSION_0_9_28_3),y)
+		headers install_dev
+else
 		headers install_headers
+endif
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
