From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 17:22:04 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] sngrep: fix libgcrypt
 handling
Message-ID: <20180411154835.6D9E088454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1ce76dba48534ef35ba16b27bdde7777f4e5599
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes:
http://autobuild.buildroot.net/results/f1c6494133806b9fc26ae3ce9e9c6a22fa2eda6f/

Commit 6205b75873c (sngrep: gnutls support also needs libgcrypt) ensured
that --with-gnutls is only used when both gnutls and libgcrypt are enabled,
but it didn't ensure libgcrypt gets built before sngrep or told the
configure script where to find libgcrypt-config, breaking the build.

Fix both issues.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ae7d59eaae1c55d707b2a70437a84c280f598572)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sngrep/sngrep.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 1e0e051433..a76887e7dd 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -23,7 +23,8 @@ SNGREP_DEPENDENCIES += openssl
 SNGREP_CONF_OPTS += --with-openssl --without-gnutls
 # gnutls support also requires libgcrypt
 else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-SNGREP_DEPENDENCIES += gnutls
+SNGREP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+SNGREP_DEPENDENCIES += gnutls libgcrypt
 SNGREP_CONF_OPTS += --with-gnutls --without-openssl
 else
 SNGREP_CONF_OPTS += --without-gnutls --without-openssl
