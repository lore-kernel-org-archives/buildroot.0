From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 22:30:45 +0200
Subject: [Buildroot] [git commit] flite: depend on alsa-lib when available
Message-ID: <20140503203400.2EAD99CAD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d42ac75fd07c1f5f187e08a0ccf02c24f1bde4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The flite configure script detects the availability of alsa-lib. Add alsa-lib
to flite dependencies to make sure alsa-lib is always detected when
available.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flite/flite.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 7511b87..08d2ce1 100644
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
