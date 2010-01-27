From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 27 Jan 2010 15:54:30 +0100
Subject: [Buildroot] [PATCH] "libdir" variable is not set correctly in
	(generated) $(STAGING_DIR)/usr/lib/libSDL.la
Message-ID: <1264604070-7294-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

"libdir" is set to "/xxx/output/build/staging_dir/usr/xxx/output/build/staging_dir/usr/lib"
instead of "/xxx/output/build/staging_dir/usr/lib". This prevents other apps to link against SDL.
This patch try to correct/workaround that (is it the best way to do it ?).

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/sdl/sdl.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 959be7e..60eccaa 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -97,6 +97,9 @@ $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
 # use correct rpath for linking
 	$(SED) 's^libdir=\$${exec_prefix}^libdir=/usr^' \
 		$(STAGING_DIR)/usr/bin/sdl-config
+# set correct libdir path in libSDL.la
+	$(SED) "s^libdir='$(STAGING_DIR)/usr^libdir='^" \
+		$(STAGING_DIR)/usr/lib/libSDL.la
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libSDL.so: $(STAGING_DIR)/usr/lib/libSDL.so
-- 
1.6.0.4
