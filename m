From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Sep 2011 23:00:07 +0200
Subject: [Buildroot] [git commit] package: change ordering of steps
Message-ID: <20110918210216.599A88D5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a473a616d27e46951a23d90249a31b08006098bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
