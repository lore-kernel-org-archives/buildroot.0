From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 Jul 2016 21:44:31 +0300
Subject: [Buildroot] [PATCH] strace: bump to version 4.13
Message-ID: <9bc291044351bf19b1cd7d4af632ab9ac8c5126f.1469990671.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Remove preseed of netlink.h and if_packet.h tests since these tests were
removed from configure.ac.

Add stronger sha256 hash.

Version 4.13 fixes a typo in configure.ac (commit 7c0e8875a432) that causes
build failure with kernel v4.7 headers, thus fixing:
http://autobuild.buildroot.net/results/aa6/aa6badae8b3d58d6d48161f261988103271bc2ef/
http://autobuild.buildroot.net/results/4ad/4ad1b0c42206243bd76e94b34454d4108fb31070/
http://autobuild.buildroot.net/results/1c6/1c6c88a7163529a666d1661969736f66e9aba7f7/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...de-fallback-definitions-for-BTRFS_IOC_QUO.patch | 97 ----------------------
 package/strace/strace.hash                         |  8 +-
 package/strace/strace.mk                           |  6 +-
 3 files changed, 6 insertions(+), 105 deletions(-)
 delete mode 100644 package/strace/0001-btrfs-provide-fallback-definitions-for-BTRFS_IOC_QUO.patch

diff --git a/package/strace/0001-btrfs-provide-fallback-definitions-for-BTRFS_IOC_QUO.patch b/package/strace/0001-btrfs-provide-fallback-definitions-for-BTRFS_IOC_QUO.patch
deleted file mode 100644
index e52666189501..000000000000
--- a/package/strace/0001-btrfs-provide-fallback-definitions-for-BTRFS_IOC_QUO.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From fe7a451e5accf78c16ac9e65381d257924b266ed Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Fri, 17 Jun 2016 03:02:46 +0300
-Subject: [PATCH] btrfs: provide fallback definitions for
- BTRFS_IOC_QUOTA_RESCAN*
-
-<linux/btrfs.h> was introduced in linux v3.9-rc1 while some
-of btrfs ioctls were added later, e.g. BTRFS_IOC_QUOTA_RESCAN
-and BTRFS_IOC_QUOTA_RESCAN_STATUS in v3.10-rc2,
-or BTRFS_IOC_QUOTA_RESCAN_WAIT in v3.11-rc1.
-
-* btrfs.c [!BTRFS_IOC_QUOTA_RESCAN]
-(struct btrfs_ioctl_quota_rescan_args): New structure.
-(BTRFS_IOC_QUOTA_RESCAN, BTRFS_IOC_QUOTA_RESCAN_STATUS): New macros.
-[!BTRFS_IOC_QUOTA_RESCAN_WAIT] (BTRFS_IOC_QUOTA_RESCAN_WAIT): New macro.
-* tests/btrfs.c: Likewise.
-
-Reported-by: Li Er <phoooyb@gmail.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit fe7a451e5accf78c16ac9e65381d257924b266ed
-
- btrfs.c       | 18 ++++++++++++++++--
- tests/btrfs.c | 14 ++++++++++++++
- 2 files changed, 30 insertions(+), 2 deletions(-)
-
-diff --git a/btrfs.c b/btrfs.c
-index 04c71fc3480d..f94565bc4e6b 100644
---- a/btrfs.c
-+++ b/btrfs.c
-@@ -83,6 +83,20 @@ struct btrfs_ioctl_defrag_range_args {
- # define BTRFS_FIRST_FREE_OBJECTID 256ULL
- #endif
- 
-+#ifndef BTRFS_IOC_QUOTA_RESCAN
-+struct btrfs_ioctl_quota_rescan_args {
-+	uint64_t flags, progress, reserved[6];
-+};
-+# define BTRFS_IOC_QUOTA_RESCAN _IOW(BTRFS_IOCTL_MAGIC, 44, \
-+					struct btrfs_ioctl_quota_rescan_args)
-+# define BTRFS_IOC_QUOTA_RESCAN_STATUS _IOR(BTRFS_IOCTL_MAGIC, 45, \
-+					struct btrfs_ioctl_quota_rescan_args)
-+#endif
-+
-+#ifndef BTRFS_IOC_QUOTA_RESCAN_WAIT
-+# define BTRFS_IOC_QUOTA_RESCAN_WAIT _IO(BTRFS_IOCTL_MAGIC, 46)
-+#endif
-+
- #ifndef BTRFS_IOC_GET_FEATURES
- # define BTRFS_IOC_GET_FEATURES _IOR(BTRFS_IOCTL_MAGIC, 57, \
- 					struct btrfs_ioctl_feature_flags)
-@@ -1024,7 +1038,7 @@ MPERS_PRINTER_DECL(int, btrfs_ioctl,
- 		if (umove_or_printaddr(tcp, arg, &args))
- 			break;
- 
--		tprintf("{flags=%" PRI__u64 "}", args.flags);
-+		tprintf("{flags=%" PRIu64 "}", (uint64_t) args.flags);
- 		break;
- 	}
- 
-@@ -1038,7 +1052,7 @@ MPERS_PRINTER_DECL(int, btrfs_ioctl,
- 		if (umove_or_printaddr(tcp, arg, &args))
- 			break;
- 
--		tprintf("{flags=%" PRI__u64 ", progress=", args.flags);
-+		tprintf("{flags=%" PRIu64 ", progress=", (uint64_t) args.flags);
- 		btrfs_print_objectid(args.progress);
- 		tprints("}");
- 		break;
-diff --git a/tests/btrfs.c b/tests/btrfs.c
-index 4014c883c301..45aa08fc4e44 100644
---- a/tests/btrfs.c
-+++ b/tests/btrfs.c
-@@ -72,6 +72,20 @@ const unsigned char uuid_reference[BTRFS_UUID_SIZE] = {
- 
- const char uuid_reference_string[] = "01234567-89ab-cdef-fedc-ba9876543210";
- 
-+#ifndef BTRFS_IOC_QUOTA_RESCAN
-+struct btrfs_ioctl_quota_rescan_args {
-+	uint64_t flags, progress, reserved[6];
-+};
-+# define BTRFS_IOC_QUOTA_RESCAN _IOW(BTRFS_IOCTL_MAGIC, 44, \
-+					struct btrfs_ioctl_quota_rescan_args)
-+# define BTRFS_IOC_QUOTA_RESCAN_STATUS _IOR(BTRFS_IOCTL_MAGIC, 45, \
-+					struct btrfs_ioctl_quota_rescan_args)
-+#endif
-+
-+#ifndef BTRFS_IOC_QUOTA_RESCAN_WAIT
-+# define BTRFS_IOC_QUOTA_RESCAN_WAIT _IO(BTRFS_IOCTL_MAGIC, 46)
-+#endif
-+
- #ifndef BTRFS_IOC_GET_FEATURES
- # define BTRFS_IOC_GET_FEATURES _IOR(BTRFS_IOCTL_MAGIC, 57, \
-                                    struct btrfs_ioctl_feature_flags)
--- 
-2.8.1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 432df7de88db..6c09cca3bce5 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,3 +1,5 @@
-# From http://sourceforge.net/projects/strace/files/strace/4.12/
-md5	efb8611fc332e71ec419c53f59faa93e	strace-4.12.tar.xz
-sha1	30d79bc07e46a8672decb945e458447c1b66e496	strace-4.12.tar.xz
+# From http://sourceforge.net/projects/strace/files/strace/4.13/
+md5	4b78c7febdd24c79d5147824d1a080a3	strace-4.13.tar.xz
+sha1	7e1fc622e2b166cb74799a14c23d6bfde9ddbc3c	strace-4.13.tar.xz
+# Locally computed
+sha256	d48f732576c91ece36a5843d63f9be054c40ef59f1e4773986042636861625d7	strace-4.13.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 7465baad701c..b060137ae0b5 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,16 +4,12 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.12
+STRACE_VERSION = 4.13
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
 STRACE_LICENSE_FILES = COPYING
 
-STRACE_CONF_ENV = \
-	ac_cv_header_linux_if_packet_h=yes \
-	ac_cv_header_linux_netlink_h=yes
-
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
-- 
2.8.1
