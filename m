From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Nov 2013 00:08:01 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: fix the SYSROOT_DIR
	mangling logic
Message-ID: <1383779283-19725-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a1d94aaa3a21911 ('toolchain-external: add support for musl C
library'), we made the following change to the SYSROOT_DIR mangling
logic:

-       SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
+       SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/(.*/)?libc\.a::'` ; \

This was needed to accomodate for musl based toolchains that don't
have libc.a in usr/lib/..., but directory in lib/... Basically, the
change makes the usr/ at the beginning optional.

However, with the very permissive (.*) matching in the middle of the
path, the change above had an unexpected consequence: any path contain
'/lib' would be truncated before this lib. As an example, Peter
reported that his builds, running from /var/lib/buildbot/ were no
longer working because the SYSROOT_DIR was decided to be /var instead
of something like
/var/lib/buildbot/buildroot/output/host/opt/ext-toolchain/arm-linux-gnueabihf/libc/.

So, this commit changes (again!) this regexp by changing (.*) to
([^/]*), the idea being that it will match only *one* path
component. Note that this intermediate (.*) directory was added in
e6e60becb008 ('external-toolchain: add support for Linaro 2012.01') to
accomodate for Linaro toolchains that have a subdirectory in their
sysroot named after the target tuple:

$ ./output/host/opt/ext-toolchain/bin/arm-linux-gnueabihf-gcc -print-file-name=libc.a
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../arm-linux-gnueabihf/libc/usr/lib/arm-linux-gnueabihf/libc.a

In addition to this, this commit also makes sure that the change
making usr/ optional is properly reported on all the instances of this
regular expression.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2722600..e669d21 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -381,7 +381,7 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
-	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/(.*/)?libc\.a::'` ; \
+	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
@@ -463,14 +463,14 @@ endif
 
 define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
-	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
+	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
 	ARCH_LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
-	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
-	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(32|64)?)/(.*/)?libc.a:\1:'` ; \
+	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::'` ; \
+	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:'` ; \
 	SUPPORT_LIB_DIR="" ; \
 	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
 		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
@@ -516,8 +516,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
 	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
 	FDPIC_LIBC_A_LOCATION=`readlink -f $$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
-	FDPIC_SYSROOT_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
-	FDPIC_LIB_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(32|64)?)/(.*/)?libc.a:\1:'` ; \
+	FDPIC_SYSROOT_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::'` ; \
+	FDPIC_LIB_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:'` ; \
 	FDPIC_SUPPORT_LIB_DIR="" ; \
 	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
 	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
-- 
1.8.1.2
