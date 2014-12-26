From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 26 Dec 2014 18:29:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/lftp: don't use host's path
Message-ID: <1419614983-8105-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lftp try to link with -L/usr/lib/lftp/$(LFTP_VERSION) if
DESTDIR is not set.

When DESTDIR is set to STAGING_DIR, it link with
-L$(STAGING_DIR)/usr/lib/lftp/$(LFTP_VERSION)

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lftp/lftp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 1586579..73e3087 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -45,6 +45,10 @@ LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_FTP) += proto-ftp.so
 LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_HTTP) += proto-http.so
 LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_SFTP) += proto-sftp.so
 
+# Set DESTDIR to STAGING_DIR during the build to avoid linking
+# with -L/usr/lib/lftp/$(LFTP_VERSION)
+LFTP_MAKE_ENV += DESTDIR="$(STAGING_DIR)"
+
 define LFTP_REMOVE_MODULES
 	for f in $(LFTP_MODULES_TO_REMOVE-) ; do \
 		$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/$$f ; \
-- 
1.9.3
