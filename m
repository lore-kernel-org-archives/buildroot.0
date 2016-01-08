From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jan 2016 14:47:28 -0300
Subject: [Buildroot] [PATCH] vala: add vala/valac wrapper
Message-ID: <1452275248-23020-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vala/valac can use gir and vapi data files installed by other packages,
but since these are normally installed to staging and host-vala looks
for them in the host directory (logically) this leads to failure.
So wrap them to call the real tool and add this information via
command-line parameters to them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vala/vala-wrapper |  2 ++
 package/vala/vala.mk      | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/vala/vala-wrapper

diff --git a/package/vala/vala-wrapper b/package/vala/vala-wrapper
new file mode 100644
index 0000000..ea0bd09
--- /dev/null
+++ b/package/vala/vala-wrapper
@@ -0,0 +1,2 @@
+#!/bin/sh
+$0- at VALA_VERSION@ --vapidir=@STAGING_DIR@/usr/share/vala/vapi --girdir=@STAGING_DIR@/usr/share/gir-1.0 $@
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index a0a986c..0107e26 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -16,4 +16,22 @@ HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
 # available".
 HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
 
+# We wrap vala & valac to point to the proper gir and vapi data dirs
+# Otherwise we'll get host directory data which isn't enough
+define HOST_VALA_INSTALL_WRAPPER
+	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
+		$(HOST_DIR)/usr/bin/vala
+	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
+		$(HOST_DIR)/usr/bin/valac
+	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
+		$(HOST_DIR)/usr/bin/vala
+	$(SED) 's, at STAGING_DIR@,$(STAGING_DIR),g' \
+		$(HOST_DIR)/usr/bin/vala
+	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
+		$(HOST_DIR)/usr/bin/valac
+	$(SED) 's, at STAGING_DIR@,$(STAGING_DIR),g' \
+		$(HOST_DIR)/usr/bin/valac
+endef
+HOST_VALA_POST_INSTALL_HOOKS += HOST_VALA_INSTALL_WRAPPER
+
 $(eval $(host-autotools-package))
-- 
2.4.10
