From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  6 Feb 2018 15:44:06 -0600
Subject: [Buildroot] [PATCH] libglib2: assume libpcre built with unicode
Message-ID: <1517953446-13576-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pcre package already explicitly sets unicode, so have the dependent
host-libglib2 do similar.  This resolves a build failure of the
configure test for support of pcre unicode in an build environment
where we stop using absolute paths in our rpath, plus create independent
HOST_DIRs not in the search path.  Currently the configure test
assumes some default search paths as part of the build and can't
find the libpcre.so.x.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libglib2/libglib2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b13da33..7cb7666 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -92,6 +92,8 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
+HOST_LIBGLIB2_CONF_ENV = glib_cv_pcre_has_unicode=yes
+
 HOST_LIBGLIB2_CONF_OPTS = \
 	--disable-coverage \
 	--disable-dtrace \
-- 
1.9.1
