From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Jul 2014 23:33:25 +0200
Subject: [Buildroot] [git commit] freetype: fix double installation
Message-ID: <20140703213741.D3F909D150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc5b8e72308f523b3826ada5fe7009b722bf9a79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Eric_L on IRC reported that the following strange behavior: the first
installation of freetype works, and then each time you do "make
freetype-dirclean freetype", it fails and works alternatively, in a
fully reproducible manner.

After some investigation, it turns out that the problem is caused by
the creation of the symbolic link /usr/include/freetype2/freetype ->
/usr/include/freetype2 for backward compatibility reasons by
freetype.mk, in a post-staging installation hook. As the symbolic link
is created *after* the installation, the first installation works
fine. However, the second installation fails because the freetype
build system does:

 ./builds/unix/mkinstalldirs \
         /home/thomas/projets/buildroot/output/target/usr/include/freetype2/config
  [...]
 rm -f /home/thomas/projets/buildroot/output/target/usr/include/freetype2/freetype/config/*
 rmdir /home/thomas/projets/buildroot/output/target/usr/include/freetype2/freetype/config
  [...]
 /usr/bin/install -c -m 644 ./builds/unix/ftconfig.h               \
       /home/thomas/projets/buildroot/output/target/usr/include/freetype2/config/ftconfig.h

This last line fails, because due to the symbolic link mentioned above, the
command 'rmdir
/home/thomas/projets/buildroot/output/target/usr/include/freetype2/freetype/config'
has in fact the consequence of deleting the 'config' directory created
by the mkinstalldirs command.

The proposed solution to solve this problem is to remove the symbolic link
in a pre-install hook, run the installation, and restore the symbolic link.

[Peter: minor tweaks to commit message / comment]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index a6ae0a0..19dbd86 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -70,12 +70,26 @@ define FREETYPE_FIX_CONFIG_FILE_LIBS
 endef
 FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS
 
-# Version 2.5.1 reorganized headers out of freetype2/freetype
-# It's unexpected for some packages so symlink it until it spreads upstream
+# Version 2.5.1 reorganized headers out of freetype2/freetype.
+# It is unexpected for some packages so symlink it until it spreads
+# upstream. Note that we also have to remove the symlink prior to the
+# installation process, because the installation process of freetype
+# removes usr/include/Freetype2/freetype/config, before installing
+# something in usr/include/Freetype2/config/ which no longer exists
+# due to the symbolic link.
+define FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
+	$(RM) -f $(STAGING_DIR)/usr/include/freetype2/freetype
+endef
+FREETYPE_PRE_INSTALL_STAGING_HOOKS += FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
 define FREETYPE_FIX_FREETYPE_INCLUDE
 	ln -sf . $(STAGING_DIR)/usr/include/freetype2/freetype
 endef
 FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_FREETYPE_INCLUDE
+
+define HOST_FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
+	$(RM) -f $(HOST_DIR)/usr/include/freetype2/freetype
+endef
+HOST_FREETYPE_PRE_INSTALL_HOOKS += FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
 define HOST_FREETYPE_FIX_FREETYPE_INCLUDE
 	ln -sf . $(HOST_DIR)/usr/include/freetype2/freetype
 endef
