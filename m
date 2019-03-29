From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Mar 2019 18:25:27 +0100
Subject: [Buildroot] [PATCH 1/2] package/quota: bump to version 4.05
Message-ID: <20190329172528.22787-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add COPYING and its hash to license files
- Drop all patches (not needed anymore or already in version)
- Drop autoreconf
- Drop --disable-strip-binaries (not available anymore)
- Drop all "hacks" as package now use pkg-config and automake

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quota/0001-tools-getrpcbynumber.patch |  42 ----
 package/quota/0002-fix-static-linking.patch   |  55 -----
 .../quota/0003-remove-non-posix-types.patch   | 200 ------------------
 package/quota/0004-import-sys-cdefs.patch     |  18 --
 package/quota/0005-include-fcntl.patch        |  20 --
 package/quota/quota.hash                      |  10 +-
 package/quota/quota.mk                        |  25 +--
 7 files changed, 11 insertions(+), 359 deletions(-)
 delete mode 100644 package/quota/0001-tools-getrpcbynumber.patch
 delete mode 100644 package/quota/0002-fix-static-linking.patch
 delete mode 100644 package/quota/0003-remove-non-posix-types.patch
 delete mode 100644 package/quota/0004-import-sys-cdefs.patch
 delete mode 100644 package/quota/0005-include-fcntl.patch

diff --git a/package/quota/0001-tools-getrpcbynumber.patch b/package/quota/0001-tools-getrpcbynumber.patch
deleted file mode 100644
index 899db914f0..0000000000
--- a/package/quota/0001-tools-getrpcbynumber.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-allow usage of getrpcbynumber() instead of getrpcbynumber_r()
-
-libtirpc does not implement the reentrant function getrpcbynumber_r(),
-so allow quota to use the non-reentrant version getrpcbynumber(). This
-should not be a problem as quota tools are not multi-threaded.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -182,6 +182,12 @@
- AC_C_CONST
- AC_C_INLINE
- 
-+AC_CHECK_FUNCS([getrpcbynumber getrpcbynumber_r])
-+
-+if test "$ac_cv_func_getrpcbynumber_r" != "yes" -a "$ac_cv_func_getrpcbynumber" != "yes"; then
-+   AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
-+fi
-+
- AC_ARG_ENABLE(rpc,
- 	[  --enable-rpc=[yes/no]           Enable RPC support [default=yes].],
- 	,
-Index: b/svc_socket.c
-===================================================================
---- a/svc_socket.c
-+++ b/svc_socket.c
-@@ -55,7 +55,12 @@
- 	addr.sin_family = AF_INET;
- 
- 	if (!port) {
-+#if HAVE_GETRPCBYNUMBER_R
- 		ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof(rpcdata), &rpcp);
-+#else
-+		rpcp = getrpcbynumber(number);
-+		ret = 0;
-+#endif
- 		if (ret == 0 && rpcp != NULL) {
- 			/* First try name */
- 			ret = getservbyname_r(rpcp->r_name, proto, &servbuf, servdata,
diff --git a/package/quota/0002-fix-static-linking.patch b/package/quota/0002-fix-static-linking.patch
deleted file mode 100644
index fd73f64eb6..0000000000
--- a/package/quota/0002-fix-static-linking.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Use $(LIBS) properly
-
-This patch makes sure the quota build system uses $(LIBS) where
-appropriate, so that it can be used to link with additional libraries,
-which is needed when linking statically.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile.in
-===================================================================
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -105,30 +105,40 @@
- 	-$(INSTALL) -m $(DEF_MAN_MODE) *.8 $(ROOTDIR)$(mandir)/man8
- 
- quotaon: quotaon.o quotaon_xfs.o $(LIBOBJS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- quotacheck: quotacheck.o quotacheck_v1.o quotacheck_v2.o quotaops.o $(LIBOBJS)
--	$(CC) $(LDFLAGS) -o $@ $^ $(EXT2LIBS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(EXT2LIBS) $(LIBS)
- 
- quota: quota.o quotaops.o $(LIBOBJS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- quotasync: quotasync.o $(LIBOBJS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- quot: quot.o $(LIBOBJS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- repquota: repquota.o $(LIBOBJS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- warnquota: warnquota.o $(LIBOBJS)
--	$(CC) $(LDFLAGS) -o $@ $^ $(LDAPLIBS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LDAPLIBS) $(LIBS)
- 
- quotastats: quotastats.o common.o pot.o
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- xqmstats: xqmstats.o common.o pot.o
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- edquota: edquota.o quotaops.o $(LIBOBJS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- setquota: setquota.o quotaops.o $(LIBOBJS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- convertquota: convertquota.o $(LIBOBJS)
-+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- rpc.rquotad: rquota_server.o rquota_svc.o svc_socket.o $(LIBOBJS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
diff --git a/package/quota/0003-remove-non-posix-types.patch b/package/quota/0003-remove-non-posix-types.patch
deleted file mode 100644
index 869c85f23e..0000000000
--- a/package/quota/0003-remove-non-posix-types.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-Use proper C99 integer types
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Thomas: borrowed from OpenEmbedded.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: quota-tools/bylabel.c
-===================================================================
---- quota-tools.orig/bylabel.c
-+++ quota-tools/bylabel.c
-@@ -20,6 +20,7 @@
- #include <ctype.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <stdint.h>
- 
- #include "bylabel.h"
- #include "common.h"
-@@ -37,32 +38,32 @@ static struct uuidCache_s {
- 
- #define EXT2_SUPER_MAGIC	0xEF53
- struct ext2_super_block {
--	u_char s_dummy1[56];
--	u_char s_magic[2];
--	u_char s_dummy2[46];
--	u_char s_uuid[16];
--	u_char s_volume_name[16];
-+	uint8_t s_dummy1[56];
-+	uint8_t s_magic[2];
-+	uint8_t s_dummy2[46];
-+	uint8_t s_uuid[16];
-+	uint8_t s_volume_name[16];
- };
- 
--#define ext2magic(s)	((uint) s.s_magic[0] + (((uint) s.s_magic[1]) << 8))
-+#define ext2magic(s)	((uint32_t) s.s_magic[0] + (((uint32_t) s.s_magic[1]) << 8))
- 
- #define XFS_SUPER_MAGIC "XFSB"
- #define XFS_SUPER_MAGIC2 "BSFX"
- struct xfs_super_block {
--	u_char s_magic[4];
--	u_char s_dummy[28];
--	u_char s_uuid[16];
--	u_char s_dummy2[60];
--	u_char s_fsname[12];
-+	uint8_t s_magic[4];
-+	uint8_t s_dummy[28];
-+	uint8_t s_uuid[16];
-+	uint8_t s_dummy2[60];
-+	uint8_t s_fsname[12];
- };
- 
- #define REISER_SUPER_MAGIC	"ReIsEr2Fs"
- struct reiserfs_super_block {
--	u_char s_dummy1[52];
--	u_char s_magic[10];
--	u_char s_dummy2[22];
--	u_char s_uuid[16];
--	u_char s_volume_name[16];
-+	uint8_t s_dummy1[52];
-+	uint8_t s_magic[10];
-+	uint8_t s_dummy2[22];
-+	uint8_t s_uuid[16];
-+	uint8_t s_volume_name[16];
- };
- 
- static inline unsigned short swapped(unsigned short a)
-@@ -222,7 +223,7 @@ static char *get_spec_by_x(int n, const
- 	return NULL;
- }
- 
--static u_char fromhex(char c)
-+static uint8_t fromhex(char c)
- {
- 	if (isdigit(c))
- 		return (c - '0');
-@@ -234,7 +235,7 @@ static u_char fromhex(char c)
- 
- static char *get_spec_by_uuid(const char *s)
- {
--	u_char uuid[16];
-+	uint8_t uuid[16];
- 	int i;
- 
- 	if (strlen(s) != 36 || s[8] != '-' || s[13] != '-' || s[18] != '-' || s[23] != '-')
-Index: quota-tools/quot.c
-===================================================================
---- quota-tools.orig/quot.c
-+++ quota-tools/quot.c
-@@ -47,6 +47,7 @@
- #include <utmp.h>
- #include <pwd.h>
- #include <grp.h>
-+#include <stdint.h>
- 
- #include "pot.h"
- #include "quot.h"
-@@ -56,8 +57,8 @@
- #include "quotasys.h"
- 
- #define	TSIZE	500
--static __uint64_t sizes[TSIZE];
--static __uint64_t overflow;
-+static uint64_t sizes[TSIZE];
-+static uint64_t overflow;
- 
- static int aflag;
- static int cflag;
-@@ -72,7 +73,7 @@ static time_t now;
- char *progname;
- 
- static void mounttable(void);
--static char *idname(__uint32_t, int);
-+static char *idname(uint32_t, int);
- static void report(const char *, const char *, int);
- static void creport(const char *, const char *);
- 
-@@ -173,7 +174,7 @@ static int qcmp(du_t * p1, du_t * p2)
- static void creport(const char *file, const char *fsdir)
- {
- 	int i;
--	__uint64_t t = 0;
-+	uint64_t t = 0;
- 
- 	printf(_("%s (%s):\n"), file, fsdir);
- 	for (i = 0; i < TSIZE - 1; i++)
-@@ -219,7 +220,7 @@ static void report(const char *file, con
- 	}
- }
- 
--static idcache_t *getnextent(int type, __uint32_t id, int byid)
-+static idcache_t *getnextent(int type, uint32_t id, int byid)
- {
- 	struct passwd *pw;
- 	struct group  *gr;
-@@ -240,7 +241,7 @@ static idcache_t *getnextent(int type, _
- 	return &idc;
- }
- 
--static char *idname(__uint32_t id, int type)
-+static char *idname(uint32_t id, int type)
- {
- 	idcache_t *ncp, *idp;
- 	static idcache_t nc[2][NID];
-@@ -286,8 +287,8 @@ static void acctXFS(xfs_bstat_t *p)
- {
- 	register du_t *dp;
- 	du_t **hp;
--	__uint64_t size;
--	__uint32_t i, id;
-+	uint64_t size;
-+	uint32_t i, id;
- 
- 	if ((p->bs_mode & S_IFMT) == 0)
- 		return;
-Index: quota-tools/quot.h
-===================================================================
---- quota-tools.orig/quot.h
-+++ quota-tools/quot.h
-@@ -35,18 +35,18 @@
- #define	SEC24HR	(60*60*24)	/* seconds per day */
- 
- typedef struct {
--	__uint32_t id;
-+	uint32_t id;
- 	char name[UT_NAMESIZE + 1];
- } idcache_t;
- 
- typedef struct du {
- 	struct du *next;
--	__uint64_t blocks;
--	__uint64_t blocks30;
--	__uint64_t blocks60;
--	__uint64_t blocks90;
--	__uint64_t nfiles;
--	__uint32_t id;
-+	uint64_t blocks;
-+	uint64_t blocks30;
-+	uint64_t blocks60;
-+	uint64_t blocks90;
-+	uint64_t nfiles;
-+	uint32_t id;
- } du_t;
- 
- #define	NDU	60000
-Index: quota-tools/rquota_server.c
-===================================================================
---- quota-tools.orig/rquota_server.c
-+++ quota-tools/rquota_server.c
-@@ -60,7 +60,7 @@ extern char nfs_pseudoroot[PATH_MAX];
-  */
- extern struct authunix_parms *unix_cred;
- 
--int in_group(gid_t * gids, u_int len, gid_t gid)
-+int in_group(gid_t * gids, uint32_t len, gid_t gid)
- {
- 	gid_t *gidsp = gids + len;
- 
diff --git a/package/quota/0004-import-sys-cdefs.patch b/package/quota/0004-import-sys-cdefs.patch
deleted file mode 100644
index 9acd1fe4f9..0000000000
--- a/package/quota/0004-import-sys-cdefs.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Add missing <sys/cdefs.h> include
-
-quota.h uses the __P definition, so it must include <sys/cdefs.h>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/quota.h
-===================================================================
---- a/quota.h
-+++ b/quota.h
-@@ -2,6 +2,7 @@
- #define GUARD_QUOTA_H
- 
- #include <sys/types.h>
-+#include <sys/cdefs.h>
- 
- typedef u_int32_t qid_t;	/* Type in which we store ids in memory */
- typedef int64_t qsize_t;	/* Type in which we store size limitations */
diff --git a/package/quota/0005-include-fcntl.patch b/package/quota/0005-include-fcntl.patch
deleted file mode 100644
index fe7ea98831..0000000000
--- a/package/quota/0005-include-fcntl.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Include <fcntl.h> to get loff_t definition
-
-Fixes the following build issue with musl:
-
-dqblk_v2.h:32:2: error: unknown type name ?loff_t?
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/dqblk_v2.h
-===================================================================
---- a/dqblk_v2.h
-+++ b/dqblk_v2.h
-@@ -8,6 +8,7 @@
- #define GUARD_DQBLK_V2_H
- 
- #include <sys/types.h>
-+#include <fcntl.h>
- #include "quota_tree.h"
- 
- #define Q_V2_GETQUOTA	0x0D00	/* Get limits and usage */
diff --git a/package/quota/quota.hash b/package/quota/quota.hash
index 5e49693646..dc58b2842c 100644
--- a/package/quota/quota.hash
+++ b/package/quota/quota.hash
@@ -1,3 +1,7 @@
-# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.01/ (click on info button)
-md5	5c2c31e321d2e1322ce12d69ae5c66d6	quota-4.01.tar.gz
-sha1	64d2ab8b039cfea1aa4bd9e77e8c373488a7f0bf	quota-4.01.tar.gz
+# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.05/ (click on info button)
+md5	1c1dbd2cd3d680ccac661239b067e147	quota-4.05.tar.gz
+sha1	d23711f3b204e0a86b8378c32545c95fb149168d	quota-4.05.tar.gz
+
+#?Locally calculated
+sha256	ef3b5b5d1014ed1344b46c1826145e20cbef8db967b522403c9a060761cf7ab9	quota-4.05.tar.gz
+sha256	35b2d9797b83bce16076da9c3273f264f50b8d02f492ee32cd4c51ba6897bceb	COPYING
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 38e18a60c2..46ef243ecc 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -4,41 +4,24 @@
 #
 ################################################################################
 
-QUOTA_VERSION = 4.01
+QUOTA_VERSION = 4.05
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
-QUOTA_AUTORECONF = YES
 QUOTA_LICENSE = GPL-2.0+
-QUOTA_CONF_OPTS = --disable-strip-binaries
+QUOTA_LICENSE_FILES = COPYING
 QUOTA_LIBS = $(TARGET_NLS_LIBS)
 
-QUOTA_CFLAGS = $(TARGET_CFLAGS)
-
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
-QUOTA_DEPENDENCIES += e2fsprogs
+QUOTA_DEPENDENCIES += host-pkgconf e2fsprogs
 QUOTA_CONF_OPTS += --enable-ext2direct
-# quote does not use pkg-config to find e2fsprogs, so it does not know it
-# may require -pthreads in case of static build
-ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
-QUOTA_LIBS += -pthread
-endif
 else
 QUOTA_CONF_OPTS += --disable-ext2direct
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 QUOTA_DEPENDENCIES += libtirpc host-pkgconf
-QUOTA_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
-QUOTA_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
-QUOTA_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LIBS="$(QUOTA_LIBS)"
-QUOTA_CONF_ENV = \
-	CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LIBS="$(QUOTA_LIBS)"
-
-# Package uses autoconf but not automake.
-QUOTA_INSTALL_TARGET_OPTS = \
-	ROOTDIR=$(TARGET_DIR) \
-	install
+QUOTA_CONF_ENV = LIBS="$(QUOTA_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.20.1
