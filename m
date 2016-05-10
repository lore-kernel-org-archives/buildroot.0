From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 15:46:17 +0200
Subject: [Buildroot] [git commit] lksctp-tools: bump to version 1.0.17
Message-ID: <20160510135145.E247581880@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0401ccc325632ff47b5475ab39b463ae7348f1f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch and autoreconf related hook. Add
--disable-tests config option to reduce build time.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lksctp-tools/0001-Fix-musl-build.patch | 46 --------------------------
 package/lksctp-tools/lksctp-tools.hash         |  4 +--
 package/lksctp-tools/lksctp-tools.mk           |  9 ++---
 3 files changed, 4 insertions(+), 55 deletions(-)

diff --git a/package/lksctp-tools/0001-Fix-musl-build.patch b/package/lksctp-tools/0001-Fix-musl-build.patch
deleted file mode 100644
index 5669c70..0000000
--- a/package/lksctp-tools/0001-Fix-musl-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 112c17e00246d562fc923ec395f124a7101fda3f Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Thu, 10 Mar 2016 09:30:46 +0100
-Subject: [PATCH] Fix musl build
-
-Replace __BEGIN_DECLS/__END_DECLS macros with following blocks:
-
-extern "C" {
-
-}
-
-__BEGIN_DECLS/__END_DECLS are not part of all C libraries.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- src/include/netinet/sctp.h | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/include/netinet/sctp.h b/src/include/netinet/sctp.h
-index 51f5bfb..47571cd 100644
---- a/src/include/netinet/sctp.h
-+++ b/src/include/netinet/sctp.h
-@@ -37,7 +37,9 @@
- #include <linux/types.h>
- #include <sys/socket.h>
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- typedef __s32 sctp_assoc_t;
- 
-@@ -862,6 +864,8 @@ int sctp_recvmsg(int s, void *msg, size_t len, struct sockaddr *from,
- /* Return the address length for an address family. */
- int sctp_getaddrlen(sa_family_t family);
- 
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
- 
- #endif /* __linux_sctp_h__ */
--- 
-2.7.0
-
diff --git a/package/lksctp-tools/lksctp-tools.hash b/package/lksctp-tools/lksctp-tools.hash
index ae6b0dc..0ecc8ff 100644
--- a/package/lksctp-tools/lksctp-tools.hash
+++ b/package/lksctp-tools/lksctp-tools.hash
@@ -1,3 +1,3 @@
 # From https://sourceforge.net/projects/lksctp/files/lksctp-tools/
-md5	708bb0b5a6806ad6e8d13c55b067518e	lksctp-tools-1.0.16.tar.gz
-sha1	8b17f913844851ee6872374cffec0745c804637b	lksctp-tools-1.0.16.tar.gz
+md5	68e9b8fa4d4e331029b247b72d46d7a5	lksctp-tools-1.0.17.tar.gz
+sha1	941b0b5c39e364a971f514bba66120435660e518	lksctp-tools-1.0.17.tar.gz
diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
index 91b96a6..a36d6ca 100644
--- a/package/lksctp-tools/lksctp-tools.mk
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -4,19 +4,14 @@
 #
 ################################################################################
 
-LKSCTP_TOOLS_VERSION = 1.0.16
+LKSCTP_TOOLS_VERSION = 1.0.17
 LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
 LKSCTP_TOOLS_INSTALL_STAGING = YES
 # configure not shipped
 LKSCTP_TOOLS_AUTORECONF = YES
 LKSCTP_TOOLS_LICENSE = LGPLv2.1 (library), GPLv2+ (programs)
 LKSCTP_TOOLS_LICENSE_FILES = COPYING.lib COPYING
-
-# Needed by autoreconf
-define LKSCTP_TOOLS_MAKE_M4
-	mkdir -p $(@D)/m4
-endef
-LKSCTP_TOOLS_POST_PATCH_HOOKS += LKSCTP_TOOLS_MAKE_M4
+LKSCTP_TOOLS_CONF_OPTS = --disable-tests
 
 # Cleanup installed target source code
 define LKSCTP_TOOLS_CLEANUP_TARGET
