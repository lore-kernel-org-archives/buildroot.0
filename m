From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Fri, 19 Sep 2014 09:13:51 +0200
Subject: [Buildroot] [PATCH] swig: add symlink to /usr/bin/swig2.0
In-Reply-To: <1411110831-27676-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1411110831-27676-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <1411110831-27676-3-git-send-email-jeremy.rosen@openwide.fr>
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
---
 package/swig/swig.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 5efc81c..233e97d 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -15,4 +15,10 @@ HOST_SWIG_CONF_OPT = \
 SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
+define SWIG_INSTALL_SYMLINK
+	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
+endef
+
+HOST_SWIG_POST_INSTALL_HOOKS += SWIG_INSTALL_SYMLINK
+
 $(eval $(host-autotools-package))
-- 
2.1.0
