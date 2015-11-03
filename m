From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:10:17 +0100
Subject: [Buildroot] [git commit] elfutils: fix sparc64 build, -fPIC required
Message-ID: <20151103211024.12ED68182A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc0c66510c1a2290804230c90765bc0d8281dd7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following autobuild errors:
http://autobuild.buildroot.net/results/82cc7766d2c805146e94baf82a24d1002f56593d/
http://autobuild.buildroot.net/results/ca4ca362581ee0111cba389d1afbff287692c21b/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/elfutils.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 838c3b8..d96ef41 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -16,9 +16,16 @@ ELFUTILS_PATCH = elfutils-portability-0.161.patch
 ELFUTILS_AUTORECONF = YES
 ELFUTILS_CONF_OPTS += --disable-werror
 
+ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
+
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
