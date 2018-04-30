From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 30 Apr 2018 12:23:59 -0700
Subject: [Buildroot] [PATCH 2/2] packages: Use PKG_PYTHON_HOST_PYTHON for
 host python
In-Reply-To: <20180430192359.15733-1-tpiepho@impinj.com>
References: <20180430192359.15733-1-tpiepho@impinj.com>
Message-ID: <20180430192359.15733-3-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are not python packages, but they still depend on host-python.
Have them use $(PKG_PYTHON_HOST_PYTHON) as the dependency so they use
the correct python version.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/gtest/gtest.mk | 5 ++---
 package/ninja/ninja.mk | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index b62ceb3270..907fe73168 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -17,13 +17,12 @@ endif
 
 HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
 HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python3
 else
 HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python
 endif
+HOST_GTEST_DEPENDENCIES += $(PKG_PYTHON_HOST_PYTHON)
 
 HOST_GTEST_GMOCK_PYTHONPATH = \
 	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 259a87d216..670b074b12 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -8,8 +8,7 @@ NINJA_VERSION = v1.8.2
 NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
-
-HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+HOST_NINJA_DEPENDENCIES = $(PKG_PYTHON_HOST_PYTHON)
 
 define HOST_NINJA_BUILD_CMDS
 	(cd $(@D); ./configure.py --bootstrap)
-- 
2.14.3
