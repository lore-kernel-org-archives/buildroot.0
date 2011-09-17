From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 22:22:57 +0200
Subject: [Buildroot] [PATCH 7/8] package: change ordering of steps
In-Reply-To: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5a8e557f8f35394252c05dd5176e143b38a3469f.1316290714.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the dependency chain is :

 configure -> patch
 patch -> extract
 extract -> depends
 depends -> source + dependencies ready

This is a problem for RTAI, as :

 * In linux/linux-ext-rtai.mk, we need the RTAI source code to be
   extracted/patched by the RTAI package, so we need to have a
   dependency on RTAI.

 * The RTAI package cannot have its configure step executed before the
   Linux kernel is built, because it needs the kernel source code to
   be extracted and configured.

Therefore, we have a sort of circular dependency. We solve this
circular dependency by having the RTAI kernel part depending on
rtai-patch, and having the RTAI userspace part depending on the linux
package. However, for this to work, we have to modify the dependency
chain to:

 configure -> patch + depends
 patch -> extract
 extract -> source
 depends -> dependencies ready

Which means that dependencies are guaranteed to be built not when the
package is extracted, but when the package is configured. Which is
technically more correct that what we were doing in the past.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 0751144..66be0a2 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -487,15 +487,15 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD)
 
-$(1)-configure:		$(1)-patch \
+$(1)-configure:		$(1)-patch $(1)-depends \
 			$$($(2)_TARGET_CONFIGURE)
 
 $(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
 
-$(1)-extract:		$(1)-depends \
+$(1)-extract:		$(1)-source \
 			$$($(2)_TARGET_EXTRACT)
 
-$(1)-depends:		$(1)-source $$($(2)_DEPENDENCIES)
+$(1)-depends:		$$($(2)_DEPENDENCIES)
 
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
-- 
1.7.4.1
