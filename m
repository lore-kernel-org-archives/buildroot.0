From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Jul 2021 19:23:01 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/gesftpserver: fix
 build without Python
Message-ID: <20210711165031.A32EA95498@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61023ef6ffd045b9d275c5551789c6b9f338745e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

The build of gesftserver in an environment without Python fails with:

checking for Python 2.4 or better... configure: error: cannot find Python 2.4 or better

However, it turns out that Python is only needed for tests, which we
don't run/use in Buildroot, so we can safely build gesftpserver
without Python.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 422fd73fadfbe33523e1687f90bbfecd3f7ab5d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gesftpserver/gesftpserver.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 85511a3c97..20ad92d25a 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -23,6 +23,10 @@ GESFTPSERVER_DEPENDENCIES += \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(if $(BR2_PACKAGE_OPENSSH),openssh)
 
+# Python on the host is only used for tests, which we don't use in
+# Buildroot
+GESFTPSERVER_CONF_ENV += rjk_cv_python24=false
+
 # openssh/dropbear looks here
 define GESFTPSERVER_ADD_SYMLINK
 	ln -sf gesftpserver $(TARGET_DIR)/usr/libexec/sftp-server
