From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 23:08:22 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/socat: drop
 optional readline dependency
Message-ID: <20191119073224.E9BE08F193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3dc2f288d1bff64b02bb63a81717acf2d9ccf307
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
(cherry picked from commit 47def13564555a00cd832ec73e5b31ccd0782d2f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/socat.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 5fea067d82..e4595007df 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -29,6 +29,8 @@ endif
 # automake, so we can't use the normal autoreconf logic.
 
 SOCAT_DEPENDENCIES = host-autoconf
+# incompatibile license (GPL-3.0+)
+SOCAT_CONF_OPTS = --disable-readline
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SOCAT_DEPENDENCIES += openssl
@@ -36,12 +38,6 @@ else
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
