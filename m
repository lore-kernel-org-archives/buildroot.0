From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 18:41:01 +0200
Subject: [Buildroot] [git commit] package/lzo: enable shared/static libs
	when needed
Message-ID: <20170902163603.6EBA481E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=802aaa55b9aece24db79b243e0fdf3f60ea6e69b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 61c4c63 (package/lzo: switch to cmake), building lzo has switched
from autotools to cmake. In the conversion, we've lost the build of the
shared library, because the cmake-based buildsystem of lzo explcitly
disables it by default.

Restore the shared library build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzo/lzo.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index dba965f..27ca459 100644
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
