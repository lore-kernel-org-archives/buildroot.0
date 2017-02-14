From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Feb 2017 22:13:16 +0100
Subject: [Buildroot] [PATCH] package/opengl: ensure consistency between the
	various providers
Message-ID: <1487106796-15403-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some GL providers will provide libegl and libgles, but not libgl, while
other will provide libgl but not libegl not libgles. This can be the
case with:
  - mesa3d       -> libgl
  - rpi-userland -> libegl and libgles

Since we can not protect against this situation in the Config.in files
(especially because providers may be out-of-tree), we can only check for
the validity after the fact.

Fixes:
    http://autobuild.buildroot.org/results/6f1/6f197c643972e92f0b27b3afac7da7b4b1115f7e/
    http://autobuild.buildroot.org/results/6c6/6c6e0a236bde7b892a69119a49422119f3efaa97/
    http://autobuild.buildroot.org/results/5a2/5a2a1503b7d19c0ca5b0e9093aa24ed9c020e812/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opengl/opengl.mk | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/opengl/opengl.mk b/package/opengl/opengl.mk
index abf96d5..47902f2 100644
--- a/package/opengl/opengl.mk
+++ b/package/opengl/opengl.mk
@@ -1 +1,30 @@
 include $(sort $(wildcard package/opengl/*/*.mk))
+
+# Ensure consistency betwenn the various GL providers:
+
+# If we have a libgl provider, then the libegl provider must be the same
+ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_HAS_LIBEGL),yy)
+# No need to qstrip, both are quoted
+ifneq ($(BR2_PACKAGE_PROVIDES_LIBGL),$(BR2_PACKAGE_PROVIDES_LIBEGL))
+$(error Provider for libgl ($(BR2_PACKAGE_PROVIDES_LIBGL)) is not the same \
+	as for libegl ($(BR2_PACKAGE_PROVIDES_LIBEGL)))
+endif
+endif
+
+# If we have a libgl provider, then the libgles provider must be the same
+ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+# No need to qstrip, both are quoted
+ifneq ($(BR2_PACKAGE_PROVIDES_LIBGL),$(BR2_PACKAGE_PROVIDES_LIBGLES))
+$(error Provider for libgl ($(BR2_PACKAGE_PROVIDES_LIBGL)) is not the same \
+	as for libgles ($(BR2_PACKAGE_PROVIDES_LIBGLES)))
+endif
+endif
+
+# If we have a libegl provider, then the libgles provider must be the same
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+# No need to qstrip, both are quoted
+ifneq ($(BR2_PACKAGE_PROVIDES_LIBEGL),$(BR2_PACKAGE_PROVIDES_LIBGLES))
+$(error Provider for libegl ($(BR2_PACKAGE_PROVIDES_LIBEGL)) is not the same \
+	as for libgles ($(BR2_PACKAGE_PROVIDES_LIBGLES)))
+endif
+endif
-- 
2.7.4
