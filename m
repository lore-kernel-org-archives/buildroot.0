From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:49 -0700
Subject: [Buildroot] [PATCH v2 01/13] package/gettext-gnu: add msgfmt wrapper
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The msgfmt provided by gettext-gnu uses a default GETTEXTDATADIR path of
/usr/share/gettext, causing problems with msgfmt, particularly if the host
does not have gettext development packages installed, or if the host has a
different version of gettext. Install a wrapper that sets the GETTEXTDATADIR
to ${TARGET_DIR}/usr/share/gettext/ to ensure that any package using the
msgfmt utility uses the proper GETTEXTDATADIR path.

This wrapper is not needed for gettext-tiny, as their implimentation of msgfmt
is written completely from scratch and does not use the GETTEXTDATADIR
variable.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gettext-gnu/gettext-gnu.mk | 13 +++++++++++++
 package/gettext-gnu/msgfmt         |  3 +++
 2 files changed, 16 insertions(+)
 create mode 100644 package/gettext-gnu/msgfmt

diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index ee7e97baf7..0b25203b5c 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -87,6 +87,19 @@ define HOST_GETTEXT_GNU_GETTEXTIZE_CONFIRMATION
 endef
 HOST_GETTEXT_GNU_POST_INSTALL_HOOKS += HOST_GETTEXT_GNU_GETTEXTIZE_CONFIRMATION
 
+# The msgfmt provided by gettext-gnu uses a default GETTEXTDATADIR path of
+# /usr/share/gettext, causing problems with msgfmt, particularly if the host
+# does not have gettext development packages installed, or if the host has a
+# different version of gettext. Install a wrapper that sets the GETTEXTDATADIR
+# to ${TARGET_DIR}/usr/share/gettext/ to ensure that any package using the
+# msgfmt utility uses the proper GETTEXTDATADIR path.
+define GETTEXT_GNU_INSTALL_MSGFMT_WRAPPER
+	mv $(HOST_DIR)/bin/msgfmt $(HOST_DIR)/bin/msgfmt.real
+	$(INSTALL) -D -m 755 \
+			$(GETTEXT_GNU_PKGDIR)/msgfmt $(HOST_DIR)/bin/msgfmt
+endef
+HOST_GETTEXT_GNU_POST_INSTALL_HOOKS += GETTEXT_GNU_INSTALL_MSGFMT_WRAPPER
+
 # autoreconf expects gettextize to install ABOUT-NLS, but it only gets
 # installed by gettext-runtime which we don't build/install for the
 # host, so do it manually
diff --git a/package/gettext-gnu/msgfmt b/package/gettext-gnu/msgfmt
new file mode 100644
index 0000000000..06f1a523da
--- /dev/null
+++ b/package/gettext-gnu/msgfmt
@@ -0,0 +1,3 @@
+#!/usr/bin/env bash
+
+GETTEXTDATADIR="${TARGET_DIR}/usr/share/gettext/" ${HOST_DIR}/bin/msgfmt.real "${@}"
-- 
2.26.2
