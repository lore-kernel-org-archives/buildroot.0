From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 22:49:27 +0100
Subject: [Buildroot] [git commit] package/infozip: silent LFS warning
Message-ID: <20150205214959.A8AAC8013F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a919e0a4328e3208aa3ef88a5b1ecc2257974bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

infozip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE in
some sources files when LARGE_FILE_SUPPORT is set.
Remove them from CFLAGS.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/infozip/infozip.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 3e8058f..e57f7e1 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -21,9 +21,14 @@ INFOZIP_CFLAGS = -I. -DUNIX
 # removed since it can't work for cross-compilation.
 INFOZIP_CFLAGS += -DUIDGID_NOT_16BIT
 
+# infozip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
+# necessary, redefining it on the command line causes some warnings.
+INFOZIP_TARGET_CFLAGS = \
+	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
+
 define INFOZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) $(INFOZIP_CFLAGS)" \
+		CFLAGS="$(INFOZIP_TARGET_CFLAGS) $(INFOZIP_CFLAGS)" \
 		AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
