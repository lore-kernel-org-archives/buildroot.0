From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 14:47:18 +0100
Subject: [Buildroot] [PATCH 5/5] guile: fix libltdl and libgmp detection
In-Reply-To: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419688038-15640-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly pass the path to libtldl and libgmp, so that guile does not
try to use host versions when available.

Fixes:

  http://autobuild.buildroot.org/results/056/056b7fcbf3b73a8d15ca635b000771cdc2d7fbf9/

And another similar problem with libgmp.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/guile/guile.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 30af11d..194eca2 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -29,5 +29,9 @@ GUILE_CFLAGS = \
 GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 
+GUILE_CONF_OPTS += \
+	--with-libltdl-prefix=$(STAGING_DIR)/usr/lib \
+	--with-libgmp-prefix=$(STAGING_DIR)/usr/lib
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
