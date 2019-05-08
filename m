From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  8 May 2019 16:45:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/pseudo: fix build without xattr
Message-ID: <20190508144521.9783-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of host-pseudo without xattr fails on:
ports/linux/xattr/portdefs.h:1:10: fatal error: attr/xattr.h: No such file or directory
 #include <attr/xattr.h>

xattr is enabled since
http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/configure?id=6c6d0a3e4a4d382fd0b2e056a3ecffb015652767

So disable xattr through --enable-xattr=no as --disable-xattr is not
supported

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pseudo/pseudo.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 446427109f..54abd2a8d8 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -24,6 +24,7 @@ HOST_PSEUDO_CONF_OPTS = \
 	--with-rpath=$(HOST_DIR)/lib \
 	--bits=$(if $(filter %64,$(HOSTARCH)),64,32) \
 	--libdir=$(HOST_DIR)/lib \
-	--with-sqlite=$(HOST_DIR)
+	--with-sqlite=$(HOST_DIR) \
+	--enable-xattr=no
 
 $(eval $(host-autotools-package))
-- 
2.20.1
