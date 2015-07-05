From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jul 2015 13:56:57 +0200
Subject: [Buildroot] [PATCH] core/pkg-generic: host variants inherits
	target's override-srcdir
Message-ID: <1436097417-1809-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a package has both a target and a host variants, and there is an
override-srcdir set for the target variant, the host variant should
inherit the target's override-srcdir, unless explicitly set, like we do
for all other target-variant properties.

Reported-by: Mike <mikez@OpenPlayer.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9fe01b8..926d594 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -310,6 +310,12 @@ else
   $(2)_VERSION := $$(call sanitize,$$($(2)_VERSION))
 endif
 
+ifndef $(2)_OVERRIDE_SRCDIR
+  ifdef $(3)_OVERRIDE_SRCDIR
+    $(2)_OVERRIDE_SRCDIR = $$($(3)_OVERRIDE_SRCDIR)
+  endif
+endif
+
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
-- 
1.9.1
