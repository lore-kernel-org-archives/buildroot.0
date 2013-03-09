From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Mar 2013 15:03:00 +0100
Subject: [Buildroot] [PATCH 3/3] icu: speed up host build
In-Reply-To: <1362837781-27071-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362837781-27071-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362837781-27071-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host build of icu doesn't need to build everything, so we can add
a few more --disable-<foo> options to save a little bit of build time.

On a fast build server, this bring the host icu build from 2m28.517s
to 2m5.192s.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/icu.mk |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

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
-- 
1.7.9.5
