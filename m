From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:42 -0000
Subject: [Buildroot] [git commit] lzo: build shared library for the host
Message-ID: <20180907111550.1058C7F981@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d80864d2ba0e2eba7bf9188ff7967d51c825454
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, the lzo package builds and installs only a static
library. For the target variant, we pass the appropriate
ENABLE_STATIC/ENABLE_SHARED options, but not for the host package, and
therefore a static lzo library gets installed.

However, on the host, our policy is to build shared libraries and not
static libraries, as visible in the default configure options passed
to host package in pkg-autotools.mk (--enable-shared
--disable-static). Let's do the same with lzo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
