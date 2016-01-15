From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Fri, 15 Jan 2016 15:21:48 +0300
Subject: [Buildroot] [PATCH] trousers: disable pie option on ARC
Message-ID: <1452860508-27467-1-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC gcc understands "-pie" option and attempts to generate PIE
binaries as of today PIE is not really supported for user-space
applications. So we provide option which can make relro and pie usage
optional and disable PIE detection if building for ARC. Also AUTORECONF
option should be added because of modified configure.in and Makefile.am
files.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/trousers/0002-add-pie-option.patch | 69 ++++++++++++++++++++++++++++++
 package/trousers/trousers.mk               |  8 ++++
 2 files changed, 77 insertions(+)
 create mode 100644 package/trousers/0002-add-pie-option.patch

diff --git a/package/trousers/0002-add-pie-option.patch b/package/trousers/0002-add-pie-option.patch
new file mode 100644
index 0000000..95a2f01
--- /dev/null
+++ b/package/trousers/0002-add-pie-option.patch
@@ -0,0 +1,69 @@
+Even though ARC gcc understands "-pie" option and attempts
+to generate PIE binaries as of today PIE is not really supported
+for user-space applications. Trousers configure scripts don't provide
+any options which can disable "-pie" usage. This patch provides an 
+option to make PIE usage optional.
+
+Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
+
+
+diff -Naur trousers.orig/configure.in trousers/configure.in
+--- trousers.orig/configure.in	2014-04-24 22:05:43.000000000 +0400
++++ trousers/configure.in	2016-01-15 13:15:44.486371425 +0300
+@@ -144,6 +144,18 @@
+ 	AC_MSG_ERROR(["gtk", "openssl" and "none" are the only supported gui options for trousers])
+ fi
+ 
++#"enable" options
++ AC_ARG_ENABLE(pie,
++	[AC_HELP_STRING([--enable-pie],
++			[Produce position independent executables @<:@default=yes@:>@])],
++	enable_pie=$enableval,
++	enable_pie="maybe")
++
++AC_ARG_ENABLE(relro,
++	[AC_HELP_STRING([--enable-relro],
++			[Enable relocations read-only support @<:@default=yes@:>@])],
++	enable_relro=$enableval,
++	enable_relro="maybe")
+ #
+ # The default port that the TCS daemon listens on
+ #
+@@ -383,6 +395,21 @@
+ 	localstatedir="/usr/local/var"
+ fi
+ 
++if test $enable_pie != "no"; then
++	PIE_CFLAGS="-fpie -pie"
++else
++	PIE_CFLAGS=""
++fi
++AC_SUBST([PIE_CFLAGS])
++
++if test $enable_relro != "no"; then
++	RELRO_CFLAGS="-Wl,-z,relro"
++else
++	RELRO_CFLAGS=""
++fi
++AC_SUBST([RELRO_CFLAGS])
++
++
+ AC_OUTPUT(dist/tcsd.conf \
+ 	  dist/fedora/trousers.spec \
+ 	  dist/trousers.spec \
+
+diff -Naur trousers.orig/src/tcsd/Makefile.am trousers/src/tcsd/Makefile.am
+--- trousers.orig/src/tcsd/Makefile.am	2014-04-24 22:05:44.000000000 +0400
++++ trousers/src/tcsd/Makefile.am	2016-01-15 13:15:44.486371425 +0300
+@@ -2,8 +2,7 @@
+ 
+ tcsd_CFLAGS=-DAPPID=\"TCSD\" -DVAR_PREFIX=\"@localstatedir@\" -DETC_PREFIX=\"@sysconfdir@\" -I${top_srcdir}/src/include -fPIE -DPIE
+ tcsd_LDADD=${top_builddir}/src/tcs/libtcs.a ${top_builddir}/src/tddl/libtddl.a -lpthread @CRYPTOLIB@
+-tcsd_LDFLAGS=-pie -Wl,-z,relro -Wl,-z,now
+-
++tcsd_LDFLAGS=$(PIE_CFLAGS) $(RELRO_CFLAGS)
+ tcsd_SOURCES=svrside.c tcsd_conf.c tcsd_threads.c platform.c
+ 
+ if TSS_BUILD_PS
+
+
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index 5ecab70..1397ac4 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -10,6 +10,8 @@ TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TRO
 TROUSERS_LICENSE = BSD-3c
 TROUSERS_LICENSE_FILES = LICENSE
 TROUSERS_INSTALL_STAGING = YES
+# Need autoreconf because of a patch touching configure.in and Makefile.am
+TROUSERS_AUTORECONF = YES
 TROUSERS_DEPENDENCIES = openssl
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
@@ -21,4 +23,10 @@ endif
 # workaround.
 TROUSERS_CONF_OPTS += --disable-usercheck
 
+# uClibc toolchain for ARC doesn't support PIE at the moment
+ifeq ($(BR2_arc),y)
+TROUSERS_CONF_OPTS += --disable-pie
+endif
+
+
 $(eval $(autotools-package))
-- 
2.5.0
