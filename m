From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 3 Nov 2015 18:18:32 +0100
Subject: [Buildroot] [PATCH] elfutils: fix sparc64 build, -fPIC required
Message-ID: <20151103171832.GA7668@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following autobuild errors:
http://autobuild.buildroot.net/results/82cc7766d2c805146e94baf82a24d1002f56593d/
http://autobuild.buildroot.net/results/ca4ca362581ee0111cba389d1afbff287692c21b/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/elfutils/elfutils.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 838c3b8..261849a 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -21,6 +21,11 @@ ELFUTILS_CONF_ENV += \
 	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
 	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
 
+# sparc64 needs -fPIC instead of -fpic
+ifeq ($(BR2_sparc64),y)
+ELFUTILS_CONF_ENV += CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS)) -fPIC"
+endif
+
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
 
 # Unconditionnally requires gettext.
-- 
1.7.10.4
