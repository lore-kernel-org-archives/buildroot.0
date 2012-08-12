From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:50 +0200
Subject: [Buildroot] [PATCH 02/36] package/sdl: add symlink to sdl-config
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SDL installs a script-based sdl-config in the sysroot, but some
packages (eg. QEMU) needs it to be either:
  - prefixed with the cross-prefix
  - in the PATH

So, as sdl-config is a script, and although it is installed in
the sysroot, it can be run on the host.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sdl/sdl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 139312f..c499562 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -66,6 +66,8 @@ define SDL_FIXUP_SDL_CONFIG
 		$(STAGING_DIR)/usr/bin/sdl-config
 	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
 		$(STAGING_DIR)/usr/bin/sdl-config
+	$(HOSTLN) -s $(STAGING_DIR)/usr/bin/sdl-config \
+	             $(HOST_DIR)/usr/bin/sdl-config
 endef
 
 SDL_POST_INSTALL_STAGING_HOOKS+=SDL_FIXUP_SDL_CONFIG
-- 
1.7.2.5
