From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:19:47 +0100
Subject: [Buildroot] [git commit] guile: fix libltdl,
	libgmp and libunistring detection
Message-ID: <20141227162027.C26EB8045F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64973b0946cefb06915674bc87a7a9ce5bf70699
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly pass the path to libtldl, libgmp and libunistring, so that
guile does not try to use host versions when available.

Fixes:

  http://autobuild.buildroot.org/results/056/056b7fcbf3b73a8d15ca635b000771cdc2d7fbf9/

And another similar problem with libgmp and libunistring.

[Thomas: added --with-libunistring-prefix, as suggested by Samuel
Martin.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
---
 package/guile/guile.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 30af11d..e57c917 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -29,5 +29,10 @@ GUILE_CFLAGS = \
 GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 
+GUILE_CONF_OPTS += \
+	--with-libltdl-prefix=$(STAGING_DIR)/usr/lib \
+	--with-libgmp-prefix=$(STAGING_DIR)/usr/lib \
+	--with-libunistring-prefix=$(STAGING_DIR)/usr/lib
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
