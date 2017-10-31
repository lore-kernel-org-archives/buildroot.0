From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 31 Oct 2017 01:18:34 -0500
Subject: [Buildroot] [PATCH] argp-standalone: fix build with > GCC5.1
Message-ID: <20171031061834.27832-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem is the change of the default C standard from gnu89 to gnu11
which changes the semantics of 'inline'. The issue is described in the
Porting guide at https://gcc.gnu.org/gcc-5/porting_to.html. Adding the
'-fgnu89-inline' option fixes the issue.

Similar issue:
https://www.mail-archive.com/ptxdist at pengutronix.de/msg09746.html

Fixes:
http://autobuild.buildroot.net/results/a9c/a9cedc54829b7bd2dd7ae6ff2bd6c6db242f1c35//

Tested via test-pkg with the following cfg
BR2_PACKAGE_ARGP_STANDALONE=y

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/argp-standalone/argp-standalone.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 7a7028c..977b954 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -10,7 +10,7 @@ ARGP_STANDALONE_INSTALL_STAGING = YES
 ARGP_STANDALONE_LICENSE = LGPL-2.0+
 
 ARGP_STANDALONE_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -fPIC"
+	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline"
 
 define ARGP_STANDALONE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libargp.a $(STAGING_DIR)/usr/lib/libargp.a
-- 
2.7.4
