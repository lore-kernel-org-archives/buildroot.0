From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Aug 2015 09:59:51 +0100
Subject: [Buildroot] [PATCH] package/tn5250: fix static linking problem
Message-ID: <1440579591-23594-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tn5250 fails to link with openssl when building statically. We need to
add the needed libraries to the LIBS configure environment variable in
order to make tn5250 able to find them.

Fixes:

  http://autobuild.buildroot.net/results/95f/95f6df0d01e4944ecd84e830e2bbd8389e1d3e3d/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tn5250/tn5250.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 213f02c..953b395 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -12,6 +12,7 @@ TN5250_LICENSE = LGPLv2.1+
 TN5250_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+TN5250_CONF_ENV += LIBS="-lssl -lcrypto -lz"
 TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
 TN5250_DEPENDENCIES += openssl
 else
-- 
1.7.1
