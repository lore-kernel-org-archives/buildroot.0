From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 18:22:52 +0100
Subject: [Buildroot] [git commit] package/luajit: ensure dynamic library
	symlinks are created
Message-ID: <20160326172641.6173C817CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b33c4a2d4e5390d3d657d2afd8a9a275a5cf4185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The luajit Makefile has the following logic:

          $(LDCONFIG) $(INSTALL_LIB) && \
          $(SYMLINK) $(INSTALL_SONAME) $(INSTALL_SHORT1) && \
          $(SYMLINK) $(INSTALL_SONAME) $(INSTALL_SHORT2) || :

So if ldconfig fails for some reason, the symbolic links to refer to
the luajit library are not created. Since ldconfig for the target
didn't make sense, LDCONFIG=true has been added a long time ago when
building the target variant of luajit.

However, since commit 9ba8d1cce4ab00307827083bae234d87b37fb967, the
host variant of luajit is also linked dynamically. While ldconfig for
the host should work, on certain machines ldconfig is not available in
the PATH, and needs to be explicitly called as
/sbin/ldconfig. However, since output/host/usr/lib is in the RPATH of
the binaries we create, there is really no need to bother running
ldconfig, so we simply pass LDCONFIG=true, like we do for the target
variant. This ensures that the symlinks are always created.

Fixes:
http://autobuild.buildroot.net/results/4dc/4dcbcde0046e265317e170a977e699e5c3a06b87/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
[Thomas: rewrite commit log with a proper explanation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/luajit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 322d203..623bfcc 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -72,7 +72,7 @@ define HOST_LUAJIT_BUILD_CMDS
 endef
 
 define HOST_LUAJIT_INSTALL_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" -C $(@D) install
+	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
 $(eval $(generic-package))
