From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 22:25:30 +0100
Subject: [Buildroot] [PATCH v2 8/8] uclibc: remove version selection
In-Reply-To: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453929930-18215-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we now only support uClibc-ng, remove the version selection from
the uclibc package.

Note that the BR2_UCLIBC_VERSION_SUPPORTS_* hidden booleans, which
were only used to allow each uClibc version to specify which thread
implementation they support and on which architecture are removed. Now
such architecture dependencies are directly encoded in the "Thread
library implementation" choice.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 41 +++++------------------------------------
 package/uclibc/uclibc.mk | 11 +++--------
 2 files changed, 8 insertions(+), 44 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 452043d..16bf89c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -7,38 +7,9 @@ config BR2_PACKAGE_UCLIBC
 
 comment "uClibc Options"
 
-config BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
-	bool
-
-config BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
-	bool
-
-config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
-	bool
-
-choice
-	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_NG
-	help
-	  Select the version of uClibc you wish to use.
-
-	config BR2_UCLIBC_VERSION_NG
-		bool "uClibc-ng"
-		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS if BR2_m68k
-		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
-		       if BR2_m68k || BR2_arm || BR2_armeb
-		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
-		       if !BR2_m68k && !BR2_x86_i386
-
-endchoice
-
-config BR2_UCLIBC_VERSION_STRING
-	string
-	default "1.0.11"		if BR2_UCLIBC_VERSION_NG
-
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
-	default "package/uclibc/uClibc-ng.config" if BR2_UCLIBC_VERSION_NG
+	default "package/uclibc/uClibc-ng.config"
 	help
 	  Some people may wish to use their own modified uClibc configuration
 	  file and will specify their config file location with this option.
@@ -76,9 +47,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if BR2_UCLIBC_VERSION_SUPPORTS_NPTL
-	default BR2_PTHREADS_OLD if BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
-	default BR2_PTHREADS if BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
+	default BR2_PTHREADS_NATIVE
 	help
 	  Use this option to select the thread library implementation
 	  that should be used in your toolchain.
@@ -89,18 +58,18 @@ choice
 	config BR2_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
+		depends on BR2_m68k
 
 	config BR2_PTHREADS_OLD
 		bool "linuxthreads (stable/old)"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
+		depends on BR2_m68k || BR2_arm || BR2_armeb
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-		depends on BR2_UCLIBC_VERSION_SUPPORTS_NPTL
+		depends on !BR2_m68k && !BR2_x86_i386
 endchoice
 
 config BR2_PTHREAD_DEBUG
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 44b8a97..6b05181 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,16 +4,11 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = $(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
-UCLIBC_SOURCE ?= uClibc-$(UCLIBC_VERSION).tar.bz2
+UCLIBC_VERSION = 1.0.11
+UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
+UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
 UCLIBC_LICENSE_FILES = COPYING.LIB
-
-ifeq ($(BR2_UCLIBC_VERSION_NG),y)
-UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
-UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
-endif
-
 UCLIBC_INSTALL_STAGING = YES
 
 # uclibc is part of the toolchain so disable the toolchain dependency
-- 
2.6.4
