From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Jul 2018 20:17:13 +0200
Subject: [Buildroot] [PATCH 2/2] mutt: add libidn2 support
In-Reply-To: <20180723181713.18954-1-fontaine.fabrice@gmail.com>
References: <20180723181713.18954-1-fontaine.fabrice@gmail.com>
Message-ID: <20180723181713.18954-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libidn2 support was added in version 1.10: http://www.mutt.org/relnotes/1.10
libidn and libidn2 can't be selected at the same time: see configure.ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
