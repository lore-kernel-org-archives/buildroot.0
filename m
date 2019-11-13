From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 22:02:23 +0100
Subject: [Buildroot] [git commit] package/socat: drop optional readline
 dependency
Message-ID: <20191113205505.BD0EC8EE94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47def13564555a00cd832ec73e5b31ccd0782d2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

socat is licensed under GPL-2.0, which is not license compatible with
readline (GPL-3.0+), so drop the optional dependency and add a comment
explaining why.

This also matches how socat is packaged in Debian, where the man page has
the following snippet added:

READLINE

  Uses GNU readline and history on stdio to allow editing and reusing input lines (example).
  Due to licensing restrictions the readline feature is disabled in Debian.  See BUGS.
  You can use STDIO instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/socat/socat.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index c6f99c2afa..9e747e08fa 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -27,6 +27,8 @@ endif
 # automake, so we can't use the normal autoreconf logic.
 
 SOCAT_DEPENDENCIES = host-autoconf
+# incompatibile license (GPL-3.0+)
+SOCAT_CONF_OPTS = --disable-readline
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SOCAT_DEPENDENCIES += openssl
@@ -34,12 +36,6 @@ else
 SOCAT_CONF_OPTS += --disable-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
-SOCAT_DEPENDENCIES += readline
-else
-SOCAT_CONF_OPTS += --disable-readline
-endif
-
 define SOCAT_RUN_AUTOCONF
 	(cd $(@D); $(HOST_DIR)/bin/autoconf)
 endef
