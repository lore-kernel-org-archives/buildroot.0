From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jul 2017 23:14:22 +0200
Subject: [Buildroot] [PATCH 01/14 v4] system: with no init system,
	only allow custom skeleton
In-Reply-To: <cover.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <291153589ecb2247033d5b23ae6bc9b852eef7f3.1501017251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When there is no init system (i.e. a custom one), our bundled default
skeleton is most probably un-fit for that (non-)init system.

This will be the case when we introduce per init system skeletons. The
systemd skeleton will be unfit except for a systemd init; the sysv
skeleton will be unfit except for a sysv-like init system.

In case they are using no init system (really, a custom one), the user
should be responsible for providing their own, custom skeleton as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 system/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 828df4217e..ed539dcbe0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -3,11 +3,17 @@ menu "System configuration"
 choice
 	prompt "Root FS skeleton"
 
+# When not using an init system (i.e. a custom one), our default skeleton
+# is most probably unfit; so, allow only the custom skeleton in that case.
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
+	depends on !BR2_INIT_NONE
 	help
 	  Use default target skeleton
 
+comment "default target skeleton needs an init system"
+	depends on BR2_INIT_NONE
+
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
 	help
-- 
2.11.0
