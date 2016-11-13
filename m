From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 18:03:57 +0100
Subject: [Buildroot] [git commit] quota: fix build on musl
Message-ID: <20161113170448.4AD0C803D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9317b9542bd3971bc340808ca8efadee36f5b263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds 3 patches to the quota package, that allows to build
it with musl. One patch was borrowed from OpenEmbedded, the other two
patches are really trivial.

Fixes:

  http://autobuild.buildroot.net/results/6f0ff905251d12e198654b8ffe0ea5c15186371e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quota/0003-remove-non-posix-types.patch | 200 ++++++++++++++++++++++++
 package/quota/0004-import-sys-cdefs.patch       |  18 +++
 package/quota/0005-include-fcntl.patch          |  20 +++
 3 files changed, 238 insertions(+)

diff --git a/package/quota/0003-remove-non-posix-types.patch b/package/quota/0003-remove-non-posix-types.patch
new file mode 100644
index 0000000..869c85f
--- /dev/null
+++ b/package/quota/0003-remove-non-posix-types.patch
@@ -0,0 +1,200 @@
+Use proper C99 integer types
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Thomas: borrowed from OpenEmbedded.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: quota-tools/bylabel.c
+===================================================================
+--- quota-tools.orig/bylabel.c
++++ quota-tools/bylabel.c
+@@ -20,6 +20,7 @@
+ #include <ctype.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <stdint.h>
+ 
+ #include "bylabel.h"
+ #include "common.h"
+@@ -37,32 +38,32 @@ static struct uuidCache_s {
+ 
+ #define EXT2_SUPER_MAGIC	0xEF53
+ struct ext2_super_block {
+-	u_char s_dummy1[56];
+-	u_char s_magic[2];
+-	u_char s_dummy2[46];
+-	u_char s_uuid[16];
+-	u_char s_volume_name[16];
++	uint8_t s_dummy1[56];
++	uint8_t s_magic[2];
++	uint8_t s_dummy2[46];
++	uint8_t s_uuid[16];
++	uint8_t s_volume_name[16];
+ };
+ 
+-#define ext2magic(s)	((uint) s.s_magic[0] + (((uint) s.s_magic[1]) << 8))
++#define ext2magic(s)	((uint32_t) s.s_magic[0] + (((uint32_t) s.s_magic[1]) << 8))
+ 
+ #define XFS_SUPER_MAGIC "XFSB"
+ #define XFS_SUPER_MAGIC2 "BSFX"
+ struct xfs_super_block {
+-	u_char s_magic[4];
+-	u_char s_dummy[28];
+-	u_char s_uuid[16];
+-	u_char s_dummy2[60];
+-	u_char s_fsname[12];
++	uint8_t s_magic[4];
++	uint8_t s_dummy[28];
++	uint8_t s_uuid[16];
++	uint8_t s_dummy2[60];
++	uint8_t s_fsname[12];
+ };
+ 
+ #define REISER_SUPER_MAGIC	"ReIsEr2Fs"
+ struct reiserfs_super_block {
+-	u_char s_dummy1[52];
+-	u_char s_magic[10];
+-	u_char s_dummy2[22];
+-	u_char s_uuid[16];
+-	u_char s_volume_name[16];
++	uint8_t s_dummy1[52];
++	uint8_t s_magic[10];
++	uint8_t s_dummy2[22];
++	uint8_t s_uuid[16];
++	uint8_t s_volume_name[16];
+ };
+ 
+ static inline unsigned short swapped(unsigned short a)
+@@ -222,7 +223,7 @@ static char *get_spec_by_x(int n, const
+ 	return NULL;
+ }
+ 
+-static u_char fromhex(char c)
++static uint8_t fromhex(char c)
+ {
+ 	if (isdigit(c))
+ 		return (c - '0');
+@@ -234,7 +235,7 @@ static u_char fromhex(char c)
+ 
+ static char *get_spec_by_uuid(const char *s)
+ {
+-	u_char uuid[16];
++	uint8_t uuid[16];
+ 	int i;
+ 
+ 	if (strlen(s) != 36 || s[8] != '-' || s[13] != '-' || s[18] != '-' || s[23] != '-')
+Index: quota-tools/quot.c
+===================================================================
+--- quota-tools.orig/quot.c
++++ quota-tools/quot.c
+@@ -47,6 +47,7 @@
+ #include <utmp.h>
+ #include <pwd.h>
+ #include <grp.h>
++#include <stdint.h>
+ 
+ #include "pot.h"
+ #include "quot.h"
+@@ -56,8 +57,8 @@
+ #include "quotasys.h"
+ 
+ #define	TSIZE	500
+-static __uint64_t sizes[TSIZE];
+-static __uint64_t overflow;
++static uint64_t sizes[TSIZE];
++static uint64_t overflow;
+ 
+ static int aflag;
+ static int cflag;
+@@ -72,7 +73,7 @@ static time_t now;
+ char *progname;
+ 
+ static void mounttable(void);
+-static char *idname(__uint32_t, int);
++static char *idname(uint32_t, int);
+ static void report(const char *, const char *, int);
+ static void creport(const char *, const char *);
+ 
+@@ -173,7 +174,7 @@ static int qcmp(du_t * p1, du_t * p2)
+ static void creport(const char *file, const char *fsdir)
+ {
+ 	int i;
+-	__uint64_t t = 0;
++	uint64_t t = 0;
+ 
+ 	printf(_("%s (%s):\n"), file, fsdir);
+ 	for (i = 0; i < TSIZE - 1; i++)
+@@ -219,7 +220,7 @@ static void report(const char *file, con
+ 	}
+ }
+ 
+-static idcache_t *getnextent(int type, __uint32_t id, int byid)
++static idcache_t *getnextent(int type, uint32_t id, int byid)
+ {
+ 	struct passwd *pw;
+ 	struct group  *gr;
+@@ -240,7 +241,7 @@ static idcache_t *getnextent(int type, _
+ 	return &idc;
+ }
+ 
+-static char *idname(__uint32_t id, int type)
++static char *idname(uint32_t id, int type)
+ {
+ 	idcache_t *ncp, *idp;
+ 	static idcache_t nc[2][NID];
+@@ -286,8 +287,8 @@ static void acctXFS(xfs_bstat_t *p)
+ {
+ 	register du_t *dp;
+ 	du_t **hp;
+-	__uint64_t size;
+-	__uint32_t i, id;
++	uint64_t size;
++	uint32_t i, id;
+ 
+ 	if ((p->bs_mode & S_IFMT) == 0)
+ 		return;
+Index: quota-tools/quot.h
+===================================================================
+--- quota-tools.orig/quot.h
++++ quota-tools/quot.h
+@@ -35,18 +35,18 @@
+ #define	SEC24HR	(60*60*24)	/* seconds per day */
+ 
+ typedef struct {
+-	__uint32_t id;
++	uint32_t id;
+ 	char name[UT_NAMESIZE + 1];
+ } idcache_t;
+ 
+ typedef struct du {
+ 	struct du *next;
+-	__uint64_t blocks;
+-	__uint64_t blocks30;
+-	__uint64_t blocks60;
+-	__uint64_t blocks90;
+-	__uint64_t nfiles;
+-	__uint32_t id;
++	uint64_t blocks;
++	uint64_t blocks30;
++	uint64_t blocks60;
++	uint64_t blocks90;
++	uint64_t nfiles;
++	uint32_t id;
+ } du_t;
+ 
+ #define	NDU	60000
+Index: quota-tools/rquota_server.c
+===================================================================
+--- quota-tools.orig/rquota_server.c
++++ quota-tools/rquota_server.c
+@@ -60,7 +60,7 @@ extern char nfs_pseudoroot[PATH_MAX];
+  */
+ extern struct authunix_parms *unix_cred;
+ 
+-int in_group(gid_t * gids, u_int len, gid_t gid)
++int in_group(gid_t * gids, uint32_t len, gid_t gid)
+ {
+ 	gid_t *gidsp = gids + len;
+ 
diff --git a/package/quota/0004-import-sys-cdefs.patch b/package/quota/0004-import-sys-cdefs.patch
new file mode 100644
index 0000000..9acd1fe
--- /dev/null
+++ b/package/quota/0004-import-sys-cdefs.patch
@@ -0,0 +1,18 @@
+Add missing <sys/cdefs.h> include
+
+quota.h uses the __P definition, so it must include <sys/cdefs.h>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/quota.h
+===================================================================
+--- a/quota.h
++++ b/quota.h
+@@ -2,6 +2,7 @@
+ #define GUARD_QUOTA_H
+ 
+ #include <sys/types.h>
++#include <sys/cdefs.h>
+ 
+ typedef u_int32_t qid_t;	/* Type in which we store ids in memory */
+ typedef int64_t qsize_t;	/* Type in which we store size limitations */
diff --git a/package/quota/0005-include-fcntl.patch b/package/quota/0005-include-fcntl.patch
new file mode 100644
index 0000000..fe7ea98
--- /dev/null
+++ b/package/quota/0005-include-fcntl.patch
@@ -0,0 +1,20 @@
+Include <fcntl.h> to get loff_t definition
+
+Fixes the following build issue with musl:
+
+dqblk_v2.h:32:2: error: unknown type name ???loff_t???
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/dqblk_v2.h
+===================================================================
+--- a/dqblk_v2.h
++++ b/dqblk_v2.h
+@@ -8,6 +8,7 @@
+ #define GUARD_DQBLK_V2_H
+ 
+ #include <sys/types.h>
++#include <fcntl.h>
+ #include "quota_tree.h"
+ 
+ #define Q_V2_GETQUOTA	0x0D00	/* Get limits and usage */
