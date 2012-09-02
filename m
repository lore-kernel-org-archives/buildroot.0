From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Sep 2012 17:43:53 +0200
Subject: [Buildroot] [PATCH 10/12] pkg-infra: ensure gettext gets built
	before all other packages
In-Reply-To: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1346600635-30946-11-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the gettext package is selected, it means that the toolchain does not
provide gettext functionality, and that at least one package needs it.
Thus, the gettext package needs to be built before any such package.

So far, packages that need gettext declare an explicit conditional
build-dependency upon gettext, thus ensuring that gettext be built
before they are.

But if gettext was built first, packages would no longer need to declare
such an explicit build-dependency.

As it is not easy to ensure that gettext be the first package, we can also
declare it as a dependency of all packages (except itself, of course).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffe7dfb..b731ff0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -367,7 +367,8 @@ $(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
 $(1)-extract:		$(1)-source \
 			$$($(2)_TARGET_EXTRACT)
 
-$(1)-depends:		$$($(2)_DEPENDENCIES)
+$(1)-depends:		$(filter-out $(1),$(if $(BR2_PACKAGE_GETTEXT),gettext))	\
+			$$($(2)_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 else
@@ -378,7 +379,9 @@ else
 $(1)-configure:		$(1)-depends \
 			$$($(2)_TARGET_CONFIGURE)
 
-$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
+$(1)-depends:		$(1)-rsync						\
+			$(filter-out $(1),$(if $(BR2_PACKAGE_GETTEXT),gettext))	\
+			$$($(2)_DEPENDENCIES)
 
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
@@ -386,7 +389,7 @@ $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 endif
 
 $(1)-show-depends:
-			@echo $$($(2)_DEPENDENCIES)
+			@echo $(filter-out $(1),$(if $(BR2_PACKAGE_GETTEXT),gettext)) $$($(2)_DEPENDENCIES)
 
 $(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
 
-- 
1.7.2.5
