From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 21 Jul 2015 18:29:44 +0200
Subject: [Buildroot] [PATCH] snmppp: extract license text from source files
Message-ID: <1437496184-26203-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no proper license file in the SNMP++ tarballs, so let's
extract it from a source file instead of copying it entirely.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/snmppp/snmppp.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 026fe6e..1b73eba 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -11,7 +11,7 @@ SNMPPP_DEPENDENCIES = host-pkgconf
 SNMPPP_INSTALL_STAGING = YES
 SNMPPP_CONF_OPTS = $(if $(BR2_PACKAGE_SNMPPP_LOGGING),--enable-logging,--disable-logging)
 SNMPPP_LICENSE = SNMP++
-SNMPPP_LICENSE_FILES = src/v3.cpp
+SNMPPP_LICENSE_FILES = license.txt
 
 ifeq ($(BR2_PACKAGE_SNMPPP_SNMPV3),y)
 SNMPPP_CONF_OPTS += --enable-snmpv3
@@ -20,4 +20,10 @@ else
 SNMPPP_CONF_OPTS += --disable-snmpv3
 endif
 
+define SNMPPP_EXTRACT_LICENSE
+	grep '_##' $(@D)/src/v3.cpp >$(@D)/license.txt
+endef
+
+SNMPPP_POST_EXTRACT_HOOKS += SNMPPP_EXTRACT_LICENSE
+
 $(eval $(autotools-package))
-- 
1.9.1
