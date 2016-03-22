From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:29:39 +0100
Subject: [Buildroot] [git commit] vala: add vala/valac wrapper
Message-ID: <20160322223623.B65E580F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6811cf124775b855c09f37c5c2243a482865f522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vala/valac can use gir and vapi data files installed by other packages,
but since these are normally installed to staging and host-vala looks
for them in the host directory (logically) this leads to failure.
So wrap them to call the real tool and add this information via
command-line parameters to them.

This is required for vala-in-vala bindings (vapi).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/vala-wrapper |  2 ++
 package/vala/vala.mk      | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/vala/vala-wrapper b/package/vala/vala-wrapper
new file mode 100644
index 0000000..ae2f7ca
--- /dev/null
+++ b/package/vala/vala-wrapper
@@ -0,0 +1,2 @@
+#!/bin/sh
+$0- at VALA_VERSION@ --vapidir=${STAGING_DIR}/usr/share/vala/vapi --girdir=${STAGING_DIR}/usr/share/gir-1.0 $@
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 57a6956..b236c54 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -16,4 +16,17 @@ HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
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
+		$(HOST_DIR)/usr/bin/vala \
+		$(HOST_DIR)/usr/bin/valac
+endef
+HOST_VALA_POST_INSTALL_HOOKS += HOST_VALA_INSTALL_WRAPPER
+
 $(eval $(host-autotools-package))
