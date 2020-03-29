From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 16:52:01 +0200
Subject: [Buildroot] [git commit] package/vala: also wrap vapigen
Message-ID: <20200329145710.72AA088EF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5c8cec5a5a7e9fe1c37081173ea526821f3f580
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

when compiling gobject-introspection .gir files, some packages use vapigen to
generate a vala-api compatible .gir file. These packages tend to call vapigen
directly instead of vala or valac.

Without the wrapper, building the .gir files fail. In the case of for example,
gupnp-dlna throws the following error:
"error: Package `Gst-1.0' not found in specified Vala API directories or
GObject-Introspection GIR directories."

Installing the vala wrapper for vapigen fixes the above issue.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vala/vala.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index b8a69f8c5e..95365faf18 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -17,16 +17,19 @@ HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
 HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
 HOST_VALA_CONF_OPTS += --disable-valadoc
 
-# We wrap vala & valac to point to the proper gir and vapi data dirs
+# We wrap vala, valac and vapigen to point to the proper gir and vapi data dirs
 # Otherwise we'll get host directory data which isn't enough
 define HOST_VALA_INSTALL_WRAPPER
 	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
 		$(HOST_DIR)/bin/vala
 	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
 		$(HOST_DIR)/bin/valac
+	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
+		$(HOST_DIR)/bin/vapigen
 	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
 		$(HOST_DIR)/bin/vala \
-		$(HOST_DIR)/bin/valac
+		$(HOST_DIR)/bin/valac \
+		$(HOST_DIR)/bin/vapigen
 endef
 HOST_VALA_POST_INSTALL_HOOKS += HOST_VALA_INSTALL_WRAPPER
 
