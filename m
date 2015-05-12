From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 May 2015 23:07:04 +0200
Subject: [Buildroot] [PATCH] vsftpd: use pkg-config to get OpenSSL link flags
Message-ID: <1431464824-22153-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of hardcoding -lssl -lcrypto as the linker flags to link with
OpenSSL, use pkg-config to fetch those flags. This allows to behave
properly when doing static linking, since pkg-config returns the
entire set of libraries we should link against.

Fixes:

  http://autobuild.buildroot.org/results/d71/d710ecfa9ed0a8e3f97d2010d3dabb372485c7f2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vsftpd/vsftpd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index b94328d..ed15f00 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -23,8 +23,8 @@ VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_DISABLE_UTMPX
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-VSFTPD_DEPENDENCIES += openssl
-VSFTPD_LIBS += -lssl -lcrypto
+VSFTPD_DEPENDENCIES += openssl host-pkgconf
+VSFTPD_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libssl)
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
 
-- 
2.1.0
