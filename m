From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 22:01:39 +0200
Subject: [Buildroot] [git commit] package/libcpprestsdk: work around gcc bug
 85180
Message-ID: <20190524195543.F1B5C8B852@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=318abefa254249d9ed58d9f0035a9d5b2e9077b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building libcpprestsdk with optimization but not when
building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/7065e14917a8bbc0faf21b29183ac55b6c800ee3/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index e8dddeddd7..10b5934d05 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -18,8 +18,10 @@ LIBCPPRESTSDK_CONF_OPTS += \
 	-DBoost_USE_STATIC_RUNTIME=ON
 endif
 
+LIBCPPRESTSDK_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+LIBCPPRESTSDK_CXXFLAGS += -latomic
 endif
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
@@ -36,4 +38,10 @@ else
 LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=ON
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+LIBCPPRESTSDK_CXXFLAGS += -O0
+endif
+
+LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBCPPRESTSDK_CXXFLAGS)"
+
 $(eval $(cmake-package))
