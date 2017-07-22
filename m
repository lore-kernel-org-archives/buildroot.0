From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:24:26 +0200
Subject: [Buildroot] [PATCH] cppcms: fix build with ICU
Message-ID: <20170722202426.29171-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump of ICU to 59.1, it needs C++11. cppcms has been updated
with the appropriate dependency on gcc >= 4.8, but it also needs
-std=c++11. Therefore, this patch complements the CXXFLAGS passed to
cppcms by adding what icu-config reports, in a manner similar to what
was done to fix the same issue in the PHP package in commit
214a76d045f906c1a8d687b7c7e7bc85c5b09906 ("package/php: fix icu
support").

Fixes:

  http://autobuild.buildroot.net/results/f05d9999f1f3248b6a50f14de476108028ed047e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppcms/cppcms.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 4b4a2c6..e72acb2 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -10,16 +10,20 @@ CPPCMS_LICENSE = LGPL-3.0
 CPPCMS_LICENSE_FILES = COPYING.TXT
 CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
 CPPCMS_INSTALL_STAGING = YES
+CPPCMS_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 # disable rpath to avoid getting /usr/lib added to the link search
 # path
-CPPCMS_CONF_OPTS = -DCMAKE_SKIP_RPATH=ON
+CPPCMS_CONF_OPTS = \
+	-DCMAKE_SKIP_RPATH=ON \
+	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
 
 CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICONV=ON
 CPPCMS_DEPENDENCIES += icu
+CPPCMS_CXXFLAGS += "`$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.9.4
