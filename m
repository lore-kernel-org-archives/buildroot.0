From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:25:49 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 4.16.0
Message-ID: <20180501192706.2020A8100F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed7f7f7129f1194d2535b04820448faa814bbfe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop uClibc-ng compatibility patch. Current uClibc-ng provides the
needed definitions.

Drop the libc-config.h musl compatibility workaround patch. iproute2
update its headers copy to current kernel version for which this
workaround is no longer needed.

Don't modify tc/Makefile to make XT_LIB_DIR get the value of
IPT_LIB_DIR. Pass the correct value directly in CFLAGS.

Add a patch removing arpd dependency on threading support.

Rename IPROUTE2_WITH_IPTABLES to IPROUTE2_DISABLE_IPTABLES which better
describes what it does.

Don't patch the configure script for the cross compiler. The CC
environment variable is enough.

Don't force the CCOPTS make variable. The CFLAGS environment variable
does the trick for target code.

Don't patch CCOPTS out of netem/Makefile. The CBUILD_CFLAGS environment
variable can pass the host CFLAGS to host code.

The ifcfg script is now POSIX shell compatible. Remove its installation
dependency on bash.

Pass installation DESTDIR in the environment. Don't force SBINDIR, DOCDIR, and
MANDIR. The default values are fine.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...musl-workaround-to-the-libc-compat.h-copy.patch | 38 --------------
 .../0001-arpd-remove-pthread-dependency.patch      | 37 ++++++++++++++
 ...s-add-local-PF_VSOCK-AF_VSOCK-definitions.patch | 58 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       | 39 +++------------
 5 files changed, 46 insertions(+), 128 deletions(-)

diff --git a/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch b/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
deleted file mode 100644
index ff362c97c2..0000000000
--- a/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 909a6f10157114e09936d2dd545175d7ed84c0fb Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 22 Dec 2016 15:26:30 +0200
-Subject: [PATCH] Add the musl workaround to the libc-compat.h copy
-
-The libc-compat.h kernel header uses glibc specific macros (__GLIBC__ and
-__USE_MISC) to solve conflicts with libc provided headers. This patch makes
-libc-compat.h work also for musl libc.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: libc-compat.h is a local copy of a kernel headers. A proper
-musl fix must go to the kernel first.
----
- include/uapi/linux/libc-compat.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
-index 9ab3ace08e2b..e768459d89f9 100644
---- a/include/uapi/linux/libc-compat.h
-+++ b/include/uapi/linux/libc-compat.h
-@@ -50,10 +50,12 @@
- #define _LIBC_COMPAT_H
- 
- /* We have included glibc headers... */
--#if defined(__GLIBC__)
-+#if 1
-+#define __USE_MISC
- 
- /* Coordinate with glibc net/if.h header. */
- #if defined(_NET_IF_H) && defined(__USE_MISC)
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
- 
- /* GLIBC headers included first so don't define anything
-  * that would already be defined. */
--- 
-2.15.0
-
diff --git a/package/iproute2/0001-arpd-remove-pthread-dependency.patch b/package/iproute2/0001-arpd-remove-pthread-dependency.patch
new file mode 100644
index 0000000000..bfc9649d35
--- /dev/null
+++ b/package/iproute2/0001-arpd-remove-pthread-dependency.patch
@@ -0,0 +1,37 @@
+From 4a4f4d491f89bdd580fdd7a901a3300cb5e9789e Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 1 May 2018 15:33:47 +0300
+Subject: [PATCH] arpd: remove pthread dependency
+
+Explicit link with pthread is not needed when linking dynamically. Even
+static link with recent libdb does not pull in the code that uses
+pthread. Finally, the configure check introduced in commit a25df4887d7
+(configure: Check for Berkeley DB for arpd compilation) does not add
+-lpthread to its link command.
+
+This change allows arpd build with toolchains that do not provide
+threads support.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: http://patchwork.ozlabs.org/patch/907031/
+
+ misc/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/Makefile b/misc/Makefile
+index 34ef6b21b4ed..b2dd6b26e2dc 100644
+--- a/misc/Makefile
++++ b/misc/Makefile
+@@ -25,7 +25,7 @@ rtacct: rtacct.c
+ 	$(QUIET_CC)$(CC) $(CFLAGS) $(LDFLAGS) -o rtacct rtacct.c $(LDLIBS) -lm
+ 
+ arpd: arpd.c
+-	$(QUIET_CC)$(CC) $(CFLAGS) -I$(DBM_INCLUDE) $(LDFLAGS) -o arpd arpd.c $(LDLIBS) -ldb -lpthread
++	$(QUIET_CC)$(CC) $(CFLAGS) -I$(DBM_INCLUDE) $(LDFLAGS) -o arpd arpd.c $(LDLIBS) -ldb
+ 
+ ssfilter.c: ssfilter.y
+ 	$(QUIET_YACC)bison ssfilter.y -o ssfilter.c
+-- 
+2.17.0
+
diff --git a/package/iproute2/0002-ss-add-local-PF_VSOCK-AF_VSOCK-definitions.patch b/package/iproute2/0002-ss-add-local-PF_VSOCK-AF_VSOCK-definitions.patch
deleted file mode 100644
index bbd1f45de9..0000000000
--- a/package/iproute2/0002-ss-add-local-PF_VSOCK-AF_VSOCK-definitions.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From ca5562864f3c45557ee96a6fd6036150066c6b58 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 15 Feb 2018 07:39:52 +0200
-Subject: [PATCH] ss: add local PF_VSOCK/AF_VSOCK definitions
-
-uclibc-ng does not provide these definitions yet. Add them locally to
-fix the build.
-
-Increase AF_MAX to cover AF_VSOCK.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: not upstreamable. uclibc-ng needs to update its Linux
-socket.h.
----
- misc/ss.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/misc/ss.c b/misc/ss.c
-index 29a250704c2d..b3f289ae358e 100644
---- a/misc/ss.c
-+++ b/misc/ss.c
-@@ -50,6 +50,14 @@
- #define BUF_CHUNK (1024 * 1024)
- #define LEN_ALIGN(x) (((x) + 1) & ~1)
- 
-+#ifndef PF_VSOCK
-+#define PF_VSOCK 40
-+#endif
-+
-+#ifndef AF_VSOCK
-+#define AF_VSOCK PF_VSOCK
-+#endif
-+
- #define DIAG_REQUEST(_req, _r)						    \
- 	struct {							    \
- 		struct nlmsghdr nlh;					    \
-@@ -298,7 +306,7 @@ static const struct filter default_dbs[MAX_DB] = {
- 	},
- };
- 
--static const struct filter default_afs[AF_MAX] = {
-+static const struct filter default_afs[AF_MAX+1] = {
- 	[AF_INET] = {
- 		.dbs    = INET_DBM,
- 		.states = SS_CONN,
-@@ -383,7 +391,7 @@ static void filter_merge_defaults(struct filter *f)
- 		if (!(default_dbs[db].families & f->families))
- 			f->families |= default_dbs[db].families;
- 	}
--	for (af = 0; af < AF_MAX; af++) {
-+	for (af = 0; af < AF_MAX+1; af++) {
- 		if (!(f->families & FAMILY_MASK(af)))
- 			continue;
- 
--- 
-2.15.1
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 630447cc71..9f808b742a 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	48d4616a99d7b609b7b795c0ae8ec57099fb0271ed89253e8772c02327798355	iproute2-4.15.0.tar.xz
+sha256	0c5c24020fd7349fe25728c5edee9fb6a1bc8a38f08e23be5c57a6301e55ee0a	iproute2-4.16.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 11db7d2c6e..319e69b93f 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.15.0
+IPROUTE2_VERSION = 4.16.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
@@ -22,57 +22,34 @@ ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 IPROUTE2_DEPENDENCIES += elfutils
 endif
 
-# If we've got iptables enable xtables support for tc
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
-define IPROUTE2_WITH_IPTABLES
-	# Makefile is busted so it never passes IPT_LIB_DIR properly
-	$(SED) "s/-DIPT/-DXT/" $(@D)/tc/Makefile
-endef
 else
-define IPROUTE2_WITH_IPTABLES
+define IPROUTE2_DISABLE_IPTABLES
 	# m_xt.so is built unconditionally
 	echo "TC_CONFIG_XT:=n" >>$(@D)/config.mk
 endef
 endif
 
-# arpd needs BerkeleyDB and links against pthread
-ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185),y)
 IPROUTE2_DEPENDENCIES += berkeleydb
-else
-define IPROUTE2_DISABLE_ARPD
-	echo "HAVE_BERKELEY_DB:=n" >> $(@D)/config.mk
-endef
-endif
-
-# ifcfg needs bash
-ifeq ($(BR2_PACKAGE_BASH),)
-define IPROUTE2_REMOVE_IFCFG
-	rm -f $(TARGET_DIR)/sbin/ifcfg
-endef
 endif
 
 define IPROUTE2_CONFIGURE_CMDS
-	$(SED) 's/gcc/$$CC $$CFLAGS/g' $(@D)/configure
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
-	$(IPROUTE2_DISABLE_ARPD)
-	$(IPROUTE2_WITH_IPTABLES)
+	$(IPROUTE2_DISABLE_IPTABLES)
 endef
 
 define IPROUTE2_BUILD_CMDS
-	$(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
-	$(TARGET_MAKE_ENV) LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) \
+	$(TARGET_MAKE_ENV) LDFLAGS="$(TARGET_LDFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS) -DXT_LIB_DIR=\\\"/usr/lib/xtables\\\"" \
+		CBUILD_CFLAGS="$(HOST_CFLAGS)" $(MAKE) V=1 LIBDB_LIBS=-lpthread \
 		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
-		CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 		SHARED_LIBS="$(if $(BR2_STATIC_LIBS),n,y)" -C $(@D)
 endef
 
 define IPROUTE2_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" \
-		SBINDIR=/sbin \
-		DOCDIR=/usr/share/doc/iproute2-$(IPROUTE2_VERSION) \
-		MANDIR=/usr/share/man install
-	$(IPROUTE2_REMOVE_IFCFG)
+	$(TARGET_MAKE_ENV) DESTDIR="$(TARGET_DIR)" $(MAKE) -C $(@D) install
 endef
 
 $(eval $(generic-package))
