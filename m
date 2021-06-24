From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 24 Jun 2021 14:32:37 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gesftpserver: Fix per-package
 build without Python
Message-ID: <20210624123237.23997-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building per-package in an environment without Python, the gesftpserver
configure script dies when looking for Python support.
The configure script is happy (doesnt check and wont error out) when being
told that Python is not available, so we hack around this by setting the
appropriate env variable.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/gesftpserver/gesftpserver.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 85511a3c97..a261719610 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -23,6 +23,8 @@ GESFTPSERVER_DEPENDENCIES += \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(if $(BR2_PACKAGE_OPENSSH),openssh)
 
+GESFTPSERVER_CONF_ENV += rjk_cv_python24=false
+
 # openssh/dropbear looks here
 define GESFTPSERVER_ADD_SYMLINK
 	ln -sf gesftpserver $(TARGET_DIR)/usr/libexec/sftp-server
-- 
2.32.0
