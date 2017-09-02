From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 23:05:09 +0200
Subject: [Buildroot] [git commit] package/xmlstarlet: fix host build
Message-ID: <20170902205841.31CB18018D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d8247947eb756a8505b5930c66b034e58b10df0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
src/xml_C14N.c:12:31: fatal error??: libxml/xmlversion.h : No such file or directory
 #include <libxml/xmlversion.h>
                               ^
In file included from src/trans.c:4:0:
src/trans.h:32:30: fatal error??: libxml/xmlmemory.h : No such file or directory
 #include <libxml/xmlmemory.h>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: remove french messages from the commit log, drop
--with-libiconv-prefix option, since we don't have a libiconv
dependency for the host.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xmlstarlet/xmlstarlet.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 9920dcf..1d748dc 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -26,5 +26,9 @@ endif
 
 HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
 
+HOST_XMLSTARLET_CONF_OPTS += \
+	--with-libxml-prefix=$(HOST_DIR)/usr \
+	--with-libxslt-prefix=$(HOST_DIR)/usr
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
