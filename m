From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 23:18:40 +0100
Subject: [Buildroot] [git commit] package/mutt: do not run compiled programs
	from ./configure
Message-ID: <20141116222332.C0A73B4347@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=576873b8e9c53439cb5b1b0f73406204db6cecde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mutt's ./configure is broken for cross-compilation, because it runs
programs to check for some features or behaviours.

So, we have to feed it some variables to force the checks the way they
are supposed to be resolved for our use-case.

Fixes:
    http://autobuild.buildroot.net/results/58c/58c73e72e1387c7f490ad97a86666b12393917cf/
    http://autobuild.buildroot.net/results/73b/73b8c54ca41cc475594c24a8d6176d511dcb85e6/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.mk |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

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
