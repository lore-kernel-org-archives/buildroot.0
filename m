From: =?UTF-8?q?C=C3=A9dric=20Marie?= <cedric.marie@openmailbox.org>
Date: Wed, 22 Apr 2015 22:11:56 +0200
Subject: [Buildroot] [PATCH] pkg-cmake: Skip compilation in installation step
Message-ID: <1429733516-4466-1-git-send-email-cedric.marie@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With CMake build system, the "make install" command always compiles
before installing, to make sure that everything is up-to-date.

In Buildroot environment, this is quite useless, because the package
has always already been compiled, either at first build, or when
invoking "make <package>-rebuild".
In all cases, when it comes to staging or target installation step, the
package has just been compiled.

Using "make install/fast" - in order to skip the compilation step - is
therefore more appropriate, more consistent with what other build
systems do, and saves time when you need to rebuild your package.

Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
---
 package/pkg-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 2262012..f17a883 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -57,8 +57,8 @@ $(2)_MAKE			?= $$(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPTS		?= install
-$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
-$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
+$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
+$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install/fast
 
 $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
 
-- 
2.1.4
