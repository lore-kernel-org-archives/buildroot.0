From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jul 2017 23:14:24 +0200
Subject: [Buildroot] [PATCH 03/14 v4] package/skeleton: select it rather
	than default to y
In-Reply-To: <cover.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <3c318e0ac9475536b2890d7a07669d05c82ecc56.1501017251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/skeleton/Config.in | 1 -
 system/Config.in           | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
index d25147bd92..b22ac66b35 100644
--- a/package/skeleton/Config.in
+++ b/package/skeleton/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_SKELETON
 	bool
-	default y
 	help
 	  The basic skeleton for your rootfs.
diff --git a/system/Config.in b/system/Config.in
index 5cb921f108..9b42fbbbac 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -8,6 +8,7 @@ choice
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
 	depends on !BR2_INIT_NONE
+	select BR2_PACKAGE_SKELETON
 	help
 	  Use default target skeleton
 
@@ -16,6 +17,7 @@ comment "default target skeleton needs an init system"
 
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
+	select BR2_PACKAGE_SKELETON
 	help
 	  Use custom target skeleton.
 
-- 
2.11.0
