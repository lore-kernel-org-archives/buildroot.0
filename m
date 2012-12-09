From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Dec 2012 11:35:02 -0300
Subject: [Buildroot] [PATCH] sane-backends: fix documentation build failure
Message-ID: <1355063702-4716-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable documentation build, it seems to break with older
texlive/kpathsea versions, fixes:
http://autobuild.buildroot.net/results/44327b543d8918929bf252c5284e8691fda87fd0/
Also switch to alioth mirror since the original tarball is gone from the
regular site when 1.0.23 was released.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sane-backends/sane-backends.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 56ce82d..496dca4 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -5,7 +5,7 @@
 #############################################################
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
-SANE_BACKENDS_SITE = ftp://ftp2.sane-project.org/pub/sane/sane-backends-$(SANE_BACKENDS_VERSION)
+SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/3503
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
@@ -37,4 +37,10 @@ else
 SANE_BACKENDS_CONF_OPT += --without-snmp
 endif
 
+define SANE_BACKENDS_DISABLE_DOCS
+	$(SED) 's/ doc//' $(@D)/Makefile
+endef
+
+SANE_BACKENDS_POST_CONFIGURE_HOOKS += SANE_BACKENDS_DISABLE_DOCS
+
 $(eval $(autotools-package))
-- 
1.7.8.6
