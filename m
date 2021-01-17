From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2021 13:24:44 +0100
Subject: [Buildroot] [PATCH/RFC 1/1] package/pkg-utils.mk: fix per-package
 build
Message-ID: <20210117122444.2409286-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building host-cairo is broken:

>>> host-cairo 1.16.0 Configuring
mkdir -p output/per-package/host-cairo/host
rsync -a -K --link-dest=output/per-package/host-fontconfig/host/ output/per-package/host-fontconfig/host/ output/per-package/host-cairo/host
rsync -a -K --link-dest=output/per-package/host-freetype/host/ output/per-package/host-freetype/host/ output/per-package/host-cairo/host
rsync -a -K --link-dest=output/per-package/host-libglib2/host/ output/per-package/host-libglib2/host/ output/per-package/host-cairo/host
cannot delete non-empty directory: share/gettext
could not make way for new symlink: share/gettext
rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1207) [sender=3.1.3]

While host-fontconfig provides share/gettext as a directory

$ ls -la output/per-package/host-fontconfig/host/share | grep gettext
drwxr-xr-x  3 build build 4096 Jan 17 12:27 gettext

in host-libglib2 share/gettext is a link

$ ls -la output/per-package/host-libglib2/host/share | grep gettext
lrwxrwxrwx   3 build build   90 Jan 17 12:27 gettext -> output/per-package/host-gettext-tiny/host/usr/share/gettext-tiny
drwxr-xr-x   5 build build 4096 Jan 17 12:27 gettext-tiny

causing an error with rsync.

Fixes:
http://autobuild.buildroot.net/results/cae/caecde3dc21717745c9b202435e8ddae85c5bb8f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This patch is a RFC because I am unsure whether this is the correct fix
as I do not have much experience with rsync. But nonetheless I would like
to point into the imho right direction for the fix.

 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 11090cb628..1f3ff05b6c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -178,7 +178,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+		rsync -a --force --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 		$(3)$(sep))
 endef
-- 
2.29.2
