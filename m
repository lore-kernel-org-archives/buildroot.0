From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 23:47:39 +0100
Subject: [Buildroot] [git commit] luajit: pass LDCONFIG=true to make sure
	dynamic library links are created
Message-ID: <20140226225343.F11099BAF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40089283e91fc6daae1aff0346f6821bd2bcab80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To install its shared library, the luajit Makefile does:

        cd src && test -f $(FILE_SO) && \
          $(INSTALL_X) $(FILE_SO) $(INSTALL_DYN) && \
          $(LDCONFIG) $(INSTALL_LIB) && \
          $(SYMLINK) $(INSTALL_SONAME) $(INSTALL_SHORT1) && \
          $(SYMLINK) $(INSTALL_SONAME) $(INSTALL_SHORT2) || :

This means that if ldconfig doesn't work or isn't available on the
system, it won't create the libluajit-5.1.so -> libluajit-5.1.so.5.2.0
symbolic link.

Not having this symbolic link prevents lua-ev from finding the shared
version of the luajit library, and it fallbacks to using the
libluajit.a static library. However, this static library is not built
with -fPIC, so using it within a shared library doesn't work, and
leads to build failures on architectures that really do want to have
non-fPIC code into a shared library, such as x86-64.

By passing LDCONFIG=true during the installation steps of luajit, we
ensure that the symbolic links are created, which allows lua-ev to
detect the shared library properly, making everybody happy.

Investigation conducted with Samuel Martin. Thanks!

Fixes:

  http://autobuild.buildroot.org/results/41c/41c8bb9cf91a86908a150dae27726136cb56f5b7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/luajit.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 529d3c2..4122d0a 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -48,11 +48,11 @@ define LUAJIT_BUILD_CMDS
 endef
 
 define LUAJIT_INSTALL_STAGING_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) install
+	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
 define LUAJIT_INSTALL_TARGET_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
+	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
 $(eval $(generic-package))
