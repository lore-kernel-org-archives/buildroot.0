From: Darcy L. Watkins <dwatkins@tranzeo.com>
Date: Wed, 23 Jun 2010 11:25:45 -0700
Subject: [Buildroot] [May15 patch 12/12] netsnmp: disable build with
 external toolchain
In-Reply-To: <1277307031.18561.19.camel@localhost.localdomain>
References: <1277216184.23331.8.camel@localhost.localdomain>
	<1277307031.18561.19.camel@localhost.localdomain>
Message-ID: <1277317545.21423.117.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The patch below appears to get net-snmp to build OK (at least in my
environment using crosstool-ng).  It is a bit of a hack/kludge since it
is basically saying, "just in case you don't understand the --sysroot
directive, here are some redundant -I and -L directives to include with
CFLAGS and LDFLAGS to point to the staging area includes and libraries."


Regards,

Darcy

------


signed-off-by: Darcy Watkins <dwatkins@tranzeo.com>
Index: buildroot-2010.02_x86/package/Makefile.in
===================================================================
--- buildroot-2010.02_x86.orig/package/Makefile.in
+++ buildroot-2010.02_x86/package/Makefile.in
@@ -92,8 +92,10 @@ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 #########################################################################
 else
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) --sysroot $(STAGING_DIR)/
+TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
 #########################################################################
 #ifeq ($(BR2_ROOTFS_SUFFIX),)
