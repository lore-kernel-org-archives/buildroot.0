From: Marc Gauthier <marc@tensilica.com>
Date: Wed, 27 May 2009 23:03:30 -0700
Subject: [Buildroot] [PATCH] fix dropbear install
Message-ID: <522C1DF17AF50042AD8AE87F7887BD3D0158B35BFF@exch.hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix dropbear install

The -D option to install only works portably when the destination is a file.
Specifying the filename avoids the following build error (at least on some hosts):
"/usr/bin/install: cannot overwrite directory `/tmp/buildroot/project_build_foobar/uclibc/root/etc/init.d' with non-directory"

Signed-off-by: Marc Gauthier <marc@tensilica.com>


diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e84df87..63d3daa 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -28,7 +28,7 @@ $(DROPBEAR_TARGET_INSTALL_TARGET):
        ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/scp
        ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/ssh
        if [ ! -f $(TARGET_DIR)/etc/init.d/S50dropbear ]; then \
-               $(INSTALL) -m 0755 -D package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d; \
+               $(INSTALL) -m 0755 -D package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d/S50dropbear; \
        fi
        touch $@


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090527/8c61ca18/attachment.htm>
