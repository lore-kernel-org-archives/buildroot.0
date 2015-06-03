From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:40 +0200
Subject: [Buildroot] [PATCH 23/32 v2] package/matchbox: enable support for
	the Xsession manager
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <8f33998f39bb0d9c429c078b66ad339243767bce.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since this is a non-obvious dependency, just select the appropriate
library.

Also, add a comment to act as a separator between matchbox' options
and the other matchbox packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -. v2:
  - add a Kconfig option rather than relying only on a build-dependency
    (Arnout)
---
 package/matchbox/Config.in   | 8 ++++++++
 package/matchbox/matchbox.mk | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index ae33ecf..d42b90f 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -17,6 +17,14 @@ menuconfig BR2_PACKAGE_MATCHBOX
 
 if BR2_PACKAGE_MATCHBOX
 
+config BR2_PACKAGE_MATCHBOX_SM
+	bool "session manager"
+	select BR2_PACKAGE_XLIB_LIBSM
+	help
+	  Enable support for the Session Manager.
+
+comment "matchbox utilities"
+
 source "package/matchbox-common/Config.in"
 source "package/matchbox-desktop/Config.in"
 source "package/matchbox-fakekey/Config.in"
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 43f6b4b..b1f96a6 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -27,4 +27,11 @@ else
 MATCHBOX_CONF_OPTS += --disable-startup-notification
 endif
 
+ifeq ($(BR2_PACKAGE_MATCHBOX_SM),y)
+MATCHBOX_CONF_OPTS += --enable-session
+MATCHBOX_DEPENDENCIES += xlib_libSM
+else
+MATCHBOX_CONF_OPTS += --disable-session
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
