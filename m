From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 May 2011 16:58:32 +0200
Subject: [Buildroot] [git commit] fakeroot: disallow selection for the target
Message-ID: <20110522145942.12734835BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=75c0a454887cb650f6fc049c8d12848a7cc6f3cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fakeroot for the target fails to build against glibc, due to largefile
related problems :

libtool: link: /home/test/outputs/test-503/host/usr/bin/powerpc-linux-gnu-gcc -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o faked faked.o  ./.libs/libcommunicate.a -ldl
{standard input}: Assembler messages:
{standard input}:2592: Error: symbol `__fxstatat64' is already defined
{standard input}:2627: Error: symbol `__fxstat64' is already defined
{standard input}:2663: Error: symbol `__xstat64' is already defined
{standard input}:2698: Error: symbol `__lxstat64' is already defined
make[3]: *** [libfakeroot.lo] Error 1

As fakeroot for the target is not really needed, and was only added
when we packaged fakeroot for the host, just make fakeroot not
selectable for the target.

We have to keep the AUTOTARGETS call for fakeroot on the target,
because the host variant does not work otherwise, due to issues in the
package infrastructure (that will be fixed post-2011.05).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 -
 package/fakeroot/Config.in   |    6 ------
 package/fakeroot/fakeroot.mk |    3 +++
 3 files changed, 3 insertions(+), 7 deletions(-)
 delete mode 100644 package/fakeroot/Config.in

diff --git a/package/Config.in b/package/Config.in
index 1d3c0cc..40f523d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -48,7 +48,6 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/diffutils/Config.in"
 endif
 source "package/distcc/Config.in"
-source "package/fakeroot/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/findutils/Config.in"
 endif
diff --git a/package/fakeroot/Config.in b/package/fakeroot/Config.in
deleted file mode 100644
index 186b717..0000000
--- a/package/fakeroot/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_FAKEROOT
-	bool "fakeroot"
-	help
-	  Run commands in an environment faking root privileges.
-
-	  http://joostje.op.het.net/fakeroot/
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 8061443..29e9e5b 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -16,5 +16,8 @@ endef
 
 FAKEROOT_POST_PATCH_HOOKS += FAKEROOT_PATCH_FAKEROOT_IN
 
+# The package for the target cannot be selected (build problems when
+# largefile is enabled), but is needed for the host package to work
+# due to deficiencies in the package infrastructure.
 $(eval $(call AUTOTARGETS,package,fakeroot))
 $(eval $(call AUTOTARGETS,package,fakeroot,host))
-- 
1.7.3.4
