From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 23:44:25 +0200
Subject: [Buildroot] [PATCH 9/9] package/weston: add option to enable EGL
In-Reply-To: <cover.1381354867.git.yann.morin.1998@free.fr>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <7e31b6ba4a2f05ab5ba1b1114863e7d102fa5a17.1381354867.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Add a no-prompt option to enable EGL. Compositors that can use
EGL can select this option.

Currently, no compositor (supported by Buildroot) selects EGL,
but this will be the case when weston 1.3.0 is out (since the
RPi compositor will have gained EGL support by that time with
commit #b4659eb in upstream weston).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 4 ++++
 package/weston/weston.mk | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 8c00bf6..4096671 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -24,6 +24,10 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
+# Whether EGL support is needed
+config BR2_PACKAGE_WESTON_EGL
+    bool
+
 # These two options make sure at least one compositor is selected.
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 2d68fba..e3804f2 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -27,6 +27,12 @@ WESTON_CONF_OPT = \
 	--disable-colord \
 	--disable-libunwind
 
+ifeq ($(BR2_PACKAGE_WESTON_EGL),y)
+WESTON_CONF_OPT += --enable-egl
+else
+WESTON_CONF_OPT += --disable-egl --disable-simple-egl-clients
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
 WESTON_CONF_OPT += --enable-fbdev-compositor
 else
-- 
1.8.1.2
