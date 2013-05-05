From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  5 May 2013 10:14:35 -0300
Subject: [Buildroot] [PATCH] ltp-testsuite: fix build breakage with libcap
Message-ID: <1367759675-26734-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltp-testsuite needs libcap with file attributes which in turn needs
attr.
Only libcap is checked for so if it lacks file attr support it breaks.
Disable libcap support unless it's got attr support, fixes:
http://autobuild.buildroot.net/results/b16b20963c7cb17d8e220a5baa1356372ebf85a6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index caed4b3..093c2c3 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -3,10 +3,18 @@
 # ltp-testsuite
 #
 #############################################################
+
 LTP_TESTSUITE_VERSION = 20130109
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
 LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
+# Needs libcap with file attrs which needs attr, so both required
+ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
+LTP_TESTSUITE_DEPENDENCIES += libcap
+else
+LTP_TESTSUITE_CONF_ENV += ac_cv_lib_cap_cap_compare=no
+endif
+
 $(eval $(autotools-package))
-- 
1.8.1.5
