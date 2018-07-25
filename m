From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 23:01:01 +0200
Subject: [Buildroot] [git commit] mutt: add libidn2 support
Message-ID: <20180725205550.7FD118A3E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdd532ffd284081073947a092389984b2d9cb296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libidn2 support was added in version 1.10: http://www.mutt.org/relnotes/1.10
libidn and libidn2 can't be selected at the same time: see configure.ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mutt/mutt.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 1a2c5342d7..1c3021ece1 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -16,11 +16,15 @@ MUTT_DEPENDENCIES += libiconv
 MUTT_CONF_OPTS += --enable-iconv
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN),y)
+# Both options can't be selected at the same time so prefer libidn2
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+MUTT_DEPENDENCIES += libidn2
+MUTT_CONF_OPTS += --with-idn2 --without-idn
+else ifeq ($(BR2_PACKAGE_LIBIDN),y)
 MUTT_DEPENDENCIES += libidn
-MUTT_CONF_OPTS += --with-idn
+MUTT_CONF_OPTS += --with-idn --without-idn2
 else
-MUTT_CONF_OPTS += --without-idn
+MUTT_CONF_OPTS += --without-idn --without-idn2
 endif
 
 ifeq ($(BR2_PACKAGE_MUTT_IMAP),y)
