From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 00:40:54 +0100
Subject: [Buildroot] [git commit] ncftp: fix cross-compilation test
Message-ID: <20140221234122.8774D96E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1963bc815d7d61c7dd7196c5f1543ea59b9e7824
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncftp/ncftp.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
