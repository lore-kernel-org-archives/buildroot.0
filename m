From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 13:43:46 +0200
Subject: [Buildroot] [git commit] package/freerdp: prepare for adding
	another client
Message-ID: <20151003122241.F2F0481923@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d131b4da9bb1cd6dc67bdc7946744e76640df00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the only client we can build is the X11 client.

FreeRDP now has support for building a wayland client.

However, that means we need to rethink the way we build FreeRDP, because
of some "inconsistencies" in its build system. This is because FreeRDP's
buildsystem does not have orthogonal options; some of the options can be
used for different components.

For example, the set of X11 libraries needed to build the server is a
superset of the X11 libraries needed to build the X11 client. So,
whenever the server is enabled, it means the X11 libraries required to
build the X11 client are available.

Now, if the user also wants to build the waland client (but not the X11
client), there is no way to tell FreeRDP not to build the X11 client,
because there is a single option, WITH_CLIENT, to drive whether any of
the clients is built. The decision is made on the availability of the
required libraries. And since the server is enabled, the X11 libs
required to build the X11 client are available. So, we end up with the
X11 client, even though it is not wanted.

And conversely with wayland...

So, we redesign the way we build FreeRDP. WE do not care what is
actually built; we just build whatever is buildable with the current
set of enabled libraries. But at install time (both in staging/ and
target/) we remove whatever the user does not want.

We also take the opportunity to rename the X11 client option, so it is
coherent with the soon-to-be-introduced wayland client.

Note: since FreeRDP has gained new dependencies, we can not just
introduce the legacy option as-is, otherwise we run the risk that it
selects the new option even though the new FreeRDP dependencies are not
enabled, spitting out the infamous 'unmet direct dependencies" kconfig
error.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           |    7 +++++
 package/freerdp/Config.in  |    6 ++--
 package/freerdp/freerdp.mk |   55 ++++++++++++++++++++++++++++++++++++--------
 3 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5305538..8975b95 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+# Since FreeRDP has new dependencies, protect this legacy to avoid the
+# infamous "unmet direct dependencies" kconfig error.
+config BR2_PACKAGE_FREERDP_CLIENT
+	bool "freerdp client option renamed"
+	depends on BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_FREERDP_CLIENT_X11
+
 config BR2_PACKAGE_BLACKBOX
 	bool "blackbox package has been removed"
 	select BR2_LEGACY
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 12619a5..6d9d6fc 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -62,14 +62,14 @@ config BR2_PACKAGE_FREERDP_SERVER
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 
-config BR2_PACKAGE_FREERDP_CLIENT
-	bool "client"
+config BR2_PACKAGE_FREERDP_CLIENT_X11
+	bool "X11 client"
 	default y
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 
-comment "server and client need X.Org"
+comment "server and X11 client need X.Org"
 	depends on !BR2_PACKAGE_XORG7
 
 endif
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 30108b6..0b68e2e 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -85,18 +85,38 @@ ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
 FREERDP_CONF_OPTS += -DWITH_SERVER=ON
 endif
 
-ifeq ($(BR2_PACKAGE_FREERDP_CLIENT),y)
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_X11),y)
 FREERDP_CONF_OPTS += -DWITH_CLIENT=ON
 endif
 
 #---------------------------------------
 # X.Org libs for client and/or server
 
-ifneq ($(BR2_PACKAGE_FREERDP_SERVER)$(BR2_PACKAGE_FREERDP_CLIENT),)
-
-# Those two are mandatory for both the server and the client
+# The FreeRDP buildsystem uses non-orthogonal options. For example it
+# is not possible to build the server and the wayland client without
+# also building the X client. That's because the dependencies of the
+# server (the X libraries) are a superset of those of the X client.
+# So, as soon as FreeRDP is configured for the server and the wayland
+# client, it will believe it also has to build the X client, because
+# the libraries it needs are enabled.
+#
+# Furthermore, the shadow server is always built, even if there's nothing
+# it can serve (i.e. the X libs are disabled).
+#
+# So, we do not care whether we build too much; we remove, as
+# post-install hooks, whatever we do not want.
+
+# If Xorg is enabled, and the server or the X client are, then libX11
+# and libXext are forcibly enabled at the Kconfig level. However, if
+# Xorg is enabled but neither the server nor the X client are, then
+# there's nothing that guarantees those two libs are enabled. So we
+# really must check for them.
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBX11),yy)
 FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXext
 FREERDP_CONF_OPTS += -DWITH_X11=ON
+else
+FREERDP_CONF_OPTS += -DWITH_X11=OFF
+endif
 
 # The following libs are either optional or mandatory only for either
 # the server or the client. A mandatory library for either one is
@@ -171,12 +191,6 @@ else
 FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
-else # ! SERVER && ! CLIENT
-
-FREERDP_CONF_OPTS += -DWITH_X11=OFF
-
-endif # ! SERVER && ! CLIENT
-
 #---------------------------------------
 # Post-install hooks to cleanup and install missing stuff
 
@@ -189,6 +203,27 @@ endef
 FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_RM_SHADOW_SERVER
 endif # ! server
 
+# X client is always built as soon as a client is enabled and the
+# necessary libs are enabled (e.g. because of the server), so manually
+# remove it if the user does not want it.
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_X11),)
+define FREERDP_RM_CLIENT_X11
+	rm -f $(TARGET_DIR)/usr/bin/xfreerdp
+	rm -f $(TARGET_DIR)/usr/lib/libxfreerdp-client*
+endef
+FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_RM_CLIENT_X11
+define FREERDP_RM_CLIENT_X11_LIB
+	rm -f $(STAGING_DIR)/usr/lib/libxfreerdp-client*
+endef
+FREERDP_POST_INSTALL_STAGING_HOOKS += FREERDP_RM_CLIENT_X11_LIB
+endif # ! X client
+
+# Remove static libraries in unusual dir
+define FREERDP_CLEANUP
+	rm -rf $(TARGET_DIR)/usr/lib/freerdp
+endef
+FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_CLEANUP
+
 FREERDP_CONF_OPTS += -DWITH_WAYLAND=OFF
 
 # Install the server key and certificate, so that a client can connect.
