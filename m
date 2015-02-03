From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 18:05:21 +0100
Subject: [Buildroot] [git commit] pkg-generic: reinstall target
Message-ID: <20150203170923.52299803CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7bc44d22d0fddde7c964a2fd259775ea8d0bf9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a <pkg>-reinstall target, just like <pkg>-rebuild and
<pkg>-reconfigure, but that only retrigger the install step of the
package.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 38ef581..1b09955 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -577,16 +577,20 @@ $(1)-graph-depends: graph-depends-requirements
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
-$(1)-clean-for-rebuild:
+$(1)-clean-for-reinstall:
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 			rm -f $$($(2)_TARGET_RSYNC)
 endif
-			rm -f $$($(2)_TARGET_BUILD)
 			rm -f $$($(2)_TARGET_INSTALL_STAGING)
 			rm -f $$($(2)_TARGET_INSTALL_TARGET)
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
 
+$(1)-reinstall:		$(1)-clean-for-reinstall $(1)
+
+$(1)-clean-for-rebuild: $(1)-clean-for-reinstall
+			rm -f $$($(2)_TARGET_BUILD)
+
 $(1)-rebuild:		$(1)-clean-for-rebuild $(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
