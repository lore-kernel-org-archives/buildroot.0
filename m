From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 11:43:06 +0100
Subject: [Buildroot] [git commit] package/iputils: rework to get rid of
 check-package warning
Message-ID: <20191101103624.897588E4CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8f4c01652e108f55e760e0bff4e50f60710b152
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package does not like us overriding IPUTILS_NINFOD, so rework the
logic to use unset (empty) for the positive case and explicitly test against
'n'.

package/iputils/iputils.mk:51: conditional override of variable IPUTILS_NINFOD
package/iputils/iputils.mk:56: conditional override of variable IPUTILS_NINFOD

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index c9c59a202d..57e90a973a 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -31,8 +31,6 @@ else
 IPUTILS_CONF_OPTS += -DUSE_IDN=false
 endif
 
-IPUTILS_NINFOD = y
-
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=nettle
 IPUTILS_DEPENDENCIES += nettle
@@ -56,15 +54,15 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 IPUTILS_NINFOD = n
 endif
 
-ifeq ($(IPUTILS_NINFOD),y)
+ifeq ($(IPUTILS_NINFOD),n)
+IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+else
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=true
 define IPUTILS_INSTALL_SERVICE_NINFOD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../lib/systemd/system/ninfod.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ninfod.service
 endef
-else
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
