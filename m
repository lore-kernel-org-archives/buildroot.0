From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 22:08:30 +0100
Subject: [Buildroot] [git commit] cjson: build shared and static library
Message-ID: <20180103210844.8B01783A9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aca8412ce27fdb216e80145933baa13c15118719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cjson 1.6.0 added the BUILD_SHARED_AND_STATIC_LIBS option which is OFF
by default so set it depending on BR2_SHARED_STATIC_LIBS value.

If BUILD_SHARED_AND_STATIC_LIBS is set to OFF, cjson uses the standard
BUILD_SHARED_LIBS option which is passed by the cmake-package
infrastructure.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index f3ef7fd..aabf367 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -15,4 +15,10 @@ CJSON_CONF_OPTS += \
 	-DENABLE_CJSON_TEST=OFF \
 	-DENABLE_CUSTOM_COMPILER_FLAGS=OFF
 
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+CJSON_CONF_OPTS += -DBUILD_SHARED_AND_STATIC_LIBS=ON
+else
+CJSON_CONF_OPTS += -DBUILD_SHARED_AND_STATIC_LIBS=OFF
+endif
+
 $(eval $(cmake-package))
