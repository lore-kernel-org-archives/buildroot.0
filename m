From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 21 Feb 2014 22:00:52 +0100
Subject: [Buildroot] [PATCH v3 1/1] ncftp: fix cross-compilation test
Message-ID: <1393016452-10812-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cross-compilation test is based on the ability to run
a test program on the host, which is wrong.

If it runs, then the configure script concludes
that we're doing native compilation,
if it doesn't run, we're doing cross-compilation.

The configure script needs to be regenerated to fix the
cross-compilation test.

Fixes
http://autobuild.buildroot.net/results/969/969a49ae97a50634ea846a82b9c360e4fb020ace/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/ncftp/ncftp.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index ff6c70a..841c82b 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -11,6 +11,14 @@ NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = Clarified Artistic License
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
 
+NCFTP_DEPENDENCIES = host-autoconf
+
+define NCFTP_RUN_AUTOCONF
+       (cd $(@D); $(HOST_DIR)/usr/bin/autoconf -I$(@D)/autoconf_local/)
+endef
+
+NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
+
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
 	NCFTP_TARGET_BINS += ncftpget
 endif
-- 
1.8.5.3
