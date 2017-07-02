From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:30:42 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libnl: don't download
	patch from Github
Message-ID: <20170702222816.D733281F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6826e2ee8a2bc09104185c777a4ff57bc6a78872
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eck-for-integer-overflow-in-nlmsg_reserve.patch | 38 ++++++++++++++++++++++
 package/libnl/libnl.hash                           |  1 -
 package/libnl/libnl.mk                             |  2 --
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/package/libnl/0001-lib-check-for-integer-overflow-in-nlmsg_reserve.patch b/package/libnl/0001-lib-check-for-integer-overflow-in-nlmsg_reserve.patch
new file mode 100644
index 0000000..c1a070c
--- /dev/null
+++ b/package/libnl/0001-lib-check-for-integer-overflow-in-nlmsg_reserve.patch
@@ -0,0 +1,38 @@
+From 3e18948f17148e6a3c4255bdeaaf01ef6081ceeb Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Mon, 6 Feb 2017 22:23:52 +0100
+Subject: [PATCH] lib: check for integer-overflow in nlmsg_reserve()
+
+In general, libnl functions are not robust against calling with
+invalid arguments. Thus, never call libnl functions with invalid
+arguments. In case of nlmsg_reserve() this means never provide
+a @len argument that causes overflow.
+
+Still, add an additional safeguard to avoid exploiting such bugs.
+
+Assume that @pad is a trusted, small integer.
+Assume that n->nm_size is a valid number of allocated bytes (and thus
+much smaller then SIZE_T_MAX).
+Assume, that @len may be set to an untrusted value. Then the patch
+avoids an integer overflow resulting in reserving too few bytes.
+
+[Upstream commit: https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/msg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/msg.c b/lib/msg.c
+index 9af3f3a0..3e27d4e0 100644
+--- a/lib/msg.c
++++ b/lib/msg.c
+@@ -411,6 +411,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
+ 	size_t nlmsg_len = n->nm_nlh->nlmsg_len;
+ 	size_t tlen;
+ 
++	if (len > n->nm_size)
++		return NULL;
++
+ 	tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
+ 
+ 	if ((tlen + nlmsg_len) > n->nm_size)
diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index eafba4a..2f1a3cb 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,3 +1,2 @@
 # From https://github.com/thom311/libnl/releases/download/libnl3_2_27/libnl-3.2.27.tar.gz.sha256sum
 sha256	4bbbf92b3c78a90f423cf96260bf419a28b75db8cced47051217a56795f58ec6	libnl-3.2.27.tar.gz
-sha256	b7bb929194eefc56c786a7e1ae5176b54713f9013ccec63760f232742ae80361	3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index af28382..85c0db8 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -11,8 +11,6 @@ LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex
 
-LIBNL_PATCH = https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
-
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
 else
