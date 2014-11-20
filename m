From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 23:06:41 +0100
Subject: [Buildroot] [git commit] clamav: fix bzip2 detection
Message-ID: <20141120221343.1F6657FDBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e1728bb05aa6fd4e571fde91fab4c082b1381c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure gets confused if the host has bzip2 development headers, so force
the results.

Fixes:
http://autobuild.buildroot.net/results/e73/e732d1bac8fe68fd8bba50e4e9d908be3d996c83/
http://autobuild.buildroot.net/results/1a4/1a46e53cf892534f1b3a16c249fa710485290b5a/
http://autobuild.buildroot.net/results/6d0/6d09379aaba0ccddddfee9e319b84687012fd5fc/
http://autobuild.buildroot.net/results/d23/d2310a2f265e7d22c025a61e064a3c29dc6213ef/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index fb3730c..9a4063f 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -32,6 +32,10 @@ CLAMAV_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 CLAMAV_DEPENDENCIES += bzip2
+# autodetection gets confused if host has bzip2, so force it
+CLAMAV_CONF_ENV += \
+	ac_cv_libbz2_libs=-lbz2 \
+	ac_cv_libbz2_ltlibs=-lbz2
 else
 CLAMAV_CONF_OPTS += --disable-bzip2
 endif
