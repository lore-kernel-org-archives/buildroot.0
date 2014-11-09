From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Nov 2014 21:45:55 +0100
Subject: [Buildroot] [git commit] quota: remove dependency on util-linux
Message-ID: <20141109211319.ACD18B3AAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff48f5ae44e959fc704134b1cd985a715afdbd16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency on util-linux is only present in Config.in, and not in
quota.mk, and quota indeed builds properly without util-linux. It
could be a runtime dependency, but there is no indication that it is
the case, and I don't see why quota would run-time depend on
util-linux utilities.

Looking back at when the quota package was introduced, in one of the
preliminary patch, he following explanation was given by the original
author:

  [Update: I added check for util-linux mount because
   it support usrquota and grpquota mount options.]

But I still don't see why usrquota and grpquota mount options would be
the source of a dependency of the quota utilities on util-linux. Here
is what the util-linux mount man page says about those two mount
options:

   grpquota|noquota|quota|usrquota

         These options are accepted but ignored.  (However, quota
         utilities may react to such strings in /etc/fstab.)

So indeed, the quota tools will look at /proc/mounts and see if those
options are used for certain mount points, but that doesn't create a
dependency of quota on util-linux.

Therefore, this commit gets rid of the dependency of quota on
util-linux. It allows to re-enable quota on Microblaze, since this
dependency was inherited from util-linux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quota/Config.in |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index 69f03af..46a6c05 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -3,11 +3,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
-	depends on !(BR2_microblazeel || BR2_microblazebe) # util-linux
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_BINARIES
-	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -16,7 +12,7 @@ config BR2_PACKAGE_QUOTA
 	  http://sourceforge.net/projects/linuxquota/
 
 comment "quota needs a toolchain w/ largefile, wchar, threads"
-	depends on BR2_USE_MMU && !(BR2_microblazeel || BR2_microblazebe)
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || \
 		!BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
