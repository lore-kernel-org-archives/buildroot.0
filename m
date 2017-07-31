From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 23:58:17 +0200
Subject: [Buildroot] [git commit] package/skeleton: select it rather than
	default to y
Message-ID: <20170731215752.D32417F899@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10ac06496cdede78e004c82671e0a8c9ca6ea2d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our current skeleton is tailored to sysv-like init systems; it is not
fit for systemd-based systems. So, in upcoming changes, we'll add
another skeleton for systemd.

This means we can no longer have the current skeleton default to 'y', or
it would be enabled also for systemd, which would be incorrect.

So, we remove the default to 'y' but have it selected by the default
skeleton choice.

However, we do not yet have a way to directly build (really, install)
the custom skeleton, it is built (really, installed) as a dependency of
the default skeleton. So we must also forcibly select the default
skeleton when using a custom one.

Until we have the means to do only one or the other; i.e. when we have a
virtual skeleton.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton/Config.in | 1 -
 system/Config.in           | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
index d25147b..b22ac66 100644
--- a/package/skeleton/Config.in
+++ b/package/skeleton/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_SKELETON
 	bool
-	default y
 	help
 	  The basic skeleton for your rootfs.
diff --git a/system/Config.in b/system/Config.in
index 1ee76e8..b2f5be3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -5,11 +5,13 @@ choice
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
+	select BR2_PACKAGE_SKELETON
 	help
 	  Use default target skeleton
 
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
+	select BR2_PACKAGE_SKELETON
 	help
 	  Use custom target skeleton.
 
