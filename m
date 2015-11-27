From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 14:58:56 +0100
Subject: [Buildroot] [PATCH] package/gstreamer1: add symlink to gstconfig.h
	in legacy location
Message-ID: <1448632736-9476-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After version 1.4 (the previous one packaged in Buildroot), gstreamer
has changed the location where it installs its gstconfig.h, because it
is architecture-dependent, see upstream commit:
    http://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=444ceb068424122ceba46d8cc48a53b8b32c3cf5

However, this causes build failures in some pcakges (at least FreeRDP
is known to break) because either they do not use pkg-config (bad!) or,
like FreeRDP, have a broken buildsystem and have not yet fixed their
build failures [0].

In Buildroot, we do not really care about architecture-dependent
locatios, because we only build for one architecture. So, the legacy
location of that header is not problematic to us.

Create a symbolic link to gstconfig.h in its legacy location.

Fixes numerous FreeRDP build failures:
    http://autobuild.buildroot.org/results/438/4384ab572bdcb1d148bcdae5a67d8b0bf26d3049
    http://autobuild.buildroot.org/results/b00/b0060f16c7464c240bc7d3b0ff17c9cb311fe30d
    http://autobuild.buildroot.org/results/cad/cadb2fb90ce66b1fa3051a6fcfb7c8142f420c31
    ...

[0] FreeRDP does have a commit supposedly fixing the build with "newer"
gstreamer versions:
    https://github.com/FreeRDP/FreeRDP/commit/bea27fd919b64ee8d97996409e279e1e83d13594

but it makes the whole build completely fail, as it does not even
detect gstreamer anymore. Sigh... :-(

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index d5982f9..265afa0 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -36,4 +36,14 @@ GSTREAMER1_CONF_OPTS = \
 
 GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
 
+# gstreamer-1.6 changed the location of its gstconfig.h file,
+# and unfortunately, not all (by far!) consumers have been
+# updated to look in the correct location.
+# Add a symlink to the legacy location
+define GSTREAMER1_LEGACY_CGSTCONFIG_H
+	ln -sf $(STAGING_DIR)/usr/lib/gstreamer-1.0/include/gst/gstconfig.h \
+	       $(STAGING_DIR)/usr/include/gstreamer-1.0/gst/gstconfig.h
+endef
+GSTREAMER1_POST_INSTALL_STAGING_HOOKS += GSTREAMER1_LEGACY_CGSTCONFIG_H
+
 $(eval $(autotools-package))
-- 
1.9.1
