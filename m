From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Aug 2017 04:10:57 +0000
Subject: [Buildroot] [Bug 10246] New: BR2_ENABLE_DEBUG does not have the
 expected effect for cmake packages
Message-ID: <bug-10246-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10246

            Bug ID: 10246
           Summary: BR2_ENABLE_DEBUG does not have the expected effect for
                    cmake packages
           Product: buildroot
           Version: 2017.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: joker.eph at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I've been bitten by the option BR2_ENABLE_DEBUG which does not exactly do what
the doc describes:


config BR2_ENABLE_DEBUG
        bool "build packages with debugging symbols"
        help
          Build packages with debugging symbols enabled. All libraries
          and binaries in the 'staging' directory will have debugging
          symbols, which allows remote debugging even if libraries and
          binaries are stripped on the target. Whether libraries and
          binaries are stripped on the target is controlled by the
          BR2_STRIP_* options below.


For a CMake package, this corresponds to `-DCMAKE_BUILD_TYPE=RelWithDebInfo`,
however currently buildroot will pass  `-DCMAKE_BUILD_TYPE=Debug` which has the
effect of generating a *non-optimized* build (i.e. -O0).

I suggest the following patch:

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index db78d897d826..0a7bee685096 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -257,7 +257,7 @@ $(HOST_DIR)/share/buildroot/toolchainfile.cmake:
                -e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call
qstrip,$(TARGET_FC)))#' \
                -e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call
qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
                -e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if
$(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
-               -e 's#@@CMAKE_BUILD_TYPE@@#$(if
$(BR2_ENABLE_DEBUG),Debug,Release)#' \
+               -e 's#@@CMAKE_BUILD_TYPE@@#$(if
$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release)#' \
                $(TOPDIR)/support/misc/toolchainfile.cmake.in \
                > $@

-- 
You are receiving this mail because:
You are on the CC list for the bug.
