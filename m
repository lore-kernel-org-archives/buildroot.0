From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:49 +0200
Subject: [Buildroot] [RFC v4 15/16] pkg-generic: ADD_TOOLCHAIN_DEPENDENCY is
	true only for target packages
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-16-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will simplify the commit that add the per-package staging
directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-generic.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3da5a87..376b025 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -394,17 +394,20 @@ $(2)_REDISTRIBUTE		?= YES
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency
-$(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
+ifeq ($(4),target)
+ $(2)_ADD_TOOLCHAIN_DEPENDENCY ?= YES
+else
+ $(2)_ADD_TOOLCHAIN_DEPENDENCY ?= NO
+endif
 
 ifeq ($(4),host)
 $(2)_DEPENDENCIES ?= $$(filter-out  host-toolchain $(1),\
 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
-ifeq ($(4),target)
+
 ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
 $(2)_DEPENDENCIES += toolchain
 endif
-endif
 
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
-- 
2.4.3
