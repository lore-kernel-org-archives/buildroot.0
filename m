From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Oct 2019 09:26:43 -0600
Subject: [Buildroot] [PATCH v4 2/2] support/dependencies: set cmake version
 min to 3.10
In-Reply-To: <20191012152643.67744-1-james.hilliard1@gmail.com>
References: <20191012152643.67744-1-james.hilliard1@gmail.com>
Message-ID: <20191012152643.67744-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We retain 3.8 as the minimum for hosts without a c++ toolchain.

All packages that require 3.10 or newer themselves require a c++ toolchain.

This is required by wpewebkit and webkitgtk.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v3 -> v4:
  - retain support for version 3.8.2 for older toolchains
---
 support/dependencies/check-host-cmake.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 5604713de6..7d59708573 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,17 @@
-# Set this to either 3.8 or higher, depending on the highest minimum
+# Set this to either 3.10 or higher, depending on the highest minimum
 # version required by any of the packages bundled in Buildroot. If a
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
+# Newer versions of cmake require a c++11 toolchain so we should
+# only build newer versions if our host gcc supports c++11.
+# Packages that depend upon newer cmake versions all currently
+# require a c++11 toolchain themselves.
 #
+ifeq ($(BR2_HOST_GCC_AT_LEAST_4_8),y)
+BR2_CMAKE_VERSION_MIN = 3.10
+else
 BR2_CMAKE_VERSION_MIN = 3.8
+endif
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.20.1
