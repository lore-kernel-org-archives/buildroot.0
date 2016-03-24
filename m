From: Mason <slash.tmp@free.fr>
Date: Thu, 24 Mar 2016 15:02:59 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: build kernel modules when
	appropriate
Message-ID: <56F3F393.6020407@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

When building a kernel, build LTP's test kernel modules also.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 8adfdef68d69..a435a60a2441 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -13,6 +13,13 @@ LTP_TESTSUITE_CONF_OPTS += \
 	--with-power-management-testsuite \
 	--with-realtime-testsuite
 
+ifeq ($(BR2_LINUX_KERNEL),y)
+LTP_TESTSUITE_DEPENDENCIES += linux
+LTP_TESTSUITE_CONF_OPTS += --with-linux-dir=$(LINUX_DIR)
+else
+LTP_TESTSUITE_CONF_OPTS += --without-modules
+endif
+
 # Needs libcap with file attrs which needs attr, so both required
 ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
 LTP_TESTSUITE_DEPENDENCIES += libcap
-- 
2.7.0
