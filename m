From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 10:44:25 +0200
Subject: [Buildroot] [PATCH 3/6] system: provide no default for custom
	skeleton path
In-Reply-To: <cover.1468744792.git.yann.morin.1998@free.fr>
References: <cover.1468744792.git.yann.morin.1998@free.fr>
Message-ID: <409ca6c1a9e541db283e4b2276f25b8322cad63f.1468744792.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Being custom means that our default one is not suitable to start with.
So there is no reson to offer it as the default path.

Add a check that it is not empty.

Add a separating empty line, for good measure, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v2 -> v3:
  - add a check that it is not empty (Romain, Arnout)
---
 package/skeleton/skeleton.mk | 6 ++++++
 system/Config.in             | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 7a7c200..d580fcb 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -17,6 +17,12 @@ ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 
 SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
 
+ifeq ($(BR_BUILDING),y)
+ifeq ($(SKELETON_PATH),)
+$(error No path specified for the custom skeleton)
+endif
+endif
+
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 
 # Ensure the user has prepared a merged /usr.
diff --git a/system/Config.in b/system/Config.in
index b895db9..6fce8e1 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -184,9 +184,9 @@ config BR2_ROOTFS_SKELETON_CUSTOM
 endchoice
 
 if BR2_ROOTFS_SKELETON_CUSTOM
+
 config BR2_ROOTFS_SKELETON_CUSTOM_PATH
 	string "custom target skeleton path"
-	default "system/skeleton"
 	help
 	  Path to custom target skeleton.
 
-- 
2.7.4
