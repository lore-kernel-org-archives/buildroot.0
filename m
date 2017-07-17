From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 17 Jul 2017 15:13:08 -0700
Subject: [Buildroot] [PATCH] package: libglib2: explicitly specify host's
	PYTHON to be used
Message-ID: <20170717221308.16711-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unless explicitly told otherwise, libglib2's ./configure step will
pick up the first python implementation it finds in ${PATH} as the
python to use for code generation scripts executed as a part of build
process. Because [host-]python is not specified in any of the
_DEPENDENCIES this creates a corner case leading to build failure.

What happens is [host-]libglib2's ./configure, executead after
[host-]python is already built, ends up picking up python from
${HOST_DIR}, which, not specified as a dependency will cause partial
rebuilds executed as:

cd ${OUTPUT_DIR}
find ${BUILD_DIR} -name ".stamp_host_installed" | xargs rm -f
rm -rf ${HOST_DIR}
make host-libglib2-install

to fail, becuase python would not be re-installed to ${HOST_DIR}.

To avoid having this problem completely, specify host's python using
--with-python option explicitly.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/libglib2/libglib2.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 47d9f6313..fe53f2d3f 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -90,6 +90,12 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
+#
+# We explicitly specify --with-python to point to host's python here
+# and in LIBGLIB2_CONF_OPTS to make sure that ./configure does not
+# pick up python from ${HOST_DIR} thus creating a dependency that
+# would have to be specified in _DEPENDENCIES
+#
 HOST_LIBGLIB2_CONF_OPTS = \
 	--disable-coverage \
 	--disable-dtrace \
@@ -98,7 +104,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	--disable-selinux \
 	--disable-systemtap \
 	--disable-xattr \
-	--with-pcre=system
+	--with-pcre=system \
+	--with-python=$$(which python)
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 host-gettext \
@@ -114,6 +121,7 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 
 LIBGLIB2_CONF_OPTS = \
 	--with-pcre=system
+	--with-python=$$(which python)
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
-- 
2.13.3
