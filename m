From: Ignacy Gawedzki <i@lri.fr>
Date: Thu, 7 Feb 2013 14:48:35 +0100
Subject: [Buildroot] [PATCH] boost: Pass staging dir to --with-icu option.
Message-ID: <20130207134835.GA23603@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using the --with-icu option without specifying the directory, boost's
bootstrap.sh script will look at "common" locations (lines 289-294):

    COMMON_ICU_PATHS="/usr /usr/local /sw"
    for p in $COMMON_ICU_PATHS; do
      if test -r $p/include/unicode/utypes.h; then
        ICU_ROOT=$p
      fi
    done

With buildroot it may surely become problematic at some point.
---
 package/boost/boost.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 5e1bb4e..a202848 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -39,7 +39,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
 
 ifeq ($(BR2_PACKAGE_ICU),y)
-BOOST_FLAGS += --with-icu
+BOOST_FLAGS += --with-icu=$(STAGING_DIR)/usr
 BOOST_DEPENDENCIES += icu
 else
 BOOST_FLAGS += --without-icu
-- 
1.7.10.4
