From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 23:59:51 +0200
Subject: [Buildroot] [PATCH next 1/4] lzo: build shared library for the host
In-Reply-To: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
References: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180821215954.11971-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, the lzo package builds and installs only a static
library. For the target variant, we pass the appropriate
ENABLE_STATIC/ENABLE_SHARED options, but not for the host package, and
therefore a static lzo library gets installed.

However, on the host, our policy is to build shared libraries and not
static libraries, as visible in the default configure options passed
to host package in pkg-autotools.mk (--enable-shared
--disable-static). Let's do the same with lzo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lzo/lzo.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 27ca459acf..0ead92725a 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -23,5 +23,7 @@ else
 LZO_CONF_OPTS += -DENABLE_STATIC=OFF
 endif
 
+HOST_LZO_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.14.4
