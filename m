From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:42:26 +0200
Subject: [Buildroot] [git commit] vim: install /bin/vi as a relative symlink
Message-ID: <20180805123618.3E0C18B4B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52385d789af0d17bf12406e5c028651ccbd841f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prevent creating a dangling symlink when vim is not present on the host
machine. With BR2_ROOTFS_MERGED_USR, just link to "vim", since they are
on the same directory, otherwise link to "../usr/bin/vim".

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vim/vim.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index dbf71c573f..ee0c8b61e4 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -63,9 +63,15 @@ define VIM_REMOVE_DOCS
 endef
 
 # Avoid oopses with vipw/vigr, lack of $EDITOR and 'vi' command expectation
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define VIM_INSTALL_VI_SYMLINK
-	ln -sf /usr/bin/vim $(TARGET_DIR)/bin/vi
+	ln -sf vim $(TARGET_DIR)/usr/bin/vi
 endef
+else
+define VIM_INSTALL_VI_SYMLINK
+	ln -sf ../usr/bin/vim $(TARGET_DIR)/bin/vi
+endef
+endif
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_VI_SYMLINK
 
 ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
