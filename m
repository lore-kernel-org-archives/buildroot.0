From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 23:15:58 +0100
Subject: [Buildroot] [git commit] icu: speed up host build
Message-ID: <20130310223431.5EF029AFF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f6baf89d487c6aaf5fb3684c48032a3460e2b45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host build of icu doesn't need to build everything, so we can add
a few more --disable-<foo> options to save a little bit of build time.

On a fast build server, this bring the host icu build from 2m28.517s
to 2m5.192s.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/icu/icu.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 5a88496..7658589 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -15,7 +15,12 @@ ICU_INSTALL_STAGING = YES
 ICU_CONFIG_SCRIPTS = icu-config
 ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
 		--disable-tests
-HOST_ICU_CONF_OPT = --disable-samples --disable-tests
+HOST_ICU_CONF_OPT = \
+	--disable-samples \
+	--disable-tests \
+	--disable-extras \
+	--disable-icuio \
+	--disable-layout
 ICU_MAKE = $(MAKE1)
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
