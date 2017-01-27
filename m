From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 20:21:19 +1300
Subject: [Buildroot] [git commit] sngrep: gnutls support also needs libgcrypt
Message-ID: <20170127072421.0D7FA7F8F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6205b75873cefe5376f49934f456729f5de6ee1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gnutls support in sngrep not only needs gnutls, but also
libgcrypt. So only enable gnutls support when both packages are
available.

Fixes:

  http://autobuild.buildroot.net/results/18fbb5748a6ad66ac6ec8141c3296d2b13fa40ac/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sngrep/sngrep.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index b4b91c9..52c8a2d 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -18,7 +18,8 @@ SNGREP_CONF_OPTS += --disable-unicode
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SNGREP_DEPENDENCIES += openssl
 SNGREP_CONF_OPTS += --with-openssl --without-gnutls
-else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+# gnutls support also requires libgcrypt
+else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 SNGREP_DEPENDENCIES += gnutls
 SNGREP_CONF_OPTS += --with-gnutls --without-openssl
 else
