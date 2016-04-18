From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:40:11 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: build kernel modules when
	appropriate
Message-ID: <20160418194019.34A588188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44df0aeb6a61ee75db2be99418bca722b93a29ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If we're building a kernel, we can also build LTP's test modules.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 8adfdef..cf48072 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -13,6 +13,14 @@ LTP_TESTSUITE_CONF_OPTS += \
 	--with-power-management-testsuite \
 	--with-realtime-testsuite
 
+ifeq ($(BR2_LINUX_KERNEL),y)
+LTP_TESTSUITE_DEPENDENCIES += linux
+LTP_TESTSUITE_MAKE_ENV += $(LINUX_MAKE_FLAGS)
+LTP_TESTSUITE_CONF_OPTS += --with-linux-dir=$(LINUX_DIR)
+else
+LTP_TESTSUITE_CONF_OPTS += --without-modules
+endif
+
 # Needs libcap with file attrs which needs attr, so both required
 ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
 LTP_TESTSUITE_DEPENDENCIES += libcap
