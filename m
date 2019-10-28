From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 14:13:53 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/vtun: fix static
 linking with atomic
Message-ID: <20191028130735.0C3398B685@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=216c668a36bbb655233b5a6022e60848fa043e7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes:
 - http://autobuild.buildroot.org/results/908707cdd16c5b89197c226a3e259f8943a5474e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cff14017f99c6c8a85784a0f1b2e39f3094ed162)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vtun/vtun.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 86d452c0c2..35b0ddedbb 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -8,7 +8,7 @@ VTUN_VERSION = 3.0.4
 VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
 VTUN_LICENSE = GPL-2.0+ with OpenSSL exception
 VTUN_LICENSE_FILES = README.OpenSSL
-VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
+VTUN_DEPENDENCIES = host-bison host-flex host-pkgconf zlib lzo openssl
 VTUN_AUTORECONF = YES
 
 VTUN_CONF_OPTS = \
@@ -19,4 +19,8 @@ VTUN_CONF_OPTS = \
 # Assumes old-style gcc inline symbol visibility rules
 VTUN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
 
+# configure.in forgets to link to dependent libraries of openssl breaking static
+# linking
+VTUN_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+
 $(eval $(autotools-package))
