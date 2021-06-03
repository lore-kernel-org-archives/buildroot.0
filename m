From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Jun 2021 15:22:33 +0300
Subject: [Buildroot] [PATCH next] package/daemon: fix build without
 BR2_ENABLE_RUNTIME_DEBUG
Message-ID: <59a8a19501b670fa04f4db4a5b36c318d61c8795.1622722953.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 5a8c50fe05afa ("core: enable 'NDEBUG' unless
BR2_ENABLE_RUNTIME_DEBUG is set"), NDEBUG is defined in compile flags
when BR2_ENABLE_RUNTIME_DEBUG is not enabled. Add a patch to make the
daemon package build with NDEBUG as it should.

Fixes:
http://autobuild.buildroot.net/results/995ef1b5d9fce05881b2a41025916fa45b68a9bc/
http://autobuild.buildroot.net/results/98cd9fb348d6cfe676667205b1f79ec2cd1490de/
http://autobuild.buildroot.net/results/a7c51e6f59656d8c1e1c82a7129a670a68eb8a62/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0002-Fix-build-with-NDEBUG-defined.patch  | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/daemon/0002-Fix-build-with-NDEBUG-defined.patch

diff --git a/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch b/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch
new file mode 100644
index 000000000000..e99e9d8ed73d
--- /dev/null
+++ b/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch
@@ -0,0 +1,46 @@
+From fc84d8d572ffcecb533fd6d6d025abea12ce027e Mon Sep 17 00:00:00 2001
+Message-Id: <fc84d8d572ffcecb533fd6d6d025abea12ce027e.1622722814.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 3 Jun 2021 15:01:10 +0300
+Subject: [PATCH] Fix build with NDEBUG defined
+
+Build with NDEBUG fails because the debug() macro becomes empty. This
+creates invalid syntax with the debug() call is the only statement in
+the body of a 'for' loop.
+
+This fixes build failures like:
+
+daemon.c: In function 'show':
+daemon.c:3607:2: error: expected expression before '}' token
+  }
+  ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/raforg/daemon/pull/3
+
+ libslack/err.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libslack/err.h b/libslack/err.h
+index 106bdb01e074..7acfbe46d60a 100644
+--- a/libslack/err.h
++++ b/libslack/err.h
+@@ -40,10 +40,10 @@
+ #undef check
+ 
+ #ifdef NDEBUG
+-#define debug(args)
+-#define vdebug(args)
+-#define debugsys(args)
+-#define vdebugsys(args)
++#define debug(args) do {} while (0);
++#define vdebug(args) do {} while (0);
++#define debugsys(args) do {} while (0);
++#define vdebugsys(args) do {} while (0);
+ #define check(cond, mesg) (void_cast(0))
+ #else
+ #define debug(args) debugf args;
+-- 
+2.30.2
+
-- 
2.30.2
