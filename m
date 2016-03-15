From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:54:14 +0100
Subject: [Buildroot] [git commit] lksctp-tools: fix musl build
Message-ID: <20160315220331.E1BE680E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14f733bbd2cc28e78229591822c2af12d3fc5663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch replacing __BEGIN_DECLS/__END_DECLS with
"extern "C" {" definition.

Fixes:

http://autobuild.buildroot.net/results/d7d/d7d1c6a13ad788ef74ac0487bf2bdbdcd7d52d40/
http://autobuild.buildroot.net/results/06a/06a76d80701b126789c6c8e867db067e3b927caa/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lksctp-tools/0001-Fix-musl-build.patch | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/lksctp-tools/0001-Fix-musl-build.patch b/package/lksctp-tools/0001-Fix-musl-build.patch
new file mode 100644
index 0000000..5669c70
--- /dev/null
+++ b/package/lksctp-tools/0001-Fix-musl-build.patch
@@ -0,0 +1,46 @@
+From 112c17e00246d562fc923ec395f124a7101fda3f Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 10 Mar 2016 09:30:46 +0100
+Subject: [PATCH] Fix musl build
+
+Replace __BEGIN_DECLS/__END_DECLS macros with following blocks:
+
+extern "C" {
+
+}
+
+__BEGIN_DECLS/__END_DECLS are not part of all C libraries.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/include/netinet/sctp.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/include/netinet/sctp.h b/src/include/netinet/sctp.h
+index 51f5bfb..47571cd 100644
+--- a/src/include/netinet/sctp.h
++++ b/src/include/netinet/sctp.h
+@@ -37,7 +37,9 @@
+ #include <linux/types.h>
+ #include <sys/socket.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ typedef __s32 sctp_assoc_t;
+ 
+@@ -862,6 +864,8 @@ int sctp_recvmsg(int s, void *msg, size_t len, struct sockaddr *from,
+ /* Return the address length for an address family. */
+ int sctp_getaddrlen(sa_family_t family);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* __linux_sctp_h__ */
+-- 
+2.7.0
+
