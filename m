From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 20:12:04 +0200
Subject: [Buildroot] [git commit] package/cloop: needs _GNU_SOURCE
Message-ID: <20190801181058.768ED86BF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edf97df877694632111c029a0350732d8beca568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-cloop needs _GNU_SOURCE for loff_t otherwise build fails with gcc
8.3.0 on:
extract_compressed_fs.c: In function 'main':
extract_compressed_fs.c:55:2: error: unknown type name 'loff_t'; did you mean 'off_t'?
  loff_t *offsets;

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cloop/cloop.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index ad50d0a94a..585f422ce3 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -13,7 +13,8 @@ CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
 HOST_CLOOP_DEPENDENCIES = host-zlib
 
 define HOST_CLOOP_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes \
+		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE"
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
