From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 27 Feb 2012 13:38:54 +0100
Subject: [Buildroot] [PATCH 1/4] gamin: fix compilation with glib 2.30
In-Reply-To: <1330346337-27342-1-git-send-email-s.neumann@raumfeld.com>
References: <1330346337-27342-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1330346337-27342-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

G_CONST_RETURN is deprecated in glib 2.30 so remove occurences
to avoid build failures.

Patch taken from http://patches.openembedded.org/patch/13079/

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 package/gamin/gamin-0.1.10-no-const-return.patch |   57 ++++++++++++++++++++++
 1 files changed, 57 insertions(+), 0 deletions(-)
 create mode 100644 package/gamin/gamin-0.1.10-no-const-return.patch

diff --git a/package/gamin/gamin-0.1.10-no-const-return.patch b/package/gamin/gamin-0.1.10-no-const-return.patch
new file mode 100644
index 0000000..3e6e905
--- /dev/null
+++ b/package/gamin/gamin-0.1.10-no-const-return.patch
@@ -0,0 +1,57 @@
+G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
+build failures.
+
+Upstream-Status: Pending
+
+Index: gamin-0.1.10/server/gam_node.c
+===================================================================
+--- gamin-0.1.10.orig/server/gam_node.c	2011-10-12 15:25:45.217178314 +0100
++++ gamin-0.1.10/server/gam_node.c	2011-10-12 15:26:17.807178293 +0100
+@@ -122,7 +122,7 @@
+  * it has finished with the string.  If it must keep it longer, it
+  * should makes its own copy.  The returned string must not be freed.
+  */
+-G_CONST_RETURN char *
++const char *
+ gam_node_get_path(GamNode * node)
+ {
+     g_assert(node);
+Index: gamin-0.1.10/server/gam_node.h
+===================================================================
+--- gamin-0.1.10.orig/server/gam_node.h	2011-10-12 15:25:46.857178269 +0100
++++ gamin-0.1.10/server/gam_node.h	2011-10-12 15:26:28.637178297 +0100
+@@ -58,7 +58,7 @@
+ void                  gam_node_set_is_dir          (GamNode         *node,
+ 						   gboolean        is_dir);
+ 	
+-G_CONST_RETURN char  *gam_node_get_path            (GamNode         *node);
++const char  *gam_node_get_path            (GamNode         *node);
+ 
+ GList                *gam_node_get_subscriptions   (GamNode         *node);
+ 
+Index: gamin-0.1.10/server/gam_subscription.c
+===================================================================
+--- gamin-0.1.10.orig/server/gam_subscription.c	2011-10-12 15:25:40.497177525 +0100
++++ gamin-0.1.10/server/gam_subscription.c	2011-10-12 15:26:39.867178304 +0100
+@@ -141,7 +141,7 @@
+  * @param sub the GamSubscription
+  * @returns The path being monitored.  It should not be freed.
+  */
+-G_CONST_RETURN char *
++const char *
+ gam_subscription_get_path(GamSubscription * sub)
+ {
+     if (sub == NULL)
+Index: gamin-0.1.10/server/gam_subscription.h
+===================================================================
+--- gamin-0.1.10.orig/server/gam_subscription.h	2011-10-12 15:25:28.507178266 +0100
++++ gamin-0.1.10/server/gam_subscription.h	2011-10-12 15:25:58.817178285 +0100
+@@ -21,7 +21,7 @@
+ 
+ int                  gam_subscription_get_reqno    (GamSubscription *sub);
+ 
+-G_CONST_RETURN char *gam_subscription_get_path     (GamSubscription *sub);
++const char *gam_subscription_get_path     (GamSubscription *sub);
+ 
+ GamListener         *gam_subscription_get_listener (GamSubscription *sub);
+ 
-- 
1.7.5.4
