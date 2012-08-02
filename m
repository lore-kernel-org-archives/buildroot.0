From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:36 -0000
Subject: [Buildroot] [git commit branch/next] busybox: add 1.20.0 patches
	for find and volume_id
Message-ID: <20120802195232.F3F8C96FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55547775aafdca5fced4e0d4f530ae3093b7209c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.20.0/busybox-1.20.0-ext4.patch       |   73 ++++++++++++++++++++
 .../busybox-1.20.0/busybox-1.20.0-find.patch       |   33 +++++++++
 2 files changed, 106 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-ext4.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-ext4.patch
new file mode 100644
index 0000000..d54ccf8
--- /dev/null
+++ b/package/busybox/busybox-1.20.0/busybox-1.20.0-ext4.patch
@@ -0,0 +1,73 @@
+--- busybox-1.20.0/util-linux/volume_id/ext.c
++++ busybox-1.20.0-ext4/util-linux/volume_id/ext.c
+@@ -39,10 +39,50 @@ struct ext2_super_block {
+ 	uint8_t	volume_name[16];
+ } PACKED;
+ 
+-#define EXT3_FEATURE_COMPAT_HAS_JOURNAL		0x00000004
+-#define EXT3_FEATURE_INCOMPAT_JOURNAL_DEV	0x00000008
+ #define EXT_SUPERBLOCK_OFFSET			0x400
+ 
++/* for s_flags */
++#define EXT2_FLAGS_TEST_FILESYS			0x0004
++
++/* for s_feature_compat */
++#define EXT3_FEATURE_COMPAT_HAS_JOURNAL		0x0004
++
++/* for s_feature_ro_compat */
++#define EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER	0x0001
++#define EXT2_FEATURE_RO_COMPAT_LARGE_FILE	0x0002
++#define EXT2_FEATURE_RO_COMPAT_BTREE_DIR	0x0004
++#define EXT4_FEATURE_RO_COMPAT_HUGE_FILE	0x0008
++#define EXT4_FEATURE_RO_COMPAT_GDT_CSUM		0x0010
++#define EXT4_FEATURE_RO_COMPAT_DIR_NLINK	0x0020
++#define EXT4_FEATURE_RO_COMPAT_EXTRA_ISIZE	0x0040
++
++/* for s_feature_incompat */
++#define EXT2_FEATURE_INCOMPAT_FILETYPE		0x0002
++#define EXT3_FEATURE_INCOMPAT_RECOVER		0x0004
++#define EXT3_FEATURE_INCOMPAT_JOURNAL_DEV	0x0008
++#define EXT2_FEATURE_INCOMPAT_META_BG		0x0010
++#define EXT4_FEATURE_INCOMPAT_EXTENTS		0x0040 /* extents support */
++#define EXT4_FEATURE_INCOMPAT_64BIT		0x0080
++#define EXT4_FEATURE_INCOMPAT_MMP		0x0100
++#define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
++
++#define EXT2_FEATURE_RO_COMPAT_SUPP	(EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER| \
++					 EXT2_FEATURE_RO_COMPAT_LARGE_FILE| \
++					 EXT2_FEATURE_RO_COMPAT_BTREE_DIR)
++#define EXT2_FEATURE_INCOMPAT_SUPP	(EXT2_FEATURE_INCOMPAT_FILETYPE| \
++					 EXT2_FEATURE_INCOMPAT_META_BG)
++#define EXT2_FEATURE_INCOMPAT_UNSUPPORTED	~EXT2_FEATURE_INCOMPAT_SUPP
++#define EXT2_FEATURE_RO_COMPAT_UNSUPPORTED	~EXT2_FEATURE_RO_COMPAT_SUPP
++
++#define EXT3_FEATURE_RO_COMPAT_SUPP	(EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER| \
++					 EXT2_FEATURE_RO_COMPAT_LARGE_FILE| \
++					 EXT2_FEATURE_RO_COMPAT_BTREE_DIR)
++#define EXT3_FEATURE_INCOMPAT_SUPP	(EXT2_FEATURE_INCOMPAT_FILETYPE| \
++					 EXT3_FEATURE_INCOMPAT_RECOVER| \
++					 EXT2_FEATURE_INCOMPAT_META_BG)
++#define EXT3_FEATURE_INCOMPAT_UNSUPPORTED	~EXT3_FEATURE_INCOMPAT_SUPP
++#define EXT3_FEATURE_RO_COMPAT_UNSUPPORTED	~EXT3_FEATURE_RO_COMPAT_SUPP
++
+ int FAST_FUNC volume_id_probe_ext(struct volume_id *id /*,uint64_t off*/)
+ {
+ #define off ((uint64_t)0)
+@@ -66,11 +106,15 @@ int FAST_FUNC volume_id_probe_ext(struct
+ 	dbg("ext: label '%s' uuid '%s'", id->label, id->uuid);
+ 
+ #if ENABLE_FEATURE_BLKID_TYPE
+-	if ((le32_to_cpu(es->feature_compat) & EXT3_FEATURE_COMPAT_HAS_JOURNAL) != 0)
++	if ((es->feature_ro_compat & cpu_to_le32(EXT4_FEATURE_RO_COMPAT_HUGE_FILE | EXT4_FEATURE_RO_COMPAT_DIR_NLINK))
++	 || (es->feature_incompat & cpu_to_le32(EXT4_FEATURE_INCOMPAT_EXTENTS | EXT4_FEATURE_INCOMPAT_64BIT))
++	) {
++		id->type = "ext4";
++	}
++	else if (es->feature_compat & cpu_to_le32(EXT3_FEATURE_COMPAT_HAS_JOURNAL))
+ 		id->type = "ext3";
+ 	else
+ 		id->type = "ext2";
+ #endif
+-
+ 	return 0;
+ }
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-find.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-find.patch
new file mode 100644
index 0000000..f913cda
--- /dev/null
+++ b/package/busybox/busybox-1.20.0/busybox-1.20.0-find.patch
@@ -0,0 +1,33 @@
+--- busybox-1.20.0/findutils/find.c
++++ busybox-1.20.0-find/findutils/find.c
+@@ -831,6 +831,11 @@ static action*** parse_params(char **arg
+ 	                        PARM_name      ,
+ 	                        PARM_iname     ,
+ 	IF_FEATURE_FIND_PATH(   PARM_path      ,)
++#if ENABLE_DESKTOP
++	/* -wholename is a synonym for -path */
++	/* We support it because Linux kernel's "make tags" uses it */
++	IF_FEATURE_FIND_PATH(   PARM_wholename ,)
++#endif
+ 	IF_FEATURE_FIND_PATH(   PARM_ipath     ,)
+ 	IF_FEATURE_FIND_REGEX(  PARM_regex     ,)
+ 	IF_FEATURE_FIND_TYPE(   PARM_type      ,)
+@@ -869,6 +874,9 @@ static action*** parse_params(char **arg
+ 	                         "-name\0"
+ 	                         "-iname\0"
+ 	IF_FEATURE_FIND_PATH(   "-path\0"   )
++#if ENABLE_DESKTOP
++	IF_FEATURE_FIND_PATH(   "-wholename\0")
++#endif
+ 	IF_FEATURE_FIND_PATH(   "-ipath\0"  )
+ 	IF_FEATURE_FIND_REGEX(  "-regex\0"  )
+ 	IF_FEATURE_FIND_TYPE(   "-type\0"   )
+@@ -1076,7 +1084,7 @@ static action*** parse_params(char **arg
+ 			ap->iname = (parm == PARM_iname);
+ 		}
+ #if ENABLE_FEATURE_FIND_PATH
+-		else if (parm == PARM_path || parm == PARM_ipath) {
++		else if (parm == PARM_path IF_DESKTOP(|| parm == PARM_wholename) || parm == PARM_ipath) {
+ 			action_path *ap;
+ 			dbg("%d", __LINE__);
+ 			ap = ALLOC_ACTION(path);
