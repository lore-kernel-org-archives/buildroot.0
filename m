From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 12:47:32 +0100
Subject: [Buildroot] [git commit] json-c: fix build without threads support
Message-ID: <20171231114737.CE17C83942@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba3769c39aa32ef844e53750c658f023473c9391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An uClibc toolchain that does not support threads emits a warning when
_REENTRANT is defined. This breaks build with -Werror. Remove -Werror as
a workaround to fix the build.

This issue as been reported upstream
(https://github.com/json-c/json-c/issues/396).

Fixes:
http://autobuild.buildroot.net/results/606/60683141f2ef320a28820c4cd65d2b951123b147/
http://autobuild.buildroot.net/results/969/969faba96d94c1bda7e06b005d8f3a3f7175a0a2/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../json-c/0001-configure.ac-remove-Werror.patch   | 32 ++++++++++++++++++++++
 package/json-c/json-c.mk                           |  3 ++
 2 files changed, 35 insertions(+)

diff --git a/package/json-c/0001-configure.ac-remove-Werror.patch b/package/json-c/0001-configure.ac-remove-Werror.patch
new file mode 100644
index 0000000..e877671
--- /dev/null
+++ b/package/json-c/0001-configure.ac-remove-Werror.patch
@@ -0,0 +1,32 @@
+From 79d862ccaabc6620ce4b2783a44d6014ae837df9 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 31 Dec 2017 00:01:37 +0200
+Subject: [PATCH] configure.ac: remove -Werror
+
+The unconditional _REENTRANT macro causes a warning when building with a
+no-threads toolchain. Remove -Werror to fix the build.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: not upstreamable
+Issue reported upstream: https://github.com/json-c/json-c/issues/396
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 024c5aa0d687..74caa4d99e15 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,7 +165,7 @@ AS_IF([test "x$enable_Bsymbolic" = "xcheck"],
+ AS_IF([test "x$enable_Bsymbolic" = "xyes"], [JSON_BSYMBOLIC_LDFLAGS=-Wl[,]-Bsymbolic-functions])
+ AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
+ 
+-AX_APPEND_COMPILE_FLAGS([-Wall -Werror -Wcast-qual -Wno-error=deprecated-declarations])
++AX_APPEND_COMPILE_FLAGS([-Wall -Wcast-qual -Wno-error=deprecated-declarations])
+ AX_APPEND_COMPILE_FLAGS([-Wextra -Wwrite-string -Wno-unused-parameter])
+ AX_APPEND_COMPILE_FLAGS([-D_GNU_SOURCE -D_REENTRANT])
+ 
+-- 
+2.15.1
+
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index d8007b8..450ee8b 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -10,5 +10,8 @@ JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
+# Patching configure.ac
+JSON_C_AUTORECONF = YES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
