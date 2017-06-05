From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 18:53:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/cppcms: use correct cxxflags for
	icu support
Message-ID: <20170605165346.1906-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cppcms lacks "-std=c++11", provided by icu-config, when compiling icu
support leading to a build failure:

/home/buildroot/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/unicode/umachine.h:347:13:
 error: ?char16_t? does not name a type

Fixes
http://autobuild.buildroot.net/results/a81/a81ef7fc945e393179fef7539e01550830b71d22/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cppcms/cppcms.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 75ef36afb..789d60498 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -19,6 +19,8 @@ CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICONV=ON -DDISABLE_ICU_LOCALE=OFF
+CPPCMS_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
 CPPCMS_DEPENDENCIES += icu
 else
 CPPCMS_CONF_OPTS += -DDISABLE_ICONV=OFF -DDISABLE_ICU_LOCALE=ON
-- 
2.11.0
