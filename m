From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 3 Nov 2015 22:04:38 +0100
Subject: [Buildroot] [PATCH v2] elfutils: fix sparc64 build, -fPIC required
Message-ID: <20151103210438.GA13049@waldemar-brodkorb.de>
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
v1 -> v2:
  - use ELFUTILS_CFLAGS and remove duplication of filter-out
    suggested by Thomas Petazzoni

---
 package/elfutils/elfutils.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 838c3b8..bf854c7 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -16,9 +16,15 @@ ELFUTILS_PATCH = elfutils-portability-0.161.patch
 ELFUTILS_AUTORECONF = YES
 ELFUTILS_CONF_OPTS += --disable-werror
 
+ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
+# sparc64 needs -fPIC instead of -fpic
+ifeq ($(BR2_sparc64),y)
+ELFUTILS_CFLAGS += -fPIC
+endif
+
 # elfutils gets confused when lfs mode is forced, so don't
 ELFUTILS_CONF_ENV += \
-	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
+	CFLAGS="$(ELFUTILS_CFLAGS)" \
 	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
 
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
-- 
1.7.10.4
