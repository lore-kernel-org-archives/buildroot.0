From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Thu, 26 Oct 2017 16:43:45 -0500
Subject: [Buildroot] [PATCH v2 2/2] package/libssh2: Update to newest version
In-Reply-To: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <1509054225-19795-2-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update libssh2 to use the newest version from git. This caused a
transition from released version number to hash as it has not been
version rev'd in over a year (see issue
https://github.com/libssh2/libssh2/issues/220 for bump request).

This brings in changes to the autoconf to correctly pick the crypto
library.

Update libssh2.mk to have a preconf hook to call buildconf. This
generates the configuration file used by autotools, and is required when
pulling source from git instead of a released version.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

----

[v1->v2]
 - Use LIBSSH2_AUTORECONF instead of calling explicitly

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
---
 package/libssh2/libssh2.hash |  3 +--
 package/libssh2/libssh2.mk   | 10 ++++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index 6b1cced..f0df7a2 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,3 +1,2 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh2.org/download/libssh2-1.8.0.tar.gz.asc
-sha256	39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4	libssh2-1.8.0.tar.gz
+sha256 e73d55cd512863aa6423c6e137039e3e1bcbf5ba87f130e7441132c2c78a5425 libssh2-616fd4d1b3e4a55de67c48819fefca83132126b5.tar.gz
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 3978698..c803e0e 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,12 +4,18 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.8.0
-LIBSSH2_SITE = http://www.libssh2.org/download
+LIBSSH2_VERSION = 616fd4d1b3e4a55de67c48819fefca83132126b5
+LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build
+LIBSSH2_AUTORECONF = YES
+
+define LIBSSH2_AUTORECONF_CMDS
+	cp $(@D)/src/libssh2_config.h.in $(@D)/example/libssh2_config.h.in
+endef
+LIBSSH2_PRE_CONFIGURE_HOOKS += LIBSSH2_AUTORECONF_CMDS
 
 # Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
 # Config.in.
-- 
1.9.1
