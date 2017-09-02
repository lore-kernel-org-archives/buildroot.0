From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 Sep 2017 16:28:53 +0200
Subject: [Buildroot] [PATCH] package/lzo: enable shared/static libs when
	needed
Message-ID: <20170902142853.18011-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 61c4c63 (package/lzo: switch to cmake), building lzo has switched
from autotools to cmake. In the conversion, we've lost the build of the
shared library, because the cmake-based buildsystem of lzo explcitly
disables it by default.

Restore the shared library build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

---
Note: it was noticed because of an autobuild failure of cairo:
http://autobuild.buildroot.org/results/d51/d51888cbc3a743d53ce38f736ee43953e50bdf61/
but it has not been checked wether this patch fixes the build at all.
Yet, the patch is still valid even without fixing the autobuild failure.
---
 package/lzo/lzo.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index dba965fcd3..27ca459acf 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -11,5 +11,17 @@ LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
 LZO_SUPPORTS_IN_SOURCE_BUILD = NO
 
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LZO_CONF_OPTS += -DENABLE_SHARED=ON
+else
+LZO_CONF_OPTS += -DENABLE_SHARED=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LZO_CONF_OPTS += -DENABLE_STATIC=ON
+else
+LZO_CONF_OPTS += -DENABLE_STATIC=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.11.0
