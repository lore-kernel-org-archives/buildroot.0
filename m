From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 09:53:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070209175356.23EB44863B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 09:53:55 -0800 (Fri, 09 Feb 2007)
New Revision: 17843

Log:
- honor BR2_PTHREAD_DEBUG
  Stop asking any thread related questions while at it.


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-09 17:32:16 UTC (rev 17842)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-09 17:53:55 UTC (rev 17843)
@@ -149,19 +149,36 @@
 else
 	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' $(UCLIBC_DIR)/.config
 endif
-ifneq ($(BR2_PTHREADS_NONE),y)
-	$(SED) 's,# UCLIBC_HAS_THREADS is not set,UCLIBC_HAS_THREADS=y,g' $(UCLIBC_DIR)/.config
-	$(SED) 's,# PTHREADS_DEBUG_SUPPORT is not set,PTHREADS_DEBUG_SUPPORT=y,g' $(UCLIBC_DIR)/.config
+	$(SED) '/UCLIBC_HAS_THREADS/d' $(UCLIBC_DIR)/.config
+	$(SED) '/LINUXTHREADS/d' $(UCLIBC_DIR)/.config
+	$(SED) '/LINUXTHREADS_OLD/d' $(UCLIBC_DIR)/.config
+	$(SED) '/PTHREADS_DEBUG_SUPPORT/d' $(UCLIBC_DIR)/.config
+	$(SED) '/UCLIBC_HAS_THREADS_NATIVE/d' $(UCLIBC_DIR)/.config
+ifeq ($(BR2_PTHREADS_NONE),y)
+	echo "# UCLIBC_HAS_THREADS is not set" >> $(UCLIBC_DIR)/.config
+else
+	echo "UCLIBC_HAS_THREADS=y" >> $(UCLIBC_DIR)/.config
 endif
 ifeq ($(BR2_PTHREADS),y)
-	$(SED) 's,# LINUXTHREADS is not set,LINUXTHREADS=y,g' $(UCLIBC_DIR)/.config
+	echo "LINUXTHREADS=y" >> $(UCLIBC_DIR)/.config
+else
+	echo "# LINUXTHREADS is not set" >> $(UCLIBC_DIR)/.config
 endif
 ifeq ($(BR2_PTHREADS_OLD),y)
-	$(SED) 's,# LINUXTHREADS_OLD is not set,LINUXTHREADS_OLD=y,g' $(UCLIBC_DIR)/.config
+	echo "LINUXTHREADS_OLD=y" >> $(UCLIBC_DIR)/.config
+else
+	echo "# LINUXTHREADS_OLD is not set" >> $(UCLIBC_DIR)/.config
 endif
 ifeq ($(BR2_PTHREADS_NATIVE),y)
-	$(SED) 's,# UCLIBC_HAS_THREADS_NATIVE is not set,UCLIBC_HAS_THREADS_NATIVE=y,g' $(UCLIBC_DIR)/.config
+	echo "UCLIBC_HAS_THREADS_NATIVE=y" >> $(UCLIBC_DIR)/.config
+else
+	echo "# UCLIBC_HAS_THREADS_NATIVE is not set" >> $(UCLIBC_DIR)/.config
 endif
+ifeq ($(BR2_PTHREAD_DEBUG),y)
+	echo "PTHREADS_DEBUG_SUPPORT=y" >> $(UCLIBC_DIR)/.config
+else
+	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.config
+endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.config
 else
