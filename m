From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Sep 2016 23:59:20 +0200
Subject: [Buildroot] [PATCH 2/2 v8] core/pkg-cmake: ensure no package needs
	a cmake newer than we do
In-Reply-To: <cover.1473717489.git.yann.morin.1998@free.fr>
References: <cover.1473717489.git.yann.morin.1998@free.fr>
Message-ID: <51cc816673de51799d4f86a7045ef4f480fbab46.1473717489.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the existing host cmake is deemed usable, we now skip building our
own variant.

However, in the following conditions, the build would fail:

  - host cmake: 3.2
  - Buildroot requirement: 3.1
  - package requirement: 3.4
  - cmake package in Buildroot: 3.5

This is because Buildroot would consider that cmake-3.2 is usable (and
it technically is for Buildroot, which requires 3.0), but the package
will fail at configure time.

To catch this situation and fix Buildroot, we add a post-patch hook that
checks that, amongst all cmake versions required by the package, the
version required by Buildroot is at least equal or higher.

We do use a post-patch hook rather than the more expected pre-configure
hook, to avoid having to build all the package dependencies just to
check the cmake version.

Exclude the cmake (target variant) from that check, since it requires
cmake >= 3.4. However, that requirement is only for the tests, and we're
not building them; all the other parts of the build have no requirement
besides a cmake >= 2.8). Bumping the version Buildroot requires to 3.4
would almost always defeat the purpose of this change, as a lot of
not-so-old distributions are still using cmake < 3.4; only very recent
ones released since the end of 2015 would stand a chance of having such
a cmake version. So we just exclude cmake from that check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Davide Viti <zinosat@tiscali.it>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-cmake.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index aca9e61..e77945d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -35,6 +35,39 @@ ifneq ($(QUIET),)
 CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
 endif
 
+#
+# Check the package does not require a cmake version more recent than we do.
+#
+# Some packages may use a variable to set the minimum required version. In
+# this case, there is not much we can do, so we just accept it; the configure
+# would fail later anyway in this case.
+#
+# We sort all the minimum versions required by the package (there may be more
+# than one, if the package has cmake "sub-modules"), to which we add our own
+# version. We then sort everything to get the highest version first, and expect
+# our version to win.
+#
+# If not, then it means the package has a higher requirement than we do.
+#
+define CMAKE_CHECK_MIN_VERSION
+	$(Q)v=$$( \
+		{ grep -hr -i 'cmake_minimum_required.*version' $(@D); \
+		  echo $(BR2_CMAKE_VERSION_MIN); \
+		} \
+		|tr '[:upper:]' '[:lower:]' \
+		|sed -r -e '/.*\(version ([[:digit:]]+\.[[:digit:]]+).+/!d; s//\1/' \
+		|sort -t. -k 1,1nr -k2,2nr \
+		|head -n 1 \
+		); \
+	if [ "$${v}" != "$(BR2_CMAKE_VERSION_MIN)" ]; then \
+		printf "*** Error: package %s needs cmake version >= %s\n" $($(PKG)_NAME) $${v}; \
+		printf "***        Buildroot's minimum version BR2_CMAKE_VERSION_MIN\n"; \
+		printf "***        should be set to at least that version, but is\n" \
+		printf "***        currently set to %s."; $(BR2_CMAKE_VERSION_MIN); \
+		exit 1; \
+	fi
+endef
+
 ################################################################################
 # inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
@@ -71,6 +104,13 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+# Special exception for cmake, which requires cmake up to 3.4, but
+# only to run its tests; all other equirements are on at most 3.0.
+# Just skip the version check for cmake, and only for cmake.
+ifneq ($(1),cmake)
+$(2)_POST_PATCH_HOOKS += CMAKE_CHECK_MIN_VERSION
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
-- 
2.7.4
