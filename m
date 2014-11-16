From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 23:08:51 +0100
Subject: [Buildroot] [PATCH] package/mutt: do not run compiled programs from
	./configure
Message-ID: <1416175731-31022-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mutt's ./configure is broken for cross-compilation, because it runs
programs to check for some features or behaviours.

So, we have to feed it some variables to force the checks the way they
are supposed to be resolved for our use-case.

Fixes:
    http://autobuild.buildroot.net/results/58c/58c73e72e1387c7f490ad97a86666b12393917cf/
    http://autobuild.buildroot.net/results/73b/73b8c54ca41cc475594c24a8d6176d511dcb85e6/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mutt/mutt.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index b245542..b4f18b0 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -41,4 +41,20 @@ else
 MUTT_CONF_OPTS += --without-ssl
 endif
 
+# Avoid running tests to check for:
+#  - target system is *BSD
+#  - C99 conformance (snprintf, vsnprintf)
+#  - behaviour of the regex library
+#  - if mail spool directory is world/group writable
+#  - we have a working libiconv
+MUTT_CONF_ENV += \
+	mutt_cv_bsdish=no \
+	mutt_cv_c99_snprintf=yes \
+	mutt_cv_c99_vsnprintf=yes \
+	mutt_cv_regex_broken=no \
+	mutt_cv_worldwrite=yes \
+	mutt_cv_groupwrite=yes \
+	mutt_cv_iconv_good=yes \
+	mutt_cv_iconv_nontrans=no
+
 $(eval $(autotools-package))
-- 
1.9.1
