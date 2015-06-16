From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Tue, 16 Jun 2015 15:21:28 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages and
	theirs local dependencies
Message-ID: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The purpose of this patch is to rebuild local site packages and theirs
local dependencies if the source has changed. Therefore, if the source
of a package has changed, it will be rebuild if you type make or
make <pkg>. Likewise, if a package has a library dependency which is
local site package too and you type make <pkg>, the library will be
rebuild if the source has been modified.

This behavior is pretty useful if you use buildroot with many of your
own packages. Especially if you share these packages with a developer
team through a version control system like git.

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d5b29f0..929a31c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -509,6 +509,10 @@ ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
 endif
 
+ifeq ($$($(2)_SITE_METHOD),local)
+$$($(2)_TARGET_RSYNC): $(1)-clean-for-rebuild
+endif
+
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # In the normal case (no package override), the sequence of steps is
 #  source, by downloading
-- 
2.1.4
