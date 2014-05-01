From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 May 2014 06:17:27 +0300
Subject: [Buildroot] [PATCH 1/2] flite: depend on alsa-lib when available
Message-ID: <fe00d46b244bd6b6023e6a8f87307b136938cf70.1398914248.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The flite configure script detects the availability of alsa-lib. Add alsa-lib
to flite dependencies to make sure alsa-lib is always detected when
available.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/flite/flite.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 7511b87731e7..08d2ce1622f9 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -38,4 +38,11 @@ define FLITE_EXTRACT_CMDS
 	$(RM) -rf $(BUILD_DIR)/$(subst .tar.bz2,,$(FLITE_SOURCE))
 endef
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FLITE_DEPENDENCIES += alsa-lib
+FLITE_CONF_OPT += --with-audio=alsa
+else
+FLITE_CONF_OPT += --with-audio=oss
+endif
+
 $(eval $(autotools-package))
-- 
1.9.2
