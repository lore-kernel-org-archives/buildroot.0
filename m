From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Sep 2017 22:07:41 +0200
Subject: [Buildroot] [PATCH v2] package/xmlstarlet: fix host build
Message-ID: <20170902200741.2878-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide the path to HOST_DIR for libxml, libxslt and libiconv like for
the target variant to avoid a build issue on host where /bin is a
symlink to /usr/bin.

Indeed, the configure script use a custom m4 macro XSTAR_LIB_CHECK to
find xml2-config:

XSTAR_LIB_CHECK([LIBXML], [xml2-config])

This macro come from a local m4 file m4/xstar-check-libs.m4 where it
use:

AC_PATH_PROG(LIBXXX()_CONFIG, xxx_config(),
               [], [$LIBXXX()_PREFIX/bin$PATH_SEPARATOR$PATH]

Since no prefix seems to be defined by $LIBXXX()_PREFIX, AC_PATH_PROG
look by itself at /bin/ for xml2-config. So the PATH variable set
by Buildroot containing HOST_DIR/bin is ignored.

The wrong xml2-config is used during the build and the build fail
when no xml2 headers are installed on the host.

Fixes:
src/xml_C14N.c:12:31: erreur fatale?: libxml/xmlversion.h : No such file or directory
 #include <libxml/xmlversion.h>
                               ^
In file included from src/trans.c:4:0:
src/trans.h:32:30: erreur fatale?: libxml/xmlmemory.h : No such file or directory
 #include <libxml/xmlmemory.h>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: improve the commit message (ThomasP)
---
 package/xmlstarlet/xmlstarlet.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 9920dcf..673eedb 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -26,5 +26,10 @@ endif
 
 HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
 
+HOST_XMLSTARLET_CONF_OPTS += \
+	--with-libxml-prefix=$(HOST_DIR)/usr \
+	--with-libxslt-prefix=$(HOST_DIR)/usr \
+	--with-libiconv-prefix=$(HOST_DIR)/usr
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.5
