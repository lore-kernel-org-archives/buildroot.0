From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 13:09:29 +0100
Subject: [Buildroot] [git commit] vboot-utils: fix RSA redefinition build
	error with old compilers
Message-ID: <20160123121058.7E0307FC1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=530c5a55959f161f49dc095641a24ede649725be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old gcc compilers do not support type redefinitions, which causes a
build failure of the host-vboot-utils package on certain machines. The
vboot-utils source code redefines "typedef struct rsa_st RSA" which is
already defined in the OpenSSL headers.

This commit adds a patch which works around this build issue.

Fixes:

  http://autobuild.buildroot.org/results/1a4/1a45412939a3f9d6fa59d086d834a3b4a4bffef7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-Avoid-RSA-type-redefinition.patch         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch b/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
new file mode 100644
index 0000000..86374ca
--- /dev/null
+++ b/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
@@ -0,0 +1,44 @@
+From 593407d2b3ea3b871d55ec399671e48c84b900a7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 21 Jan 2016 22:01:37 +0100
+Subject: [PATCH] Avoid RSA type redefinition
+
+The host_key.h headers does:
+
+  typedef struct rsa_st RSA;
+
+But this type definition is already done by the OpenSSL headers.
+
+While such a type redefinition is legal with recent gcc versions, it
+doesn't build with older gcc versions such as gcc 4.4.
+
+To work around this problem, we instead use a forward declaration of
+"struct rsa_st", and change the only place where the RSA type was used
+by "struct rsa_st".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ host/lib/include/host_key.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/host/lib/include/host_key.h b/host/lib/include/host_key.h
+index 9f98ccc..c2d01a5 100644
+--- a/host/lib/include/host_key.h
++++ b/host/lib/include/host_key.h
+@@ -12,11 +12,11 @@
+ #include "vboot_struct.h"
+ 
+ 
+-typedef struct rsa_st RSA;
++struct rsa_st;
+ 
+ /* Private key data */
+ typedef struct VbPrivateKey {
+-  RSA* rsa_private_key;  /* Private key data */
++  struct rsa_rt* rsa_private_key;  /* Private key data */
+   uint64_t algorithm;    /* Algorithm to use when signing */
+ } VbPrivateKey;
+ 
+-- 
+2.6.4
+
