From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Mon, 22 Sep 2014 13:31:08 +0200
Subject: [Buildroot] [PATCH v2] swig: add symlink to /usr/bin/swig2.0
In-Reply-To: <1411385468-24878-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1411385468-24878-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <1411385468-24878-2-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the cmake detection script provided with cmake will first look for a
binary called swig2.0 then for a binary called swig

swig-host only installs a binary called swig and gets overridden by the
version installed by the host distro. This symlink prevents that from
happening


Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>

---

v1 => v2 :
* fix definition of SWIG
* add missing SOB
* rename SWIG_INSTALL_SYMLINK to HOST_SWIG_INSTALL_SYMLINK

After discussing with smartin on IRC, adding a symlink seems like
the best approch
* adding a -DSWIG_EXECUTABLE needs to be done in all dependent packages
* changing to swig2.0 breaks compilation (at least xbmc)
* patching FindSwig.mk is a BR specific patch that probably can't be
  upstreamed
---
 package/swig/swig.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index e9ef521..07f0548 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION = 2.0.12
+SWIG_MAJOR = 2.0
+SWIG_VERSION = $(SWIG_MAJOR).12
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPT = \
@@ -14,4 +15,10 @@ HOST_SWIG_CONF_OPT = \
 SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
+define HOST_SWIG_INSTALL_SYMLINK
+	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
+endef
+
+HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
+
 $(eval $(host-autotools-package))
-- 
2.1.0
