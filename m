From: Mason <slash.tmp@free.fr>
Date: Mon, 4 Apr 2016 15:08:36 +0200
Subject: [Buildroot] [PATCH v2] ltp-testsuite: build kernel modules when
	appropriate
In-Reply-To: <56FAD38B.8040201@mind.be>
References: <56F3F393.6020407@free.fr>
 <20160324222555.21f04320@free-electrons.com> <56F92840.9090206@free.fr>
 <56FAD38B.8040201@mind.be>
Message-ID: <57026754.50205@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

If we're building a kernel, we can also build LTP's test modules.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 8adfdef68d69..1c1c2a0d4f6b 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -13,6 +13,14 @@ LTP_TESTSUITE_CONF_OPTS += \
 	--with-power-management-testsuite \
 	--with-realtime-testsuite
 
+ifeq ($(BR2_LINUX_KERNEL),y)
+LTP_TESTSUITE_DEPENDENCIES += linux
+LTP_TESTSUITE_MAKE_ENV = ARCH=$(KERNEL_ARCH)
+LTP_TESTSUITE_CONF_OPTS += --with-linux-dir=$(LINUX_DIR)
+else
+LTP_TESTSUITE_CONF_OPTS += --without-modules
+endif
+
 # Needs libcap with file attrs which needs attr, so both required
 ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
 LTP_TESTSUITE_DEPENDENCIES += libcap
-- 
2.8.0
