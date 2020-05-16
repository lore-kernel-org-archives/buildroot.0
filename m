From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 May 2020 14:19:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: force Release mode
Message-ID: <20200516121935.1235445-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Debug build without SSP will fail on:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/8.3.0/../../../../i586-buildroot-linux-musl/bin/ld: cannot find -lssp_nonshared
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/8.3.0/../../../../i586-buildroot-linux-musl/bin/ld: cannot find -lssp

because of the following lines in CMakeLists.txt:

if(CMAKE_BUILD_TYPE MATCHES "Debug")
    set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -g -O0 -fprofile-arcs -ftest-coverage -fstack-protector-all --param=ssp-buffer-size=4")
endif()

So force Release mode

Fixes:
 - http://autobuild.buildroot.org/results/3ed42be111cc8c3b3d1d4f6504ae548730ab6af6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pistache/pistache.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
index c182754cee..f258bae3bc 100644
--- a/package/pistache/pistache.mk
+++ b/package/pistache/pistache.mk
@@ -11,6 +11,9 @@ PISTACHE_LICENSE_FILES = LICENSE
 
 PISTACHE_INSTALL_STAGING = YES
 
+# Force Release to fix build failure without SSP
+PISTACHE_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PISTACHE_DEPENDENCIES += openssl
 PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=ON
-- 
2.26.2
