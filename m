From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:06:29 +0200
Subject: [Buildroot] [git commit] package/matchbox: enable support for the
	Xsession manager
Message-ID: <20150609211052.B53D37FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14b6ea282fe85e41f1ae7a37c687440f1bcf1642
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since this is a non-obvious dependency, just select the appropriate
library.

Also, add a comment to act as a separator between matchbox' options
and the other matchbox packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in   |    8 ++++++++
 package/matchbox/matchbox.mk |    7 +++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

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
