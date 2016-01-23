From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 19:28:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/quota: fix musl build
In-Reply-To: <1453573714-19731-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453573714-19731-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453573714-19731-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the errors yet because they failed
earlier with other packages, but I am continuing the build using
the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/quota/0003-fcntl.patch                  | 121 ++++++++++++++
 package/quota/0004-remove_non_posix_types.patch | 206 ++++++++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100644 package/quota/0003-fcntl.patch
 create mode 100644 package/quota/0004-remove_non_posix_types.patch

diff --git a/package/quota/0003-fcntl.patch b/package/quota/0003-fcntl.patch
new file mode 100644
index 0000000..404055a
--- /dev/null
+++ b/package/quota/0003-fcntl.patch
@@ -0,0 +1,121 @@
+Fix musl build
+
+Downloaded from
+http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/quota/quota/fcntl.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+Include fcntl.h to pacify compiler errors on musl
+like
+
+error: unknown type name 'loff_t'
+Cover rpc headers under proper conditional
+Dont use __P its undefined
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ndex: quota-tools/quota.h
+===================================================================
+Index: quota-tools/quota.h
+===================================================================
+--- quota-tools.orig/quota.h
++++ quota-tools/quota.h
+@@ -165,6 +165,6 @@ enum {
+ 	#endif
+ #endif
+ 
+-long quotactl __P((int, const char *, qid_t, caddr_t));
++long quotactl (int, const char *, qid_t, caddr_t);
+ 
+ #endif /* _QUOTA_ */
+Index: quota-tools/quotacheck.c
+===================================================================
+--- quota-tools.orig/quotacheck.c
++++ quota-tools/quotacheck.c
+@@ -19,6 +19,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <errno.h>
++#include <fcntl.h>
+ 
+ #include <sys/stat.h>
+ #include <sys/types.h>
+Index: quota-tools/quotaio.c
+===================================================================
+--- quota-tools.orig/quotaio.c
++++ quota-tools/quotaio.c
+@@ -12,6 +12,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <stdlib.h>
++#include <fcntl.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
+Index: quota-tools/dqblk_v2.h
+===================================================================
+--- quota-tools.orig/dqblk_v2.h
++++ quota-tools/dqblk_v2.h
+@@ -7,6 +7,7 @@
+ #ifndef GUARD_DQBLK_V2_H
+ #define GUARD_DQBLK_V2_H
+ 
++#include <fcntl.h>
+ #include <sys/types.h>
+ #include "quota_tree.h"
+ 
+Index: quota-tools/quotaops.c
+===================================================================
+--- quota-tools.orig/quotaops.c
++++ quota-tools/quotaops.c
+@@ -34,7 +34,9 @@
+ 
+ #include "config.h"
+ 
++#if defined(RPC)
+ #include <rpc/rpc.h>
++#endif
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
+Index: quota-tools/rquota_client.c
+===================================================================
+--- quota-tools.orig/rquota_client.c
++++ quota-tools/rquota_client.c
+@@ -19,7 +19,9 @@
+ 
+ #include "config.h"
+ 
++#if defined(RPC)
+ #include <rpc/rpc.h>
++#endif
+ #include <sys/types.h>
+ #include <sys/param.h>
+ #include <sys/stat.h>
+@@ -35,7 +37,9 @@
+ #include <stdint.h>
+ 
+ #include "mntopt.h"
++#if defined(RPC)
+ #include "rquota.h"
++#endif
+ #include "common.h"
+ #include "quotaio.h"
+ #include "quotasys.h"
+Index: quota-tools/setquota.c
+===================================================================
+--- quota-tools.orig/setquota.c
++++ quota-tools/setquota.c
+@@ -7,7 +7,9 @@
+ 
+ #include "config.h"
+ 
++#if defined(RPC)
+ #include <rpc/rpc.h>
++#endif
+ #include <sys/types.h>
+ #include <errno.h>
+ #include <stdio.h>
diff --git a/package/quota/0004-remove_non_posix_types.patch b/package/quota/0004-remove_non_posix_types.patch
new file mode 100644
index 0000000..7de96f7
--- /dev/null
+++ b/package/quota/0004-remove_non_posix_types.patch
@@ -0,0 +1,206 @@
+Fix musl build
+
+Downloaded from
+http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+Use proper C99 integer types
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
-- 
2.7.0.rc3
