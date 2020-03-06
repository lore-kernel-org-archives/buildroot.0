From: Eugen Hristev <eugen.hristev@microchip.com>
Date: Fri, 6 Mar 2020 15:06:49 +0200
Subject: [Buildroot] [PATCH] package/ninja: add dependency to host-cmake for
 host-ninja
Message-ID: <20200306130649.18989-1-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we change the minimum CMAKE version in external,
buildroot will try to build host-cmake , but, host-cmake
is not built yet at the time of ninja build.
So, we need to add a dependency to host-cmake in host-ninja.
Otherwise, host-ninja will try to use the host-cmake but
'file not found' error.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---

Hello Thomas,

I am unsure about this patch, but this fixes the issue for me.
If we change the minimum CMAKE version in our external tree, we hit this
issue: the fact that the host-cmake is not yet built when it's needed.
How can we fix that ?
This patch makes host-cmake being built at the moment when ninja needs it.
It can happen that some other package may need it before, but I cannot know,
if it's not enabled in our config.

Actually, this all started from the fact that BR2_CMAKE_VERSION_MIN is hardcoded
in mk file in the support/dependencies.
How can this be hardcoded, when we can build buildroot with an external that
needs a newer CMAKE ?
So, to fix this I added in the external.mk:


BR2_CMAKE_VERSION_MIN = 3.13

BR2_CMAKE_CANDIDATES ?= cmake cmake3
BR2_CMAKE ?= $(call suitable-host-package,cmake,\
       $(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
ifeq ($(BR2_CMAKE),)
BR2_CMAKE = $(HOST_DIR)/bin/cmake
BR2_CMAKE_HOST_DEPENDENCY = host-cmake
endif


But now ninja fails because host-cmake does not exist yet. Not built yet.
So with this patch , all is fixed, but is this the right way, and can we
do it better from just the external ? To force the host-cmake to build
and ALL packets needing cmake to start using it.

Thanks,
Eugen

 package/ninja/ninja.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 060893d85f..998893f243 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -9,6 +9,9 @@ NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
+HOST_NINJA_DEPENDENCIES += \
+	host-cmake
+
 define HOST_NINJA_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
 endef
-- 
2.17.1
