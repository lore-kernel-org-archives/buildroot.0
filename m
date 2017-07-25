From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 20:41:22 +0200
Subject: [Buildroot] [PATCH] cppcms: fix build with ICU enabled,
	but CPPCMS_ICU disabled
Message-ID: <20170725184122.13076-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the ICU package is enabled (BR2_PACKAGE_ICU=y) but ICU support in
cppcms is disabled (BR2_PACKAGE_CPPCMS_ICU is disabled), cppcms still
detects ICU, but it fails to build since we don't get the proper ICU
CXXFLAGS.

In addition, this is not the intended behavior: when
BR2_PACKAGE_CPPCMS_ICU is disabled, we except cppcms to be built
without ICU support.

To achieve this, we pass -DDISABLE_ICU_LOCALE=ON when
BR2_PACKAGE_CPPCMS_ICU is disabled (yes DISABLE_ICU_LOCALE means the
logic is inverted).

While at it, we pass DISABLE_ICU_LOCALE=OFF when ICU support is
enabled, and not DISABLE_ICONV=ON. The latter has been passed in this
condition since the cppcms package was introduced in Buildroot, but it
doesn't seem to make sense.

Fixes:

  http://autobuild.buildroot.net/results/b6a8c7000c5742efc9d8e13507dab86e36b62840/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppcms/cppcms.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index e72acb2..f3ea2628 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -21,9 +21,11 @@ CPPCMS_CONF_OPTS = \
 CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
-CPPCMS_CONF_OPTS += -DDISABLE_ICONV=ON
+CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
 CPPCMS_DEPENDENCIES += icu
 CPPCMS_CXXFLAGS += "`$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
+else
+CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=ON
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.9.4
