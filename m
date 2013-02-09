From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Feb 2013 10:55:59 +0100
Subject: [Buildroot] [git commit] boost: Pass staging dir to --with-icu
	option.
Message-ID: <20130209095615.EDEC09AA2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5946dcfc582370fa8b55f06517a98bac2b2c1c1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using the --with-icu option without specifying the directory, boost's
bootstrap.sh script will look at "common" locations (lines 289-294):

    COMMON_ICU_PATHS="/usr /usr/local /sw"
    for p in $COMMON_ICU_PATHS; do
      if test -r $p/include/unicode/utypes.h; then
        ICU_ROOT=$p
      fi
    done

With buildroot it may surely become problematic at some point.

Signed-off-by: Ignacy Gaw??dzki <i@lri.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/boost.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
